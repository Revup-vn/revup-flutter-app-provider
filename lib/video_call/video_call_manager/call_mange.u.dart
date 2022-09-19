import 'package:auto_route/auto_route.dart';
import 'package:connectycube_flutter_call_kit/connectycube_flutter_call_kit.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

import '../../configs/video_call_const.dart';
import '../../router/router.dart';
import 'call_kit_manager.u.dart';

class CallManager {
  CallManager._internal();

  factory CallManager() => _getInstance();

  // collect pending calls in case when it was accepted/ended before establish chat connection
  final Map<String?, String> _callsMap = {};

  static CallManager get instance => _getInstance();
  static CallManager? _instance;

  static CallManager _getInstance() {
    return _instance ??= CallManager._internal();
  }

  P2PClient? _callClient;
  P2PSession? _currentCall;
  BuildContext? context;

  void init(BuildContext context) {
    this.context = context;

    _initCustomMediaConfigs();

    if (CubeChatConnection.instance.isAuthenticated()) {
      _initCalls();
    } else {
      _initChatConnectionStateListener();
    }

    _initCallKit();
  }

  void destroy() {
    P2PClient.instance.destroy();
    _callsMap.clear();
  }

  void _initCustomMediaConfigs() {
    RTCMediaConfig.instance
      ..minHeight = 720
      ..minWidth = 1280
      ..minFrameRate = 30;

    RTCConfig.instance.statsReportsInterval = 200;
  }

  void _initCalls() {
    if (_callClient == null) {
      _callClient = P2PClient.instance;

      _callClient!.init();
    }

    _callClient!.onReceiveNewSession = (callSession) async {
      if (_currentCall != null &&
          _currentCall!.sessionId != callSession.sessionId) {
        callSession.reject();
        return;
      }
      _currentCall = callSession;

      final callState = await _getCallState(_currentCall!.sessionId);

      if (callState == CallState.REJECTED) {
        reject(_currentCall!.sessionId);
      } else if (callState == CallState.ACCEPTED) {
        acceptCall(_currentCall!.sessionId);
      } else if (callState == CallState.UNKNOWN) {
        await ConnectycubeFlutterCallKit.setCallState(
          sessionId: _currentCall?.sessionId,
          callState: CallState.PENDING,
        );
        _showIncomingCallScreen(_currentCall!);
      }
    };

    _callClient!.onSessionClosed = (callSession) {
      if (_currentCall != null &&
          _currentCall!.sessionId == callSession.sessionId) {
        _currentCall = null;
        CallKitManager.instance.processCallFinished(callSession.sessionId);
      }
    };
  }

  void startNewCall(
    BuildContext context,
    int callType,
    Set<int> opponents, {
    bool startScreenSharing = false,
  }) {
    if (opponents.isEmpty) return;

    final callSession = _callClient?.createCallSession(
      callType,
      opponents,
      startScreenSharing: startScreenSharing,
    );
    _currentCall = callSession;
    context.router
        .push(ConversationRoute(callSession: callSession!, isIncoming: false));

    _sendStartCallSignalForOffliners(_currentCall!);
  }

  void _showIncomingCallScreen(P2PSession callSession) {
    if (context != null) {
      context?.router.push(IncomingCallRoute(callSession: callSession));
    }
  }

  void acceptCall(String sessionId) {
    ConnectycubeFlutterCallKit.setOnLockScreenVisibility(isVisible: true);
    if (_currentCall != null) {
      if (context != null) {
        if (context != null) {
          context?.router.push(
            ConversationRoute(
              callSession: _currentCall!,
              isIncoming: true,
            ),
          );
        }
      }
    } else {
      _callsMap[sessionId] = CallState.ACCEPTED;
    }
  }

  void reject(String sessionId) {
    if (_currentCall != null) {
      CallKitManager.instance.processCallFinished(_currentCall!.sessionId);
      _currentCall!.reject();
    } else {
      _callsMap[sessionId] = CallState.REJECTED;
    }
  }

  void hungUp() {
    if (_currentCall != null) {
      CallKitManager.instance.processCallFinished(_currentCall!.sessionId);
      _sendEndCallSignalForOffliners(_currentCall!);
      _currentCall!.hungUp();
    }
  }

  CreateEventParams _getCallEventParameters(P2PSession currentCall) {
    const callerName = 'username';

    final params = CreateEventParams()
      ..parameters = <String, dynamic>{
        'message':
            '''Incoming ${currentCall.callType == CallType.VIDEO_CALL ? 'Video' : 'Audio'} call''',
        PARAM_CALL_TYPE: currentCall.callType,
        PARAM_SESSION_ID: currentCall.sessionId,
        PARAM_CALLER_ID: currentCall.callerId,
        PARAM_CALLER_NAME: callerName,
        PARAM_CALL_OPPONENTS: currentCall.opponentsIds.join(','),
      };

    // ignore: cascade_invocations
    params.notificationType = NotificationType.PUSH;
    // ignore: cascade_invocations
    params.environment = CubeEnvironment.DEVELOPMENT;
    // ignore: cascade_invocations
    params.usersIds = currentCall.opponentsIds.toList();

    return params;
  }

  void _sendStartCallSignalForOffliners(P2PSession currentCall) {
    final params = _getCallEventParameters(currentCall);
    params.parameters[PARAM_SIGNAL_TYPE] = SIGNAL_TYPE_START_CALL;
    params.parameters[PARAM_IOS_VOIP] = 1;

    createEvent(params.getEventForRequest()).then((cubeEvent) {
      log('Event for offliners created: $cubeEvent');
    }).catchError((void error) {
      log('ERROR occurs during create event');
    });
  }

  void _sendEndCallSignalForOffliners(P2PSession currentCall) {
    final currentUser = CubeChatConnection.instance.currentUser;
    if (currentUser == null || currentUser.id != currentCall.callerId) return;

    final params = _getCallEventParameters(currentCall);
    params.parameters[PARAM_SIGNAL_TYPE] = SIGNAL_TYPE_END_CALL;

    createEvent(params.getEventForRequest()).then((cubeEvent) {
      log('Event for offliners created');
    }).catchError((void error) {
      log('ERROR occurs during create event');
    });
  }

  void _initCallKit() {
    CallKitManager.instance.init(
      onCallAccepted: acceptCall,
      onCallEnded: (uuid) {
        hungUp();
      },
      onMuteCall: (mute, uuid) {
        _currentCall?.setMicrophoneMute(mute);
      },
    );
  }

  void _initChatConnectionStateListener() {
    CubeChatConnection.instance.connectionStateStream.listen((state) {
      if (CubeChatConnectionState.Ready == state) {
        log('message');
        _initCalls();
      }
    });
  }

  Future<String> _getCallState(String sessionId) async {
    if (Platform.isAndroid) {
      return ConnectycubeFlutterCallKit.getCallState(sessionId: sessionId);
    } else if (Platform.isIOS) {
      if (_callsMap.containsKey(sessionId)) {
        return Future.value(_callsMap[sessionId]);
      }
    }

    return Future.value(CallState.UNKNOWN);
  }
}

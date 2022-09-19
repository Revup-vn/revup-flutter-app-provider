import 'dart:convert';

import 'package:connectycube_flutter_call_kit/connectycube_flutter_call_kit.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:universal_io/io.dart';

import '../../../configs/video_call_config.dart' as config;
import '../../configs/video_call_const.dart';

class PushNotificationsManager {
  factory PushNotificationsManager() => _getInstance();

  PushNotificationsManager._internal();

  static PushNotificationsManager? _instance;

  static PushNotificationsManager _getInstance() {
    return _instance ??= PushNotificationsManager._internal();
  }

  BuildContext? applicationContext;

  static PushNotificationsManager get instance => _getInstance();

  Future<void> init() async {
    ConnectycubeFlutterCallKit.initEventsHandler();

    ConnectycubeFlutterCallKit.onTokenRefreshed = (token) {
      log('[onTokenRefresh] VoIP token: $token');
      subscribe(token);
    };

    await ConnectycubeFlutterCallKit.getToken().then((token) {
      log('[getToken] VoIP token: $token');
      if (token != null) {
        subscribe(token);
      }
    });

    ConnectycubeFlutterCallKit.onCallRejectedWhenTerminated =
        onCallRejectedWhenTerminated;
  }

  Future<void> subscribe(String token) async {
    log('[subscribe] token: $token');
    final parameters = CreateSubscriptionParameters();
    // ignore: cascade_invocations
    parameters.pushToken = token;
    const isProduction = bool.fromEnvironment('dart.vm.product');
    parameters.environment =
        isProduction ? CubeEnvironment.PRODUCTION : CubeEnvironment.DEVELOPMENT;

    if (Platform.isAndroid) {
      parameters
        ..channel = NotificationsChannels.GCM
        ..platform = CubePlatform.ANDROID;
    } else if (Platform.isIOS) {
      parameters
        ..channel = NotificationsChannels.APNS_VOIP
        ..platform = CubePlatform.IOS;
    }

    String? deviceId = await PlatformDeviceId.getDeviceId;

    if (kIsWeb) {
      parameters.udid = base64Encode(utf8.encode(deviceId ?? ''));
    } else {
      parameters.udid = deviceId;
    }

    final packageInfo = await PackageInfo.fromPlatform();
    parameters.bundleIdentifier = packageInfo.packageName;

    await createSubscription(parameters.getRequestParameters())
        .then((cubeSubscriptions) {
      log('[subscribe] subscription SUCCESS');
    }).catchError((String error) {
      log('[subscribe] subscription ERROR: $error');
    });
  }
}

Future<void> onCallRejectedWhenTerminated(CallEvent callEvent) async {
  print(
      '[PushNotificationsManager][onCallRejectedWhenTerminated] callEvent: $callEvent');
  return sendPushAboutRejectFromKilledState(
    <String, dynamic>{
      PARAM_CALL_TYPE: callEvent.callType,
      PARAM_SESSION_ID: callEvent.sessionId,
      PARAM_CALLER_ID: callEvent.callerId,
      PARAM_CALLER_NAME: callEvent.callerName,
      PARAM_CALL_OPPONENTS: callEvent.opponentsIds.join(','),
    },
    callEvent.callerId,
  );
}

Future<void> sendPushAboutRejectFromKilledState(
  Map<String, dynamic> parameters,
  int callerId,
) {
  CubeSettings.instance.applicationId = config.APP_ID;
  CubeSettings.instance.authorizationKey = config.AUTH_KEY;
  CubeSettings.instance.authorizationSecret = config.AUTH_SECRET;
  CubeSettings.instance.accountKey = config.ACCOUNT_ID;

  final params = CreateEventParams();
  // ignore: cascade_invocations
  params.parameters = parameters;
  params.parameters['message'] = 'Reject call';
  params.parameters[PARAM_SIGNAL_TYPE] = SIGNAL_TYPE_REJECT_CALL;
  // params.parameters[PARAM_IOS_VOIP] = 1;

  params
    ..notificationType = NotificationType.PUSH
    ..environment = CubeEnvironment
        .DEVELOPMENT // TODO for sample we use DEVELOPMENT environment
    // bool isProduction = bool.fromEnvironment('dart.vm.product');
    // params.environment =
    //     isProduction ? CubeEnvironment.PRODUCTION : CubeEnvironment.DEVELOPMENT;
    ..usersIds = [callerId];

  return createEvent(params.getEventForRequest());
}

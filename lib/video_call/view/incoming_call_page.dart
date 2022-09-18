import 'package:auto_route/auto_route.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/material.dart';

import '../video_call_manager/call_mange.u.dart';

class IncomingCallPage extends StatelessWidget {
  const IncomingCallPage(this._callSession, {super.key});
  final P2PSession _callSession;

  @override
  Widget build(BuildContext context) {
    _callSession.onSessionClosed = (callSession) {
      context.router.pop();
    };

    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(36),
                child: Text(
                  _getCallTitle(),
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 36, bottom: 8),
                child: Text('User name', style: TextStyle(fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 86),
                child: Text(
                  _callSession.opponentsIds.join(', '),
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 36),
                    child: FloatingActionButton(
                      heroTag: 'RejectCall',
                      backgroundColor: Colors.red,
                      onPressed: () => _rejectCall(context, _callSession),
                      child: const Icon(
                        Icons.call_end,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 36),
                    child: FloatingActionButton(
                      heroTag: 'AcceptCall',
                      backgroundColor: Colors.green,
                      onPressed: () => _acceptCall(context, _callSession),
                      child: const Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getCallTitle() {
    var callType = '';

    switch (_callSession.callType) {
      case CallType.VIDEO_CALL:
        callType = 'Video';
        break;
      case CallType.AUDIO_CALL:
        callType = 'Audio';
        break;
    }

    return 'Incoming $callType call';
  }

  void _acceptCall(BuildContext context, P2PSession callSession) {
    CallManager.instance.acceptCall(callSession.sessionId);
  }

  void _rejectCall(BuildContext context, P2PSession callSession) {
    CallManager.instance.reject(callSession.sessionId);
  }

  Future<bool> _onBackPressed(BuildContext context) {
    return Future.value(true);
  }
}

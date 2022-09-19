import 'package:auto_route/auto_route.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
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
                  context.l10n.incomingVideoLabal,
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 86),
                child: Text(
                  context.l10n.yourProviderLabel,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 36),
                    child: FloatingActionButton(
                      heroTag: context.l10n.rejectCallLabel,
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
                      heroTag: context.l10n.acceptCallLabel,
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

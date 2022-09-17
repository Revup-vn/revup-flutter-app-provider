import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:universal_io/io.dart';

import '../video_call_manager/call_mange.u.dart';

class ConversationPage extends StatefulWidget {
  ConversationPage(this._callSession, {super.key, required this.isIncoming});
  final P2PSession _callSession;
  final bool isIncoming;
  final CubeStatsReportsManager _statsReportsManager =
      CubeStatsReportsManager();

  @override
  State<StatefulWidget> createState() => ConversationPageState();
}

class ConversationPageState extends State<ConversationPage>
    implements RTCSessionStateCallback<P2PSession> {
  bool isCameraEnabled = true;
  bool isSpeakerEnabled = true;
  bool isMicMute = false;
  RTCVideoRenderer? localRenderer;
  Map<int?, RTCVideoRenderer> remoteRenderers = {};
  MediaStream? _localMediaStream;
  Widget? _localVideoView;
  bool customMediaStream = false;
  bool needRebuildLocalVideoView = true;

  @override
  void deactivate() {
    super.deactivate();
    stopBackgroundExecution();

    localRenderer?.srcObject = null;
    localRenderer?.dispose();

    remoteRenderers.forEach((opponentId, renderer) {
      try {
        renderer
          ..srcObject = null
          ..dispose();
      } catch (e) {
        log('Error $e');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _switchSpeaker();
    widget._callSession.onLocalStreamReceived = _addLocalMediaStream;
    widget._callSession.onRemoteStreamReceived = _addRemoteMediaStream;
    widget._callSession.onSessionClosed = _onSessionClosed;
    widget._statsReportsManager.init(widget._callSession);
    widget._callSession.setSessionCallbacksListener(this);
    if (widget.isIncoming) {
      widget._callSession.acceptCall();
    } else {
      widget._callSession.startCall();
    }
  }

  Future<bool> stopBackgroundExecution() async {
    if (Platform.isAndroid && FlutterBackground.isBackgroundExecutionEnabled) {
      return FlutterBackground.disableBackgroundExecution();
    } else {
      return Future.value(true);
    }
  }

  void _addLocalMediaStream(MediaStream stream) {
    _localMediaStream = stream;

    if (!mounted) return;

    setState(() {
      needRebuildLocalVideoView = localRenderer == null;
    });
    localRenderer?.srcObject = _localMediaStream;
  }

  void _addRemoteMediaStream(
    dynamic session,
    int userId,
    MediaStream stream,
  ) {
    _onRemoteStreamAdd(userId, stream);
  }

  Future<void> _onRemoteStreamAdd(int opponentId, MediaStream stream) async {
    final streamRender = RTCVideoRenderer();
    await streamRender.initialize();
    streamRender.srcObject = stream;
    setState(() {
      remoteRenderers[opponentId] = streamRender;
    });
  }

  void _onSessionClosed(dynamic session) {
    widget._callSession.removeSessionCallbacksListener();

    widget._statsReportsManager.dispose();
    context.router.pop();
  }

  Future<void> _removeMediaStream(dynamic callSession, int userId) async {
    final videoRenderer = remoteRenderers[userId];
    if (videoRenderer == null) return;

    videoRenderer.srcObject = null;
    await videoRenderer.dispose();

    setState(() {
      remoteRenderers.remove(userId);
    });
  }

  Future<Widget> _buildLocalVideoItem() async {
    if (localRenderer == null) {
      localRenderer = RTCVideoRenderer();
      await localRenderer!.initialize();
    }

    localRenderer?.srcObject = _localMediaStream;

    _localVideoView = Expanded(
      child: RTCVideoView(
        localRenderer!,
        objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
        mirror: true,
      ),
    );
    needRebuildLocalVideoView = false;

    return _localVideoView!;
  }

  List<Widget> renderStreamsGrid(Orientation orientation) {
    final streamsExpanded = <Widget>[];

    if (_localMediaStream != null) {
      streamsExpanded.add(_localVideoView == null
          ? FutureBuilder<Widget>(
              future: needRebuildLocalVideoView
                  ? _buildLocalVideoItem()
                  : Future.value(_localVideoView),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data!;
                } else {
                  return Expanded(child: Container());
                }
              })
          : _localVideoView != null
              ? _localVideoView!
              : Expanded(child: Container()));
    }

    streamsExpanded.addAll(
      remoteRenderers.entries
          .map(
            (entry) => Expanded(
              child: Stack(
                children: [
                  RTCVideoView(
                    entry.value,
                    objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: StreamBuilder<CubeMicLevelEvent>(
                            stream: widget._statsReportsManager.micLevelStream
                                .where((event) => event.userId == entry.key),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const LinearProgressIndicator(value: 0);
                              } else {
                                final micLevelForUser = snapshot.data!;
                                return LinearProgressIndicator(
                                  value: micLevelForUser.micLevel,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.black26,
                          child: StreamBuilder<CubeVideoBitrateEvent>(
                            stream: widget
                                ._statsReportsManager.videoBitrateStream
                                .where((event) => event.userId == entry.key),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const AutoSizeText(
                                  '0 kbits/sec',
                                  style: TextStyle(color: Colors.white),
                                );
                              } else {
                                final videoBitrateForUser = snapshot.data!;
                                return AutoSizeText(
                                  '${videoBitrateForUser.bitRate} kbits/sec',
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onInverseSurface,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );

    if (streamsExpanded.length > 2) {
      final rows = <Widget>[];

      for (var i = 0; i < streamsExpanded.length; i += 2) {
        var chunkEndIndex = i + 2;

        if (streamsExpanded.length < chunkEndIndex) {
          chunkEndIndex = streamsExpanded.length;
        }

        final chunk = streamsExpanded.sublist(i, chunkEndIndex);

        rows.add(
          Expanded(
            child: orientation == Orientation.portrait
                ? Row(children: chunk)
                : Column(children: chunk),
          ),
        );
      }

      return rows;
    }

    return streamsExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        body: Stack(clipBehavior: Clip.none, children: [
          if (_isVideoCall())
            OrientationBuilder(
              builder: (context, orientation) {
                return Center(
                  child: Container(
                    child: orientation == Orientation.portrait
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: renderStreamsGrid(orientation),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: renderStreamsGrid(orientation),
                          ),
                  ),
                );
              },
            )
          else
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(bottom: 24),
                    child: Text(
                      'Audio call',
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: Text(
                      'Members:',
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Text(
                    widget._callSession.opponentsIds.join(', '),
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _getActionsPanel(),
          ),
        ]),
      ),
    );
  }

  Widget _getActionsPanel() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 8, right: 8),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        child: Container(
          padding: const EdgeInsets.all(4),
          color: Colors.black26,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: _muteMic,
                  color: !isMicMute
                      ? Theme.of(context).colorScheme.tertiary
                      : Theme.of(context).colorScheme.outline,
                  textColor: Theme.of(context).colorScheme.surface,
                  padding: const EdgeInsets.all(16),
                  shape: const CircleBorder(),
                  child: Icon(
                    !isMicMute ? Icons.mic : Icons.mic_off_outlined,
                    size: 24,
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: _isVideoEnabled,
                  color: isCameraEnabled
                      ? Theme.of(context).colorScheme.tertiary
                      : Theme.of(context).colorScheme.outline,
                  textColor: Theme.of(context).colorScheme.surface,
                  padding: const EdgeInsets.all(16),
                  shape: const CircleBorder(),
                  child: Icon(
                    isCameraEnabled ? Icons.videocam : Icons.videocam_off,
                    size: 24,
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: _switchCamera,
                  color: _isVideoEnabled()
                      ? Theme.of(context).colorScheme.tertiary
                      : Theme.of(context).colorScheme.outline,
                  textColor: Theme.of(context).colorScheme.surface,
                  padding: const EdgeInsets.all(16),
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.flip_camera_ios_outlined,
                    size: 24,
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: _endCall,
                  color: Theme.of(context).colorScheme.error,
                  textColor: Theme.of(context).colorScheme.surface,
                  padding: const EdgeInsets.all(16),
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.call_end,
                    size: 24,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _endCall() {
    CallManager.instance.hungUp();
  }

  Future<bool> _onBackPressed(BuildContext context) {
    return Future.value(false);
  }

  void _muteMic() {
    setState(() {
      isMicMute = !isMicMute;
      widget._callSession.setMicrophoneMute(isMicMute);
    });
  }

  bool _isVideoCall() {
    return CallType.VIDEO_CALL == widget._callSession.callType;
  }

  bool _isVideoEnabled() {
    return _isVideoCall() && isCameraEnabled;
  }

  void _switchCamera() {
    if (!_isVideoEnabled()) return;

    widget._callSession.switchCamera();
  }

  void _switchSpeaker() {
    setState(() {
      widget._callSession.enableSpeakerphone(true);
    });
  }

  @override
  void onConnectedToUser(P2PSession session, int userId) {
    // TODO: implement onConnectedToUser
  }

  @override
  void onConnectionClosedForUser(P2PSession session, int userId) {
    _removeMediaStream(session, userId);
  }

  @override
  void onDisconnectedFromUser(P2PSession session, int userId) {
    // TODO: implement onDisconnectedFromUser
  }
}

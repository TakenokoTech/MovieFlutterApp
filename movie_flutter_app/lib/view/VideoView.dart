import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import '../utils/AppLog.dart';

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    AppLog.debug('VideoApp.initState');
    super.initState();
    _controller = network('http://192.168.99.100:9090/live/test.m3u8')
      ..addListener(calback)
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    AppLog.debug('VideoApp.build');
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        appBar: appBar(),
        body: new Container(
          decoration: new BoxDecoration(color: Colors.white70),
          child: Center(
              child:
                  _controller.value.initialized ? aspectRatio() : Container()),
        ),
//        floatingActionButton: floatingActionButton(),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text("Real Time Movie"),
    );
  }

  AspectRatio aspectRatio() {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: VideoPlayer(_controller),
    );
  }

  FloatingActionButton floatingActionButton() {
    return FloatingActionButton(
      onPressed:
          _controller.value.isPlaying ? _controller.pause : _controller.play,
      child: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
    );
  }

  VideoPlayerController network(String path) {
    AppLog.debug('VideoApp.network');
    return VideoPlayerController.network(
      path,
    );
  }

  VideoPlayerController asset(String path) {
    AppLog.debug('VideoApp.asset');
    return VideoPlayerController.asset(
      path,
    );
  }

  VoidCallback calback() {
    // AppLog.debug('VideoApp.calback');
    final bool isPlaying = _controller.value.isPlaying;
    if (isPlaying != _isPlaying) {
      setState(() {
        _isPlaying = isPlaying;
      });
    }
  }
}

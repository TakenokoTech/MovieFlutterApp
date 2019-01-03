import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

//Logger.root.level = Level.ALL;
//Logger.root.onRecord.listen((LogRecord rec) {
//  print('${rec.level.name}: ${rec.time}: ${rec.message}');
//});
//final Logger log = new Logger('VideoApp');

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
//    _controller = VideoPlayerController.network(
//      'http://10.0.2.2:3000/1.mp4',
//    );
    _controller = VideoPlayerController.asset(
      'assets/1.mp4',
    );
    _controller.addListener(() {
        debugPrint('addListener');
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
      });
    _controller.initialize();

//      ..initialize().then((_) {
//        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//        setState(() {});
//      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _controller.value.isPlaying
              ? _controller.pause
              : _controller.play,
          child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
        ),
      ),
    );
  }
}
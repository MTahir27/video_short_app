import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../widgets/loader_widget.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key, required this.videoUrl});
  final String videoUrl;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController? _controller;
  bool _isVideoReady = false;
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.videoUrl),
      )..initialize().then((_) {
          setState(() {
            _isVideoReady = true;
            _controller?.play();
          });
        });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
    setState(() {
      _isVideoReady = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isVideoReady
        ? AspectRatio(
            aspectRatio: _controller!.value.aspectRatio,
            child: VideoPlayer(
              _controller!,
            ),
          )
        : const LoaderWidget();
  }
}

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late FlickManager flickManager;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flickManager = FlickManager(
        videoPlayerController:
            VideoPlayerController.asset("Images/v3.mp4",));
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      
      child: AspectRatio(
        aspectRatio: 16 / 8,
      
        child: FlickVideoPlayer(
          flickManager: flickManager,
        ),
      ),
    );
  }
}

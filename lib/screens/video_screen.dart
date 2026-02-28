import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';



class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();

}



class _VideoScreenState extends State<VideoScreen> {

  late VideoPlayerController _controller;

  @override
  void initState(){
    super.initState();
    _controller = VideoPlayerController.asset(
        "assets/videos/sample1.mp4",
    )
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.addListener(() {
      if (_controller.value.position ==
          _controller.value.duration) {
        setState(() {});
      }
    });
  }


  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),

            SizedBox(height: 20,),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: Text(
                _controller.value.isPlaying
                    ? "Pause"
                    : "Play",
              ),
            ),
          ],
        )
            : CircularProgressIndicator(),
      ),
    );
  }

}
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';



class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();

}



class _AudioScreenState extends State<AudioScreen> {

  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
      });
    });
  }

  Future<void> toggleAudio() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(
          AssetSource('audios/sample1.mp3'),
      );

    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }


  @override

  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Audio Player: Piano!"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: toggleAudio,
            child: Text(isPlaying ? "Pause" : "Play"),
        ),
      ),


    );
  }

}
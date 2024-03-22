import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:rounded_background_text/rounded_background_text.dart';

class VideoPlayerScreen extends StatelessWidget {
  final String videoId;
  final String titleVideo;
  final String levelVideo;
  final String decsVideo;
  final String timeVideo;
  final String imageVideo;
  final String statusVideo;

  const VideoPlayerScreen({
    Key? key,
    required this.videoId,
    required this.titleVideo,
    required this.levelVideo,
    required this.decsVideo,
    required this.timeVideo,
    required this.imageVideo,
    required this.statusVideo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: videoId,
              flags: const YoutubePlayerFlags(
                autoPlay: false,
                mute: false,
              ),
            ),
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  titleVideo,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedBackgroundText(
                  levelVideo,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  backgroundColor: Colors.pink,
                ),
              ),
            ],
          ),
        ], // Added closing square bracket
      ),
    );
  }
}

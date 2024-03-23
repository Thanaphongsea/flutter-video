import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/model.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:rounded_background_text/rounded_background_text.dart';

class VideoPlayerScreen extends StatelessWidget {
  final Video videoPlay;

  const VideoPlayerScreen({
    super.key,
    required this.videoPlay,
  });

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
              initialVideoId: videoPlay.id,
              flags: const YoutubePlayerFlags(
                autoPlay: false,
                mute: false,
              ),
            ),
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 15),
            child: Row(
              children: [
                Text(
                  videoPlay.title,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.00,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RoundedBackgroundText(
                  videoPlay.level,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  backgroundColor: HexColor(videoPlay.colorsVideo),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 15, right: 10),
            child: Text(
              videoPlay.decs,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              softWrap: true,
            ),
          ),
        ], // Added closing square bracket
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_application_1/pages/home/home_controller.dart';

class AllVideosPage extends StatelessWidget {
  final VideoListController _controller = VideoListController();

  AllVideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Map over the list of videos and create a VideoRow for each video
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Videos'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: _controller.videos.map((video) {
            return VideoRow(videoLink: video.url);
          }).toList(),
        ),
      ),
    );
  }
}

class VideoRow extends StatelessWidget {
  final String videoLink;

  const VideoRow({super.key, required this.videoLink});

  @override
  Widget build(BuildContext context) {
    String videoId = YoutubePlayer.convertUrlToId(videoLink) ?? '';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
          const SizedBox(height: 8),
          const Text('Video'),
        ],
      ),
    );
  }
}

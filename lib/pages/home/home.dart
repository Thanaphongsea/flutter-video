import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/home_Controller.dart';
import 'package:flutter_application_1/pages/home/video_list_row.dart';

class VideoListView extends StatelessWidget {
  final VideoListController _controller = VideoListController();

  VideoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pet'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(context, "Learn Next", "view all"),
          _buildVideosListView(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(
      BuildContext context, String title, String titleBtn) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              _controller.navigateToAllVideosPage(
                context,
              );
            },
            child: Text(
              titleBtn,
              style: const TextStyle(color: Colors.blueGrey),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVideosListView() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _controller.videos.length,
        itemBuilder: (context, index) {
          var videoEntry = _controller.videos[index];
          return VideoListRow(
            videoEntry: videoEntry,
            onPressed: () {
              _controller.navigateToVideoPlayer(context, videoEntry);
            },
          );
        },
      ),
    );
  }
}

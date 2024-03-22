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
                  context, _controller.videos.first.id);
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
          String videoId = _controller.videos[index].id;
          String titleVideo = _controller.videos[index].title;
          String levelVideo = _controller.videos[index].level;
          String decsVideo = _controller.videos[index].decs;
          String timeVideo = _controller.videos[index].time;
          String imageVideo = _controller.videos[index].image;
          String statusVideo = _controller.videos[index].status;
          String colorsVideo = _controller.videos[index].colorsVideo;
          return VideoListRow(
            videoId: videoId,
            titleVideo: titleVideo,
            levelVideo: levelVideo,
            decsVideo: decsVideo,
            timeVideo: timeVideo,
            imageVideo: imageVideo,
            statusVideo: statusVideo,
            index: index,
            onPressed: () {
              _controller.navigateToVideoPlayer(
                context,
                videoId,
                titleVideo,
                levelVideo,
                decsVideo,
                timeVideo,
                imageVideo,
                statusVideo,
              );
            },
            colosVideo: colorsVideo,
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_application_1/pages/home/home_controller.dart';

class AllVideosPage extends StatefulWidget {
  const AllVideosPage({super.key});

  @override
  AllVideosPageState createState() => AllVideosPageState();
}

class AllVideosPageState extends State<AllVideosPage> {
  final VideoListController _controller = VideoListController();
  late List<String> filteredVideos;

  @override
  void initState() {
    super.initState();
    filteredVideos = _controller.videos.map((video) => video.url).toList();
  }

  void filterVideos(String query) {
    setState(() {
      filteredVideos = _controller.videos
          .where((video) => video.url.contains(query))
          .map((video) => video.url)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Videos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              final String? result = await showSearch(
                context: context,
                delegate: VideoSearch(filteredVideos),
              );
              if (result != null) {
                filterVideos(result);
              }
            },
          ),
        ],
      ),
      body: SizedBox(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _controller.videos.length,
          itemBuilder: (context, index) {
            var videoEntry = _controller.videos[index];
            return VideoRow(
              videoEntry: videoEntry,
              onPressed: () {
                _controller.navigateToVideoPlayer(context, videoEntry);
              },
            );
          },
        ),
      ),
    );
  }
}

class VideoRow extends StatelessWidget {
  final Video videoEntry;
  final VoidCallback onPressed;

  const VideoRow(
      {super.key, required this.videoEntry, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    String videoId = YoutubePlayer.convertUrlToId(videoEntry.url) ?? '';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Column(
          children: [
            // YoutubePlayer(
            //   controller: YoutubePlayerController(
            //     initialVideoId: videoId,
            //     flags: const YoutubePlayerFlags(
            //       autoPlay: false,
            //       mute: false,
            //     ),
            //   ),
            //   showVideoProgressIndicator: true,
            //   progressIndicatorColor: Colors.blueAccent,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      image: AssetImage(videoEntry.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Icon(
                    Icons.play_circle_fill,
                    size: 50,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              videoId,
            ),
          ],
        ),
      ),
    );
  }
}

class VideoSearch extends SearchDelegate<String> {
  final List<String> videos;

  VideoSearch(this.videos);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? videos
        : videos.where((video) => video.contains(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          close(context, suggestionList[index]);
        },
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }
}

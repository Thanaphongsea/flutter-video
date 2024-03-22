import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:rounded_background_text/rounded_background_text.dart';
import 'package:hexcolor/hexcolor.dart';

class VideoListRow extends StatelessWidget {
  final String videoId;
  final int index;
  final String titleVideo;
  final String levelVideo;
  final String decsVideo;
  final String timeVideo;
  final String imageVideo;
  final String statusVideo;
  final String colosVideo;
  final VoidCallback onPressed;

  const VideoListRow({
    super.key,
    required this.videoId,
    required this.index,
    required this.titleVideo,
    required this.levelVideo,
    required this.decsVideo,
    required this.timeVideo,
    required this.imageVideo,
    required this.statusVideo,
    required this.onPressed,
    required this.colosVideo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 200,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                // Video widget goes here

                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: AssetImage(imageVideo),
                        fit: BoxFit.cover,
                        height: 100,
                        // width: 150,
                      ),
                    ),
                    Icon(
                      Icons.play_circle_fill,
                      size: 50,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ],
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
                        backgroundColor: HexColor(colosVideo),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

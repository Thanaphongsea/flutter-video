import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/model.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:rounded_background_text/rounded_background_text.dart';
import 'package:hexcolor/hexcolor.dart';

class VideoListRow extends StatelessWidget {
  final Video videoEntry;
  final VoidCallback onPressed;

  const VideoListRow({
    super.key,
    required this.videoEntry,
    required this.onPressed,
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
                        image: AssetImage(videoEntry.image),
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
                        videoEntry.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RoundedBackgroundText(
                        videoEntry.level,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        backgroundColor: HexColor(videoEntry.colorsVideo),
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

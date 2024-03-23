import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/all_video_page.dart';
import 'package:flutter_application_1/pages/videopage.dart';
import 'package:flutter_application_1/pages/home/model.dart';

class VideoListController {
  final List<Video> videos = [
    Video(
      id: "_tCgIwza9bU",
      url: "https://www.youtube.com/watch?v=_tCgIwza9bU",
      image: 'images/cat.jpg',
      title: 'Cat',
      decs:
          '''The cat (Felis catus), commonly referred to as the domestic cat or house cat,is the only domesticated species in the family Felidae. Recent advances in archaeology and genetics have shown that the domestication of the cat occurred in the Near East around 7500 BC. It is commonly kept as a house pet and farm cat, but also ranges freely as a feral cat avoiding human contact.''',
      level: 'Begginer',
      time: '10.00',
      status: '40%',
      colorsVideo: '#F6546A',
    ),
    Video(
      id: "snYu2JUqSWs",
      url: "https://www.youtube.com/watch?v=snYu2JUqSWs",
      image: 'images/owl.jpg',
      title: 'Owl',
      decs:
          '''Owls are birds from the order Strigiformes, which includes over 200 species of mostly solitary and nocturnal birds of prey typified by an upright stance, a large, broad head, binocular vision, binaural hearing, sharp talons, and feathers adapted for silent flight. Exceptions include the diurnal northern hawk-owl and the gregarious burrowing owl.''',
      level: 'Intermediate',
      time: '10.00',
      status: '40%',
      colorsVideo: '#BCEE68',
    ),
    Video(
      id: "xuP4g7IDgDM",
      url: "https://www.youtube.com/watch?v=xuP4g7IDgDM",
      image: 'images/fox.jpg',
      title: 'Fox',
      decs:
          '''Foxes are small to medium-sized, omnivorous mammals belonging to several genera of the family Canidae. They have a flattened skull,upright, triangular ears, a pointed, slightly upturned snout, and a long bushy tail ("brush").''',
      level: 'advance',
      time: '10.00',
      status: '40%',
      colorsVideo: '#0A75AD',
    ),
    Video(
      id: "UT5F9AXjwhg",
      url: "https://www.youtube.com/watch?v=UT5F9AXjwhg",
      image: 'images/snowfox.jpg',
      title: 'Snowfox',
      decs:
          '''The Arctic fox (Vulpes lagopus), also known as the white fox, polar fox, or snow fox, is a small fox that belongs to the family of Canidae, native to the Arctic regions of the Northern Hemisphere and common throughout the Arctic tundra biome.''',
      level: 'advance',
      time: '10.00',
      status: '40%',
      colorsVideo: '#0A75AD',
    ),
  ];

  void navigateToAllVideosPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AllVideosPage()),
    );
  }

  void navigateToVideoPlayer(BuildContext context, Video video) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPlayerScreen(
          videoPlay: video,
        ),
      ),
    );
  }
}

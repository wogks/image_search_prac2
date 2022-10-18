import 'package:flutter/material.dart';
import 'package:image_search_prac_2/domain/model/video/video_model.dart';

class VideoWidget extends StatelessWidget {
  final VideoModel thumbNail;
  const VideoWidget({super.key, required this.thumbNail});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      image: DecorationImage(
        fit: BoxFit.cover,
        image: NetworkImage('https://i.vimeocdn.com/video/${thumbNail.pictureId}_960x540.jpg'),
      )),
    );
  }
}

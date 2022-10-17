import 'package:flutter/material.dart';
import 'package:image_search_prac_2/domain/model/video/video_model.dart';

class VideoWidget extends StatelessWidget {
  final VideoModel video;
  const VideoWidget({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
        child: Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(video.userImageURL ?? ''),
          )),
    ));
  }
}

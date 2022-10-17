import 'package:flutter/material.dart';
import 'package:image_search_prac_2/domain/model/photo_model.dart';

class PhotoWidget extends StatelessWidget {
  final PhotoModel photo;
  const PhotoWidget({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(photo.previewURL),
        ),
      ),
    );
  }
}

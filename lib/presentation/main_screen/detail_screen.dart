import 'package:flutter/material.dart';
import 'package:image_search_prac_2/domain/model/photo/photo_model.dart';

class ImageDetailScreen extends StatelessWidget {
  final PhotoModel bigPhoto;
  const ImageDetailScreen({super.key, required this.bigPhoto});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: NetworkImage(bigPhoto.largeImageURL),
          ),
        ),
      ),
    );
  }
}

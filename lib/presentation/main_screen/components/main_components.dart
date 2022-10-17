import 'package:flutter/material.dart';
import 'package:image_search_prac_2/domain/model/photo_model.dart';


class PhotoWidget extends StatefulWidget {
  final PhotoModel photo;
  const PhotoWidget({super.key, required this.photo});

  @override
  State<PhotoWidget> createState() => _PhotoWidgetState();
}

class _PhotoWidgetState extends State<PhotoWidget> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(widget.photo.previewURL),
        ),
      ),
    );
  }
}

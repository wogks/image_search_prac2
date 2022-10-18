import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search_prac_2/data/source/remote/api/video_api/video_api.dart';
import 'package:image_search_prac_2/domain/model/video/video_model.dart';


class VideoApiImple extends VideoApi {
  @override
  Future<List<VideoModel>> fetchVideos(String query) async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/videos/?key=28871499-c75df118d01f09e96aaf02d60&q=$query'));
    Map<String, dynamic> json = jsonDecode(response.body);
    Iterable hits = json['hits'];
    return hits.map((e) => VideoModel.fromJson(e)).toList();
  }

}

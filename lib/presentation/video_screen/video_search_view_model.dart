// ignore_for_file: non_constant_identifier_names

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:image_search_prac_2/data/source/remote/api/video_api/video_api.dart';
import 'package:image_search_prac_2/domain/model/video/video_model.dart';

class VideoSearchViewModel with ChangeNotifier {
  final VideoApi videoApi;
  VideoSearchViewModel(this.videoApi);

  List<VideoModel> _videos = [];

  UnmodifiableListView<VideoModel> get videos => UnmodifiableListView(_videos);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchVideos(String query) async {
    final result = await videoApi.fetchVideos(query);
    _isLoading = true;
    notifyListeners();
    _videos = result;
    notifyListeners();
    _isLoading = false;
    notifyListeners();
  }
}

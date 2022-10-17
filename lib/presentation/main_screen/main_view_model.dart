import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:image_search_prac_2/data/source/remote/api/image_api/pixabay_api.dart';
import 'package:image_search_prac_2/domain/model/photo/photo_model.dart';

class MainViewModel with ChangeNotifier {
  final PixabayApi api;
  MainViewModel(this.api);

  List<PhotoModel> _photos = [];

  UnmodifiableListView<PhotoModel> get photos => UnmodifiableListView(_photos);

  bool _isloading = false;
  bool get isLosading => _isloading;

  Future<void> fetch(String query) async {
    final result = await api.fetch(query);

    _isloading = true;
    notifyListeners();
    _photos = result;
    notifyListeners();
    _isloading = false;
    notifyListeners();
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search_prac_2/data/source/remote/api/pixabay_api.dart';
import 'package:image_search_prac_2/domain/model/photo_model.dart';

class PixabayApiImpl implements PixabayApi {
  final baseUrl = 'https://pixabay.com/api/';
  final key = '28871499-c75df118d01f09e96aaf02d60';

  @override
  Future<List<PhotoModel>> fetch(String query) async {
    final response = await http.get(
        Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo&pretty=true'));
    Map<String, dynamic> json = jsonDecode(response.body);
    Iterable hits = json['hits'];
    return hits.map((e) => PhotoModel.fromJson(e)).toList();
  }
}

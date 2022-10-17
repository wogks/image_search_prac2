import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search_prac_2/data/source/remote/api/pixabay_api.dart';
import 'package:image_search_prac_2/domain/model/photo_model.dart';

class PixabayApiImpl implements PixabayApi {

  @override
  Future<List<PhotoModel>> fetch(String query) async {
    final response = await http.get(
        Uri.parse('https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=$query&image_type=photo'));
    Map<String, dynamic> json = jsonDecode(response.body);
    Iterable hits = json['hits'];
    return hits.map((e) => PhotoModel.fromJson(e)).toList();
  }
}

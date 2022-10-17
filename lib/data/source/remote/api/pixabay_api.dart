import 'package:image_search_prac_2/domain/model/photo_model.dart';

abstract class PixabayApi{
  Future<List<PhotoModel>> fetch(String query);
}
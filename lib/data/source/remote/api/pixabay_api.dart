import '../../../../domain/model/photo/photo_model.dart';

abstract class PixabayApi {
  Future<List<PhotoModel>> fetch(String query);
}

import 'package:image_search_prac_2/domain/model/video/video_model.dart';

abstract class VideoApi {
  Future<List<VideoModel>> fetch(String query);
}

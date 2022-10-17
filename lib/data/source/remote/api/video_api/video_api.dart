import 'package:image_search_prac_2/domain/model/video/video_model.dart';

abstract class VideoApi {
  Future<List<VideoModel>> fetchVideos(String query);
  Future<List<VideoModel>> fetchThumbnail(String pictureId);
}

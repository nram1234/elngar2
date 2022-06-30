

import '../abstract_json_resource.dart';
import '../api_app.dart';
import '../api_manager.dart';
import '../json_model/all_videos_model.dart';

class AllVideosAPI extends ApiManager{
  String data="";
  @override
  String apiUrl() {
    return APIApp.getAll_videosUrl+data;
  }

  @override
  AbstractJsonResource fromJson(data) {
    return AllVideosModel.fromJson(data);
  }

}
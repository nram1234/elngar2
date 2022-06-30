



import '../abstract_json_resource.dart';
import '../api_app.dart';
import '../api_manager.dart';
import '../json_model/upload_video_model.dart';

class UploadVideoAPI extends ApiManager{

  @override
  String apiUrl() {
    return APIApp.uploadVideoUrl;
  }

  @override
  AbstractJsonResource fromJson(data) {
    return UploadVideoModel.fromJson(data);
  }

}
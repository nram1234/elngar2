import 'package:elngar/rep/abstract_json_resource.dart';
import 'package:elngar/rep/api_manager.dart';

import '../api_app.dart';
import '../json_model/all_audios_model.dart';

class AllAudiosAPI extends ApiManager{
  String data="";
  @override
  String apiUrl() {
return APIApp.getAll_audiosyUrl+data;
  }

  @override
  AbstractJsonResource fromJson(data) {
   return AllAudiosModel.fromJson(data);
  }

}
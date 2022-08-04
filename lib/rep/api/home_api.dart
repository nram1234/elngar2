import 'package:elngar/rep/abstract_json_resource.dart';
import 'package:elngar/rep/api_app.dart';
import 'package:elngar/rep/api_manager.dart';

import '../json_model/home_model.dart';

class HomeAPI extends ApiManager{
  String data="";
  @override
  String apiUrl() {
    return APIApp.getHomeUrl+data;
  }

  @override
  AbstractJsonResource fromJson(data) {
   return HomeModel.fromJson(data);
  }



}
import 'package:elngar/rep/abstract_json_resource.dart';
import 'package:elngar/rep/api_manager.dart';

import '../api_app.dart';
import '../json_model/chechout_model.dart';

class ChechoutAPI extends ApiManager{
 String data="";
  @override
  String apiUrl() {
return APIApp.postchechoutUrl+data;
  }

  @override
  AbstractJsonResource fromJson(data) {
  return ChechoutModel.fromJson(data);
  }

}
import 'package:elngar/rep/abstract_json_resource.dart';
import 'package:elngar/rep/api_app.dart';
import 'package:elngar/rep/api_manager.dart';

import '../json_model/home_model.dart';
import '../json_model/salaries_model.dart';

class SalariesAPI extends ApiManager{
  String data="";
  @override
  String apiUrl() {
    return APIApp.salariesUrl+data;
  }

  @override
  AbstractJsonResource fromJson(data) {
   return SalariesModel.fromJson(data);
  }



}
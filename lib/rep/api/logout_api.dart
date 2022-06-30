import 'package:elngar/rep/abstract_json_resource.dart';
import 'package:elngar/rep/api_manager.dart';

import '../api_app.dart';
import '../json_model/login_model.dart';

class LogOutAPI extends ApiManager{
  @override
  String apiUrl() {
    return APIApp.logoutUrl;
  }

  @override
  AbstractJsonResource fromJson(data) {
   return LogInModel.fromJson(data);
  }




}

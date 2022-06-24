import 'package:elngar/rep/abstract_json_resource.dart';
import 'package:elngar/rep/api_app.dart';
import 'package:elngar/rep/api_manager.dart';

import '../json_model/login_model.dart';

class LogInAPI extends ApiManager{
  @override
  String apiUrl() {
return APIApp.loginUrl;
  }

  @override
  AbstractJsonResource fromJson(data) {
  return LogInModel.fromJson(data);
  }
  
}
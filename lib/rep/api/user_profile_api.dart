import 'package:elngar/rep/abstract_json_resource.dart';
import 'package:elngar/rep/api_manager.dart';

import '../api_app.dart';
import '../json_model/user_profile_model.dart';

class UserProfileAPI extends ApiManager{
  String data="";
  @override
  String apiUrl() {
    return APIApp.getUserProfileUrl+data;
  }

  @override
  AbstractJsonResource fromJson(data) {
   return UserProfileModel.fromJson(data);
  }

}
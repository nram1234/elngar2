import 'package:elngar/rep/abstract_json_resource.dart';
import 'package:elngar/rep/api_manager.dart';

import '../api_app.dart';
import '../json_model/all_holiday_model.dart';
import '../json_model/all_notifications_model.dart';

class AllAotificationsAPI extends ApiManager{
  String data="";
  @override
  String apiUrl() {
    return APIApp.allnotificationsUrl+data;
  }

  @override
  AbstractJsonResource fromJson(data) {
return AllNotificationsModel.fromJson(data);
  }
  
}
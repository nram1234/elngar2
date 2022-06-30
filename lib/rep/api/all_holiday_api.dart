import 'package:elngar/rep/abstract_json_resource.dart';
import 'package:elngar/rep/api_manager.dart';

import '../api_app.dart';
import '../json_model/all_holiday_model.dart';

class AllHolidayAPI extends ApiManager{
  String data="";
  @override
  String apiUrl() {
    return APIApp.all_holidayUrl+data;
  }

  @override
  AbstractJsonResource fromJson(data) {
return AllHolidayModel.fromJson(data);
  }
  
}
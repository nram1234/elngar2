import 'package:elngar/rep/abstract_json_resource.dart';
import 'package:elngar/rep/api_manager.dart';

import '../api_app.dart';
import '../json_model/attendance_model.dart';

class AttendanceAPI extends ApiManager{
  @override
  String apiUrl() {
   return APIApp.PostAttendanceUrl;
  }

  @override
  AbstractJsonResource fromJson(data) {
    return AttendanceModel.fromJson(data);
  }

}
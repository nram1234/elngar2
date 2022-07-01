import 'package:elngar/rep/abstract_json_resource.dart';
import 'package:elngar/rep/api_app.dart';
import 'package:elngar/rep/api_manager.dart';

import '../json_model/holiday_post_model.dart';

class PostHolidayApi extends ApiManager{
  @override
  String apiUrl() {
    return APIApp.postHolidayUrl;
  }

  @override
  AbstractJsonResource fromJson(data) {
  return HolidayPostModel.fromJson(data);
  }

}
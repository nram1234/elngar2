import 'package:elngar/rep/abstract_json_resource.dart';
import 'package:elngar/rep/api_manager.dart';

import '../api_app.dart';
import '../json_model/branchs_model.dart';

class BranchsAPI extends ApiManager{
  String data='';
  @override
  String apiUrl() {
    return APIApp.getBranchsUrl+data;
  }

  @override
  AbstractJsonResource fromJson(data) {
return BranchsModel.fromJson(data);
  }

}
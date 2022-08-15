import 'package:elngar/rep/abstract_json_resource.dart';

class ChechoutModel extends AbstractJsonResource{
  bool? status;
  String? errNum;
  String? msg;

  ChechoutModel({this.status, this.errNum, this.msg});

  ChechoutModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    return data;
  }
}

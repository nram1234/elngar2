import 'package:elngar/rep/abstract_json_resource.dart';

class AttendanceModel extends AbstractJsonResource {
  bool? status;
  String? errNum;
  String? msg;
  Attendances? attendances;

  AttendanceModel({this.status, this.errNum, this.msg, this.attendances});

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    attendances = json['attendances'] != null
        ? new Attendances.fromJson(json['attendances'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.attendances != null) {
      data['attendances'] = this.attendances!.toJson();
    }
    return data;
  }
}

class Attendances {
  int? employeeId;
  int? branchId;
  String? lat;
  String? lang;
  String? date;
  String? checkin;
  int? status;
  String? updatedAt;
  String? createdAt;
  int? id;

  Attendances(
      {this.employeeId,
        this.branchId,
        this.lat,
        this.lang,
        this.date,
        this.checkin,
        this.status,
        this.updatedAt,
        this.createdAt,
        this.id});

  Attendances.fromJson(Map<String, dynamic> json) {
    employeeId = json['employee_id'];
    branchId = json['branch_id'];
    lat = json['lat'];
    lang = json['lang'];
    date = json['date'];
    checkin = json['checkin'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employee_id'] = this.employeeId;
    data['branch_id'] = this.branchId;
    data['lat'] = this.lat;
    data['lang'] = this.lang;
    data['date'] = this.date;
    data['checkin'] = this.checkin;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}

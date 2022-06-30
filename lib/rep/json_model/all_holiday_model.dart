import 'package:elngar/rep/abstract_json_resource.dart';

class AllHolidayModel extends AbstractJsonResource{
  bool? status;
  String? errNum;
  String? msg;
  List<Holiday>? holiday;

  AllHolidayModel({this.status, this.errNum, this.msg, this.holiday});

  AllHolidayModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['holiday'] != null) {
      holiday = <Holiday>[];
      json['holiday'].forEach((v) {
        holiday!.add(new Holiday.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.holiday != null) {
      data['holiday'] = this.holiday!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Holiday {
  int? id;
  int? employeeId;
  int? branchId;
  String? fromDate;
  String? toDate;
  String? reason;
  int? isApproved;
  String? createdAt;
  String? updatedAt;

  Holiday(
      {this.id,
        this.employeeId,
        this.branchId,
        this.fromDate,
        this.toDate,
        this.reason,
        this.isApproved,
        this.createdAt,
        this.updatedAt});

  Holiday.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employee_id'];
    branchId = json['branch_id'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    reason = json['reason'];
    isApproved = json['is_approved'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee_id'] = this.employeeId;
    data['branch_id'] = this.branchId;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['reason'] = this.reason;
    data['is_approved'] = this.isApproved;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

import 'package:elngar/rep/abstract_json_resource.dart';

class UserProfileModel extends AbstractJsonResource{
  bool? status;
  String? errNum;
  String? msg;
  UserProfile? userProfile;

  UserProfileModel({this.status, this.errNum, this.msg, this.userProfile});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    userProfile = json['user_profile'] != null
        ? new UserProfile.fromJson(json['user_profile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.userProfile != null) {
      data['user_profile'] = this.userProfile!.toJson();
    }
    return data;
  }
}

class UserProfile {
  int? id;
  String? name;
  int? jobNum;
  String? image;
  String? type;
  String? startWorkDate;
  String? payroll;

  UserProfile(
      {this.id,
        this.name,
        this.jobNum,
        this.image,
        this.type,
        this.startWorkDate,
        this.payroll});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    jobNum = json['job_num'];
    image = json['image'];
    type = json['type'];
    startWorkDate = json['start_work_date'];
    payroll = json['payroll'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['job_num'] = this.jobNum;
    data['image'] = this.image;
    data['type'] = this.type;
    data['start_work_date'] = this.startWorkDate;
    data['payroll'] = this.payroll;
    return data;
  }
}

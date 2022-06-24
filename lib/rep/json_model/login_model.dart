import 'package:elngar/rep/abstract_json_resource.dart';

class LogInModel extends AbstractJsonResource{
  bool? status;
  String? errNum;
  String? msg;
  User? user;

  LogInModel({this.status, this.errNum, this.msg, this.user});

  LogInModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  int? jobNum;
  String? name;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  String? token;

  User(
      {this.id,
        this.jobNum,
        this.name,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobNum = json['job_num'];
    name = json['name'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['job_num'] = this.jobNum;
    data['name'] = this.name;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['token'] = this.token;
    return data;
  }
}

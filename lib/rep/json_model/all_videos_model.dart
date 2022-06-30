import 'package:elngar/rep/abstract_json_resource.dart';

class AllVideosModel extends AbstractJsonResource{
  bool? status;
  String? errNum;
  String? msg;
  List<Videos>? videos;

  AllVideosModel({this.status, this.errNum, this.msg, this.videos});

  AllVideosModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(new Videos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.videos != null) {
      data['videos'] = this.videos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Videos {
  int? id;
  String? media;
  int? type;
  int? employeeId;
  int? isActive;
  String? createdAt;
  String? updatedAt;

  Videos(
      {this.id,
        this.media,
        this.type,
        this.employeeId,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  Videos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    media ='https://safsooofa.com/'+ json['media'];
    type = json['type'];
    employeeId = json['employee_id'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['media'] = this.media;
    data['type'] = this.type;
    data['employee_id'] = this.employeeId;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

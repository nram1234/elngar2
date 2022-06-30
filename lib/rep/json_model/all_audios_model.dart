import 'package:elngar/rep/abstract_json_resource.dart';

class AllAudiosModel extends AbstractJsonResource {
  bool? status;
  String? errNum;
  String? msg;
  List<Audios>? audios;

  AllAudiosModel({this.status, this.errNum, this.msg, this.audios});

  AllAudiosModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['audios'] != null) {
      audios = <Audios>[];
      json['audios'].forEach((v) {
        audios!.add(new Audios.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.audios != null) {
      data['audios'] = this.audios!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Audios {
  int? id;
  String? media;
  int? type;
  int? employeeId;
  int? isActive;
  String? createdAt;
  String? updatedAt;

  Audios(
      {this.id,
        this.media,
        this.type,
        this.employeeId,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  Audios.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    media = 'https://safsooofa.com/'+json['media'];
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

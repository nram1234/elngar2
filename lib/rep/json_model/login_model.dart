import 'package:elngar/rep/abstract_json_resource.dart';

class LogInModel extends AbstractJsonResource{
  bool? status;
  String? errNum;
  String? msg;
  Data? data;

  LogInModel({this.status, this.errNum, this.msg, this.data});

  LogInModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? s0;
  List<Branch>? branch;
  User? user;

  Data({this.s0, this.branch, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    if (json['branch'] != null) {
      branch = <Branch>[];
      json['branch'].forEach((v) {
        branch!.add(new Branch.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.s0;
    if (this.branch != null) {
      data['branch'] = this.branch!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Branch {
  int? id;
  int? countryId;
  int? documentId;
  int? assetId;
  String? name;
  String? phone;
  String? address;
  String? longitude;
  String? latitude;
  int? cost;
  int? rent;
  int? isActive;
  String? createdAt;
  String? updatedAt;

  Branch(
      {this.id,
        this.countryId,
        this.documentId,
        this.assetId,
        this.name,
        this.phone,
        this.address,
        this.longitude,
        this.latitude,
        this.cost,
        this.rent,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryId = json['country_id'];
    documentId = json['document_id'];
    assetId = json['asset_id'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    cost = json['cost'];
    rent = json['rent'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_id'] = this.countryId;
    data['document_id'] = this.documentId;
    data['asset_id'] = this.assetId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['cost'] = this.cost;
    data['rent'] = this.rent;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  int? id;
  int? jobNum;
  String? name;
  Null? deviceId;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  String? token;

  User(
      {this.id,
        this.jobNum,
        this.name,
        this.deviceId,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jobNum = json['job_num'];
    name = json['name'];
    deviceId = json['device_id'];
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
    data['device_id'] = this.deviceId;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['token'] = this.token;
    return data;
  }
}

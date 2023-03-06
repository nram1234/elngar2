import '../abstract_json_resource.dart';

class SalariesModel extends AbstractJsonResource{
  bool? status;
  String? errNum;
  String? msg;
  List<Notifications>? notifications;

  SalariesModel({this.status, this.errNum, this.msg, this.notifications});

  SalariesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['notifications'] != null) {
      notifications = <Notifications>[];
      json['notifications'].forEach((v) {
        notifications!.add(new Notifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.notifications != null) {
      data['notifications'] =
          this.notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notifications {
  String? sallerValue;
  String? daies;
  String? date;
  String? status;

  Notifications({this.sallerValue, this.daies, this.date, this.status});

  Notifications.fromJson(Map<String, dynamic> json) {
    sallerValue = json['saller_value'];
    daies = json['daies'];
    date = json['date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['saller_value'] = this.sallerValue;
    data['daies'] = this.daies;
    data['date'] = this.date;
    data['status'] = this.status;
    return data;
  }
}

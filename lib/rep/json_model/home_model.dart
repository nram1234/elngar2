import '../abstract_json_resource.dart';

class HomeModel extends AbstractJsonResource{
  bool? status;
  String? errNum;
  String? msg;
  Home? home;

  HomeModel({this.status, this.errNum, this.msg, this.home});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    home = json['home'] != null ? new Home.fromJson(json['home']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.home != null) {
      data['home'] = this.home!.toJson();
    }
    return data;
  }
}

class Home {
  String? user;
  String? articles;
  int? attendance;
  int? absence;
  int? branchId;
  String? branchName;

  Home(
      {this.user,
        this.articles,
        this.attendance,
        this.absence,
        this.branchId,
        this.branchName});

  Home.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    articles = json['articles'];
    attendance = json['attendance'];
    absence = json['Absence'];
    branchId = json['branch_id'];
    branchName = json['branch_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['articles'] = this.articles;
    data['attendance'] = this.attendance;
    data['Absence'] = this.absence;
    data['branch_id'] = this.branchId;
    data['branch_name'] = this.branchName;
    return data;
  }
}

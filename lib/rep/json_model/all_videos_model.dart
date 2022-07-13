import 'package:elngar/rep/abstract_json_resource.dart';

class AllVideosModel extends AbstractJsonResource{
  bool? status;
  String? errNum;
  String? msg;
  List<Media>? media;

  AllVideosModel({this.status, this.errNum, this.msg, this.media});

  AllVideosModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['errNum'] = this.errNum;
    data['msg'] = this.msg;
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Media {
  int? id;
  String? media;

  Media({this.id, this.media});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    media = json['media'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['media'] = this.media;
    return data;
  }
}

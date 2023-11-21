class RecentModel {
  String? ver;
  String? status;
  String? message;
  List<Data>? data;

  RecentModel({this.ver, this.status, this.message, this.data});

  RecentModel.fromJson(Map<String, dynamic> json) {
    ver = json['ver'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ver'] = ver;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? shortid;
  String? slnk;
  String? title;
  String? domain;
  String? createdate;
  int? clicks;
  int? enable;
  String? urlpin;

  Data(
      {this.shortid,
      this.slnk,
      this.title,
      this.domain,
      this.createdate,
      this.clicks,
      this.enable,
      this.urlpin});

  Data.fromJson(Map<String, dynamic> json) {
    shortid = json['shortid'];
    slnk = json['slnk'];
    title = json['title'];
    domain = json['domain'];
    createdate = json['createdate'];
    clicks = json['clicks'];
    enable = json['enable'];
    urlpin = json['urlpin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shortid'] = shortid;
    data['slnk'] = slnk;
    data['title'] = title;
    data['domain'] = domain;
    data['createdate'] = createdate;
    data['clicks'] = clicks;
    data['enable'] = enable;
    data['urlpin'] = urlpin;
    return data;
  }
}

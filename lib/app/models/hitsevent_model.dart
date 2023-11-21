class HitsEventModel {
  String? ver;
  String? status;
  String? message;
  List<Data>? data;

  HitsEventModel({this.ver, this.status, this.message, this.data});

  HitsEventModel.fromJson(Map<String, dynamic> json) {
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
  String? aip;
  String? country;
  String? cplatform;
  String? cbrowser;
  String? referer;
  String? status;
  String? timeid;

  Data({
    this.aip,
    this.country,
    this.cplatform,
    this.cbrowser,
    this.referer,
    this.status,
    this.timeid,
    // this.e,
  });

  Data.fromJson(Map<String, dynamic> json) {
    aip = json['aip'];
    country = json['country'];
    cplatform = json['cplatform'];
    cbrowser = json['cbrowser'];
    referer = json['referer'];
    status = json['status'];
    timeid = json['timeid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['aip'] = aip;
    data['country'] = country;
    data['cplatform'] = cplatform;
    data['cbrowser'] = cbrowser;
    data['referer'] = referer;
    data['status'] = status;
    data['timeid'] = timeid;

    return data;
  }
}

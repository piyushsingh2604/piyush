class CountryList {
  bool? status;
  String? message;
  List<Country>? data;

  CountryList({this.status, this.message, this.data});

  CountryList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Country>[];
      json['data'].forEach((v) {
        data!.add(new Country.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Country {
  int? id;
  String? name;
  String? code;
  String? telCode;
  String? timezone;
  String? flag;
  String? createdAt;
  String? updatedAt;

  Country(
      {this.id,
      this.name,
      this.code,
      this.telCode,
      this.timezone,
      this.flag,
      this.createdAt,
      this.updatedAt});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    telCode = json['tel_code'];
    timezone = json['timezone'];
    flag = json['flag'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['tel_code'] = this.telCode;
    data['timezone'] = this.timezone;
    data['flag'] = this.flag;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

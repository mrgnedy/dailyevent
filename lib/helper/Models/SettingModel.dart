class SettingModel {
  String msg;
  Data data;

  SettingModel({this.msg, this.data});

  SettingModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String siteName;
  String siteLogo;
  String usage;
  String policy;
  String about;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
      this.siteName,
      this.siteLogo,
      this.usage,
      this.policy,
      this.about,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    siteName = json['site_name'];
    siteLogo = json['site_logo'];
    usage = json['usage'];
    policy = json['policy'];
    about = json['about'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['site_name'] = this.siteName;
    data['site_logo'] = this.siteLogo;
    data['usage'] = this.usage;
    data['policy'] = this.policy;
    data['about'] = this.about;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
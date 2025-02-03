class BannerModel {
  int? id;
  String? bannerImage;
  String? title;
  String? subtitle;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  BannerModel({this.id, this.bannerImage, this.title, this.subtitle, this.createdAt, this.updatedAt, this.deletedAt});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bannerImage = json['banner_image'];
    title = json['title'];
    subtitle = json['subtitle'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['banner_image'] = this.bannerImage;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
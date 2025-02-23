class CategoryModel {
  int? id;
  String? title;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  CategoryModel({
    this.id,
    this.title,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
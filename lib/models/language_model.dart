class LanguageModel {
  int? id;
  String? title;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  LanguageModel({this.id, this.title, this.createdAt, this.updatedAt, this.deletedAt});

  LanguageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
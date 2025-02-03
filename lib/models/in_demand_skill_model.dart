class InDemandSkillModel {
  int? id;
  String? title;
  String? type;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? categoryMasterId;
  int? jobsCount;

  InDemandSkillModel({
    this.id,
    this.title,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.categoryMasterId,
    this.jobsCount,
  });

  InDemandSkillModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    categoryMasterId = json['category_master_id'];
    jobsCount = json['jobs_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['category_master_id'] = this.categoryMasterId;
    data['jobs_count'] = this.jobsCount;
    return data;
  }
}
class JobModel {
  int? id;
  String? title;
  int? jobTypeId;
  int? companyId;
  String? minExp;
  String? maxExp;
  int? minSal;
  int? maxSal;
  String? salHide;
  String? qualification;
  int? noOpenings;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? summary;
  String? roles;
  String? endDate;
  int? joinPeriodId;
  String? subcompanyId;
  int? publish;
  int? needPassport;
  String? startDate;
  String? experienceId;
  int? industryId;
  bool? campusPool;
  String? jobOtherinfo;
  String? periodFromDate;
  String? periodToDate;
  String? isOpen;
  int? noOfViews;
  int? isFavourite;
  int? isApplied;
  int? isRated;
  List<String>? candidateJobRating;
  List<AlmamaterMasters>? almamaterMasters;
  Company? company;
  CandidateJob? candidateJob;
  String? experience;
  Industry? industry;
  JobType? jobType;
  Industry? joinPeriod;
  String? subcompany;
  List<MarriageStatus>? marriageStatus;
  List<JobSkills>? jobSkills;
  List<Cities>? cities;

  JobModel({
    this.id,
    this.title,
    this.jobTypeId,
    this.companyId,
    this.minExp,
    this.maxExp,
    this.minSal,
    this.maxSal,
    this.salHide,
    this.qualification,
    this.noOpenings,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.summary,
    this.roles,
    this.endDate,
    this.joinPeriodId,
    this.subcompanyId,
    this.publish,
    this.needPassport,
    this.startDate,
    this.experienceId,
    this.industryId,
    this.campusPool,
    this.jobOtherinfo,
    this.periodFromDate,
    this.periodToDate,
    this.isOpen,
    this.noOfViews,
    this.isFavourite,
    this.isApplied,
    this.isRated,
    this.candidateJobRating,
    this.almamaterMasters,
    this.company,
    this.experience,
    this.industry,
    this.jobType,
    this.joinPeriod,
    this.subcompany,
    this.marriageStatus,
    this.jobSkills,
    this.cities,
  });

  JobModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? int.parse(json['id'].toString()) : null;
    title = json['title'];

    jobTypeId = json['job_type_id'] != null
        ? int.parse(json['job_type_id'].toString())
        : null;
    companyId = json['company_id'] != null
        ? int.parse(json['company_id'].toString())
        : null;
    minExp = json['min_exp'];
    maxExp = json['max_exp'];
    minSal =
        json['min_sal'] != null ? int.parse(json['min_sal'].toString()) : null;
    maxSal =
        json['max_sal'] != null ? int.parse(json['max_sal'].toString()) : null;
    salHide = json['sal_hide'];
    qualification = json['qualification'];
    noOpenings = json['no_openings'] != null
        ? int.parse(json['no_openings'].toString())
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    summary = json['summary'];
    roles = json['roles'];
    endDate = json['end_date'];
    joinPeriodId = json['join_period_id'] != null
        ? int.parse(json['join_period_id'].toString())
        : null;
    subcompanyId = json['subcompany_id'].toString();
    publish =
        json['publish'] != null ? int.parse(json['publish'].toString()) : null;
    needPassport = json['need_passport'] != null
        ? int.parse(json['need_passport'].toString())
        : null;
    startDate = json['start_date'];
    experienceId = json['experience_id'];
    industryId = json['industry_id'] != null
        ? int.parse(json['industry_id'].toString())
        : null;
    campusPool = json['campus_pool'];
    jobOtherinfo = json['job_otherinfo'];
    periodFromDate = json['period_from_date'];
    periodToDate = json['period_to_date'];
    isOpen = json['is_open'];
    noOfViews = json['no_of_views'] != null
        ? int.parse(json['no_of_views'].toString())
        : null;
    isFavourite = json['is_favourated'] != null
        ? int.parse(json['is_favourated'].toString())
        : null;
    isApplied = json['is_applied'] != null
        ? int.parse(json['is_applied'].toString())
        : null;
    isRated = json['is_rated'] != null
        ? int.parse(json['is_rated'].toString())
        : null;
    candidateJobRating = json['candidate_job_rating'].cast<String>();
    if (json['almamater_masters'] != null) {
      almamaterMasters = <AlmamaterMasters>[];
      json['almamater_masters'].forEach((v) {
        almamaterMasters!.add(new AlmamaterMasters.fromJson(v));
      });
    }
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
    candidateJob = (json['candidate_job'] != null
        ? new CandidateJob.fromJson(json['candidate_job'])
        : null);
    experience = json['experience'];
    industry = json['industry'] != null
        ? new Industry.fromJson(json['industry'])
        : null;
    jobType = json['job_type'] != null
        ? new JobType.fromJson(json['job_type'])
        : null;
    joinPeriod = json['join_period'] != null
        ? new Industry.fromJson(json['join_period'])
        : null;
    subcompany = null;
    if (json['marriage_statusses'] != null) {
      marriageStatus = <MarriageStatus>[];
      json['marriage_statusses'].forEach((v) {
        marriageStatus!.add(new MarriageStatus.fromJson(v));
      });
    }
    if (json['job_skills'] != null) {
      jobSkills = <JobSkills>[];
      json['job_skills'].forEach((v) {
        jobSkills!.add(new JobSkills.fromJson(v));
      });
    }
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(new Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['job_type_id'] = this.jobTypeId;
    data['company_id'] = this.companyId;
    data['min_exp'] = this.minExp;
    data['max_exp'] = this.maxExp;
    data['min_sal'] = this.minSal;
    data['max_sal'] = this.maxSal;
    data['sal_hide'] = this.salHide;
    data['qualification'] = this.qualification;
    data['no_openings'] = this.noOpenings;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['summary'] = this.summary;
    data['roles'] = this.roles;
    data['end_date'] = this.endDate;
    data['join_period_id'] = this.joinPeriodId;
    data['subcompany_id'] = this.subcompanyId;
    data['publish'] = this.publish;
    data['need_passport'] = this.needPassport;
    data['start_date'] = this.startDate;
    data['experience_id'] = this.experienceId;
    data['industry_id'] = this.industryId;
    data['campus_pool'] = this.campusPool;
    data['job_otherinfo'] = this.jobOtherinfo;
    data['period_from_date'] = this.periodFromDate;
    data['period_to_date'] = this.periodToDate;
    data['is_open'] = this.isOpen;
    data['no_of_views'] = this.noOfViews;
    data['is_favourated'] = this.isFavourite;
    data['is_applied'] = this.isApplied;
    data['is_rated'] = this.isRated;
    data['candidate_job_rating'] = this.candidateJobRating;
    if (this.almamaterMasters != null) {
      data['almamater_masters'] =
          this.almamaterMasters!.map((v) => v.toJson()).toList();
    }
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    data['experience'] = this.experience;
    if (this.industry != null) {
      data['industry'] = this.industry!.toJson();
    }
    if (this.jobType != null) {
      data['job_type'] = this.jobType!.toJson();
    }
    if (this.joinPeriod != null) {
      data['join_period'] = this.joinPeriod!.toJson();
    }
    data['subcompany'] = this.subcompany;
    if (this.marriageStatus != null) {
      data['marriage_statusses'] =
          this.marriageStatus!.map((v) => v.toJson()).toList();
    }
    if (this.jobSkills != null) {
      data['job_skills'] = this.jobSkills!.map((v) => v.toJson()).toList();
    }
    if (this.cities != null) {
      data['cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AlmamaterMasters {
  int? id;
  String? name;
  String? type;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  Pivot? pivot;

  AlmamaterMasters(
      {this.id,
      this.name,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.pivot});

  AlmamaterMasters.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? int.parse(json['id'].toString()) : null;
    name = json['name'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? jobId;
  int? almamaterMasterId;
  int? id;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Pivot(
      {this.jobId,
      this.almamaterMasterId,
      this.id,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Pivot.fromJson(Map<String, dynamic> json) {
    jobId =
        json['job_id'] != null ? int.parse(json['job_id'].toString()) : null;
    almamaterMasterId = json['almamater_master_id'] != null
        ? int.parse(json['almamater_master_id'].toString())
        : null;
    id = json['id'] != null ? int.parse(json['id'].toString()) : null;
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_id'] = this.jobId;
    data['almamater_master_id'] = this.almamaterMasterId;
    data['id'] = this.id;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

////////////candJob
class Company {
  int? id;
  String? title;
  String? logo;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? superAdminLoginId;
  int? industryId;
  int? userId;
  String? alternativeEmail;
  String? companyUrl;
  String? linkedinUrl;
  String? twitterUrl;
  String? facebookUrl;
  String? address;
  User? user;

  Company({
    this.id,
    this.title,
    this.logo,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.superAdminLoginId,
    this.industryId,
    this.userId,
    this.alternativeEmail,
    this.companyUrl,
    this.linkedinUrl,
    this.twitterUrl,
    this.facebookUrl,
    this.address,
    this.user,
  });

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? int.parse(json['id'].toString()) : null;
    title = json['title'];
    logo = json['logo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    superAdminLoginId = json['superadmin_login_id'] != null
        ? int.parse(json['superadmin_login_id'].toString())
        : null;
    industryId = json['industry_id'] != null
        ? int.parse(json['industry_id'].toString())
        : null;
    userId =
        json['user_id'] != null ? int.parse(json['user_id'].toString()) : null;
    alternativeEmail = json['alternative_email'];
    companyUrl = json['company_url'];
    linkedinUrl = json['linkedin_url'];
    twitterUrl = json['twitter_url'];
    facebookUrl = json['facebook_url'];
    address = json['address'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['logo'] = this.logo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['superadmin_login_id'] = this.superAdminLoginId;
    data['industry_id'] = this.industryId;
    data['user_id'] = this.userId;
    data['alternative_email'] = this.alternativeEmail;
    data['company_url'] = this.companyUrl;
    data['linkedin_url'] = this.linkedinUrl;
    data['twitter_url'] = this.twitterUrl;
    data['facebook_url'] = this.facebookUrl;
    data['address'] = this.address;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

//og
class CandidateJob {
  String? candidate_job_statuss;
  String? title;
  String? logo;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? superAdminLoginId;
  int? industryId;
  int? userId;
  String? alternativeEmail;
  String? companyUrl;
  String? linkedinUrl;
  String? twitterUrl;
  String? facebookUrl;
  String? address;
  User? user;

  CandidateJob({
    this.candidate_job_statuss,
    // this.title,
    // this.logo,
    // this.createdAt,
    // this.updatedAt,
    // this.deletedAt,
    // this.superAdminLoginId,
    // this.industryId,
    // this.userId,
    // this.alternativeEmail,
    // this.companyUrl,
    // this.linkedinUrl,
    // this.twitterUrl,
    // this.facebookUrl,
    // this.address,
    // this.user,
  });

  CandidateJob.fromJson(List json) {
    candidate_job_statuss = json[0]['candidate_job_statuss']["title"] != null
        ? json[0]['candidate_job_statuss']["title"]
        : null;
    // title = json['title'];
    // logo = json['logo'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // deletedAt = json['deleted_at'];
    // superAdminLoginId = json['superadmin_login_id'] != null
    //     ? int.parse(json['superadmin_login_id'].toString())
    //     : null;
    // industryId = json['industry_id'] != null
    //     ? int.parse(json['industry_id'].toString())
    //     : null;
    // userId =
    //     json['user_id'] != null ? int.parse(json['user_id'].toString()) : null;
    // alternativeEmail = json['alternative_email'];
    // companyUrl = json['company_url'];
    // linkedinUrl = json['linkedin_url'];
    // twitterUrl = json['twitter_url'];
    // facebookUrl = json['facebook_url'];
    // address = json['address'];
    // user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['candidate_job_statuss'] = this.candidate_job_statuss;
    // data['title'] = this.title;
    // data['logo'] = this.logo;
    // data['created_at'] = this.createdAt;
    // data['updated_at'] = this.updatedAt;
    // data['deleted_at'] = this.deletedAt;
    // data['superadmin_login_id'] = this.superAdminLoginId;
    // data['industry_id'] = this.industryId;
    // data['user_id'] = this.userId;
    // data['alternative_email'] = this.alternativeEmail;
    // data['company_url'] = this.companyUrl;
    // data['linkedin_url'] = this.linkedinUrl;
    // data['twitter_url'] = this.twitterUrl;
    // data['facebook_url'] = this.facebookUrl;
    // data['address'] = this.address;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? phone;

  User({this.id, this.name, this.phone});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? int.parse(json['id'].toString()) : null;
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }
}

class Industry {
  int? id;
  String? title;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Industry(
      {this.id, this.title, this.deletedAt, this.createdAt, this.updatedAt});

  Industry.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? int.parse(json['id'].toString()) : null;
    title = json['title'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class JobType {
  int? id;
  String? title;
  String? type;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  JobType(
      {this.id,
      this.title,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  JobType.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? int.parse(json['id'].toString()) : null;
    title = json['title'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class MarriageStatus {
  int? id;
  String? title;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  MarriagePivot? marriagePivot;

  MarriageStatus({
    this.id,
    this.title,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.marriagePivot,
  });

  MarriageStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? int.parse(json['id'].toString()) : null;
    title = json['title'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    marriagePivot = json['pivot'] != null
        ? new MarriagePivot.fromJson(json['pivot'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.marriagePivot != null) {
      data['pivot'] = this.marriagePivot!.toJson();
    }
    return data;
  }
}

class MarriagePivot {
  int? jobId;
  int? marriageStatusId;
  int? id;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  MarriagePivot(
      {this.jobId,
      this.marriageStatusId,
      this.id,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  MarriagePivot.fromJson(Map<String, dynamic> json) {
    jobId =
        json['job_id'] != null ? int.parse(json['job_id'].toString()) : null;
    marriageStatusId = json['marriage_statuss_id'] != null
        ? int.parse(json['marriage_statuss_id'].toString())
        : null;
    id = json['id'] != null ? int.parse(json['id'].toString()) : null;
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_id'] = this.jobId;
    data['marriage_statuss_id'] = this.marriageStatusId;
    data['id'] = this.id;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class JobSkills {
  int? id;
  int? jobId;
  int? skillMasterId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? categoryMasterId;
  String? rating;
  SkillMaster? skillMaster;
  Industry? categoryMaster;

  JobSkills(
      {this.id,
      this.jobId,
      this.skillMasterId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.categoryMasterId,
      this.rating,
      this.skillMaster,
      this.categoryMaster});

  JobSkills.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? int.parse(json['id'].toString()) : null;
    jobId =
        json['job_id'] != null ? int.parse(json['job_id'].toString()) : null;
    skillMasterId = json['skill_master_id'] != null
        ? int.parse(json['skill_master_id'].toString())
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    categoryMasterId = json['category_master_id'] != null
        ? int.parse(json['category_master_id'].toString())
        : null;
    rating = json['rating'];
    skillMaster = json['skill_master'] != null
        ? new SkillMaster.fromJson(json['skill_master'])
        : null;
    categoryMaster = json['category_master'] != null
        ? new Industry.fromJson(json['category_master'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['job_id'] = this.jobId;
    data['skill_master_id'] = this.skillMasterId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['category_master_id'] = this.categoryMasterId;
    data['rating'] = this.rating;
    if (this.skillMaster != null) {
      data['skill_master'] = this.skillMaster!.toJson();
    }
    if (this.categoryMaster != null) {
      data['category_master'] = this.categoryMaster!.toJson();
    }
    return data;
  }
}

class SkillMaster {
  int? id;
  String? title;
  String? type;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? categoryMasterId;

  SkillMaster(
      {this.id,
      this.title,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.categoryMasterId});

  SkillMaster.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? int.parse(json['id'].toString()) : null;
    title = json['title'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    categoryMasterId = json['category_master_id'] != null
        ? int.parse(json['category_master_id'].toString())
        : null;
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
    return data;
  }
}

class Cities {
  int? id;
  String? name;
  int? stateId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  CityPivot? cityPivot;

  Cities({
    this.id,
    this.name,
    this.stateId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.cityPivot,
  });

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? int.parse(json['id'].toString()) : null;
    name = json['name'];
    stateId = json['state_id'] != null
        ? int.parse(json['state_id'].toString())
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    cityPivot =
        json['pivot'] != null ? new CityPivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['state_id'] = this.stateId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.cityPivot != null) {
      data['pivot'] = this.cityPivot!.toJson();
    }
    return data;
  }
}

class CityPivot {
  int? jobId;
  int? cityId;
  int? id;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  CityPivot(
      {this.jobId,
      this.cityId,
      this.id,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  CityPivot.fromJson(Map<String, dynamic> json) {
    jobId =
        json['job_id'] != null ? int.parse(json['job_id'].toString()) : null;
    cityId =
        json['city_id'] != null ? int.parse(json['city_id'].toString()) : null;
    id = json['id'] != null ? int.parse(json['id'].toString()) : null;
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job_id'] = this.jobId;
    data['city_id'] = this.cityId;
    data['id'] = this.id;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

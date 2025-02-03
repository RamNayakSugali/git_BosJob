class CourseModel {
  int? id;
  String? title;
  String? subTitle;
  String? description;
  String? level;
  int? courseTypeMasterId;
  int? instituteId;
  int? duration;
  int? coachId;
  int? price;
  int? categoryMasterId;
  String? totalSeats;
  String? courseBanner;
  String? moreInforamtion;
  String? courseIntroductoryVideo;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? courseModeId;
  bool? publish;
  String? packAvailable;
  String? colorCode;
  int? isCertified;
  int? exerciseId;
  int? jobCount;
  int? placementOfficerId;
  int? languageMasterId;
  int? allLessons;
  int? compleatedLessons;
  List<CourseReviews>? courseReviews;
  CourseTypeMaster? courseTypeMaster;
  Institute? institute;
  List<Coaches>? coaches;
  List<Candidates>? candidates;

  CourseModel(
      {this.id,
      this.title,
      this.subTitle,
      this.description,
      this.level,
      this.courseTypeMasterId,
      this.instituteId,
      this.duration,
      this.coachId,
      this.price,
      this.categoryMasterId,
      this.totalSeats,
      this.courseBanner,
      this.moreInforamtion,
      this.courseIntroductoryVideo,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.courseModeId,
      this.publish,
      this.packAvailable,
      this.colorCode,
      this.isCertified,
      this.exerciseId,
      this.jobCount,
      this.placementOfficerId,
      this.languageMasterId,
      this.allLessons,
      this.compleatedLessons,
      this.courseReviews,
      this.courseTypeMaster,
      this.institute,
      this.coaches,
      this.candidates});

  CourseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? int.parse(json['id'].toString()) : null;
    title = json['title'];
    subTitle = json['sub_title'];
    description = json['description'];
    level = json['level'];
    courseTypeMasterId =
        json['course_type_master_id'] != null ? int.parse(json['course_type_master_id'].toString()) : null;
    instituteId = json['institute_id'] != null ? int.parse(json['institute_id'].toString()) : null;
    duration = json['duration'] != null ? int.parse(json['duration'].toString()) : null;
    coachId = json['coach_id'] != null ? int.parse(json['coach_id'].toString()) : null;
    price = json['price'] != null ? int.parse(json['price'].toString()) : null;
    categoryMasterId = json['category_master_id'] != null ? int.parse(json['category_master_id'].toString()) : null;
    totalSeats = json['total_seats'];
    courseBanner = json['course_banner'];
    moreInforamtion = json['more_inforamtion'];
    courseIntroductoryVideo = json['course_introductory_video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    courseModeId = json['course_mode_id'] != null ? int.parse(json['course_mode_id'].toString()) : null;
    publish = json['publish'];
    packAvailable = json['pack_available'];
    colorCode = json['color_code'];
    isCertified = json['is_certified'] != null ? int.parse(json['is_certified'].toString()) : null;
    exerciseId = json['exercise_id'] != null ? int.parse(json['exercise_id'].toString()) : null;
    jobCount = json['job_count'] != null ? int.parse(json['job_count'].toString()) : null;
    placementOfficerId =
        json['placement_officer_id'] != null ? int.parse(json['placement_officer_id'].toString()) : null;
    languageMasterId = json['language_master_id'] != null ? int.parse(json['language_master_id'].toString()) : null;
    allLessons = json['all_lessons'] != null ? int.parse(json['all_lessons'].toString()) : null;
    compleatedLessons = json['compleated_lessons'] != null ? int.parse(json['compleated_lessons'].toString()) : null;
    if (json['course_reviews'] != null) {
      courseReviews = <CourseReviews>[];
      json['course_reviews'].forEach((v) {
        courseReviews!.add(new CourseReviews.fromJson(v));
      });
    }
    courseTypeMaster =
        json['course_type_master'] != null ? new CourseTypeMaster.fromJson(json['course_type_master']) : null;
    institute = json['institute'] != null ? Institute.fromJson(json['institute']) : null;
    if (json['coaches'] != null) {
      coaches = <Coaches>[];
      json['coaches'].forEach((v) {
        coaches!.add(new Coaches.fromJson(v));
      });
    }
    if (json['candidates'] != null) {
      candidates = <Candidates>[];
      json['candidates'].forEach((v) {
        candidates!.add(new Candidates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['sub_title'] = this.subTitle;
    data['description'] = this.description;
    data['level'] = this.level;
    data['course_type_master_id'] = this.courseTypeMasterId;
    data['institute_id'] = this.instituteId;
    data['duration'] = this.duration;
    data['coach_id'] = this.coachId;
    data['price'] = this.price;
    data['category_master_id'] = this.categoryMasterId;
    data['total_seats'] = this.totalSeats;
    data['course_banner'] = this.courseBanner;
    data['more_inforamtion'] = this.moreInforamtion;
    data['course_introductory_video'] = this.courseIntroductoryVideo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['course_mode_id'] = this.courseModeId;
    data['publish'] = this.publish;
    data['pack_available'] = this.packAvailable;
    data['color_code'] = this.colorCode;
    data['is_certified'] = this.isCertified;
    data['exercise_id'] = this.exerciseId;
    data['job_count'] = this.jobCount;
    data['placement_officer_id'] = this.placementOfficerId;
    data['language_master_id'] = this.languageMasterId;
    data['all_lessons'] = this.allLessons;
    data['compleated_lessons'] = this.compleatedLessons;
    if (this.courseReviews != null) {
      data['course_reviews'] = this.courseReviews!.map((v) => v.toJson()).toList();
    }
    if (this.courseTypeMaster != null) {
      data['course_type_master'] = this.courseTypeMaster!.toJson();
    }
    data['institute'] = this.institute;
    if (this.coaches != null) {
      data['coaches'] = this.coaches!.map((v) => v.toJson()).toList();
    }
    if (this.candidates != null) {
      data['candidates'] = this.candidates!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CourseReviews {
  int? id;
  int? courseId;
  int? candidateId;
  String? rating;
  String? review;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  CourseReviews(
      {this.id,
      this.courseId,
      this.candidateId,
      this.rating,
      this.review,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  CourseReviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    candidateId = json['candidate_id'];
    rating = json['rating'];
    review = json['review'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['course_id'] = this.courseId;
    data['candidate_id'] = this.candidateId;
    data['rating'] = this.rating;
    data['review'] = this.review;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class CourseTypeMaster {
  int? id;
  String? title;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  CourseTypeMaster({this.id, this.title, this.createdAt, this.updatedAt, this.deletedAt});

  CourseTypeMaster.fromJson(Map<String, dynamic> json) {
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

class Institute {
  int? id;
  String? name;
  String? primaryContact;
  String? primaryEmail;
  String? phone;
  int? cityId;
  int? stateId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? vimeoId;
  int? superadminLoginId;

  Institute(
      {this.id,
      this.name,
      this.primaryContact,
      this.primaryEmail,
      this.phone,
      this.cityId,
      this.stateId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.vimeoId,
      this.superadminLoginId});

  Institute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    primaryContact = json['primary_contact'];
    primaryEmail = json['primary_email'];
    phone = json['phone'];
    cityId = json['city_id'];
    stateId = json['state_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    vimeoId = json['vimeo_id'];
    superadminLoginId = json['superadmin_login_id'] != null ? int.parse(json['superadmin_login_id'].toString()) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['primary_contact'] = this.primaryContact;
    data['primary_email'] = this.primaryEmail;
    data['phone'] = this.phone;
    data['city_id'] = this.cityId;
    data['state_id'] = this.stateId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['vimeo_id'] = this.vimeoId;
    data['superadmin_login_id'] = this.superadminLoginId;
    return data;
  }
}

class Coaches {
  int? id;
  int? userId;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? vimeoId;
  int? superadminLoginId;
  String? percentage;
  Pivot? pivot;
  User? user;

  Coaches(
      {this.id,
      this.userId,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.vimeoId,
      this.superadminLoginId,
      this.percentage,
      this.pivot,
      this.user});

  Coaches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    vimeoId = json['vimeo_id'];
    superadminLoginId = json['superadmin_login_id'] != null ? int.parse(json['superadmin_login_id'].toString()) : null;
    percentage = json['percentage'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['vimeo_id'] = this.vimeoId;
    data['superadmin_login_id'] = this.superadminLoginId;
    data['percentage'] = this.percentage;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? courseId;
  int? coachId;
  int? id;
  String? deletedAt;
  String? isPrimary;
  String? createdAt;
  String? updatedAt;

  Pivot({this.courseId, this.coachId, this.id, this.deletedAt, this.isPrimary, this.createdAt, this.updatedAt});

  Pivot.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'] != null ? int.parse(json['course_id'].toString()) : null;
    coachId = json['coach_id'] != null ? int.parse(json['coach_id'].toString()) : null;
    id = json['id'] != null ? int.parse(json['id'].toString()) : null;
    deletedAt = json['deleted_at'];
    isPrimary = json['is_primary'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course_id'] = this.courseId;
    data['coach_id'] = this.coachId;
    data['id'] = this.id;
    data['deleted_at'] = this.deletedAt;
    data['is_primary'] = this.isPrimary;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? firstName;
  String? lastName;
  String? phone;
  int? cityId;
  int? stateId;
  String? email;
  String? emailVerifiedAt;
  String? verification;
  String? apiToken;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? profilePic;
  String? userIntroduction;
  String? googleId;
  int? marriageStatusId;
  int? genderId;
  String? linkedIn;
  int? isCoach;
  int? isInstitute;
  int? isCompany;
  int? isPlacementOfficer;
  int? isCounseller;
  int? isStudent;
  int? isProfileComplete;
  int? isSuperadmin;

  User(
      {this.id,
      this.name,
      this.firstName,
      this.lastName,
      this.phone,
      this.cityId,
      this.stateId,
      this.email,
      this.emailVerifiedAt,
      this.verification,
      this.apiToken,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.profilePic,
      this.userIntroduction,
      this.googleId,
      this.marriageStatusId,
      this.genderId,
      this.linkedIn,
      this.isCoach,
      this.isInstitute,
      this.isCompany,
      this.isPlacementOfficer,
      this.isCounseller,
      this.isStudent,
      this.isProfileComplete,
      this.isSuperadmin});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] != null ? int.parse(json['id'].toString()) : null;
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    cityId = json['city_id'] != null ? int.parse(json['city_id'].toString()) : null;
    stateId = json['state_id'] != null ? int.parse(json['state_id'].toString()) : null;
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    verification = json['verification'];
    apiToken = json['api_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    profilePic = json['profile_pic'];
    userIntroduction = json['user_introduction'];
    googleId = json['google_id'];
    marriageStatusId = json['marriage_status_id'] != null ? int.parse(json['marriage_status_id'].toString()) : null;
    genderId = json['gender_id'] != null ? int.parse(json['gender_id'].toString()) : null;
    linkedIn = json['linked_in'];
    isCoach = json['is_coach'] != null ? int.parse(json['is_coach'].toString()) : null;
    isInstitute = json['is_institute'] != null ? int.parse(json['is_institute'].toString()) : null;
    isCompany = json['is_company'] != null ? int.parse(json['is_company'].toString()) : null;
    isPlacementOfficer =
        json['is_placement_officer'] != null ? int.parse(json['is_placement_officer'].toString()) : null;
    isCounseller = json['is_counseller'] != null ? int.parse(json['is_counseller'].toString()) : null;
    isStudent = json['is_student'] != null ? int.parse(json['is_student'].toString()) : null;
    isProfileComplete = json['is_profile_complete'] != null ? int.parse(json['is_profile_complete'].toString()) : null;
    isSuperadmin = json['is_superadmin'] != null ? int.parse(json['is_superadmin'].toString()) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['city_id'] = this.cityId;
    data['state_id'] = this.stateId;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['verification'] = this.verification;
    data['api_token'] = this.apiToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['profile_pic'] = this.profilePic;
    data['user_introduction'] = this.userIntroduction;
    data['google_id'] = this.googleId;
    data['marriage_status_id'] = this.marriageStatusId;
    data['gender_id'] = this.genderId;
    data['linked_in'] = this.linkedIn;
    data['is_coach'] = this.isCoach;
    data['is_institute'] = this.isInstitute;
    data['is_company'] = this.isCompany;
    data['is_placement_officer'] = this.isPlacementOfficer;
    data['is_counseller'] = this.isCounseller;
    data['is_student'] = this.isStudent;
    data['is_profile_complete'] = this.isProfileComplete;
    data['is_superadmin'] = this.isSuperadmin;
    return data;
  }
}

class Candidates {
  int? id;
  int? userId;
  String? dob;
  double? currentSal;
  double? expectedSal;
  String? profilePic;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? experience;
  String? specialization;
  int? rollno;
  String? year;
  String? resume;
  String? resumeName;
  String? passport;
  String? bio;
  String? lookingFor;
  String? languages;
  Pivot? pivot;

  Candidates(
      {this.id,
      this.userId,
      this.dob,
      this.currentSal,
      this.expectedSal,
      this.profilePic,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.experience,
      this.specialization,
      this.rollno,
      this.year,
      this.resume,
      this.resumeName,
      this.passport,
      this.bio,
      this.lookingFor,
      this.languages,
      this.pivot});

  Candidates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    dob = json['dob'];
    currentSal = json['current_sal'];
    expectedSal = json['expected_sal'];
    profilePic = json['profile_pic'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    experience = int.parse(json['experience']);
    specialization = json['Specialization'];
    rollno = json['rollno'];
    year = json['year'];
    resume = json['resume'];
    resumeName = json['resume_name'];
    passport = json['passport'];
    bio = json['bio'];
    lookingFor = json['looking_for'];
    languages = json['languages'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['dob'] = this.dob;
    data['current_sal'] = this.currentSal;
    data['expected_sal'] = this.expectedSal;
    data['profile_pic'] = this.profilePic;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['experience'] = this.experience;
    data['Specialization'] = this.specialization;
    data['rollno'] = this.rollno;
    data['year'] = this.year;
    data['resume'] = this.resume;
    data['resume_name'] = this.resumeName;
    data['passport'] = this.passport;
    data['bio'] = this.bio;
    data['looking_for'] = this.lookingFor;
    data['languages'] = this.languages;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

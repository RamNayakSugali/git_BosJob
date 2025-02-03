class UserProfileModel {
  CandidateDetails? candidateDetails;
  User? userdetails;
  List<CandidateLinks>? candidateLink;
  String? profileImageUrl;

  UserProfileModel({this.candidateDetails, this.userdetails, this.candidateLink, this.profileImageUrl});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    candidateDetails =
        json['CandidateDetails'] != null ? new CandidateDetails.fromJson(json['CandidateDetails']) : null;
    userdetails = json['Userdetails'] != null ? new User.fromJson(json['Userdetails']) : null;
    if (json['CandidateLink'] != null) {
      candidateLink = <CandidateLinks>[];
      json['CandidateLink'].forEach((v) {
        candidateLink!.add(new CandidateLinks.fromJson(v));
      });
    }
    profileImageUrl = json['profile_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.candidateDetails != null) {
      data['CandidateDetails'] = this.candidateDetails!.toJson();
    }
    if (this.userdetails != null) {
      data['Userdetails'] = this.userdetails!.toJson();
    }
    if (this.candidateLink != null) {
      data['CandidateLink'] = this.candidateLink!.map((v) => v.toJson()).toList();
    }
    data['profile_image_url'] = this.profileImageUrl;
    return data;
  }
}

class CandidateDetails {
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
  String? rollno;
  String? year;
  String? resume;
  String? resumeName;
  int? passport;
  String? bio;
  String? lookingFor;
  String? languages;
  List<CandidateLinks>? candidateLinks;
  User? user;

  CandidateDetails(
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
      this.candidateLinks,
      this.user});

  CandidateDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    dob = json['dob'];
    currentSal = json['current_sal'];
    expectedSal = json['expected_sal'];
    profilePic = json['profile_pic'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    experience = json['experience'];
    specialization = json['Specialization'];
    rollno = json['rollno'];
    year = json['year'];
    resume = json['resume'];
    resumeName = json['resume_name'];
    passport = json['passport'];
    bio = json['bio'];
    lookingFor = json['looking_for'];
    languages = json['languages'];
    if (json['candidate_links'] != null) {
      candidateLinks = <CandidateLinks>[];
      json['candidate_links'].forEach((v) {
        candidateLinks!.add(new CandidateLinks.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
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
    if (this.candidateLinks != null) {
      data['candidate_links'] = this.candidateLinks!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class CandidateLinks {
  int? id;
  int? candidateId;
  int? linkMasterId;
  String? url;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  LinkMaster? linkMaster;

  CandidateLinks(
      {this.id,
      this.candidateId,
      this.linkMasterId,
      this.url,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.linkMaster});

  CandidateLinks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    candidateId = json['candidate_id'];
    linkMasterId = json['link_master_id'];
    url = json['url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    linkMaster = json['link_master'] != null ? new LinkMaster.fromJson(json['link_master']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['candidate_id'] = this.candidateId;
    data['link_master_id'] = this.linkMasterId;
    data['url'] = this.url;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.linkMaster != null) {
      data['link_master'] = this.linkMaster!.toJson();
    }
    return data;
  }
}

class LinkMaster {
  int? id;
  String? title;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  LinkMaster({this.id, this.title, this.createdAt, this.updatedAt, this.deletedAt});

  LinkMaster.fromJson(Map<String, dynamic> json) {
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
  City? city;
  StateData? state;
  LinkMaster? gender;
  LinkMaster? marriageStatus;

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
      this.isSuperadmin,
      this.city,
      this.state,
      this.gender,
      this.marriageStatus});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    cityId = json['city_id'];
    stateId = json['state_id'];
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
    marriageStatusId = json['marriage_status_id'];
    genderId = json['gender_id'];
    linkedIn = json['linked_in'];
    isCoach = json['is_coach'];
    isInstitute = json['is_institute'];
    isCompany = json['is_company'];
    isPlacementOfficer = json['is_placement_officer'];
    isCounseller = json['is_counseller'];
    isStudent = json['is_student'];
    isProfileComplete = json['is_profile_complete'];
    isSuperadmin = json['is_superadmin'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    state = json['state'] != null ? new StateData.fromJson(json['state']) : null;
    gender = json['gender'] != null ? new LinkMaster.fromJson(json['gender']) : null;
    marriageStatus = json['marriage_status'] != null ? new LinkMaster.fromJson(json['marriage_status']) : null;
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
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    if (this.gender != null) {
      data['gender'] = this.gender!.toJson();
    }
    if (this.marriageStatus != null) {
      data['marriage_status'] = this.marriageStatus!.toJson();
    }
    return data;
  }
}

class City {
  int? id;
  String? name;
  int? stateId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  City({this.id, this.name, this.stateId, this.createdAt, this.updatedAt, this.deletedAt});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stateId = json['state_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['state_id'] = this.stateId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class StateData {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  StateData({this.id, this.name, this.createdAt, this.updatedAt, this.deletedAt});

  StateData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
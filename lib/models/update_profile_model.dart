class UpdateProfileModel {
  String? firstName;
  String? lastName;
  String? phone;
  String? dob;
  String? genderId;
  String? marriageStatusId;
  double? currentSal;
  double? expectedSal;
  List<int>? languages;
  int? stateId;
  int? cityId;
  String? facebook;
  String? linkedin;
  String? twitter;
  String? passport;
  String? bio;
  String? lookingFor;

  UpdateProfileModel({
    this.firstName,
    this.lastName,
    this.phone,
    this.dob,
    this.genderId,
    this.marriageStatusId,
    this.currentSal,
    this.expectedSal,
    this.languages,
    this.stateId,
    this.cityId,
    this.facebook,
    this.linkedin,
    this.twitter,
    this.passport,
    this.bio,
    this.lookingFor,
  });

  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    dob = json['dob'];
    genderId = json['gender_id'];
    marriageStatusId = json['marriage_status_id'];
    currentSal = json['current_sal'];
    expectedSal = json['expected_sal'];
    languages = json['languages'].cast<int>();
    stateId = json['state_id'];
    cityId = json['city_id'];
    facebook = json['facebook'];
    linkedin = json['linkedin'];
    twitter = json['twitter'];
    passport = json['passport'];
    bio = json['bio'];
    lookingFor = json['looking_for'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['dob'] = dob;
    data['gender_id'] = genderId;
    data['marriage_status_id'] = marriageStatusId;
    data['current_sal'] = currentSal;
    data['expected_sal'] = expectedSal;
    data['languages'] = languages;
    data['state_id'] = stateId;
    data['city_id'] = cityId;
    data['facebook'] = facebook;
    data['linkedin'] = linkedin;
    data['twitter'] = twitter;
    data['passport'] = passport;
    data['bio'] = bio;
    data['looking_for'] = lookingFor;
    return data;
  }
}

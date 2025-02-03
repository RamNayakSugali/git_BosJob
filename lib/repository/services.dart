import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../models/update_profile_model.dart';
import '../utils/constants.dart';
import '../utils/user_simple_preferences.dart';

class Services {
  static Future createAccount(payload) async {
    try {
      Dio dio = Dio();
      var response;
      response = await dio.post("${kDEVURL}role_registration", data: payload);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

///////////////////////////////////////////////////////////////////////
  static Future getindustrylist() async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;
      response = await dio.get("${kDEVURL}job/industry");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  /////////////////////////////////////
  //enroll Course or buy course
  static Future enrollCourse(payload) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;
      response = await dio.post("${kDEVURL}enrollcourse_temp", data: payload);
      // POST
      //  https: //devb.bossjobs.in/dev/api/enrollcourse_temp
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  ////////////////////////
  static Future getSkillInfo(int id) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;
      response = await dio.get("${kDEVURL}getaccessed/$id");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future getSkillJobs(int id) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;
      var body = {
        "skill_master_id": "$id",
        "candidate_id": UserSimplePreferences.getCandidateId()
      };
      response = await dio.post("${kDEVURL}skill_jobs", data: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future getSkillCourseInfo(int id) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;
      response = await dio.get("${kDEVURL}skill_courses/$id");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future getSkillExercise(int id) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;
      response = await dio.get("${kDEVURL}all_exercises_based_on_skill/$id");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future editprofile(payload) async {
    try {
      Dio dio = Dio();
      var response;
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      response =
          await dio.put("${kDEVURL}candidate_profile_update", data: payload);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      return e.response!;
    }
  }

  /////////////////////////////////////////////changepassword
  static Future changepassword(payload) async {
    try {
      Dio dio = Dio();
      var response;
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      response = await dio.put("${kDEVURL}user_change_password", data: payload);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      return e.response!;
    }
  }

  static Future<Response> updateProfile(
      UpdateProfileModel updateProfileModel) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      Response response = await dio.put(
        "${kDEVURL}candidate_profile_update",
        data: updateProfileModel.toJson(),
      );
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  static Future<Response> getCandidateJobInterviewSchedules() async {
    Dio dio = Dio();
    dio.options.headers["Authorization"] =
        'Bearer ${UserSimplePreferences.getToken()}';
    Response response =
        await dio.get("${kDEVURL}candidate_job_interview_schedules");
    return response;
  }
// ram req
  static Future<Response> updateProfilePhoto(File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "profile_image": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });

    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      Response response =
          await dio.post("${kDEVURL}upload_profile_pic", data: formData);
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  static Future<Response> uploadResume(File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "profile_image": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });

    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      Response response =
          await dio.post("${kDEVURL}upload_resume", data: formData);
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  ///////////////////////////////////gitcommit issues
  // static Future changepassword(payload) async {
  //   try {
  //     Dio dio = Dio();
  //     var response;
  //     dio.options.headers["Authorization"] =
  //         'Bearer ${UserSimplePreferences.getToken()}';
  //     response = await dio.put("${kDEVURL}user_change_password", data: payload);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response.data;
  //     }
  //   } on DioError catch (e) {
  //     return e.response!;
  //   }
  // }

  static Future getcertficates() async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio.get("${kDEVURL}student_certifications");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future<Response> getLanguages() async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      Response response = await dio.get("${kDEVURL}all_languages");
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  static Future<Response> getStates() async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      Response response = await dio.post("${kDEVURL}states");
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  static Future<Response> getCities() async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      Response response = await dio.post("${kDEVURL}all_cities");
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  static Future getjobinterview() async {
    try {
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;
      response = await dio.get("${kDEVURL}candidate_job_interview_schedules");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future addachievementsprofile(payload) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;
      response = await dio.post("${kDEVURL}learner/awards", data: payload);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        print(e);
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future addworkexperience(payload) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;
      response = await dio.post("${kDEVURL}learner/experience", data: payload);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        print(e);
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future addmultipleskills(payload) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;
      response = await dio.post("${kDEVURL}addmulipleskills", data: payload);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        print(e);
        return {"message": "Something went wrong!"};
      }
    }
  }

  ///////////////////////////////////////////////////////////new multiple skills
  static Future addmultipleSKill(payload) async {
    try {
      // Dio dio = Dio();
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;
      var payloaddata = {
        "skill_master_id": payload["skill_master_id"],
        "level": payload["level"],
      };
      //  {
      //   "candidate_id": payload["candidate_id"],
      //   "note": payload["note"],
      //   "tag": payload["tag"],
      //   "course_id": payload["course_id"],
      //   "lesson_id": payload["lesson_id"],
      //   "type": payload["type"]
      // };
      response =
          await dio.post("${kDEVURL}addmulipleskills", data: payloaddata);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  //////////////////////

  static Future addeducationaldetails(payload) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;
      response = await dio.post("${kDEVURL}learner/education", data: payload);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        print(e);
        return {"message": "Something went wrong!"};
      }
    }
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // static Future createAccount(payload) async {
  //   try {
  //     Dio dio = Dio();
  //     var response;
  //     FormData formData = FormData();
  //     formData.fields.add(MapEntry("email", payload["email"]));
  //     formData.fields.add(MapEntry("first_name", payload["first_name"]));
  //     formData.fields.add(MapEntry("last_name", payload["last_name"]));
  //     formData.fields.add(MapEntry("phone", payload["phone"]));
  //     formData.fields.add(MapEntry("password", payload["password"]));
  //     formData.fields.add(MapEntry("cpassword", payload["cpassword"]));

  //     response = await dio.post("${kDEVURL}role_registration", data: formData);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response.data;
  //     }
  //   } on DioError catch (e) {
  //     if (e.response?.statusCode == 404) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 401) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 400) {
  //       return e.response?.data;
  //     } else {
  //       print(e);
  //       return {"message": "Something went wrong!"};
  //     }
  //   }
  // }
  static Future deleteSkill(payload) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var payloaddata = payload;
      var response =
          await dio.post("${kDEVURL}deleteskills", data: payloaddata);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future login(payload) async {
    try {
      Dio dio = Dio();
      var response;

      FormData formData = new FormData();
      formData.fields.add(MapEntry("email", payload["email"]));
      formData.fields.add(MapEntry("password", payload["password"]));
      response = await dio.post("${kDEVURL}login", data: payload);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  ////////////////////////forgotpassword
  static Future forgotPassword(payload) async {
    try {
      Dio dio = Dio();
      var response;

      FormData formData = new FormData();
      formData.fields.add(MapEntry("email", payload["email"]));

      response = await dio.post("${kDEVURL}forgot_password_app", data: payload);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  //////////   add_lesson_question_replay
  static Future addreplayforum(payload) async {
    try {
      // Dio dio = Dio();
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;

      FormData formData = new FormData();
      formData.fields.add(MapEntry("replay", payload["replay"]));
      formData.fields.add(MapEntry("candidate_course_lessonqand_id",
          payload["candidate_course_lessonqand_id"]));
      formData.fields.add(MapEntry("candidate_id", payload["candidate_id"]));
      response =
          await dio.post("${kDEVURL}add_lesson_question_replay", data: payload);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

//Submitting quiz answers
  static Future submitquiz(payload) async {
    try {
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;
      var payloaddata = payload;
      response = await dio.post("${kDEVURL}candidate_exercise_question_save",
          data: payloaddata);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

//////// addLessonsQuestions
  static Future addLessonsQuesforum(payload) async {
    try {
      // Dio dio = Dio();
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;

      FormData formData = new FormData();
      formData.fields.add(MapEntry("course_id", payload["course_id"])); //
      formData.fields.add(MapEntry("lesson_id", payload["lesson_id"])); //
      formData.fields.add(MapEntry("candidate_id", payload["candidate_id"])); //
      formData.fields.add(MapEntry("question", payload["question"])); //

      formData.fields
          .add(MapEntry("pack_course_id", payload["pack_course_id"])); //
      response =
          await dio.post("${kDEVURL}add_lesson_questions", data: payload);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

////////////////////////////////////////////////add_notes
  static Future addNotes(payload) async {
    try {
      // Dio dio = Dio();
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;
      var payloaddata = {
        "candidate_id": payload["candidate_id"],
        "note": payload["note"],
        "tag": payload["tag"],
        "course_id": payload["course_id"],
        "lesson_id": payload["lesson_id"],
        "type": payload["type"]
      };
      response = await dio.post("${kDEVURL}add_notes", data: payloaddata);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

///////////////
  static Future getBanners() async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio.get("${kDEVURL}banners");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future<Response> getAllJobs() async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      Response response = await dio.post(
        "${kDEVURL}search_job",
        data: {
          "search_type": "all",
        },
      );
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  static Future<Response> getAppliedJobs() async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      Response response = await dio.post(
        "${kDEVURL}search_job",
        data: {
          "search_type": "applied",
        },
      );
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  static Future<Response> applyForJob(int jobId) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      Response response = await dio.get("${kDEVURL}appliedto_jobs/$jobId");
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  static Future<Response> getFavoriteJobList() async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      Response response = await dio.post(
        "${kDEVURL}search_job",
        data: {
          "search_type": "all",
        },
      );
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  static Future getsearchtype(Map payload) async {
    try {
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;
      Uri url = Uri.parse("${kDEVURL}search_job");
      response = await http.post(
        url,
        body: payload,
        encoding: Encoding.getByName('utf-8'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future<Response> searchJobsByKeyword(String keyword) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      Response response = await dio.post(
        "${kDEVURL}search_job",
        data: {
          "search_type": "all",
          "keyword": keyword,
        },
      );
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  static Future<Response> searchCourseByKeyword(String keyword) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      Response response = await dio.post(
        "${kDEVURL}search_course_app",
        data: {
          "listing_type": "all",
          "keyword": keyword,
        },
      );
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  // static Future<Response> getAppliedJobs() async {
  //   try {
  //     Dio dio = Dio();
  //     print("token");
  //     print(UserSimplePreferences.getToken());
  //     dio.options.headers["Authorization"] =
  //         'Bearer ${UserSimplePreferences.getToken()}';
  //     var response;
  //     Uri url = Uri.parse("${kDEVURL}search_job");
  //     response = await http.post(
  //       url,
  //       body: payload,
  //       encoding: Encoding.getByName('utf-8'),
  //     );
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return jsonDecode(response.body);
  //     }
  //   } on DioError catch (e) {
  //     if (e.response?.statusCode == 404) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 401) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 400) {
  //       return e.response?.data;
  //     } else {
  //       return {"message": "Something went wrong!"};
  //     }
  //   }
  // }}
///////////////////////////////////////////////////////////////////////////////////////////////on 4/6
  static Future addjobsToWhishList(Map payload) async {
    try {
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;
      Uri url = Uri.parse("${kDEVURL}search_job");
      response = await http.post(
        url,
        body: payload,
        encoding: Encoding.getByName('utf-8'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }
  // static Future addjobsToWhishList(payload) async {
  //   try {
  //     Dio dio = Dio();
  //     print("token");
  //     print(UserSimplePreferences.getToken());
  //     dio.options.headers["Authorization"] =
  //         'Bearer ${UserSimplePreferences.getToken()}';
  //     var response;
  //     dio.options.headers["Authorization"] =
  //         'Bearer ${UserSimplePreferences.getToken()}';
  //     response = await dio.post("${kDEVURL}search_job", data: payload);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response.data;
  //     }
  //   } on DioError catch (e) {
  //     if (e.response?.statusCode == 401) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 404) {
  //       return e.response?.data;
  //     } else {
  //       return {"detail": "Something went wrong!"};
  //     }
  //   }
  // }

///////////////////////////////////////////////////////////////////////////////////////////////////
  static Future getsearchtypeapply(Map payload) async {
    try {
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;
      Uri url = Uri.parse("${kDEVURL}search_job");
      response = await http.post(
        url,
        body: payload,
        encoding: Encoding.getByName('utf-8'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }
// var headers = {
//   'Content-Type': 'application/x-www-form-urlencoded',
//   'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYm9zc2pvYnMuY28uaW5cL2RldlwvYXBpXC9sb2dpbiIsImlhdCI6MTY4NTM2MDA2NSwiZXhwIjoxNjg1MzYzNjY1LCJuYmYiOjE2ODUzNjAwNjUsImp0aSI6ImNPNXU1dVF0em91Wk82bEwiLCJzdWIiOjEzNywicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.mkhOzNdUsiK6YkBhGubThADNzi8rVHnMxMTj8P4x9YQ',
//   'Cookie': 'laravel_session=MvEa7FTGIc0Xj7p9YHkgxOmnw3o9fDD9h1TfJZJY'
// };
// var request = http.Request('POST', Uri.parse('https://bossjobs.co.in/dev/api/search_job'));
// request.bodyFields = {
//   'search_type': 'applied'
// };
// request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();

// if (response.statusCode == 200) {
//   print(await response.stream.bytesToString());
// }
// else {
//   print(response.reasonPhrase);
// }

///////////////////////////////////////////////////////////////////////////////////////////////////

  static Future getsearchexerciseList(Map payload) async {
    try {
      var response;
      Uri url = Uri.parse("${kDEVURL}search_exercise?page=1");
      response = await http.post(
        url,
        body: payload,
        encoding: Encoding.getByName('utf-8'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  ////////////////////////////////////////////////////////////////

  static Future browsePacksList(Map payload) async {
    try {
      // Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      // http.options.headers["Authorization"] =
      //     'Bearer ${UserSimplePreferences.getToken()}';
      //  String token;

      var response;
      Uri url = Uri.parse("${kDEVURL}course_packs?page=1");

      response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer ${UserSimplePreferences.getToken()}'
        },
        body: payload,
        encoding: Encoding.getByName('utf-8'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  ////////////////
  static Future myPacksList(Map payload) async {
    try {
      // Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      // http.options.headers["Authorization"] =
      //     'Bearer ${UserSimplePreferences.getToken()}';
      //  String token;

      var response;
      Uri url = Uri.parse("${kDEVURL}course_packs?page=1");

      response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer ${UserSimplePreferences.getToken()}'
        },
        body: payload,
        encoding: Encoding.getByName('utf-8'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  ////////////////////////////////////////mynotes
  static Future getmyNotes(Map payload) async {
    try {
      // Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      // http.options.headers["Authorization"] =
      //     'Bearer ${UserSimplePreferences.getToken()}';
      //  String token;

      var response;
      Uri url = Uri.parse("${kDEVURL}get_course_or_pack_notes");

      response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer ${UserSimplePreferences.getToken()}'
        },
        body: payload,
        encoding: Encoding.getByName('utf-8'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  ////////////////////////////Skills Score
  static Future getSkillScore(Map payload) async {
    try {
      // Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      // http.options.headers["Authorization"] =
      //     'Bearer ${UserSimplePreferences.getToken()}';
      //  String token;

      var response;
      Uri url = Uri.parse("${kDEVURL}generate_score");

      response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer ${UserSimplePreferences.getToken()}'
        },
        body: payload,
        encoding: Encoding.getByName('utf-8'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  /////////////////////////////anothescore
  static Future getSkillScores(payload) async {
    try {
      // Dio dio = Dio();
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;
      var payloaddata = {
        "skill_master_id": payload["skill_master_id"],
        "candidate_id": payload["candidate_id"],
        "questions": payload["questions"]
      };
      //  {
      //   "skill_master_id": payload["skill_master_id"],
      //   "level": payload["level"],
      // };

      response = await dio.post("${kDEVURL}generate_score", data: payloaddata);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future publishSkillScore(payload) async {
    try {
      // Dio dio = Dio();
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;
      var payloaddata = {
        "skill_master_id": payload["skill_master_id"],
        "candidate_id": payload["candidate_id"],
        "questions": payload["questions"]
      };

      response = await dio.post("${kDEVURL}publish_skill", data: payloaddata);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future SkillsList(int id) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;
      var body = {"category_master_id": id};
      response = await dio.post("${kDEVURL}all_sklls", data: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future getQualificationsPacks() async {
    try {
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio.get("${kDEVURL}job/qualification");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future deleteEducationalDetails(id) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var deleteId = id.toString();
      var response = await dio.delete(
        "${kDEVURL}learner/education/${deleteId}",
      );
      //   https://devb.bossjobs.in/dev/api/learner/education/7
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  //deleteAchievements
  static Future deleteAchevements(id) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var deleteId = id.toString();
      var response = await dio.delete(
        "${kDEVURL}learner/awards/${deleteId}",

//https://devb.bossjobs.in/dev/api/learner/awards/6
      );
      //   https://devb.bossjobs.in/dev/api/learner/education/7
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  ////////////////////////////////////////////edit Achevements
  static Future editAchevements(id, payload) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var payloaddata = payload;
      var deleteId = id.toString();
      var response = await dio.put("${kDEVURL}learner/awards/${deleteId}",
          data: payloaddata);
      //   	https://devb.bossjobs.in/dev/api/learner/awards/10
      //   https://devb.bossjobs.in/dev/api/learner/education/7
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  ///////////update skills
  static Future updateSkills(payload) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var payloaddata = payload;

      var response =
          await dio.post("${kDEVURL}updateskills", data: payloaddata);
      //
//https://devb.bossjobs.in/dev/api/updateskills
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future editEducationalDetails(id, payload) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var payloaddata = payload;
      var deleteId = id.toString();
      var response = await dio.put("${kDEVURL}learner/education/${deleteId}",
          data: payloaddata);
      //   https://devb.bossjobs.in/dev/api/learner/education/7
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future getcategories() async {
    try {
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio.get("${kDEVURL}all_categories");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  // static Future getjobinterview() async {
  //   try {
  //     Dio dio = Dio();
  //     print("token");
  //     print(UserSimplePreferences.getToken());
  //     dio.options.headers["Authorization"] =
  //         'Bearer ${UserSimplePreferences.getToken()}';

  //     var response;
  //     response = await dio.get("${kDEVURL}candidate_job_interview_schedules");

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return {"data": response.data};
  //     }
  //   } on DioError catch (e) {
  //     if (e.response?.statusCode == 404) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 401) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 400) {
  //       return e.response?.data;
  //     } else {
  //       return {"message": "Something went wrong!"};
  //     }
  //   }
  // }

  static Future getprofiledatajob() async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio.get("${kDEVURL}candidate_profile");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future getCourceData(int id) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var payload = {
        "category": [id],
        "level": [],
        "coursetype": [],
        "location": [],
        "duration": [],
        "price": [],
        "institute_id": [],
        "listing_type": "all_courses"
      };
      var response;
      response = await dio.post("${kDEVURL}search_course", data: payload);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

//////////////////
  static Future getcoachdashboard() async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio.get("${kDEVURL}coachingdashboard");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }
////////////////
  ////////////////////////////studentcertifications
  ///

  // static Future getcertficates() async {
  //   try {
  //     Dio dio = Dio();
  //     dio.options.headers["Authorization"] =
  //         'Bearer ${UserSimplePreferences.getToken()}';

  //     var response;
  //     response = await dio.get("${kDEVURL}student_certifications");
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return {"data": response.data};
  //     }
  //   } on DioError catch (e) {
  //     if (e.response?.statusCode == 404) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 401) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 400) {
  //       return e.response?.data;
  //     } else {
  //       return {"message": "Something went wrong!"};
  //     }
  //   }
  // }
  ///////////////

  static Future filterAPI(List values) async {
    try {
      // Uri url = Uri.parse("${kDEVURL}search_course?page=1");
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var payload = {
        "price": values,
        "listing_type": "all_courses",
        "candidate_id": UserSimplePreferences.getCandidateId()
      };
      var response;
      response = await dio.post(
        "${kDEVURL}search_course?page=1",
        data: payload,
      );
      return response.data;
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future searchCourse(Map payload) async {
    try {
      var response;
      Uri url = Uri.parse("${kDEVURL}search_course?page=1");
      response = await http.post(
        url,
        body: payload,
        encoding: Encoding.getByName('utf-8'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  ///FavouritedCourse
  static Future FavouritedCourse(Map payload) async {
    try {
      var response;
      Uri url = Uri.parse("${kDEVURL}search_course?page=1");
      response = await http.post(
        url,
        body: payload,
        encoding: Encoding.getByName('utf-8'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  ////////////////////////////////////////////data back
  ///FavouritedCourse
  static Future FavouritedCoursedatabackup(Map payload) async {
    try {
      var response;
      Uri url = Uri.parse("${kDEVURL}search_course?page=1");
      response = await http.post(
        url,
        body: payload,
        encoding: Encoding.getByName('utf-8'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

//////////////////////////////////////////////////////////9/6
  static Future searchCoursetwo(Map payload) async {
    try {
      var response;
      Uri url = Uri.parse("${kDEVURL}search_course?page=1");
      response = await http.post(
        url,
        body: payload,
        encoding: Encoding.getByName('utf-8'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  ///
  static Future CoursePacks(Map payload) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;
      Uri url = Uri.parse("${kDEVURL}course_packs?page=1&type=all_course_pack");
      response = await http.post(
        url,
        body: payload,
        encoding: Encoding.getByName('utf-8'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

//three
  // static Future CoursePackss(payload) async {
  //   try {
  //     Dio dio = Dio();
  //     var response;

  //     FormData formData = new FormData();
  //     formData.fields.add(MapEntry("type", payload["type"]));
  //     formData.fields.add(MapEntry("[category_id]", payload["category_id[]"]));
  //     response = await dio.post(
  //         "${kDEVURL}course_packs?category_id[]=1&type=all_course_pack",
  //         data: payload);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response.data;
  //     }
  //   } on DioError catch (e) {
  //     if (e.response?.statusCode == 404) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 401) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 400) {
  //       return e.response?.data;
  //     } else {
  //       return {"message": "Something went wrong!"};
  //     }
  //   }
  // }

  static Future CoursePackss(payload) async {
    try {
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;

      FormData formData = new FormData();
      formData.fields.add(MapEntry("category_id[]", payload["category_id[]"]));
      formData.fields.add(MapEntry("type", payload["type"]));
      response = await dio.post("${kDEVURL}course_packs", data: payload);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      print(e.response?.data);
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  // static Future CoursePacks(type) async {
  //   try {
  //     Dio dio = Dio();
  //     var userData = UserSimplePreferences.getUserdata();
  //     var category_id = json.decode(userData!)["category_id"];
  //     var type = json.decode(userData!)["type"];
  //     dioPackage.FormData formData = dioPackage.FormData();

  //     formData.fields.add(MapEntry(type, category_id));
  //     var response;
  //     response = await dio.post(
  //         "${kDEVURL}course_packs?category_id[]=1&type=all_course_pack",
  //         data: formData);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response.data;
  //     }
  //   } on DioError catch (e) {
  //     if (e.response?.statusCode == 404) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 401) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 400) {
  //       return e.response?.data;
  //     } else {
  //       return {"error": "Something went wrong!"};
  //     }
  //   }
  // }

//////////////////////
  static Future getAllCoursePacks() async {
    try {
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio.get("${kDEVURL}course_packs_filter/all_course_pack");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future getsearch_exercise(Map payload) async {
    try {
      var response;
      Uri url = Uri.parse("${kDEVURL}search_exercise");
      // response = await http.post(
      //   url,
      //   body: payload,
      //   encoding: Encoding.getByName('utf-8'),
      // );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future getindividualjob(id) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      ///  var id;
      var response;
      response = await dio.get("${kDEVURL}individual_job/$id");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  ////////////////////////
  // static Future getcoachdetails(id) async {
  //   try {
  //     Dio dio = Dio();
  //     dio.options.headers["Authorization"] =
  //         'Bearer ${UserSimplePreferences.getToken()}';

  //     ///  var id;
  //     var response;
  //     response =
  //         await dio.get("http://bossjobs.co.in/student/coach_profile/$id");
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return {"data": response.data};
  //     }
  //   } on DioError catch (e) {
  //     if (e.response?.statusCode == 404) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 401) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 400) {
  //       return e.response?.data;
  //     } else {
  //       return {"message": "Something went wrong!"};
  //     }
  //   }
  // }

  ////////////////xer
  static Future gettakeexercise(id) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      ///  var id;
      var response;
      response = await dio.get("${kDEVURL}individual_exercise/$id");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future gettakecourse(id) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      ///  var id;
      var response;
      response = await dio.get("${kDEVURL}question_answers/$id");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future getFormComments(int id) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      ///  var id;
      var response;
      response = await dio.post("${kDEVURL}get_all_q_s_replays", data: {
        "candidate_id": "",
        "pack_course_id": "",
        "course_id": id,
        "lesson_id": 41,
        "keyword": ""
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future getFormComment(Map payload) async {
    try {
      // Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      // http.options.headers["Authorization"] =
      //     'Bearer ${UserSimplePreferences.getToken()}';
      //  String token;

      var response;
      Uri url = Uri.parse("${kDEVURL}get_all_q_s_replays");

      response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer ${UserSimplePreferences.getToken()}'
        },
        body: payload,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  ////////////////////////////////////////////////////////////individual_course_new_2
  static Future getTakecourseApis(Map payload) async {
    try {
      var response;
      Uri url = Uri.parse("${kDEVURL}individual_course_new_2");

      response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer ${UserSimplePreferences.getToken()}'
        },
        body: payload,
        encoding: Encoding.getByName('utf-8'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future getHomeTakecourseApis(Map payload) async {
    try {
      var response;
      Uri url = Uri.parse(
          "${kDEVURL}individual_course_new_1/${payload["course_id"]}");

      response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer ${UserSimplePreferences.getToken()}'
        },
        // body: payload,
        // encoding: Encoding.getByName('utf-8'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  //////////////////////////////////////////////////////////////7/6
  static Future getindividualexercise(id) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      ///  var id;
      var response;
      response = await dio.get("${kDEVURL}individual_exercise_new/$id");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  ///////////////////////////////////////////////individualprofilebyId
  static Future individualprofilebyId(id) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      ///  var id;
      var response;
      response = await dio.get("${kDEVURL}individual_course_new_1/$id");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future individualcoursebyId(id) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      ///  var id;
      var response;
      response = await dio.get("${kDEVURL}individual_course_new_1/$id");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  /////////////////////////////////
  static Future individualcoursepacksbyId(id) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      ///  var id;
      var response;
      response = await dio.get("${kDEVURL}individual_course_pack/$id");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  ///////////////////////
  static Future jobsaddtowishlist(id) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio.get("${kDEVURL}favourateto_jobs/$id");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future<Response> addOrRemoveJobFromWishlist(int id) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      Response response = await dio.get("${kDEVURL}favourateto_jobs/$id");
      return response;
    } on DioError catch (e) {
      return e.response!;
    }
  }

  static Future getdashboard() async {
    try {
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio.get("${kDEVURL}learner/dashboard");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  /////////////////////////////////////////////////////////
  static Future getaccessrequest() async {
    try {
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio.get("${kDEVURL}candidate_requests");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }
  ////////////////////////////////////////////////////

  /////////////////////20/06/2023
//all_notifications
  static Future getnotifications() async {
    try {
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio.get("${kDEVURL}all_notifications");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }
///////////////////////////////

  static Future getAllExercises() async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio.get("${kDEVURL}all_exercises");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

////////////////////////////////////////////////////////6/5
  static Future getaccessedskills() async {
    try {
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio.get("${kDEVURL}myaccessedskills");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future getUnaccessedskills() async {
    try {
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio.get("${kDEVURL}myunaccessedskills");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  /////////////////////////////////////////get accessed/id
  static Future accessedskilltest(int id) async {
    try {
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio.get("${kDEVURL}getaccessed/$id");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  //////////////////////////wishlist courses
  static Future coursesWhishlist(int id) async {
    try {
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio.get("${kDEVURL}add_candidate_favorite_courses/$id");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  /////Favourite course packs
  static Future coursespacksWhishlist(int id) async {
    try {
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio
          .get("${kDEVURL}add_candidate_remove_course_pack_favourate/$id");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  ////////////Apply job in Job Description
  static Future jobdescriptionWhishlist(int id) async {
    try {
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio.get("${kDEVURL}appliedto_jobs/$id");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  //////favourite Exercises api
  /////////favouriteExercises
  static Future WhishlistedExercises(int id) async {
    try {
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio
          .get("${kDEVURL}add_candidate_remove_excercise_favourate/$id");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future addjobsfavouritestwo(id) async {
    try {
      Dio dio = Dio();
      print("token");
      print(UserSimplePreferences.getToken());
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';
      var response;
      Uri url = Uri.parse("${kDEVURL}search_job/$id");
      response = await http.post(
        url,
        // body: payload,
        encoding: Encoding.getByName('utf-8'),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future getAppCoursesList() async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio.get("${kDEVURL}app_courses_list/:list_type");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future getProfile() async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;

      response = await dio.get("${kDEVURL}candidate_profile");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  // static Future updateProfile(payload) async {
  //   try {
  //     Dio dio = Dio();
  //     var response;
  //     dio.options.headers["Authorization"] =
  //         'Bearer ${UserSimplePreferences.getToken()}';
  //     response = await dio.put("${kDEVURL}candidate_profile_update");
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response.data;
  //     }
  //   } on DioError catch (e) {
  //     if (e.response?.statusCode == 404) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 401) {
  //       return e.response?.data;
  //     } else if (e.response?.statusCode == 400) {
  //       return e.response?.data;
  //     } else {
  //       return {"message": "Something went wrong!"};
  //     }
  //   }
  // }

  static Future getPreviewCourse() async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio.get("${kDEVURL}preview_course/1");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future getSkillsCourse() async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio.get("${kDEVURL}skill_courses/1");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future getDemandSkills() async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio.get("${kDEVURL}in_demand_skills");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }

  static Future getCourseFilter(Map payload) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] =
          'Bearer ${UserSimplePreferences.getToken()}';

      var response;
      response = await dio.get("${kDEVURL}course_filter_menu/:listing_type");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"data": response.data};
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        return e.response?.data;
      } else if (e.response?.statusCode == 401) {
        return e.response?.data;
      } else if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        return {"message": "Something went wrong!"};
      }
    }
  }
}
//course_filter_menu/:listing_type

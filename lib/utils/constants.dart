// ignore_for_file: constant_identifier_names

import 'package:bossjobs/utils/export_file.dart';

const String kSplashPage = '/splash';
const String kDashboard = '/dashboard.dart';
const String KLogin = '/login_screens/login_view';
const String KSignup = '/login_screens/sign_up';
const String KMobile_Screen = '/login_screens/mobile_verification';
const String KOTP_Screen = '/login_screens/otp_verification';
const String kHome = '/home/home.dart';
const String kJobs = '/jobs/jobs.dart';
const String kCourses = '/coures/courses.dart';
const String kExercise = '/exercise/exercise.dart';
const String KSchedule = '/schedule/schedule.dart';
const String Kprofile = '/profile/profile.dart';
const String KEdit_Profile = '/profile/edit_profile.dart';
const String KApply_jobs = '/applyjobs/applyjobs_screen.dart';
const String KChat_Screens = '/chat/chat_screen.dart';
const String KWish_List = '/wishlist/wishlist_screen.dart';
const String KWish_List_Course = '/wishlist/wishlist_Course_screen.dart';
const String KNotification = '/notification.dart/notification.dart';
const String KSearch = '/search/search_view.dart';
const String kCompeleted_Courses = '/compeleted/compeleted_view.dart';
const String KDownloaded_Courses = '/downloaded/downloaded.dart';
const String KEdit_Schedule = '/schedule/edit_schedule.dart';
const String KJob_Description = '/JobDescription/job_description';
const String KskillGraph = '/skills/skillgraph.dart';
const String KskillGraphAccessed = '/skills/accessedskillgraph.dart';
// const String KAchievements = '/Achievements/achievements_view';
const String KSubscription = '/subscriptions/subscription_view';
const String KPayment = '/payment/payments_view';
const String KSupport = '/screens/support';
const String kRecruiters = '/JobDescription/Recruiters_details/recruiters_view';
const String KSplash = '/splash/splash_screen1';
const String KSkills = '/skills/skills_view';
const String KEducationalDetails = '/profile/educatinal_form.dart';
const String KWorkExpDetails = '/profile/workexperinces.dart';
const String KAchievedDetails = '/profile/achievements.dart';
const String KChatting = '/screens/chat/personal_chat.dart';
const String KErrors = '/screens/error_screen/error_view.dart';
const String KProductionScreen = '/screens/coures/course_details_screen.dart';
const String KAddSkills = '/screens/skills/add_skills_screen.dart';
const String KTakeCourse = '/screens/coures/take_course.dart';
const String KAuthorProfile = '/screens/coures/author_profile.dart';
const String KCourseAssesment = '/screens/courses/course_assesment.dart';
//
const String KMyExercise = '/screens/exercise/my_exercise.dart';
const String KTakeExercises = '/screens/exercise/take_exercise.dart';
const String KBrowsePacks = '/screens/course_packs/browse_course_packs.dart';
const String KMypacks = '/screens/course_packs/my_course_packs.dart';
const String KIndividualPack =
    '/screens/course_packs/individual_course_pack.dart';

const String KExerciseDescription =
    '/screens/exercise/exercise_description.dart';
const String KAssesment = '/screens/exercise/assesment_screen.dart';
const String KskillAssesment="/screens/exercise/assessed_assesment_screen.dart";
const String KMyNotes = '/screens/Notes/my_notes.dart';
const String KForgot = '/screens/forgot_password/forgot_password.dart';
const String KChangePassword = '/screens/forgot_password/change_password.dart';
const String KSkillrules = '/screens/skills/assesment_rules.dart';
// const String KSkillsSCore = '/screens/skills/skilla_score .dart';
const String KSkillScoreView = '/screens/skills/score_view.dart';
const String KViewSkillAnswers = '/screens/skills/view_skill_answers.dart';
const String KCoachDashboard = '/screens/Coach/coach_dashboard.dart';
const String KFavouratedCourses = '/screens/coures/favourite_courses.dart';
const String kFavouritedExercise = '/exercise/favourated_exercise.dart';
const String KFavouritedPacks = '/screens/course_packs/favourite_packs.dart';
const String KJobApply = '/screens/jobs/job_apply.dart';
// const String KWishListTabs = '/screens/wishlist/wishlist_screen_tabs.dart';
const String KExerciseScore = '/screens/exercise/exercise_score.dart';
const String KCourseQuiz = '/screens/courses/assesment_quiz_scree.dart';
const String KCourseQuizScore = '/screens/courses/course_quiz_score.dart';
// const String Kfavoutratejobs = '/screens/wishlist/favourited_jobs.dart';

// export '../screens/wishlist/favourited_jobs.dart';

// /screens/courses/course_quiz_score.dart';
// const String KExerciseTest = '/screens/wishlist/wishlist_screen_tabs.dart';  //remove in future
// const String KTestSkill = '/screens/skills/test_skills.dart';
// const String KTestScore = '/screens/skills/test_score.dart';

// /test_score.dart';
//   export '../screens/exercise/exercise_test_screen.dart';

double kTenFont = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .shortestSide <
        600
    ? 10.sp
    : 6.sp;
double kTwelveFont = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .shortestSide <
        600
    ? 12.sp
    : 7.sp;

double kFourteenFont = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .shortestSide <
        600
    ? 14.sp
    : 9.sp;
double kSixteenFont = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .shortestSide <
        600
    ? 16.sp
    : 11.sp;
double kEighteenFont = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .shortestSide <
        600
    ? 18.sp
    : 13.sp;
double kTwentyFont = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .shortestSide <
        600
    ? 20.sp
    : 15.sp;
double kTwentyTwoFont =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                .size
                .shortestSide <
            600
        ? 22.sp
        : 17.sp;
double kTwentyFourFont =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                .size
                .shortestSide <
            600
        ? 24.sp
        : 19.sp;
double kTwentySixFont =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                .size
                .shortestSide <
            600
        ? 26.sp
        : 21.sp;

///Font weights

const FontWeight kFW400 = FontWeight.w400;
const FontWeight kFW500 = FontWeight.w500;
const FontWeight kFW600 = FontWeight.w600;
const FontWeight kFW700 = FontWeight.w700;
const FontWeight kFW800 = FontWeight.w800;
const FontWeight kFW900 = FontWeight.w900;

///Colors
const Color kInactiveIndicatorColor = Color(0xff82A9C8);
const Color kBackground = Color(0xff191C1E);
const Color kBackground1 = Color(0xffDDD8D8);

const Color darkGrey = Color.fromRGBO(37, 37, 37, 1);
const Color purple = Color.fromRGBO(90, 100, 191, 1);
const Color grey = Color(0xff575757);
const Color grey1 = Color(0xff515050);
const Color lightgrey = Color(0xff6A6A6A);
const Color customgrey = Color(0xffA1A1A1);
// #A1A1A1 //Color(0xFFA1A1A1),
const Color Gold = Color(0xffFE9E00);
const Color kgreen = Color(0xffEAF7FF);
const Color kblue = Color(0xffDEFFE9);
const Color klightpurple = Color(0xff5A6ABF);
const Color darkblue = Color.fromRGBO(11, 40, 167, 1);
const Color white = Color.fromRGBO(255, 255, 255, 1);
const Color klightdark = Color(0xff878787);
const Color whitetwo = Color(0xffFFFFFF);
const Color darktwo = Color(0xff000000);

const Color Customgreen = Color(0xff21FF44);
const Color korange = Color(0xFFE77263);
const Color kScoregreen = Color(0xFF26C03F);
const Color kred = Color(0xFFF67B7B);
const Color kdarkred = Color(0xFFE2412C);
const Color kScorered = Color(0xFFED6C6B);
const Color klightOrange = Color(0xFFFFB242);

//  0x99FFFFFF  //  #ED6C6B  // #FFB242
class Images {
//background_fades
  static const String bg_bottom = 'assets/images/Ellipse424.png';
  static const String bg_top = 'assets/images/Ellipse425.png';

//DashBoard
  static const String bottom_home = 'assets/images/house.png';
  static const String bottom_jobs = 'assets/images/job.png';

  static const String bottom_date = 'assets/images/data.png';
  static const String bottom_courses = 'assets/images/cours.png';
  static const String bottom_profile = 'assets/images/person.png';
}

// const String kDEVURL = "https://bossjobs.co.in/dev/api/";
// const String kDEVURL2 = "https://presentiencetech.com/bossjobs/api/";
// //const String kImageURL = "https://presentiencetech.com/bossjobs/api/";
// const String kImageURL = "https://bossjobs.co.in/dev/banner_images/";
// const String kCourseURL = "https://bossjobs.co.in/dev/course_images/";
// const String kProfileURL = "https://bossjobs.co.in/dev/candidate_images/";
// const String kExerciseURL =
//     "https://bossjobs.co.in/dev/undefinedexercise_images/";
// const String kCoursePacksimages =
//     "https://bossjobs.co.in/dev/api/course_packs/";

final GlobalKey<ScaffoldState> kScaffoldKey = GlobalKey<ScaffoldState>();

// https://bossjobs.co.in/dev/api/course_packs

//new DEV URL's
const String kDEVURL = "https://devb.bossjobs.in/dev/api/";
const String kImageURL = "https://devb.bossjobs.in/dev/banner_images/";
const String kCourseURL = "https://devb.bossjobs.in/dev/course_images/";
const String kProfileURL = "https://devb.bossjobs.in/dev/candidate_images/";
const String kExerciseURL =
    "https://devb.bossjobs.in/dev/undefinedexercise_images/";
const String kCoursePacksimages =
    "https://devb.bossjobs.in/dev/api/course_packs/";

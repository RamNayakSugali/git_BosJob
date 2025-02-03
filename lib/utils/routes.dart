import 'package:bossjobs/screens/exercise/assessedskillsTest.dart';
import 'package:bossjobs/screens/skills/accessedSkillGraph.dart';
import 'package:bossjobs/screens/skills/skillGraphView.dart';
import 'package:bossjobs/utils/export_file.dart';

import '../screens/courses/author_profile.dart';

import '../screens/courses/course_assesment.dart';
import '../screens/courses/course_details_screen.dart';
import '../screens/courses/courses.dart';
import '../screens/courses/take_course.dart';
import '../screens/courses/assesment_quiz_scree.dart';
import '../screens/courses/course_quiz_score.dart';
import '../screens/exercise/exercise.dart';
import '../screens/exercise/exercise_description.dart';
import '../screens/wishlist/wishlist_Course_screen.dart';

import '../screens/courses/favourite_courses.dart';
// import '../screens/courses/courses_list.dart';
// import '../screens/courses/course_view_tabs.dart';

class Routes {
  static List<GetPage<dynamic>> routes = [
    GetPage(
      name: kSplashPage,
      transition: Transition.rightToLeft,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: kDashboard,
      transition: Transition.rightToLeft,
      page: () => const Dashboard(),
    ),
    GetPage(
      name: kHome,
      transition: Transition.rightToLeft,
      page: () => const Home(),
    ),
    GetPage(
      name: kJobs,
      transition: Transition.rightToLeft,
      page: () =>  Jobs(),
    ),
    GetPage(
      name: kCourses,
      transition: Transition.rightToLeft,
      page: () =>  coures(),
    ),
    GetPage(
      name: kExercise,
      transition: Transition.rightToLeft,
      page: () =>  Exercise(),
    ),
    GetPage(
      name: KSchedule,
      transition: Transition.rightToLeft,
      page: () =>  Schedule(),
    ),
    GetPage(
      name: Kprofile,
      transition: Transition.rightToLeft,
      page: () => const Profile(),
    ),
    GetPage(
      name: KEdit_Profile,
      transition: Transition.rightToLeft,
      page: () => const EditProfileScreen(),
    ),
    GetPage(
      name: KChat_Screens,
      transition: Transition.rightToLeft,
      page: () => const Chat_Screen(),
    ),
    GetPage(
      name: KWish_List,
      transition: Transition.rightToLeft,
      page: () => const Wishlist(),
    ),
    GetPage(
      name: KWish_List_Course,
      transition: Transition.rightToLeft,
      page: () => const CourseWishlist(),
    ),
    GetPage(
      name: KAuthorProfile,
      transition: Transition.rightToLeft,
      page: () => AuthorProfile(),
    ),
    GetPage(
      name: KApply_jobs,
      transition: Transition.rightToLeft,
      page: () => const Applyjob(),
    ),
    GetPage(
      name: KNotification,
      transition: Transition.rightToLeft,
      page: () => Notification_view(),
    ),
    GetPage(
      name: KSearch,
      transition: Transition.rightToLeft,
      page: () => const SearchScreen(),
    ),
    GetPage(
      name: kCompeleted_Courses,
      transition: Transition.rightToLeft,
      page: () => const Compeleted_view(),
    ),
    GetPage(
      name: KDownloaded_Courses,
      transition: Transition.rightToLeft,
      page: () => const Downloaded(),
    ),
    GetPage(
      name: KEdit_Schedule,
      transition: Transition.rightToLeft,
      page: () => const EditSchedule(),
    ),
    GetPage(
      name: KLogin,
      transition: Transition.rightToLeft,
      page: () => const Login_view(),
    ),
    GetPage(
      name: KSignup,
      transition: Transition.rightToLeft,
      page: () => const Signup_view(),
    ),
    GetPage(
      name: KMobile_Screen,
      transition: Transition.rightToLeft,
      page: () => const Mobile_login(),
    ),
    GetPage(
      name: KOTP_Screen,
      transition: Transition.rightToLeft,
      page: () => const OTP_view(),
    ),
    GetPage(
      name: KJob_Description,
      transition: Transition.rightToLeft,
      page: () => const JobDescribe(),
    ),
    GetPage(
      name: KskillGraph,
      transition: Transition.rightToLeft,
      page: () => const SkillGraphView(),
    ),
    GetPage(
      name: KskillGraphAccessed,
      transition: Transition.rightToLeft,
      page: () => const AccessedSkillGraphView(),
    ),
    
    // GetPage(
    //   name: KAchievements,
    //   transition: Transition.rightToLeft,
    //   page: () => const Achimevements_view(),
    // ),
    GetPage(
      name: KSubscription,
      transition: Transition.rightToLeft,
      page: () => const Subscription(),
    ),
    GetPage(
      name: KPayment,
      transition: Transition.rightToLeft,
      page: () => const Payment(),
    ),
    GetPage(
      name: KSupport,
      transition: Transition.rightToLeft,
      page: () => const Support(),
    ),
    GetPage(
      name: kRecruiters,
      transition: Transition.rightToLeft,
      page: () => const Recruiters_view(),
    ),
    GetPage(
      name: KSplash,
      transition: Transition.rightToLeft,
      page: () => const Splash_view(),
    ),
    GetPage(
      name: KSkills,
      transition: Transition.rightToLeft,
      page: () => const Skills(),
    ),
    GetPage(
      name: KEducationalDetails,
      transition: Transition.rightToLeft,
      page: () => const Educatinal(),
    ),
    GetPage(
      name: KWorkExpDetails,
      transition: Transition.rightToLeft,
      page: () => const Experinces(),
    ),
    GetPage(
      name: KAchievedDetails,
      transition: Transition.rightToLeft,
      page: () => const Achievements(),
    ),
    GetPage(
      name: KChatting,
      transition: Transition.rightToLeft,
      page: () => const ChattingScreen(),
    ),
    GetPage(
      name: KErrors,
      transition: Transition.rightToLeft,
      page: () => const ErrorScreen(),
    ),
    GetPage(
      name: KProductionScreen,
      transition: Transition.rightToLeft,
      page: () => const CourseDetailsScreen(),
    ),
    GetPage(
      name: KExerciseDescription,
      transition: Transition.rightToLeft,
      page: () => ExerciseDescription(),
    ),
    GetPage(
      name: KAddSkills,
      transition: Transition.rightToLeft,
      page: () => Addskills(),
    ),
    GetPage(
      name: KTakeCourse,
      transition: Transition.rightToLeft,
      page: () => TakeCourse(),
    ),
    GetPage(
      name: KAuthorProfile,
      transition: Transition.rightToLeft,
      page: () => AuthorProfile(),
    ),
    GetPage(
      name: KMyExercise,
      transition: Transition.rightToLeft,
      page: () => const MyExercises(),
    ),
    GetPage(
      name: KTakeExercises,
      transition: Transition.rightToLeft,
      page: () => const TakeExercise(),
    ),
    GetPage(
      name: KBrowsePacks,
      transition: Transition.rightToLeft,
      page: () => const CoursePacksView(),
    ),
    GetPage(
      name: KMypacks,
      transition: Transition.rightToLeft,
      page: () => const MyCoursePack(),
    ),
    GetPage(
      name: KIndividualPack,
      transition: Transition.rightToLeft,
      page: () => const IndividualPack(),
    ),
    GetPage(
      name: KAssesment,
      transition: Transition.rightToLeft,
      page: () => const TakeAssesment(),
    ),
    GetPage(
      name: KskillAssesment,
      transition: Transition.rightToLeft,
      page: () => const AccessedTakeAssesment(),
    ),

    
    GetPage(
      name: KMyNotes,
      transition: Transition.rightToLeft,
      page: () => const mynotes(),
    ),
    GetPage(
      name: KForgot,
      transition: Transition.rightToLeft,
      page: () => const forgotPassword(),
    ),
    GetPage(
      name: KChangePassword,
      transition: Transition.rightToLeft,
      page: () => const changePassword(),
    ),
    GetPage(
      name: KSkillrules,
      transition: Transition.rightToLeft,
      page: () => const assesment_rules(),
    ),
    GetPage(
      name: KSkillScoreView,
      transition: Transition.rightToLeft,
      page: () => SkillScore(),
    ),
    GetPage(
      name: KViewSkillAnswers,
      transition: Transition.rightToLeft,
      page: () => ViewSkillAnswer(),
    ),
    GetPage(
      name: KCourseAssesment,
      transition: Transition.rightToLeft,
      page: () => CourseAssesment(),
    ),
    GetPage(
      name: KCoachDashboard,
      transition: Transition.rightToLeft,
      page: () => CoachDashboard(),
    ),
    GetPage(
      name: KFavouratedCourses,
      transition: Transition.rightToLeft,
      page: () => FavouriteCourses(),
    ),
    GetPage(
      name: kFavouritedExercise,
      transition: Transition.rightToLeft,
      page: () => FavouriteExercises(),
    ),
    GetPage(
      name: KFavouritedPacks,
      transition: Transition.rightToLeft,
      page: () => facouriteCoursePack(),
    ),
    GetPage(
      name: KJobApply,
      transition: Transition.rightToLeft,
      page: () => JobApply(),
    ),
    // GetPage(
    //   name: KWishListTabs,
    //   transition: Transition.rightToLeft,
    //   page: () => WishListTabs(),
    // ),
    GetPage(
      name: KExerciseScore,
      transition: Transition.rightToLeft,
      page: () => ExerciseScore(),
    ),
    GetPage(
      name: KCourseQuiz,
      transition: Transition.rightToLeft,
      page: () => CourseQiuz(),
    ),
    GetPage(
      name: KCourseQuizScore,
      transition: Transition.rightToLeft,
      page: () => CourseQuizScore(),
    ),
    // GetPage(
    //   name: Kfavoutratejobs,
    //   transition: Transition.rightToLeft,
    //   page: () => FavoriteJobList(),
    // ),

    //KSkillScoreView // KTestScore
    // GetPage(
    //   name: KSkillsSCore,
    //   transition: Transition.rightToLeft,
    //   page: () => const skills_score(),
    // ),
    //assesment_rules
  ];
}
//facouriteCoursePack

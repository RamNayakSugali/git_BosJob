// ignore_for_file: camel_case_types

import '../../utils/export_file.dart';

class Profile_menu extends StatefulWidget {
  Map profiledata;
  Profile_menu({super.key, required this.profiledata});

  @override
  State<Profile_menu> createState() => _ProfilemenuState();
}

class _ProfilemenuState extends State<Profile_menu> {
  @override
  Widget build(BuildContext context) {
    List menu = [
      {
        "name": "Applied Jobs",
        "image": "assets/images/briefcase.png",
        "route": KJobApply,
        "img color": white
      },
      {
        "name": "My Skills",
        "image": "assets/images/cap1.png",
        "route": KSkills,
        "img color": white
      },
      {
        "name": "My Notes",
        "image": "assets/images/my_notes.png",
        "route": KMyNotes,
        "img color": Colors.transparent
      },
      {
        "name": "Browse Packs",
        "image": "assets/images/packs.png",
        "route": KBrowsePacks,
        "img color": white
      },
      {
        "name": "MyPacks",
        "image": "assets/images/my_packs.png",
        "route": KMypacks,
        "img color": white
      },
      // {
      //   "name": "Achievements",
      //   "image": "assets/images/person1.png",
      //   "route": KAchievements,
      //   "img color": white
      // },
      {
        "name": "My Exercise",
        "image": "assets/images/exercises.png",
        "route": KMyExercise,
        "img color": white
      },
      // {
      //   "name": "Subscriptions",
      //   "image": "assets/images/rupess.png",
      //   "route": KSubscription,
      //   "img color": white
      // },
      // {
      //   // "name": "Active Course",
      //   "name": "Payment",
      //   "image": "assets/images/cap1.png",
      //   "route": KPayment,
      //   "img color": white
      // },
      // {"name": "Pending", "image": "assets/images/test.png", "route": kHome},
      {
        "name": "My Courses",
        "image": "assets/images/my_course.png",
        "route": kCompeleted_Courses,
        "img color": white
      },
      // {
      //   "name": "Downloaded Sessions",
      //   "image": "assets/images/file.png",
      //   "route": KDownloaded_Courses,
      //   "img color": white
      // },
      {
        "name": "Help and Support",
        "image": "assets/images/help_chat.png",
        "route": KSupport,
        "img color": white
      },

      // {
      //   "name": "Chat",
      //   "image": "assets/images/support.png",
      //   "route": KChat_Screens,
      //   "img color": white
      // },

      {
        "name": "Change Password",
        "image": "assets/images/lock.png",
        "route": KChangePassword,
        "img color": white
      },
      {
        "name": "Logout",
        "image": "assets/images/logout.png",
        "route": kHome,
        "img color": Colors.red.withOpacity(0.7)
      },
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < menu.length; i++)
          Container(
            margin: EdgeInsets.only(top: 10.h, bottom: 10.h, right: 10.h),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(menu[i]["route"], arguments: widget.profiledata);
                if (menu[i]["name"] == "Logout") {
                  UserSimplePreferences.clearAllData();
                  Get.toNamed(KLogin);
                }
              },
              child: Row(
                children: [
                  Image.asset(
                    menu[i]["image"],
                    width: 25.w,
                    //   color: menu[i]["img color"],
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(menu[i]["name"],
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: GoogleFonts.gothicA1(
                          fontSize: 15.sp,
                          color: white,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          )
      ],
    );
  }
}

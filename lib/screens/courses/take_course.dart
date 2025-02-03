import 'package:bossjobs/screens/courses/take_course_detailed.dart';

import '../../utils/export_file.dart';
import 'courses_video_downloads.dart';

class TakeCourse extends StatefulWidget {
  const TakeCourse({super.key});

  @override
  State<TakeCourse> createState() => _TakeCourseState();
}

class _TakeCourseState extends State<TakeCourse> {
  @override
  void initState() {
    geListOfModeules();
    super.initState();
  }

  @override
  String selectedValue = "Select Lesson";
  var itemsOfModules = ["Select"];
  var itemsOfModules_Lessons = ["Select Lesson"];
  List<Map> lessonsData = [];
  Map ChoosenLeason = {};
  geListOfModeules() {
    itemsOfModules.clear();
    itemsOfModules_Lessons.clear();
    itemsOfModules.add("Select");
    lessonsData.clear();
    itemsOfModules_Lessons.add("Select Lesson");

    for (int i = 0;
        i < Get.arguments["course_details"][0]["course_modules"].length;
        i++) {
      try {
        for (int j = 0;
            j <
                Get
                    .arguments["course_details"][0]["course_modules"][i]
                        ["lessons"]
                    .length;
            j++) {
          setState(() {
            itemsOfModules_Lessons.add(Get.arguments["course_details"][0]
                ["course_modules"][i]["lessons"][j]["title"]);
            lessonsData.add(Get.arguments["course_details"][0]["course_modules"]
                [i]["lessons"][j]);
          });
        }
      } catch (e) {
        debugPrint("No Length");
      }
      setState(() {
        itemsOfModules.add(
            Get.arguments["course_details"][0]["course_modules"][i]["title"]);
      });
    }
    if (Get.arguments["lesson_details"]["completed_lessons"] != 0) {
      setState(() {
        try {
          selectedValue = itemsOfModules_Lessons[Get.arguments["lesson_details"]
              ["completed_lessons"]];
          ChoosenLeason = lessonsData[
              Get.arguments["lesson_details"]["completed_lessons"] - 1];
        } catch (e) {
          setState(() {
            selectedValue = itemsOfModules_Lessons[0];
            ChoosenLeason = lessonsData[1];
          });
        }
      });
    }
  }

  List<String> interests = [
    'Product Designer',
    'Visual Designer',
    'COD',
    'CID',
    'Software',
    'Full Stack Development',
  ];
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackground,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: white),
          backgroundColor: darktwo,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Take Course',
            style: GoogleFonts.gothicA1(
                letterSpacing: 1,
                fontSize: kEighteenFont,
                color: white,
                fontWeight: kFW700),
          ),
          actions: [
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(KNotification);
                },
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/bell.png',
                      width: 22.w,
                    ),
                    Positioned(
                        left: 13.r,
                        //top: .h,
                        child: const CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.green,
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 13.w,
            )
          ],
        ),
        body: Stack(
          children: [
            Background(),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(15.w),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "Your Progress",
                    //   style: GoogleFonts.gothicA1(
                    //       fontSize: kFourteenFont,
                    //       color: white,
                    //       fontWeight: kFW700),
                    // ),

                    // LinearPercentIndicator(
                    //   width: 330.w,
                    //   lineHeight: 6.h,
                    //   percent: Get.arguments["lesson_details"]["video_percentage"] >
                    //           100
                    //       ? 100 / 100
                    //       : Get.arguments["lesson_details"]["video_percentage"] /
                    //           100,
                    //   //Get.arguments["lesson_details"]["video_percentage"],
                    //   backgroundColor: Colors.grey,
                    //   progressColor: Gold,
                    // ),

                    // Container(
                    //     width: double.infinity,
                    //     padding: EdgeInsets.only(left: 5.w, right: 5.w),
                    //     decoration: BoxDecoration(
                    //         color: white,
                    //         // border: GradientBoxBorder(
                    //         //   gradient: LinearGradient(
                    //         //       colors: [Colors.white38, Gold]),
                    //         //   width: 0.5,
                    //         // ),
                    //         borderRadius: BorderRadius.circular(13.r)),
                    //     // height: 36.h,
                    //     // width: double.infinity,
                    //     // decoration: BoxDecoration(
                    //     //   borderRadius: BorderRadius.circular(13.r),
                    //     //   color: Colors.grey,
                    //     // ),
                    //     child: ButtonTheme(
                    //       alignedDropdown: true,
                    //       child: CustomDropdownButton2(
                    //         buttonHeight: 42.h,
                    //         icon: const Icon(
                    //           Icons.expand_more,
                    //           size: 25,
                    //           color: Gold,
                    //         ),
                    //         hint: "Select",

                    //         dropdownItems: itemsOfModules_Lessons,
                    //         dropdownWidth: 320.w,
                    //         buttonDecoration:
                    //             BoxDecoration(color: Colors.transparent),

                    //         // dropdownPadding:
                    //         //     EdgeInsets.only(left: 20.w, right: 20.w),
                    //         value: selectedValue,

                    //         onChanged: (value) {
                    //           setState(() {
                    //             selectedValue = value!;
                    //             var data = lessonsData
                    //                 .where((element) =>
                    //                     element["title"] == selectedValue)
                    //                 .toList();
                    //             if (data.isNotEmpty) {
                    //               setState(() {
                    //                 ChoosenLeason = data[0];
                    //               });
                    //             }

                    //             debugPrint("Choosed");
                    //           });
                    //           // onStateSelection(value);
                    //         },
                    //       ),
                    //     )),
                    SizedBox(
                      height: 15.h,
                    ),
                    // lessionVideos(),
                    selectedValue != "Select Lesson"
                        ? ChoosenLeason["lesson_videos"] != null
                            ? VimePlayer(
                                lessonInfo: ChoosenLeason,
                              )
                            : lessionVideos()
                        : SizedBox(),
                    SizedBox(
                      height: 15.h,
                    ),
                    //const Search(),
                    // const CardPopular(),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [

                    //     Image.asset(
                    //       'assets/images/upload.png',
                    //       width: 24.w,
                    //     )
                    //   ],
                    // ),
                    Text(
                      "React Native",
                      style: GoogleFonts.gothicA1(
                        fontSize: kFourteenFont,
                        color: whitetwo,
                        fontWeight: kFW600,
                      ),
                    ),

                    Text(
                      "0 Exercises I 01 Lessons",
                      style: GoogleFonts.gothicA1(
                        fontSize: kTwelveFont,
                        color: customgrey,
                        fontWeight: kFW700,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      "Window - Python 3.8.6 - Python 3.9.0 - Paython38.5 - Mac OS X",
                      style: GoogleFonts.gothicA1(
                        fontSize: kFourteenFont,
                        color: white,
                        fontWeight: kFW400,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimatedProgressBar(
                            height: 5.h,
                            width: 220.w,
                            //  value: 40 / 100,
                            value: Get.arguments["lesson_details"]
                                        ["video_percentage"] ==
                                    null
                                ? 0
                                : Get.arguments["lesson_details"]
                                            ["video_percentage"] >
                                        100
                                    ? 100 / 100
                                    : Get.arguments["lesson_details"]
                                            ["video_percentage"] /
                                        100,
                            duration: Duration(seconds: 1),
                            gradient: const LinearGradient(
                              colors: [Gold, white],
                            ),
                            backgroundColor: white),
                        Image.asset(
                          'assets/images/cup.png',
                          width: 24.w,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    SizedBox(
                      height: 35.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: interests.length,
                        itemBuilder: ((context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              right: 10.w,
                              top: 10.h,
                            ),
                            padding: EdgeInsets.only(
                                left: 14.w, right: 14.w, top: 6.h, bottom: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: customgrey,
                            ),
                            child: Text(
                              interests[index],
                              style: GoogleFonts.gothicA1(
                                  fontSize: 11.sp,
                                  color: darktwo,
                                  fontWeight: kFW600),
                            ),
                          );
                        }),
                      ),
                    ),

                    SizedBox(
                      height: 20.h,
                    ),
                    selectedValue == "Select Lesson"
                        ? SizedBox()
                        : coursedetails(
                            id: Get.arguments["course_details"][0]["id"],
                            choosenLessonData: ChoosenLeason,
                          ),
                    // SizedBox(height: 10.h),
                    // // const gridOtherCourses(),
                    // SizedBox(
                    //   height: 20.h,
                    // ),

                    // //   CandidateProgress(),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

Widget CandidateProgress() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        Get.arguments["lesson_details"]["video_percentage"].toString(),
        //  "Your Progress",
        //$.[]data.lesson_details.video_percentage
        style: GoogleFonts.gothicA1(
            fontSize: kFourteenFont, color: white, fontWeight: kFW700),
      ),
      SizedBox(height: 10.h),
      LinearPercentIndicator(
        width: 330.w,
        lineHeight: 6.h,
        percent: 0.5,
        backgroundColor: Colors.grey,
        progressColor: Gold,
      ),
      SizedBox(height: 20.h),
      Text(
        "Test Course_101",
        style: GoogleFonts.gothicA1(
            fontSize: kFourteenFont, color: white, fontWeight: kFW700),
      ),
      SizedBox(height: 10.h),
      GlassmorphicContainer(
        height: 120.h,
        width: double.infinity,
        borderRadius: 13.r,
        blur: 15,
        alignment: Alignment.center,
        border: 0.5,
        linearGradient: LinearGradient(
            colors: [white.withOpacity(0.1), white.withOpacity(0.01)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderGradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
            colors: [
              white.withOpacity(0.5),
              white.withOpacity(0.5),
              Gold.withOpacity(0.5)
            ]),
        child: Container(
          padding: EdgeInsets.all(10.r),
          width: double.infinity,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              blurRadius: 16,
              spreadRadius: 15,
              color: Colors.black.withOpacity(0.1),
            )
          ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Test Course_101",
                  //maxLines: 2,
                  style: GoogleFonts.gothicA1(
                      fontSize: kSixteenFont,
                      color: white,
                      fontWeight: kFW500)),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text("0 Exercises",
                      //maxLines: 2,
                      style: GoogleFonts.gothicA1(
                          fontSize: kSixteenFont,
                          color: white,
                          fontWeight: kFW500)),
                  Text("1 Lessons",
                      //maxLines: 2,
                      style: GoogleFonts.gothicA1(
                          fontSize: kSixteenFont,
                          color: white,
                          fontWeight: kFW500)),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  const Icon(Icons.check_box, color: white),
                  Text(" Testing Lesson 1",
                      //maxLines: 2,
                      style: GoogleFonts.gothicA1(
                          fontSize: kSixteenFont,
                          color: white,
                          fontWeight: kFW500)),
                ],
              )
            ],
          ),
        ),
      ),
    ],
  );
}

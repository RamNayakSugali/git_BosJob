import 'dart:ui';
import 'package:intl/intl.dart';

import 'package:bossjobs/screens/JobDescription/google_map.dart';

import '../../utils/export_file.dart';

class ExerciseScore extends StatefulWidget {
  const ExerciseScore({super.key});

  @override
  State<ExerciseScore> createState() => _ExerciseScoreState();
}

class _ExerciseScoreState extends State<ExerciseScore> {
  @override
  String selectedlevel = "";
  final dataMap = <String, double>{
    "Flutter": 5,
  };
  var scorepercent = Get.arguments[0];
  var exercisedata = Get.arguments[1];

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackground,
        appBar: AppBar(
          // leading: GestureDetector(
          //   onTap: () {
          //     Get.back();
          //   },
          //   child: Icon(
          //     Icons.arrow_back,
          //     color: white,
          //   ),
          // ),
          elevation: 0,
          backgroundColor: darktwo,
        ),
        body: Stack(
          children: [
            Background(),
            SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.all(15.w),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 250.w,
                        child: Text(
                          "Your Exercise Score",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.gothicA1(
                              letterSpacing: 1.4,
                              fontSize: 28.sp,
                              color: whitetwo,
                              fontWeight: kFW800),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Text(
                        (scorepercent * 100) >= 50.00
                            ? "Hurray"
                            : "Hard Luck, Don’t Give up yet",
                        style: GoogleFonts.gothicA1(
                            letterSpacing: 0.8,
                            fontSize: kSixteenFont,
                            color: (scorepercent * 100) >= 50.00
                                ? kScoregreen
                                : korange,
                            fontWeight: kFW700),
                      ),
                      SizedBox(height: 32.h),
                      KPieChart(data: [
                        PieChartData(kScoregreen, scorepercent * 100),
                        PieChartData(kScorered, 100.00 - (scorepercent * 100)),
                      ], radius: 40.r),
                      SizedBox(height: 24.h),
                      Text(
                        "${(scorepercent * 100).toStringAsFixed(0)}%",
                        // "14%",
                        // "${skillsScore["percentage"].toString()} %",

                        style: GoogleFonts.gothicA1(
                            letterSpacing: 1.6,
                            fontSize: 32.sp,
                            color: kScoregreen,
                            fontWeight: kFW800),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "50% required to pass the Quiz",
                        style: GoogleFonts.gothicA1(
                            letterSpacing: 0.65,
                            fontSize: 13.sp,
                            color: whitetwo,
                            fontWeight: kFW700),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        exercisedata["updated_at"] == null
                            ? "No date"
                            : DateFormat('yyyy-MMM-dd hh :mm aaa').format(
                                DateTime.parse(exercisedata["updated_at"])),
                        // exercisedata["updated_at"].toString(),
                        //  "Jun 20’2023",
                        style: GoogleFonts.gothicA1(
                            letterSpacing: 0.65,
                            fontSize: 11.sp,
                            color: customgrey,
                            fontWeight: kFW700),
                      ),
                      SizedBox(height: 24.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedProgressBar(
                              height: 5.h,
                              width: 280.w,
                              value: scorepercent,
                              //   value: 40 / 100,
                              duration: Duration(seconds: 1),
                              gradient: const LinearGradient(
                                colors: [Gold, white],
                              ),
                              backgroundColor: white),
                          SizedBox(height: 5.h),
                          Image.asset(
                            'assets/images/cup.png',
                            width: 24.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            exercisedata["exercise_questions"] == null
                                ? "No questions"
                                : "Total ${exercisedata["exercise_questions"].length} Questions",
                            //  "2 out of 5 Questions",
                            style: GoogleFonts.gothicA1(
                                fontSize: kTwelveFont,
                                color: white,
                                fontWeight: kFW800),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        children: [
                          Icon(Icons.info_outline,
                              size: 24.sp, color: customgrey),
                          SizedBox(width: 8.w),
                          Text(
                            "Please select the hardness level to start the Quiz",
                            style: GoogleFonts.gothicA1(
                                fontSize: kTwelveFont,
                                color: customgrey,
                                fontWeight: kFW500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        children: [
                          selectedlevel == "Basic"
                              ? GlassmorphicContainer(
                                  // height: 210.h,
                                  height: 39.h,
                                  width: 96.w,
                                  borderRadius: 10.r,
                                  blur: 15,
                                  alignment: Alignment.center,
                                  border: 2,
                                  linearGradient: LinearGradient(
                                    colors: [
                                      white.withOpacity(0.15),
                                      white.withOpacity(0.15),
                                    ],
                                  ),
                                  borderGradient: LinearGradient(
                                    colors: [
                                      kBackground,
                                      //  white.withOpacity(0.5),
                                      Gold.withOpacity(0.01)
                                    ],
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 20,
                                          spreadRadius: 10.r,
                                          color: Colors.black.withOpacity(0.1),
                                        )
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 10.0,
                                          sigmaY: 10.0,
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.only(
                                              left: 15.w, right: 15.w),
                                          //  padding: EdgeInsets.all(15.r),
                                          decoration: BoxDecoration(
                                            border: const GradientBoxBorder(
                                              gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    kBackground,
                                                    kBackground,
                                                    kBackground,
                                                    Gold
                                                  ]),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedlevel = "Basic";
                                                    });
                                                  },
                                                  child: Text(
                                                    "Basic",
                                                    style: GoogleFonts.gothicA1(
                                                      fontSize: kTwelveFont,
                                                      color: Gold,
                                                      fontWeight: kFW700,
                                                    ),
                                                  )),
                                              // SizedBox(
                                              //   height: 15.h,
                                              // ),

                                              // SizedBox(
                                              //   height: 15.h,
                                              // ),

                                              // SizedBox(height: 15.h),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  height: 39.h,
                                  width: 96.w,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedlevel = "Basic";
                                      });
                                    },
                                    child: Text(
                                      "Basic",
                                      style: GoogleFonts.gothicA1(
                                        fontSize: kFourteenFont,
                                        color: whitetwo,
                                        fontWeight: kFW500,
                                      ),
                                    ),
                                  ),
                                ),
                          SizedBox(width: 10.w),
                          selectedlevel == "Advanced"
                              ? GlassmorphicContainer(
                                  // height: 210.h,
                                  height: 39.h,
                                  width: 96.w,
                                  borderRadius: 10.r,
                                  blur: 15,
                                  alignment: Alignment.center,
                                  border: 2,
                                  linearGradient: LinearGradient(
                                    colors: [
                                      white.withOpacity(0.15),
                                      white.withOpacity(0.15),
                                    ],
                                  ),
                                  borderGradient: LinearGradient(
                                    colors: [
                                      kBackground,
                                      //  white.withOpacity(0.5),
                                      Gold.withOpacity(0.01)
                                    ],
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 20,
                                          spreadRadius: 10.r,
                                          color: Colors.black.withOpacity(0.1),
                                        )
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 10.0,
                                          sigmaY: 10.0,
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.only(
                                              left: 15.w, right: 15.w),
                                          //  padding: EdgeInsets.all(15.r),
                                          decoration: BoxDecoration(
                                            border: const GradientBoxBorder(
                                              gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    kBackground,
                                                    kBackground,
                                                    kBackground,
                                                    Gold
                                                  ]),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    selectedlevel = "Advanced";
                                                  });
                                                },
                                                child: Text(
                                                  "Advanced",
                                                  style: GoogleFonts.gothicA1(
                                                    fontSize: kTwelveFont,
                                                    color: Gold,
                                                    fontWeight: kFW700,
                                                  ),
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: 15.h,
                                              // ),

                                              // SizedBox(
                                              //   height: 15.h,
                                              // ),

                                              // SizedBox(height: 15.h),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  height: 39.h,
                                  width: 96.w,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedlevel = "Advanced";
                                      });
                                    },
                                    child: Text(
                                      "Advanced",
                                      style: GoogleFonts.gothicA1(
                                        fontSize: kFourteenFont,
                                        color: whitetwo,
                                        fontWeight: kFW500,
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      SizedBox(height: 90.h),
                      CustomButton(
                        label: 'Go To Home',
                        isLoading: true,
                        onTap: () {
                          Get.toNamed(kDashboard);
                          // Get.toNamed(KAssesment,
                          //     arguments: takeExercise["exercise_details"][0]
                          //         ["exercise_lessons"][0]

                          // takeExercise["exercise_details"]
                          //         [0]["exercise_lessons"]
                          //     [index]["id"],
                          //$.[]data.[]exercise_details.0.exercise_lessons.0.id
                        },
                      ),
                      SizedBox(height: 30.h),
                    ],
                  )),
            ),
          ],
        ));
    ////////////////////////////////////
    // Scaffold(
    //     backgroundColor: kBackground,
    //     appBar: AppBar(
    //       backgroundColor: Colors.transparent,
    //       elevation: 0,
    //       centerTitle: true,
    //       title: Text(
    //         'Your Assesment Score',
    //         style: GoogleFonts.gothicA1(
    //             letterSpacing: 1,
    //             fontSize: kEighteenFont,
    //             color: white,
    //             fontWeight: kFW700),
    //       ),
    //     ),
    //     body: SingleChildScrollView(
    //       child: Container(
    //         margin: EdgeInsets.all(15.w),
    //         child: isLoading == false
    //             ? Column(
    //                 // mainAxisAlignment: MainAxisAlignment.center,
    //                 // crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: [
    //                   Center(
    //                     child: skillsScore["percentage"] >= 50
    //                         ? Text("Good",
    //                             style: GoogleFonts.gothicA1(
    //                                 fontSize: kSixteenFont,
    //                                 color: Colors.green,
    //                                 fontWeight: kFW500))
    //                         : Text("Hard Luck,Don't Give up yet",
    //                             style: GoogleFonts.gothicA1(
    //                                 fontSize: kSixteenFont,
    //                                 color: Colors.red,
    //                                 fontWeight: kFW500)),
    //                   ),
    //                   SizedBox(
    //                     height: 15.h,
    //                   ),
    //                   RichText(
    //                     text: TextSpan(
    //                         text: "You have answered ",
    //                         style: GoogleFonts.inter(
    //                             color: white,
    //                             fontSize: kTwelveFont,
    //                             fontWeight: kFW500),
    //                         children: [
    //                           TextSpan(
    //                             text: skillsScore["score"].toString(),
    //                             style: GoogleFonts.inter(
    //                                 color: white,
    //                                 fontSize: kTwelveFont,
    //                                 fontWeight: kFW500),
    //                           ),
    //                           TextSpan(
    //                             text: ' out of ',
    //                             style: GoogleFonts.inter(
    //                                 color: white,
    //                                 fontSize: kTwelveFont,
    //                                 fontWeight: kFW500),
    //                           ),
    //                           TextSpan(
    //                             text: skillsScore["outoff"].toString(),
    //                             style: GoogleFonts.inter(
    //                                 color: white,
    //                                 fontSize: kTwelveFont,
    //                                 fontWeight: kFW500),
    //                           ),
    //                           TextSpan(
    //                             text: '  questions correctly',
    //                             style: GoogleFonts.inter(
    //                                 color: white,
    //                                 fontSize: kTwelveFont,
    //                                 fontWeight: kFW500),
    //                           ),
    //                         ]),
    //                   ),
    //                   SizedBox(
    //                     height: 15.h,
    //                   ),
    //                   RichText(
    //                     text: TextSpan(
    //                         text: "You got ",
    //                         style: GoogleFonts.inter(
    //                             color: white,
    //                             fontSize: kTwelveFont,
    //                             fontWeight: kFW500),
    //                         children: [
    //                           TextSpan(
    //                             text:
    //                                 "${skillsScore["percentage"].toString()} %",
    //                             style: GoogleFonts.inter(
    //                                 color: white,
    //                                 fontSize: kEighteenFont,
    //                                 fontWeight: kFW700),
    //                           ),
    //                           TextSpan(
    //                             text: ' in this assesment',
    //                             style: GoogleFonts.inter(
    //                                 color: white,
    //                                 fontSize: kTwelveFont,
    //                                 fontWeight: kFW500),
    //                           ),
    //                         ]),
    //                   ),
    //                   SizedBox(
    //                     height: 15.h,
    //                   ),
    //                   GestureDetector(
    //                     onTap: () {
    //                       Get.toNamed(KViewSkillAnswers,
    //                           arguments: Get.arguments);
    //                     },
    //                     child: Text("View test answers >",
    //                         style: GoogleFonts.gothicA1(
    //                             fontSize: kTwentyFont,
    //                             color: Gold,
    //                             fontWeight: kFW800)),
    //                   ),
    //                   SizedBox(
    //                     height: 15.h,
    //                   ),
    //                   GestureDetector(
    //                     onTap: () {
    //                       publishHandler();
    //                     },
    //                     child: Text("Publish >",
    //                         style: GoogleFonts.gothicA1(
    //                             fontSize: kTwentyFont,
    //                             color: Gold,
    //                             fontWeight: kFW800)),
    //                   ),
    //                   SizedBox(
    //                     height: 15.h,
    //                   ),
    //                   Text(
    //                       "Learn/Improve your Skills and assessing them to give yourself a chance to be different from the others and improves your chances of getting hired. ",
    //                       textAlign: TextAlign.center,
    //                       style: GoogleFonts.gothicA1(
    //                           fontSize: kTwelveFont,
    //                           color: white,
    //                           fontWeight: kFW500)),
    //                   SizedBox(
    //                     height: 15.h,
    //                   ),
    //                   Text(
    //                       "Based on the Skill score thresholds given by employers, your profile automatically ranks higher in employer's talent search ",
    //                       textAlign: TextAlign.center,
    //                       style: GoogleFonts.gothicA1(
    //                           fontSize: kTwelveFont,
    //                           color: white,
    //                           fontWeight: kFW500)),
    //                   SizedBox(
    //                     height: 15.h,
    //                   ),
    //                   Text(
    //                       "Adding Skills to your profile makes it easy for the recruiters to find you. It also increases your chances of getting hired. ",
    //                       textAlign: TextAlign.center,
    //                       style: GoogleFonts.gothicA1(
    //                           fontSize: kTwelveFont,
    //                           color: white,
    //                           fontWeight: kFW500)),
    //                   SizedBox(
    //                     height: 15.h,
    //                   ),
    //                   GestureDetector(
    //                     onTap: () {
    //                       Get.toNamed(kDashboard);
    //                     },
    //                     child: Text("Go Back",
    //                         textAlign: TextAlign.center,
    //                         style: GoogleFonts.gothicA1(
    //                             fontSize: kTwentyFont,
    //                             color: Gold,
    //                             fontWeight: kFW800)),
    //                   ),
    //                 ],
    //               )
    //             : Center(
    //                 child: CircularProgressIndicator(),
    //               ),
    //       ),
    //     ));
  }
}

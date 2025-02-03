import 'dart:ui';

import '../../utils/export_file.dart';

class CourseAssesment extends StatefulWidget {
  const CourseAssesment({super.key});

  @override
  State<CourseAssesment> createState() => _CourseAssesmentState();
}

class _CourseAssesmentState extends State<CourseAssesment> {
  Map tests = {};
  var quizQuestion = Get.arguments;
  String selectedlevel = "";
  // List<String> userChecked = [];
  // List<Map> answers = [];
  // double valid = 0.0;
  // Map assignmetData = Get.arguments;
  // Map takeExercises = {};
  // bool isLoading = false;
  // bool isSubmit = false;
  // // Future jobHandler() async {
  // //   setState(() {
  // //     isLoading = true;
  // //   });
  // //   Map data = await Services.gettakeexercise(id);
  // //   if (data["message"] != null) {
  // //     Fluttertoast.showToast(
  // //       msg: data["message"],
  // //     );
  // //   } else {
  // //     takeExercises = data["data"]["data"];
  // //   }
  // //   setState(() {
  // //     isLoading = false;
  // //   });
  // // }
  bool isSubmitted = false;
  bool isLoading = false;
  @override
  void initState() {
    checkForAlreadySubmitedData();
    makingNullToSelectedValues();
    prepareForPayload();
    super.initState();
  }

  checkForAlreadySubmitedData() {
    isSubmitted = quizQuestion[0]["exercise"]["candidate_exercise"].length > 0;
    if (isSubmitted) {
      result = quizQuestion[0]["exercise"]["candidate_exercise"][0];
    }
  }

  makingNullToSelectedValues() {
    for (int i = 0;
        i < quizQuestion[0]["exercise"]["exercise_questions"].length;
        i++) {
      for (int j = 0;
          j <
              quizQuestion[0]["exercise"]["exercise_questions"][i]
                      ["exercise_question_options"]
                  .length;
          j++) {
        if (quizQuestion[0]["exercise"]["exercise_questions"][i]
                ["exercise_question_options"][j]["choosen"] !=
            null) {
          quizQuestion[0]["exercise"]["exercise_questions"][i]
              ["exercise_question_options"][j]["choosen"] = null;
        }
      }
    }
  }

  Map payload = {};
  prepareForPayload() {
    var qidanswers = [];
    for (int k = 0;
        k < quizQuestion[0]["exercise"]["exercise_questions"].length;
        k++) {
      qidanswers.add(
          {"qid": quizQuestion[0]["exercise"]["exercise_questions"][k]["id"]});
    }
    payload = {
      "exercise_id": quizQuestion[0]["exercise"]["id"],
      "candidate_id": UserSimplePreferences.getCandidateId(),
      "questions": qidanswers,
      "type": "normal",
      "module": 0
    };
  }

  Map result = {};
  submitAnsers() async {
    setState(() {
      isLoading = true;
    });
    Map value = await Services.submitquiz(payload);
    //////////////////////////////////////////////////////////////////
    if (value["data"]["status"] == 1) {
      result = value["data"];
      Fluttertoast.showToast(
        msg: value["data"]["message"],
      );
    } else {
      Fluttertoast.showToast(
        msg: value["data"]["message"],
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    tests = result;
    // tests = result["result"];
    prepareForPayload();
    return Scaffold(
      //  extendBodyBehindAppBar: true,
      backgroundColor: kBackground,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: darktwo,
        elevation: 0,
      ),
      body: Stack(
        children: [
          const Background(),
          Container(
            margin: EdgeInsetsDirectional.all(15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 25.w, right: 25.w, bottom: 40.h),
                  child: Image.asset(
                    'assets/images/levelup bulb.png',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedProgressBar(
                        height: 5.h,
                        width: 280.w,
                        value: 40 / 100,
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
                Text(
                  "Your Progress",
                  style: GoogleFonts.gothicA1(
                      fontSize: kTwelveFont, color: white, fontWeight: kFW800),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  children: [
                    Icon(Icons.info_outline, size: 24.sp, color: customgrey),
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
                                      borderRadius: BorderRadius.circular(10.r),
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
                                      borderRadius: BorderRadius.circular(10.r),
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
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Icon(
                      Icons.circle_rounded,
                      color: Gold,
                      size: 10.sp,
                    ),
                    SizedBox(
                      width: 16.sp,
                    ),
                    Text(
                      "This contains 5 Questions.",
                      style: GoogleFonts.gothicA1(
                        fontSize: kTwelveFont,
                        color: whitetwo,
                        fontWeight: kFW500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Icon(
                      Icons.circle_rounded,
                      color: Gold,
                      size: 10.sp,
                    ),
                    SizedBox(
                      width: 16.sp,
                    ),
                    Text(
                      "Minimum 3 write Answers required to clear the exam. ",
                      style: GoogleFonts.gothicA1(
                        fontSize: kTwelveFont,
                        color: whitetwo,
                        fontWeight: kFW500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Icon(
                      Icons.circle_rounded,
                      color: Gold,
                      size: 10.sp,
                    ),
                    SizedBox(
                      width: 16.sp,
                    ),
                    Text(
                      "You can Retake this Exercise after some time.",
                      style: GoogleFonts.gothicA1(
                        fontSize: kTwelveFont,
                        color: whitetwo,
                        fontWeight: kFW500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 90.h),
                CustomButton(
                  label: 'Start Quiz',
                  isLoading: true,
                  onTap: () {
                    Get.toNamed(KCourseQuiz, arguments: [Get.arguments, tests]);
                    // Get.toNamed(KAssesment,
                    //     arguments: takeExercise["exercise_details"][0]
                    //         ["exercise_lessons"][0]

                    //     // takeExercise["exercise_details"]
                    //     //         [0]["exercise_lessons"]
                    //     //     [index]["id"],
                    //     //$.[]data.[]exercise_details.0.exercise_lessons.0.id
                    //     );
                  },
                  // onTap: () {
                  //   if (_formKey.currentState!.validate()) {}
                  //   ;
                  //   // Get.toNamed(KAchievedDetails);
                  // },
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // return Scaffold(
    //     backgroundColor: kBackground,
    //     appBar: AppBar(
    //       backgroundColor: kBackground,
    //       elevation: 0,
    //       centerTitle: true,
    //       title: Text(
    //         'Course Assesment',
    //         style: GoogleFonts.gothicA1(
    //             letterSpacing: 1,
    //             fontSize: kEighteenFont,
    //             color: white,
    //             fontWeight: kFW700),
    //       ),
    //       actions: [
    //         Center(
    //           child: GestureDetector(
    //             onTap: () {
    //               Get.toNamed(KNotification);
    //             },
    //             child: Stack(
    //               children: [
    //                 Image.asset(
    //                   'assets/images/bell.png',
    //                   width: 22.w,
    //                 ),
    //                 Positioned(
    //                     left: 13.r,
    //                     //top: .h,
    //                     child: const CircleAvatar(
    //                       radius: 5,
    //                       backgroundColor: Colors.green,
    //                     ))
    //               ],
    //             ),
    //           ),
    //         ),
    //         SizedBox(
    //           width: 13.w,
    //         )
    //       ],
    //     ),
    //     body: SingleChildScrollView(
    //       child: Container(
    //           margin: EdgeInsets.all(15.w),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               // Text("Test Course_101",
    //               //     //maxLines: 2,
    //               //     //  assignmetData["lesson_name"],
    //               //     style: GoogleFonts.gothicA1(
    //               //         fontSize: 17.sp, color: white, fontWeight: kFW700)),
    //               // SizedBox(
    //               //   height: 10.h,
    //               // ),
    //               SizedBox(
    //                 // height: 250.h,
    //                 child: ListView.builder(
    //                     itemCount: quizQuestion[0]["exercise"]
    //                             ["exercise_questions"]
    //                         .length,
    //                     scrollDirection: Axis.vertical,
    //                     shrinkWrap: true,
    //                     physics: NeverScrollableScrollPhysics(),
    //                     // physics: AlwaysScrollableScrollPhysics(),
    //                     itemBuilder: ((context, index) {
    //                       return Container(
    //                         height: 250.h,
    //                         width: 330.w,
    //                         child: Column(
    //                           mainAxisAlignment: MainAxisAlignment.start,
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             Text(
    //                                 quizQuestion[0]["exercise"]
    //                                     ["exercise_questions"][index]["title"],
    //                                 style: GoogleFonts.gothicA1(
    //                                     fontSize: kFourteenFont,
    //                                     color: Gold,
    //                                     fontWeight: kFW700)),
    //                             SizedBox(
    //                               height: 10.h,
    //                             ),
    // SizedBox(
    //   height: 200.h,
    //   child: ListView.builder(
    //       itemCount: quizQuestion[0]["exercise"]
    //                   ["exercise_questions"][index]
    //               ["exercise_question_options"]
    //           .length,
    //       physics: NeverScrollableScrollPhysics(),
    //       itemBuilder: ((context, i) {
    //         return ListTile(
    //             contentPadding: EdgeInsets.all(0),
    //             horizontalTitleGap: 0,
    //             title: Text(
    //                 // assignmetData["exercise_questions"]
    //                 quizQuestion[0]["exercise"][
    //                                 "exercise_questions"]
    //                             [index][
    //                         "exercise_question_options"]
    //                     [i]["title"],

    //                 //maxLines: 2,
    //                 style: GoogleFonts.gothicA1(
    //                     fontSize: kSixteenFont,
    //                     color: white,
    //                     fontWeight: kFW500)),
    //             leading: Checkbox(
    //               //  fillColor: Colors.blue,
    //               fillColor: MaterialStateProperty
    //                   .resolveWith(getColor),
    //               checkColor: white,
    //               activeColor: white,
    //               value: quizQuestion[0]["exercise"]
    //                                   [
    //                                   "exercise_questions"]
    //                               [index][
    //                           "exercise_question_options"]
    //                       [i]["choosen"] ??
    //                   false,
    //               onChanged: (value) {
    //                 if (isSubmitted != true) {
    //                   setState(() {
    //                     quizQuestion[0]["exercise"][
    //                                     "exercise_questions"]
    //                                 [index][
    //                             "exercise_question_options"]
    //                         [i]["choosen"] = value;

    //                     var data = quizQuestion[0]
    //                                     ["exercise"]
    //                                 [
    //                                 "exercise_questions"][index]
    //                             [
    //                             "exercise_question_options"]
    //                         .where((element) =>
    //                             element[
    //                                 "choosen"] ==
    //                             true)
    //                         .toList()[0]["id"];
    //                     payload["questions"][index]
    //                         ["answer"] = data;
    //                     debugPrint("choosen");
    //                   });
    //                 }
    //               },
    //               // onChanged: (val) {
    //               //   if (!isSubmit) {
    //               //     _onSelected(
    //               //         val!,
    //               //         assignmetData["exercise_questions"]
    //               //                     [index][
    //               //                 "exercise_question_options"]
    //               //             [i]["title"]);
    //               //     if (val == true) {
    //               //       assignmetData["exercise_questions"]
    //               //                           [
    //               //                           index]
    //               //                       [
    //               //                       "exercise_question_options"][i]
    //               //                   [
    //               //                   "is_answer"] ==
    //               //               "false"
    //               //           ? _howmanyCorrect(
    //               //               false,
    //               //               assignmetData[
    //               //                       "exercise_questions"]
    //               //                   .length)
    //               //           : _howmanyCorrect(
    //               //               true,
    //               //               assignmetData[
    //               //                       "exercise_questions"]
    //               //                   .length);
    //               //     } else {
    //               //       _howmanyCorrect(
    //               //           false,
    //               //           assignmetData[
    //               //                   "exercise_questions"]
    //               //               .length);
    //               //     }
    //               //   }
    //               // },
    //             )
    //             //you can use checkboxlistTile too
    //             );
    //       })),
    // ),
    //                           ],
    //                         ),
    //                       );
    //                     })),
    //               ),
    //               SizedBox(
    //                 height: 10.h,
    //               ),
    //               Center(
    //                 child: GlassmorphicContainer(
    //                   height: 41.h,
    //                   width: 160.w,
    //                   borderRadius: 13.r,
    //                   blur: 15,
    //                   alignment: Alignment.center,
    //                   border: 0.5,
    //                   linearGradient: LinearGradient(colors: [
    //                     white.withOpacity(0.1),
    //                     white.withOpacity(0.01)
    //                   ], begin: Alignment.topLeft, end: Alignment.bottomRight),
    //                   borderGradient: LinearGradient(
    //                       begin: Alignment.centerLeft,
    //                       end: Alignment.bottomRight,
    //                       colors: [
    //                         white.withOpacity(0.5),
    //                         white.withOpacity(0.5),
    //                         Gold.withOpacity(0.5)
    //                       ]),
    //                   child: Container(
    //                     decoration: BoxDecoration(boxShadow: [
    //                       BoxShadow(
    //                         blurRadius: 16,
    //                         spreadRadius: 15,
    //                         color: Colors.black.withOpacity(0.1),
    //                       )
    //                     ]),
    //                     child: GestureDetector(
    //                       onTap: () {
    //                         if (isSubmitted != true) {
    //                           setState(() async {
    //                             await submitAnsers();
    //                             isSubmitted = true;
    //                           });
    //                         }
    //                       },
    //                       child: ClipRRect(
    //                         borderRadius: BorderRadius.circular(15.0),
    //                         child: BackdropFilter(
    //                           filter: ImageFilter.blur(
    //                             sigmaX: 20.0,
    //                             sigmaY: 20.0,
    //                           ),
    //                           child: Text("Submit",
    //                               style: GoogleFonts.gothicA1(
    //                                   fontSize: kSixteenFont,
    //                                   color: white,
    //                                   fontWeight: kFW700)),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 40.h,
    //               ),
    //               isSubmitted == true && result.isNotEmpty
    //                   ? Center(
    //                       child: CircularPercentIndicator(
    //                         radius: 60.0,
    //                         lineWidth: 5.0,
    //                         percent: double.parse(result["result"]) / 100,
    //                         center: Text(result["result"] + "%",
    //                             style: GoogleFonts.gothicA1(
    //                                 fontSize: kSixteenFont,
    //                                 color: white,
    //                                 fontWeight: kFW700)),
    //                         progressColor: Gold,
    //                       ),
    //                     )
    //                   : SizedBox(),
    //               SizedBox(
    //                 height: 35.h,
    //               ),
    //               // GestureDetector(
    //               //   onTap: () {},
    //               //   child: Center(
    //               //     child: GlassmorphicContainer(
    //               //       height: 41.h,
    //               //       width: 240.w,
    //               //       borderRadius: 13.r,
    //               //       blur: 15,
    //               //       alignment: Alignment.center,
    //               //       border: 0.5,
    //               //       linearGradient: LinearGradient(colors: [
    //               //         white.withOpacity(0.1),
    //               //         white.withOpacity(0.01)
    //               //       ], begin: Alignment.topLeft, end: Alignment.bottomRight),
    //               //       borderGradient: LinearGradient(
    //               //           begin: Alignment.centerLeft,
    //               //           end: Alignment.bottomRight,
    //               //           colors: [
    //               //             white.withOpacity(0.5),
    //               //             white.withOpacity(0.5),
    //               //             Gold.withOpacity(0.5)
    //               //           ]),
    //               //       child: Container(
    //               //         decoration: BoxDecoration(boxShadow: [
    //               //           BoxShadow(
    //               //             blurRadius: 16,
    //               //             spreadRadius: 15,
    //               //             color: Colors.black.withOpacity(0.1),
    //               //           )
    //               //         ]),
    //               //         child: ClipRRect(
    //               //           borderRadius: BorderRadius.circular(15.0),
    //               //           child: BackdropFilter(
    //               //             filter: ImageFilter.blur(
    //               //               sigmaX: 20.0,
    //               //               sigmaY: 20.0,
    //               //             ),
    //               //             child: Text(" Download Certificate",
    //               //                 //maxLines: 2,
    //               //                 style: GoogleFonts.gothicA1(
    //               //                     fontSize: kSixteenFont,
    //               //                     color: white,
    //               //                     fontWeight: kFW700)),
    //               //           ),
    //               //         ),
    //               //       ),
    //               //     ),
    //               //   ),
    //               // ),
    //             ],
    //           )),
    //     ));
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.selected,
      MaterialState.focused,
      MaterialState.pressed,
    };
    if (states.any(interactiveStates.contains)) {
      return Gold;
    }
    return Colors.white;
  }
}

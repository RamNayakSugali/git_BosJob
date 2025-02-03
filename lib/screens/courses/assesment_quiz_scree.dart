import 'dart:ui';

import '../../utils/export_file.dart';

class CourseQiuz extends StatefulWidget {
  const CourseQiuz({super.key});

  @override
  State<CourseQiuz> createState() => _CourseQiuzState();
}

class _CourseQiuzState extends State<CourseQiuz> with TickerProviderStateMixin {
  //List<Map> answers = [];
  double valid = 0.0;
  var quizQuestion = Get.arguments[0];
  var quizScore = Get.arguments[1];
  // Map assignmetData = Get.arguments;
  // Map takeExercises = {};
  bool isLoading = false;
  bool isSubmit = false;
  // Future jobHandler() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   Map data = await Services.gettakeexercise(id);
  //   if (data["message"] != null) {
  //     Fluttertoast.showToast(
  //       msg: data["message"],
  //     );
  //   } else {
  //     takeExercises = data["data"]["data"];
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  // @override
  // void initState() {
  //   // jobHandler();
  //   super.initState();
  // }
  String? gender;

  late AnimationController controller;
  var _selectedAnswers;
  String selectedlevel = "";
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
    checkForAlreadySubmitedData();
    makingNullToSelectedValues();
    prepareForPayload();
    super.initState();
  }

  bool isSubmitted = false;
  // bool isLoading = false;
  // @override
  // void initState() {

  // }

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
    Get.toNamed(KCourseQuizScore,
        arguments: {"result": result, "question": quizQuestion});

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomSheet: Container(
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.only(
        //     topRight: Radius.circular(50.r),
        //     topLeft: Radius.circular(50.r),
        //   )),
        //   height: 100.h,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       selectedlevel == "time"
        //           ? GestureDetector(
        //               onTap: () {
        //                 setState(() {
        //                   selectedlevel = "time";
        //                 });
        //               },
        //               child: GlassmorphicContainer(
        //                 // height: 210.h,
        //                 height: 39.h,
        //                 width: 96.w,
        //                 borderRadius: 10.r,
        //                 blur: 15,
        //                 alignment: Alignment.center,
        //                 border: 2,
        //                 linearGradient: LinearGradient(
        //                   colors: [
        //                     white.withOpacity(0.15),
        //                     white.withOpacity(0.15),
        //                   ],
        //                 ),
        //                 borderGradient: LinearGradient(
        //                   colors: [
        //                     kBackground,
        //                     //  white.withOpacity(0.5),
        //                     Gold.withOpacity(0.01)
        //                   ],
        //                 ),
        //                 child: Container(
        //                   decoration: BoxDecoration(
        //                     boxShadow: [
        //                       BoxShadow(
        //                         blurRadius: 20,
        //                         spreadRadius: 10.r,
        //                         color: Colors.black.withOpacity(0.1),
        //                       )
        //                     ],
        //                   ),
        //                   child: ClipRRect(
        //                     borderRadius: BorderRadius.circular(10.r),
        //                     child: BackdropFilter(
        //                       filter: ImageFilter.blur(
        //                         sigmaX: 10.0,
        //                         sigmaY: 10.0,
        //                       ),
        //                       child: Container(
        //                         width: double.infinity,
        //                         padding:
        //                             EdgeInsets.only(left: 15.w, right: 15.w),
        //                         //  padding: EdgeInsets.all(15.r),
        //                         decoration: BoxDecoration(
        //                           border: const GradientBoxBorder(
        //                             gradient: LinearGradient(
        //                                 begin: Alignment.topLeft,
        //                                 end: Alignment.bottomRight,
        //                                 colors: [
        //                                   kBackground,
        //                                   kBackground,
        //                                   kBackground,
        //                                   Gold
        //                                 ]),
        //                             width: 0.5,
        //                           ),
        //                           borderRadius: BorderRadius.circular(10.r),
        //                         ),
        //                         child: Column(
        //                           crossAxisAlignment: CrossAxisAlignment.center,
        //                           mainAxisAlignment: MainAxisAlignment.center,
        //                           children: [
        //                             Text(
        //                               "09:32",
        //                               style: GoogleFonts.gothicA1(
        //                                 fontSize: kFourteenFont,
        //                                 color: Gold,
        //                                 fontWeight: kFW700,
        //                               ),
        //                             ),
        //                             // SizedBox(
        //                             //   height: 15.h,
        //                             // ),

        //                             // SizedBox(
        //                             //   height: 15.h,
        //                             // ),

        //                             // SizedBox(height: 15.h),
        //                           ],
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             )
        //           : GestureDetector(
        //               onTap: () {
        //                 setState(() {
        //                   selectedlevel = "time";
        //                 });
        //               },
        //               child: Container(
        //                 alignment: Alignment.center,
        //                 height: 39.h,
        //                 width: 96.w,
        //                 child: Text(
        //                   "09:32",
        //                   style: GoogleFonts.gothicA1(
        //                     fontSize: 11.sp,
        //                     color: whitetwo,
        //                     fontWeight: kFW500,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //       SizedBox(width: 20.w),
        //       selectedlevel == "Play"
        //           ? GestureDetector(
        //               onTap: () {
        //                 setState(() {
        //                   selectedlevel = "Play";
        //                 });
        //               },
        //               child: GlassmorphicContainer(
        //                 // height: 210.h,
        //                 height: 39.h,
        //                 width: 96.w,
        //                 borderRadius: 10.r,
        //                 blur: 15,
        //                 alignment: Alignment.center,
        //                 border: 2,
        //                 linearGradient: LinearGradient(
        //                   colors: [
        //                     white.withOpacity(0.15),
        //                     white.withOpacity(0.15),
        //                   ],
        //                 ),
        //                 borderGradient: LinearGradient(
        //                   colors: [
        //                     kBackground,
        //                     //  white.withOpacity(0.5),
        //                     Gold.withOpacity(0.01)
        //                   ],
        //                 ),
        //                 child: Container(
        //                   decoration: BoxDecoration(
        //                     boxShadow: [
        //                       BoxShadow(
        //                         blurRadius: 20,
        //                         spreadRadius: 10.r,
        //                         color: Colors.black.withOpacity(0.1),
        //                       )
        //                     ],
        //                   ),
        //                   child: ClipRRect(
        //                     borderRadius: BorderRadius.circular(10.r),
        //                     child: BackdropFilter(
        //                       filter: ImageFilter.blur(
        //                         sigmaX: 10.0,
        //                         sigmaY: 10.0,
        //                       ),
        //                       child: Container(
        //                         width: double.infinity,
        //                         padding:
        //                             EdgeInsets.only(left: 15.w, right: 15.w),
        //                         //  padding: EdgeInsets.all(15.r),
        //                         decoration: BoxDecoration(
        //                           border: const GradientBoxBorder(
        //                             gradient: LinearGradient(
        //                                 begin: Alignment.topLeft,
        //                                 end: Alignment.bottomRight,
        //                                 colors: [
        //                                   kBackground,
        //                                   kBackground,
        //                                   kBackground,
        //                                   Gold
        //                                 ]),
        //                             width: 0.5,
        //                           ),
        //                           borderRadius: BorderRadius.circular(10.r),
        //                         ),
        //                         child: Column(
        //                           mainAxisAlignment: MainAxisAlignment.center,
        //                           crossAxisAlignment: CrossAxisAlignment.center,
        //                           children: [
        //                             Row(
        //                               children: [
        //                                 Icon(Icons.play_arrow,
        //                                     color: Gold, size: 20.sp),
        //                                 Text(
        //                                   "Play",
        //                                   style: GoogleFonts.gothicA1(
        //                                     fontSize: kFourteenFont,
        //                                     color: Gold,
        //                                     fontWeight: kFW700,
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                             // SizedBox(
        //                             //   height: 15.h,
        //                             // ),

        //                             // SizedBox(
        //                             //   height: 15.h,
        //                             // ),

        //                             // SizedBox(height: 15.h),
        //                           ],
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             )
        //           : GestureDetector(
        //               onTap: () {
        //                 setState(() {
        //                   selectedlevel = "Play";
        //                 });
        //               },
        //               child: Container(
        //                 alignment: Alignment.center,
        //                 height: 39.h,
        //                 width: 96.w,
        //                 child: Row(
        //                   children: [
        //                     Icon(Icons.play_arrow, color: white, size: 20.sp),
        //                     Text(
        //                       "Play",
        //                       style: GoogleFonts.gothicA1(
        //                         fontSize: 11.sp,
        //                         color: whitetwo,
        //                         fontWeight: kFW500,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //       SizedBox(width: 20.w),
        //       selectedlevel == "Stop"
        //           ? GestureDetector(
        //               onTap: () {
        //                 setState(() {
        //                   selectedlevel = "Stop";
        //                 });
        //               },
        //               child: GlassmorphicContainer(
        //                 // height: 210.h,
        //                 height: 39.h,
        //                 width: 96.w,
        //                 borderRadius: 10.r,
        //                 blur: 15,
        //                 alignment: Alignment.center,
        //                 border: 2,
        //                 linearGradient: LinearGradient(
        //                   colors: [
        //                     white.withOpacity(0.15),
        //                     white.withOpacity(0.15),
        //                   ],
        //                 ),
        //                 borderGradient: LinearGradient(
        //                   colors: [
        //                     kBackground,
        //                     //  white.withOpacity(0.5),
        //                     Gold.withOpacity(0.01)
        //                   ],
        //                 ),
        //                 child: Container(
        //                   decoration: BoxDecoration(
        //                     boxShadow: [
        //                       BoxShadow(
        //                         blurRadius: 20,
        //                         spreadRadius: 10.r,
        //                         color: Colors.black.withOpacity(0.1),
        //                       )
        //                     ],
        //                   ),
        //                   child: ClipRRect(
        //                     borderRadius: BorderRadius.circular(10.r),
        //                     child: BackdropFilter(
        //                       filter: ImageFilter.blur(
        //                         sigmaX: 10.0,
        //                         sigmaY: 10.0,
        //                       ),
        //                       child: Container(
        //                         width: double.infinity,
        //                         padding:
        //                             EdgeInsets.only(left: 15.w, right: 15.w),
        //                         //  padding: EdgeInsets.all(15.r),
        //                         decoration: BoxDecoration(
        //                           border: const GradientBoxBorder(
        //                             gradient: LinearGradient(
        //                                 begin: Alignment.topLeft,
        //                                 end: Alignment.bottomRight,
        //                                 colors: [
        //                                   kBackground,
        //                                   kBackground,
        //                                   kBackground,
        //                                   Gold
        //                                 ]),
        //                             width: 0.5,
        //                           ),
        //                           borderRadius: BorderRadius.circular(10.r),
        //                         ),
        //                         child: Column(
        //                           mainAxisAlignment: MainAxisAlignment.center,
        //                           crossAxisAlignment: CrossAxisAlignment.center,
        //                           children: [
        //                             Row(
        //                               children: [
        //                                 Icon(Icons.stop,
        //                                     color: Gold, size: 20.sp),
        //                                 Text(
        //                                   "Stop",
        //                                   style: GoogleFonts.gothicA1(
        //                                     fontSize: kFourteenFont,
        //                                     color: Gold,
        //                                     fontWeight: kFW700,
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                             // SizedBox(
        //                             //   height: 15.h,
        //                             // ),

        //                             // SizedBox(
        //                             //   height: 15.h,
        //                             // ),

        //                             // SizedBox(height: 15.h),
        //                           ],
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             )
        //           : GestureDetector(
        //               onTap: () {
        //                 setState(() {
        //                   selectedlevel = "Stop";
        //                 });
        //               },
        //               child: Container(
        //                 alignment: Alignment.center,
        //                 height: 39.h,
        //                 width: 96.w,
        //                 child: Row(
        //                   children: [
        //                     Icon(Icons.stop, color: white, size: 20.sp),
        //                     Text(
        //                       "Stop",
        //                       style: GoogleFonts.gothicA1(
        //                         fontSize: 11.sp,
        //                         color: whitetwo,
        //                         fontWeight: kFW500,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //     ],
        //   ),
        // ),
        backgroundColor: kBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: AppBar(
            
            backgroundColor: darktwo,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Exercise',
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
            flexibleSpace: Container(
              // color: whitetwo,
              height: 40.h,
              width: double.infinity,
              margin: EdgeInsets.only(top: 120.0, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedProgressBar(
                      height: 5.h,
                      width: 220.w,
                      value: 40 / 100,
                      duration: Duration(seconds: 1),
                      gradient: const LinearGradient(
                        colors: [Gold, white],
                      ),
                      backgroundColor: white),
                  Row(
                    children: [
                      Text("2/",
                          style: GoogleFonts.inter(
                              color: white,
                              fontSize: kFourteenFont,
                              fontWeight: kFW800)),
                      Text("4 Qn",
                          style: GoogleFonts.inter(
                              color: white,
                              fontSize: kTwelveFont,
                              fontWeight: kFW600)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Background(),
            SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.all(15.w),
                  child: isLoading == false
                      ? Column(
                          children: [
                            // Text(
                            //   assementdetails["skilinfo"]["title"],
                            //   //$.[]data.question_master.length
                            //   style: GoogleFonts.gothicA1(
                            //       letterSpacing: 1,
                            //       fontSize: kEighteenFont,
                            //       color: white,
                            //       fontWeight: kFW700),
                            // ),
                            // SizedBox(
                            //   height: 10.h,
                            // ),
                            isLoading == false
                                ? ListView.builder(
                                    itemCount: quizQuestion[0]["exercise"]
                                            ["exercise_questions"]
                                        .length,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: ((context, index) {
                                      return GlassmorphicContainer(
                                        margin: EdgeInsets.only(bottom: 15.h),
                                        // height: 230.h,
                                        // height: 250.h,
                                        height: 270.h,
                                        width: double.infinity,
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
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                              )
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                sigmaX: 10.0,
                                                sigmaY: 10.0,
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                padding: EdgeInsets.all(16.w),
                                                decoration: BoxDecoration(
                                                  border:
                                                      const GradientBoxBorder(
                                                    gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topLeft,
                                                        end: Alignment
                                                            .bottomRight,
                                                        colors: [
                                                          kBackground,
                                                          kBackground,
                                                          kBackground,
                                                          Gold
                                                        ]),
                                                    width: 0.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                ),
                                                child: Theme(
                                                  data: ThemeData(
                                                      unselectedWidgetColor:
                                                          whitetwo),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        quizQuestion[0]
                                                                    ["exercise"]
                                                                [
                                                                "exercise_questions"]
                                                            [index]["title"],
                                                        maxLines: 2,
                                                        style: GoogleFonts
                                                            .gothicA1(
                                                                fontSize: 13.sp,
                                                                color: whitetwo,
                                                                fontWeight:
                                                                    kFW700),
                                                      ),
                                                      SizedBox(
                                                        height: 200.h,
                                                        child: ListView.builder(
                                                            itemCount: quizQuestion[0]
                                                                            [
                                                                            "exercise"]
                                                                        [
                                                                        "exercise_questions"][index]
                                                                    [
                                                                    "exercise_question_options"]
                                                                .length,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemBuilder:
                                                                ((context, i) {
                                                              return ListTile(
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0),
                                                                  horizontalTitleGap:
                                                                      0,
                                                                  title: Text(
                                                                      // assignmetData["exercise_questions"]
                                                                      quizQuestion[0]["exercise"]["exercise_questions"][index]["exercise_question_options"][i]
                                                                          [
                                                                          "title"],

                                                                      //maxLines: 2,
                                                                      style: GoogleFonts.gothicA1(
                                                                          fontSize:
                                                                              kSixteenFont,
                                                                          color:
                                                                              white,
                                                                          fontWeight:
                                                                              kFW500)),
                                                                  leading:
                                                                      Checkbox(
                                                                    //  fillColor: Colors.blue,
                                                                    fillColor: MaterialStateProperty
                                                                        .resolveWith(
                                                                            getColor),
                                                                    checkColor:
                                                                        white,
                                                                    activeColor:
                                                                        white,
                                                                    value: quizQuestion[0]["exercise"]["exercise_questions"][index]["exercise_question_options"][i]
                                                                            [
                                                                            "choosen"] ??
                                                                        false,
                                                                    onChanged:
                                                                        (value) {
                                                                      if (isSubmitted !=
                                                                          true) {
                                                                        setState(
                                                                            () {
                                                                          quizQuestion[0]["exercise"]["exercise_questions"][index]["exercise_question_options"][i]["choosen"] =
                                                                              value;

                                                                          var data = quizQuestion[0]["exercise"]["exercise_questions"][index]["exercise_question_options"]
                                                                              .where((element) => element["choosen"] == true)
                                                                              .toList()[0]["id"];
                                                                          payload["questions"][index]["answer"] =
                                                                              data;
                                                                          debugPrint(
                                                                              "choosen");
                                                                        });
                                                                      }
                                                                    },
                                                                    // onChanged: (val) {
                                                                    //   if (!isSubmit) {
                                                                    //     _onSelected(
                                                                    //         val!,
                                                                    //         assignmetData["exercise_questions"]
                                                                    //                     [index][
                                                                    //                 "exercise_question_options"]
                                                                    //             [i]["title"]);
                                                                    //     if (val == true) {
                                                                    //       assignmetData["exercise_questions"]
                                                                    //                           [
                                                                    //                           index]
                                                                    //                       [
                                                                    //                       "exercise_question_options"][i]
                                                                    //                   [
                                                                    //                   "is_answer"] ==
                                                                    //               "false"
                                                                    //           ? _howmanyCorrect(
                                                                    //               false,
                                                                    //               assignmetData[
                                                                    //                       "exercise_questions"]
                                                                    //                   .length)
                                                                    //           : _howmanyCorrect(
                                                                    //               true,
                                                                    //               assignmetData[
                                                                    //                       "exercise_questions"]
                                                                    //                   .length);
                                                                    //     } else {
                                                                    //       _howmanyCorrect(
                                                                    //           false,
                                                                    //           assignmetData[
                                                                    //                   "exercise_questions"]
                                                                    //               .length);
                                                                    //     }
                                                                    //   }
                                                                    // },
                                                                  )
                                                                  //you can use checkboxlistTile too
                                                                  );
                                                            })),
                                                      ),
                                                      // ListView.builder(
                                                      //     itemCount: quizQuestion[
                                                      //                         0][
                                                      //                     "exercise"]
                                                      //                 ["exercise_questions"][index]
                                                      //             [
                                                      //             "exercise_question_options"]
                                                      //         .length,
                                                      //     shrinkWrap: true,
                                                      //     physics:
                                                      //         NeverScrollableScrollPhysics(),
                                                      //     itemBuilder:
                                                      //         ((context, i) {
                                                      //       return
                                                      //           /////////////////////////////////////////////
                                                      //           Theme(
                                                      //         data: ThemeData(
                                                      //             unselectedWidgetColor:
                                                      //                 whitetwo),
                                                      //         child:
                                                      //             RadioListTile(
                                                      //           visualDensity: const VisualDensity(
                                                      //               horizontal:
                                                      //                   VisualDensity
                                                      //                       .minimumDensity,
                                                      //               vertical:
                                                      //                   VisualDensity
                                                      //                       .minimumDensity),
                                                      //           materialTapTargetSize:
                                                      //               MaterialTapTargetSize
                                                      //                   .shrinkWrap,
                                                      //           contentPadding:
                                                      //               EdgeInsets.only(
                                                      //                   top: 12
                                                      //                       .h),
                                                      //           dense: true,
                                                      //           activeColor:
                                                      //               Gold,
                                                      //           title: Text(
                                                      //             quizQuestion[0]["exercise"]["exercise_questions"]
                                                      //                         [
                                                      //                         index]
                                                      //                     [
                                                      //                     "exercise_question_options"]
                                                      //                 [
                                                      //                 i]["title"],
                                                      //             // "This is Wrong Answer",
                                                      //             style: GoogleFonts.gothicA1(
                                                      //                 fontSize:
                                                      //                     13.sp,
                                                      //                 color:
                                                      //                     whitetwo,
                                                      //                 fontWeight:
                                                      //                     kFW700),
                                                      //           ),
                                                      //           value: quizQuestion[0]["exercise"]["exercise_questions"][index]
                                                      //                       [
                                                      //                       "exercise_question_options"][i]
                                                      //                   [
                                                      //                   "choosen"] ??
                                                      //               false,

                                                      //           // "1",
                                                      //           groupValue: quizQuestion[0]["exercise"]["exercise_questions"][index]
                                                      //                       [
                                                      //                       "exercise_question_options"][i]
                                                      //                   [
                                                      //                   "choosen"] ??
                                                      //               false,
                                                      //           // _selectedGender,
                                                      //           onChanged:
                                                      //               (value) {
                                                      //             if (isSubmitted !=
                                                      //                 true) {
                                                      //               setState(
                                                      //                   () {
                                                      //                 quizQuestion[0]["exercise"]["exercise_questions"][index]["exercise_question_options"][i]
                                                      //                         [
                                                      //                         "choosen"] =
                                                      //                     value;

                                                      //                 var data = quizQuestion[0]["exercise"]["exercise_questions"][index]
                                                      //                         [
                                                      //                         "exercise_question_options"]
                                                      //                     .where((element) =>
                                                      //                         element["choosen"] ==
                                                      //                         true)
                                                      //                     .toList()[0]["id"];
                                                      //                 payload["questions"]
                                                      //                         [
                                                      //                         index]
                                                      //                     [
                                                      //                     "answer"] = data;
                                                      //                 debugPrint(
                                                      //                     "choosen");
                                                      //               });
                                                      //             }
                                                      //           },
                                                      //           // (value) {
                                                      //           //   setState(() {
                                                      //           //     gender = value.toString();
                                                      //           //   });
                                                      //           // },
                                                      //         ),
                                                      //       );
                                                      //     })),

                                                      // RadioListTile(
                                                      //   visualDensity: const VisualDensity(
                                                      //       horizontal:
                                                      //           VisualDensity
                                                      //               .minimumDensity,
                                                      //       vertical:
                                                      //           VisualDensity
                                                      //               .minimumDensity),
                                                      //   materialTapTargetSize:
                                                      //       MaterialTapTargetSize
                                                      //           .shrinkWrap,
                                                      //   contentPadding:
                                                      //       EdgeInsets.all(0),
                                                      //   dense: true,
                                                      //   activeColor: Gold,
                                                      //   title: Text(
                                                      //     "This is Wrong Answer",
                                                      //     style: GoogleFonts.gothicA1(
                                                      //         fontSize:
                                                      //             gender ==
                                                      //                     "1"
                                                      //                 ? 15.sp
                                                      //                 : 13.sp,
                                                      //         color: gender ==
                                                      //                 "1"
                                                      //             ? Gold
                                                      //             : whitetwo,
                                                      //         fontWeight:
                                                      //             kFW700),
                                                      //   ),
                                                      //   value: "1",
                                                      //   groupValue: gender,
                                                      //   onChanged: (value) {
                                                      //     setState(() {
                                                      //       gender = value
                                                      //           .toString();
                                                      //     });
                                                      //   },
                                                      // ),
                                                      // RadioListTile(
                                                      //   contentPadding:
                                                      //       EdgeInsets.all(0),
                                                      //   // Visual Density passed here
                                                      //   visualDensity: const VisualDensity(
                                                      //       horizontal:
                                                      //           VisualDensity
                                                      //               .minimumDensity,
                                                      //       vertical:
                                                      //           VisualDensity
                                                      //               .minimumDensity),
                                                      //   materialTapTargetSize:
                                                      //       MaterialTapTargetSize
                                                      //           .shrinkWrap,
                                                      //   dense: true,
                                                      //   activeColor: Gold,
                                                      //   title: Text(
                                                      //     "This is Wrong Answer",
                                                      //     style: GoogleFonts.gothicA1(
                                                      //         fontSize:
                                                      //             gender ==
                                                      //                     "2"
                                                      //                 ? 15.sp
                                                      //                 : 13.sp,
                                                      //         color: gender ==
                                                      //                 "2"
                                                      //             ? Gold
                                                      //             : whitetwo,
                                                      //         fontWeight:
                                                      //             kFW700),
                                                      //   ),
                                                      //   value: "2",
                                                      //   groupValue: gender,
                                                      //   onChanged: (value) {
                                                      //     setState(() {
                                                      //       gender = value
                                                      //           .toString();
                                                      //     });
                                                      //   },
                                                      // ),
                                                      // RadioListTile(
                                                      //   contentPadding:
                                                      //       EdgeInsets.all(0),
                                                      //   visualDensity: const VisualDensity(
                                                      //       horizontal:
                                                      //           VisualDensity
                                                      //               .minimumDensity,
                                                      //       vertical:
                                                      //           VisualDensity
                                                      //               .minimumDensity),
                                                      //   materialTapTargetSize:
                                                      //       MaterialTapTargetSize
                                                      //           .shrinkWrap,
                                                      //   dense: true,
                                                      //   activeColor: Gold,
                                                      //   title: Text(
                                                      //     "This is Wrong Answer",
                                                      //     style: GoogleFonts.gothicA1(
                                                      //         fontSize:
                                                      //             gender ==
                                                      //                     "3"
                                                      //                 ? 15.sp
                                                      //                 : 13.sp,
                                                      //         color: gender ==
                                                      //                 "3"
                                                      //             ? Gold
                                                      //             : whitetwo,
                                                      //         fontWeight:
                                                      //             kFW700),
                                                      //   ),
                                                      //   value: "3",
                                                      //   groupValue: gender,
                                                      //   onChanged: (value) {
                                                      //     setState(() {
                                                      //       gender = value
                                                      //           .toString();
                                                      //     });
                                                      //   },
                                                      // ),
                                                      // RadioListTile(
                                                      //   toggleable: true,
                                                      //   contentPadding:
                                                      //       EdgeInsets.all(0),
                                                      //   visualDensity: const VisualDensity(
                                                      //       horizontal:
                                                      //           VisualDensity
                                                      //               .minimumDensity,
                                                      //       vertical:
                                                      //           VisualDensity
                                                      //               .minimumDensity),
                                                      //   materialTapTargetSize:
                                                      //       MaterialTapTargetSize
                                                      //           .shrinkWrap,
                                                      //   dense: true,
                                                      //   activeColor: Gold,
                                                      //   title: Text(
                                                      //     "This is Wrong Answer",
                                                      //     style: GoogleFonts.gothicA1(
                                                      //         fontSize:
                                                      //             gender ==
                                                      //                     "4"
                                                      //                 ? 15.sp
                                                      //                 : 13.sp,
                                                      //         color: gender ==
                                                      //                 "4"
                                                      //             ? Gold
                                                      //             : whitetwo,
                                                      //         fontWeight:
                                                      //             kFW700),
                                                      //   ),
                                                      //   value: "4",
                                                      //   groupValue: gender,
                                                      //   onChanged: (value) {
                                                      //     setState(() {
                                                      //       gender = value
                                                      //           .toString();
                                                      //     });
                                                      //   },
                                                      // )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }))
                                : Center(
                                    child: Text(
                                      " No skill questions updated. Please visit after some time",
                                      style: GoogleFonts.gothicA1(
                                          fontSize: kSixteenFont,
                                          color: white,
                                          fontWeight: kFW700),
                                    ),
                                  ),

                            SizedBox(height: 50.h),
                            CustomButton(
                              label: 'Submit',
                              isLoading: true,
                              onTap: () {
                                // if (isSubmitted != true) {
                                setState(() async {
                                  isSubmitted = true;
                                  await submitAnsers();
                                });

                                // }
                              },
                              // onTap: () {
                              //   if (_formKey.currentState!.validate()) {}
                              //   ;
                              //   // Get.toNamed(KAchievedDetails);
                              // },
                            ),
                            SizedBox(height: 90.h),
                            /////////////////////////////////////////////////////////////////////////////////////////////////
                            // SizedBox(height: 20.h),
                            // assementdetails["question_master"].isNotEmpty
                            //     ? GestureDetector(
                            //         onTap: () {
                            //           Get.offAllNamed(KSkillScoreView, arguments: {
                            //             "id": Get.arguments["id"],
                            //             "payload": payloadData
                            //           });
                            //         },
                            //         child: Center(
                            //           child: GlassmorphicContainer(
                            //             height: 41.h,
                            //             width: 160.w,
                            //             borderRadius: 13.r,
                            //             blur: 15,
                            //             alignment: Alignment.center,
                            //             border: 0.5,
                            //             linearGradient: LinearGradient(
                            //                 colors: [
                            //                   white.withOpacity(0.1),
                            //                   white.withOpacity(0.01)
                            //                 ],
                            //                 begin: Alignment.topLeft,
                            //                 end: Alignment.bottomRight),
                            //             borderGradient: LinearGradient(
                            //                 begin: Alignment.centerLeft,
                            //                 end: Alignment.bottomRight,
                            //                 colors: [
                            //                   white.withOpacity(0.5),
                            //                   white.withOpacity(0.5),
                            //                   Gold.withOpacity(0.5)
                            //                 ]),
                            //             child: Container(
                            //               decoration: BoxDecoration(boxShadow: [
                            //                 BoxShadow(
                            //                   blurRadius: 16,
                            //                   spreadRadius: 15,
                            //                   color: Colors.black.withOpacity(0.1),
                            //                 )
                            //               ]),
                            //               child: ClipRRect(
                            //                 borderRadius:
                            //                     BorderRadius.circular(15.0),
                            //                 child: BackdropFilter(
                            //                   filter: ImageFilter.blur(
                            //                     sigmaX: 20.0,
                            //                     sigmaY: 20.0,
                            //                   ),
                            //                   child: Text("Submit",
                            //                       //maxLines: 2,
                            //                       style: GoogleFonts.gothicA1(
                            //                           fontSize: kSixteenFont,
                            //                           color: white,
                            //                           fontWeight: kFW700)),
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       )
                            //     : SizedBox(),
                          ],
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            color: Gold,
                          ),
                        )
                  // : Center(
                  //     child: CircularPercentIndicator(radius: 5),
                  //   )
                  ),
            ),
          ],
        ));
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

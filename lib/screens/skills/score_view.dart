import 'dart:ui';

import '../../utils/export_file.dart';

class SkillScore extends StatefulWidget {
  const SkillScore({super.key});

  @override
  State<SkillScore> createState() => _SkillScoreState();
}

class _SkillScoreState extends State<SkillScore> {
  bool isLoading = false;
  Map Publishskills = {};

  Future publishHandler() async {
    setState(() {
      isLoading = true;
    });
    Map payload = {
      "skill_master_id": Get.arguments["id"],
      "candidate_id": UserSimplePreferences.getCandidateId(),
      "questions": Get.arguments["payload"]
    };

    var value = await Services.publishSkillScore(payload);

    if (value["data"] == null) {
      Fluttertoast.showToast(msg: value["data"]["message"]);
    } else {
      Publishskills = value["data"];
      Fluttertoast.showToast(msg: value["data"]["message"]);
    }
    print(value["data"]);
    setState(() {
      isLoading = false;
    });
  }

  ///////////////////////////////////////////////////////

  Map skillsScore = {};
  List<int> wishlisted = <int>[];
  var profiletopacksDataid = Get.arguments;
  Future scoreHandler() async {
    setState(() {
      isLoading = true;
    });
    List<Map> payloaddata = [];
    Get.arguments["payload"];
    for (int i = 0; i < Get.arguments["payload"].length; i++) {
      payloaddata.add({
        "qid": Get.arguments["payload"][i]["qid"],
        "answer": Get.arguments["payload"][i]["answer"]
      });
    }
    Map payload = {
      "skill_master_id": Get.arguments["id"],
      "candidate_id": UserSimplePreferences.getCandidateId(),
      "questions": payloaddata
    };

    var value = await Services.getSkillScores(payload);

    if (value["data"] == null) {
      Fluttertoast.showToast(msg: value["data"]["message"]);
    } else {
      skillsScore = value["data"];
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    scoreHandler();
  }

  @override
  Widget build(BuildContext context) {
    return

        ///////////////////////////////////////////////////////////////////
        Scaffold(
            backgroundColor: kBackground,
            appBar: AppBar(
             iconTheme: const IconThemeData(color: white),
              elevation: 0,
              backgroundColor: darktwo,
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
                              Text(
                                "Your Assessment Score",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.gothicA1(
                                    letterSpacing: 1.4,
                                    fontSize: 28.sp,
                                    color: whitetwo,
                                    fontWeight: kFW800),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Text(
                                skillsScore["percentage"] >= 50
                                    ? "Hurray!"
                                    : "Hard Luck, Don’t Give up yet",
                                style: GoogleFonts.gothicA1(
                                    letterSpacing: 0.8,
                                    fontSize: kSixteenFont,
                                    color: skillsScore["percentage"] >= 50
                                        ? kScoregreen
                                        : korange,
                                    fontWeight: kFW700),
                              ),
                              SizedBox(height: 32.h),
                              Image.asset(
                                skillsScore["percentage"] >= 50
                                    ? 'assets/images/pass_image.png'
                                    : 'assets/images/women_with_earth.png',
                                width: 117.w,
                              ),
                              SizedBox(height: 24.h),
                              Text(
                                // "14%",
                                "${skillsScore["percentage"].toString()} %",
                                //     skillsScore["percentage"].toString(),
                                maxLines: 1,
                                style: GoogleFonts.gothicA1(
                                    letterSpacing: 1.6,
                                    fontSize: 32.sp,
                                    color: Gold,
                                    fontWeight: kFW800),
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     SizedBox(
                              //       width: 45.w,
                              //       child:
                              //     ),
                              //     Text(
                              //       "%",
                              //       maxLines: 1,
                              //       style: GoogleFonts.gothicA1(
                              //           letterSpacing: 1.6,
                              //           fontSize: 32.sp,
                              //           color: Gold,
                              //           fontWeight: kFW800),
                              //     ),
                              //   ],
                              // ),
                              SizedBox(height: 4.h),
                              Text(
                                "You got in the assessment",
                                style: GoogleFonts.gothicA1(
                                    letterSpacing: 0.65,
                                    fontSize: 13.sp,
                                    color: whitetwo,
                                    fontWeight: kFW700),
                              ),
                              SizedBox(height: 24.h),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(KViewSkillAnswers,
                                      arguments: Get.arguments);
                                },
                                child: GlassmorphicContainer(
                                  margin: EdgeInsets.only(bottom: 15.h),
                                  height: 67.h,
                                  // height: 180.h,
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
                                          padding: EdgeInsets.all(10.w),
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
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "View test Answers",
                                                    style: GoogleFonts.gothicA1(
                                                        fontSize: 11.sp,
                                                        letterSpacing: 0.55,
                                                        color: Gold,
                                                        fontWeight: kFW700),
                                                  ),
                                                  SizedBox(height: 5.h),
                                                  Text(
                                                    "Lorem Epson is a dummy text ...",
                                                    style: GoogleFonts.gothicA1(
                                                        fontSize: 13.sp,
                                                        letterSpacing: 0.65,
                                                        color: whitetwo,
                                                        fontWeight: kFW700),
                                                  ),
                                                ],
                                              ),
                                              Icon(
                                                Icons.arrow_forward,
                                                size: 24.sp,
                                                color: Gold,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.info_outline,
                                      size: 22.sp, color: Gold),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                  SizedBox(
                                    width: 290.w,
                                    child: Text(
                                      "Learn/Improve your Skills and assessing them to give yourself a chance to be different from the others and improves....",
                                      maxLines: 5,
                                      style: GoogleFonts.gothicA1(
                                          letterSpacing: 0.65,
                                          fontSize: 13.sp,
                                          color: whitetwo,
                                          fontWeight: kFW700),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30.h),
                              CustomButton(
                                label: " Yes, Publish on Profile",
                                isLoading: true,
                                onTap: () {
                                  publishHandler();
                                },
                                // onTap: () {
                                //   if (_formKey.currentState!.validate()) {}
                                //   ;
                                //   // Get.toNamed(KAchievedDetails);
                                // },
                              ),
                              SizedBox(height: 10.h),
                              CustomDarkButton(
                                label: "No",
                                isLoading: true,
                                onTap: () {
                                  Get.toNamed(kDashboard);
                                },
                                // onTap: () {
                                //   if (_formKey.currentState!.validate()) {}
                                //   ;
                                //   // Get.toNamed(KAchievedDetails);
                                // },
                              ),
                              SizedBox(height: 30.h),
                            ],
                          )
                        : Center(
                            child: CircularProgressIndicator(
                              color: Gold,
                            ),
                          ),
                  ),
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

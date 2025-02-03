import 'dart:ui';

import '../../utils/export_file.dart';

class TakeExercise extends StatefulWidget {
  const TakeExercise({super.key});

  @override
  State<TakeExercise> createState() => _TakeExerciseState();
}

class _TakeExerciseState extends State<TakeExercise> {
  String selectedgender = "";
  String selectedlevel = "";
  final Uri _url = Uri.parse('https://bossjobs.co.in/dev/lessondownload/219');

  var id = Get.arguments;
  Map takeExercise = {};
  bool isLoading = false;
  Future jobHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.gettakeexercise(id);
    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      takeExercise = data["data"]["data"];
    }
    setState(() {
      isLoading = false;
    });
  }

  List<String> data = ["Mathew", "Deon", "Sara", "Yeu"];
  List<String> userChecked = [];
  @override
  void initState() {
    super.initState();
    jobHandler();
  }

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   extendBodyBehindAppBar: true,
        //   backgroundColor: kBackground,
        //   appBar: AppBar(
          //iconTheme: const IconThemeData(color: white),
        //     automaticallyImplyLeading: true,
        //     backgroundColor: Colors.transparent,
        //     elevation: 0,
        //   ),
        //   body: Stack(
        //     children: [
        //       const Background(),
        //       Container(
        //         margin: EdgeInsets.only(
        //             top: 80.h, left: 15.w, right: 15.w, bottom: 15.w),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Padding(
        //               padding:
        //                   EdgeInsets.only(left: 25.w, right: 25.w, bottom: 40.h),
        //               child: Image.asset(
        //                 'assets/images/levelup bulb.png',
        //               ),
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 AnimatedProgressBar(
        //                     height: 5.h,
        //                     width: 280.w,
        //                     value: 40 / 100,
        //                     duration: Duration(seconds: 1),
        //                     gradient: const LinearGradient(
        //                       colors: [Gold, white],
        //                     ),
        //                     backgroundColor: white),
        //                 SizedBox(height: 5.h),
        //                 Image.asset(
        //                   'assets/images/cup.png',
        //                   width: 24.w,
        //                 ),
        //               ],
        //             ),
        //             SizedBox(
        //               height: 4.h,
        //             ),
        //             Text(
        //               "Your Progress",
        //               style: GoogleFonts.gothicA1(
        //                   fontSize: kTwelveFont, color: white, fontWeight: kFW800),
        //             ),
        //             SizedBox(
        //               height: 40.h,
        //             ),
        //             Row(
        //               children: [
        //                 Icon(Icons.info_outline, size: 24.sp, color: customgrey),
        //                 SizedBox(width: 8.w),
        //                 Text(
        //                   "Please select the hardness level to start the Quiz",
        //                   style: GoogleFonts.gothicA1(
        //                       fontSize: kTwelveFont,
        //                       color: customgrey,
        //                       fontWeight: kFW500),
        //                 ),
        //               ],
        //             ),
        //             SizedBox(
        //               height: 12.h,
        //             ),
        //             Row(
        //               children: [
        //                 selectedlevel == "Basic"
        //                     ? GlassmorphicContainer(
        //                         // height: 210.h,
        //                         height: 39.h,
        //                         width: 96.w,
        //                         borderRadius: 10.r,
        //                         blur: 15,
        //                         alignment: Alignment.center,
        //                         border: 2,
        //                         linearGradient: LinearGradient(
        //                           colors: [
        //                             white.withOpacity(0.15),
        //                             white.withOpacity(0.15),
        //                           ],
        //                         ),
        //                         borderGradient: LinearGradient(
        //                           colors: [
        //                             kBackground,
        //                             //  white.withOpacity(0.5),
        //                             Gold.withOpacity(0.01)
        //                           ],
        //                         ),
        //                         child: Container(
        //                           decoration: BoxDecoration(
        //                             boxShadow: [
        //                               BoxShadow(
        //                                 blurRadius: 20,
        //                                 spreadRadius: 10.r,
        //                                 color: Colors.black.withOpacity(0.1),
        //                               )
        //                             ],
        //                           ),
        //                           child: ClipRRect(
        //                             borderRadius: BorderRadius.circular(10.r),
        //                             child: BackdropFilter(
        //                               filter: ImageFilter.blur(
        //                                 sigmaX: 10.0,
        //                                 sigmaY: 10.0,
        //                               ),
        //                               child: Container(
        //                                 width: double.infinity,
        //                                 padding: EdgeInsets.only(
        //                                     left: 15.w, right: 15.w),
        //                                 //  padding: EdgeInsets.all(15.r),
        //                                 decoration: BoxDecoration(
        //                                   border: const GradientBoxBorder(
        //                                     gradient: LinearGradient(
        //                                         begin: Alignment.topLeft,
        //                                         end: Alignment.bottomRight,
        //                                         colors: [
        //                                           kBackground,
        //                                           kBackground,
        //                                           kBackground,
        //                                           Gold
        //                                         ]),
        //                                     width: 0.5,
        //                                   ),
        //                                   borderRadius: BorderRadius.circular(10.r),
        //                                 ),
        //                                 child: Column(
        //                                   crossAxisAlignment:
        //                                       CrossAxisAlignment.center,
        //                                   mainAxisAlignment:
        //                                       MainAxisAlignment.center,
        //                                   children: [
        //                                     GestureDetector(
        //                                         onTap: () {
        //                                           setState(() {
        //                                             selectedlevel = "Basic";
        //                                           });
        //                                         },
        //                                         child: Text(
        //                                           "Basic",
        //                                           style: GoogleFonts.gothicA1(
        //                                             fontSize: kTwelveFont,
        //                                             color: Gold,
        //                                             fontWeight: kFW700,
        //                                           ),
        //                                         )),
        //                                     // SizedBox(
        //                                     //   height: 15.h,
        //                                     // ),

        //                                     // SizedBox(
        //                                     //   height: 15.h,
        //                                     // ),

        //                                     // SizedBox(height: 15.h),
        //                                   ],
        //                                 ),
        //                               ),
        //                             ),
        //                           ),
        //                         ),
        //                       )
        //                     : Container(
        //                         alignment: Alignment.center,
        //                         height: 39.h,
        //                         width: 96.w,
        //                         child: GestureDetector(
        //                           onTap: () {
        //                             setState(() {
        //                               selectedlevel = "Basic";
        //                             });
        //                           },
        //                           child: Text(
        //                             "Basic",
        //                             style: GoogleFonts.gothicA1(
        //                               fontSize: kFourteenFont,
        //                               color: whitetwo,
        //                               fontWeight: kFW500,
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                 selectedlevel == "Advanced"
        //                     ? GlassmorphicContainer(
        //                         // height: 210.h,
        //                         height: 39.h,
        //                         width: 96.w,
        //                         borderRadius: 10.r,
        //                         blur: 15,
        //                         alignment: Alignment.center,
        //                         border: 2,
        //                         linearGradient: LinearGradient(
        //                           colors: [
        //                             white.withOpacity(0.15),
        //                             white.withOpacity(0.15),
        //                           ],
        //                         ),
        //                         borderGradient: LinearGradient(
        //                           colors: [
        //                             kBackground,
        //                             //  white.withOpacity(0.5),
        //                             Gold.withOpacity(0.01)
        //                           ],
        //                         ),
        //                         child: Container(
        //                           decoration: BoxDecoration(
        //                             boxShadow: [
        //                               BoxShadow(
        //                                 blurRadius: 20,
        //                                 spreadRadius: 10.r,
        //                                 color: Colors.black.withOpacity(0.1),
        //                               )
        //                             ],
        //                           ),
        //                           child: ClipRRect(
        //                             borderRadius: BorderRadius.circular(10.r),
        //                             child: BackdropFilter(
        //                               filter: ImageFilter.blur(
        //                                 sigmaX: 10.0,
        //                                 sigmaY: 10.0,
        //                               ),
        //                               child: Container(
        //                                 width: double.infinity,
        //                                 padding: EdgeInsets.only(
        //                                     left: 15.w, right: 15.w),
        //                                 //  padding: EdgeInsets.all(15.r),
        //                                 decoration: BoxDecoration(
        //                                   border: const GradientBoxBorder(
        //                                     gradient: LinearGradient(
        //                                         begin: Alignment.topLeft,
        //                                         end: Alignment.bottomRight,
        //                                         colors: [
        //                                           kBackground,
        //                                           kBackground,
        //                                           kBackground,
        //                                           Gold
        //                                         ]),
        //                                     width: 0.5,
        //                                   ),
        //                                   borderRadius: BorderRadius.circular(10.r),
        //                                 ),
        //                                 child: Column(
        //                                   mainAxisAlignment:
        //                                       MainAxisAlignment.center,
        //                                   crossAxisAlignment:
        //                                       CrossAxisAlignment.center,
        //                                   children: [
        //                                     GestureDetector(
        //                                       onTap: () {
        //                                         setState(() {
        //                                           selectedlevel = "Advanced";
        //                                         });
        //                                       },
        //                                       child: Text(
        //                                         "Advanced",
        //                                         style: GoogleFonts.gothicA1(
        //                                           fontSize: kTwelveFont,
        //                                           color: Gold,
        //                                           fontWeight: kFW700,
        //                                         ),
        //                                       ),
        //                                     ),
        //                                     // SizedBox(
        //                                     //   height: 15.h,
        //                                     // ),

        //                                     // SizedBox(
        //                                     //   height: 15.h,
        //                                     // ),

        //                                     // SizedBox(height: 15.h),
        //                                   ],
        //                                 ),
        //                               ),
        //                             ),
        //                           ),
        //                         ),
        //                       )
        //                     : Container(
        //                         alignment: Alignment.center,
        //                         height: 39.h,
        //                         width: 96.w,
        //                         child: GestureDetector(
        //                           onTap: () {
        //                             setState(() {
        //                               selectedlevel = "Advanced";
        //                             });
        //                           },
        //                           child: Text(
        //                             "Advanced",
        //                             style: GoogleFonts.gothicA1(
        //                               fontSize: kFourteenFont,
        //                               color: whitetwo,
        //                               fontWeight: kFW500,
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //               ],
        //             ),
        //             SizedBox(height: 24.h),
        //             Row(
        //               children: [
        //                 Icon(
        //                   Icons.circle_rounded,
        //                   color: Gold,
        //                   size: 10.sp,
        //                 ),
        //                 SizedBox(
        //                   width: 16.sp,
        //                 ),
        //                 Text(
        //                   "This contains 5 Questions.",
        //                   style: GoogleFonts.gothicA1(
        //                     fontSize: kTwelveFont,
        //                     color: whitetwo,
        //                     fontWeight: kFW500,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             SizedBox(height: 10.h),
        //             Row(
        //               children: [
        //                 Icon(
        //                   Icons.circle_rounded,
        //                   color: Gold,
        //                   size: 10.sp,
        //                 ),
        //                 SizedBox(
        //                   width: 16.sp,
        //                 ),
        //                 Text(
        //                   "Minimum 3 write Answers required to clear the exam. ",
        //                   style: GoogleFonts.gothicA1(
        //                     fontSize: kTwelveFont,
        //                     color: whitetwo,
        //                     fontWeight: kFW500,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             SizedBox(height: 10.h),
        //             Row(
        //               children: [
        //                 Icon(
        //                   Icons.circle_rounded,
        //                   color: Gold,
        //                   size: 10.sp,
        //                 ),
        //                 SizedBox(
        //                   width: 16.sp,
        //                 ),
        //                 Text(
        //                   "You can Retake this Exercise after some time.",
        //                   style: GoogleFonts.gothicA1(
        //                     fontSize: kTwelveFont,
        //                     color: whitetwo,
        //                     fontWeight: kFW500,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //             SizedBox(height: 90.h),
        //             CustomButton(
        //               label: 'Start Quiz',
        //               isLoading: true,
        //               onTap: () {
        //                 Get.toNamed(KAssesment,
        //                     arguments: takeExercise["exercise_details"][0]
        //                         ["exercise_lessons"][0]

        //                     // takeExercise["exercise_details"]
        //                     //         [0]["exercise_lessons"]
        //                     //     [index]["id"],
        //                     //$.[]data.[]exercise_details.0.exercise_lessons.0.id
        //                     );
        //               },
        //               // onTap: () {
        //               //   if (_formKey.currentState!.validate()) {}
        //               //   ;
        //               //   // Get.toNamed(KAchievedDetails);
        //               // },
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // );

        /////////////////////////////////below is old code with dynamic data
        Scaffold(
            backgroundColor: kBackground,
            appBar: AppBar(
              backgroundColor: darktwo,
              elevation: 0,
              centerTitle: true,
              iconTheme: const IconThemeData(color: white),
              title: Text(
                'Take Exercise',
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
                      child: isLoading == false
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //  const exerciselessionVideos(),

                                SizedBox(
                                  height: 15.h,
                                ),
                                SizedBox(
                                  height: 210.h,
                                  child: ListView.builder(
                                      //  itemCount: BrowseCourse.length,
                                      //itemCount: 2,
                                      itemCount: 3,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: ((context, index) {
                                        return GlassmorphicContainer(
                                          margin: EdgeInsets.only(
                                              right: 18.w,
                                              top: 10.w,
                                              bottom: 10.h),
                                          height: 210.h,
                                          width: 330.w,
                                          borderRadius: 15,
                                          blur: 15,
                                          alignment: Alignment.center,
                                          border: 2,
                                          linearGradient: LinearGradient(
                                              colors: [
                                                white.withOpacity(0.15),
                                                white.withOpacity(0.15)
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight),
                                          borderGradient: LinearGradient(
                                              colors: [
                                                Colors.white.withOpacity(0.5),
                                                Gold.withOpacity(0.01)
                                              ]),
                                          child: Container(
                                            decoration:
                                                BoxDecoration(boxShadow: [
                                              BoxShadow(
                                                blurRadius: 20,
                                                spreadRadius: 16,
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                              )
                                            ]),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaX: 10.0,
                                                  sigmaY: 10.0,
                                                ),
                                                child: Container(
                                                    width: double.infinity,
                                                    height: 190.h,
                                                    padding:
                                                        EdgeInsets.all(10.r),
                                                    decoration: BoxDecoration(
                                                        border:
                                                            const GradientBoxBorder(
                                                          gradient:
                                                              LinearGradient(
                                                                  colors: [
                                                                Colors.white38,
                                                                Gold
                                                              ]),
                                                          width: 0.5,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    16.r)),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                            " This lesson does't have any videos, Please Download the Lesson files in Reading Materia",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts
                                                                .gothicA1(
                                                                    fontSize:
                                                                        kFourteenFont,
                                                                    color:
                                                                        white,
                                                                    fontWeight:
                                                                        kFW700)),
                                                        SizedBox(
                                                          height: 10.h,
                                                        ),
                                                        // SizedBox(
                                                        //     height: 40.h,
                                                        //     width: 110.w,
                                                        //     child: Ink(
                                                        //       decoration:
                                                        //           const BoxDecoration(
                                                        //         gradient:
                                                        //             LinearGradient(
                                                        //                 colors: [
                                                        //               white,
                                                        //               grey1
                                                        //             ]),
                                                        //         borderRadius:
                                                        //             BorderRadius.all(
                                                        //                 Radius.circular(
                                                        //                     80.0)),
                                                        //       ),
                                                        //       child: TextButton(
                                                        //         onPressed: _launchUrl,
                                                        //         style: ButtonStyle(
                                                        //             backgroundColor:
                                                        //                 const MaterialStatePropertyAll<
                                                        //                         Color>(
                                                        //                     grey),
                                                        //             shape: MaterialStateProperty.all<
                                                        //                     RoundedRectangleBorder>(
                                                        //                 RoundedRectangleBorder(
                                                        //                     borderRadius:
                                                        //                         BorderRadius.circular(10
                                                        //                             .r),
                                                        //                     side: const BorderSide(
                                                        //                         color:
                                                        //                             grey)))),
                                                        //         child: Text(
                                                        //           "Download",
                                                        //           style: GoogleFonts
                                                        //               .gothicA1(
                                                        //                   fontSize:
                                                        //                       kFourteenFont,
                                                        //                   color: white,
                                                        //                   fontWeight:
                                                        //                       kFW600),
                                                        //         ),
                                                        //       ),
                                                        //     ))
                                                      ],
                                                    )),
                                              ),
                                            ),
                                          ),
                                        );
                                      })),
                                ),
                                //const exercisecoursedetails(),
                                //  const coursedetails(),
                                SizedBox(height: 10.h),
                                // const gridOtherCourses(),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text(
                                  "Your Progress",
                                  style: GoogleFonts.gothicA1(
                                      fontSize: kFourteenFont,
                                      color: white,
                                      fontWeight: kFW700),
                                ),
                                SizedBox(height: 10.h),
                                LinearPercentIndicator(
                                  width: 330.w,
                                  lineHeight: 6.h,
                                  // percent: takeExercise["exercise_details"][0]["coach"]
                                  //     ["percentage"]??"",
                                  percent: 0.5,
                                  backgroundColor: Colors.grey,
                                  progressColor: Gold,
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  takeExercise["exercise_details"][0]
                                          ["title"] ??
                                      "",
                                  //  "Test Course_101",
                                  style: GoogleFonts.gothicA1(
                                      fontSize: kFourteenFont,
                                      color: white,
                                      fontWeight: kFW700),
                                ),
                                ListView.builder(

                                    //  itemCount: takeExercise["exercise_lessons"].length,
                                    itemCount: takeExercise["exercise_details"]
                                            [0]["exercise_lessons"]
                                        .length,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: ((context, index) {
                                      return GlassmorphicContainer(
                                        height: 40.h,
                                        margin: EdgeInsets.only(top: 10.h),
                                        width: double.infinity,
                                        borderRadius: 13.r,
                                        blur: 15,
                                        alignment: Alignment.center,
                                        border: 0.5,
                                        linearGradient: LinearGradient(
                                            colors: [
                                              white.withOpacity(0.1),
                                              white.withOpacity(0.01)
                                            ],
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
                                          // padding:
                                          //     EdgeInsets.only(bottom: 5.h, right: 5.w),
                                          width: double.infinity,
                                          decoration: BoxDecoration(boxShadow: [
                                            BoxShadow(
                                              blurRadius: 16,
                                              spreadRadius: 15,
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                            )
                                          ]),
                                          child: ListTile(
                                            horizontalTitleGap: 0,
                                            // contentPadding:
                                            //     EdgeInsets.only(right: 10.w),
                                            leading: SizedBox(
                                              width: 150.w,
                                              child: Text(
                                                  // takeExercise["exercise_details"][0]
                                                  //             ["exercise_lessons"][index]
                                                  //         .toString() +
                                                  //     takeExercise["exercise_details"][0]
                                                  //             ["exercise_lessons"][index]
                                                  //         ["lesson_name"],
                                                  " ${index.toString() + ". " + takeExercise["exercise_details"][0]["exercise_lessons"][index]["lesson_name"]}",
                                                  //  "Test Course_101kjjnjefasecklnew;ncernj",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.gothicA1(
                                                      fontSize: kSixteenFont,
                                                      color: white,
                                                      fontWeight: kFW500)),
                                            ),

                                            title: Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                  "${takeExercise["exercise_details"][0]["exercise_lessons"][index]["exercise_questions"].length.toString()} Ques   ",
                                                  //"Test Course_101",
                                                  //maxLines: 2,
                                                  style: GoogleFonts.gothicA1(
                                                      fontSize: kSixteenFont,
                                                      color: white,
                                                      fontWeight: kFW500)),
                                            ),
                                            trailing: GestureDetector(
                                              onTap: () {
                                                Get.toNamed(KAssesment,
                                                    arguments: takeExercise[
                                                            "exercise_details"][0]
                                                        [
                                                        "exercise_lessons"][index]

                                                    // takeExercise["exercise_details"]
                                                    //         [0]["exercise_lessons"]
                                                    //     [index]["id"],
                                                    //$.[]data.[]exercise_details.0.exercise_lessons.0.id
                                                    );
                                              },
                                              child: Text("Start  >",
                                                  //"Test Course_101",
                                                  //maxLines: 2,
                                                  style: GoogleFonts.gothicA1(
                                                      fontSize: kSixteenFont,
                                                      color: Gold,
                                                      fontWeight: kFW600)),
                                            ),
                                            //   leading: const SizedBox()
                                            //  Checkbox(
                                            //   checkColor: Gold,
                                            //   activeColor: white,
                                            //   value: userChecked.contains(
                                            //       takeExercise["exercise_details"][0]
                                            //               ["exercise_lessons"][index]
                                            //           ["lesson_name"]),
                                            //   onChanged: (val) {
                                            //     _onSelected(
                                            //         val!,
                                            //         takeExercise["exercise_details"]
                                            //                 [0]["exercise_lessons"]
                                            //             [index]["lesson_name"]);
                                            //   },
                                            // )
                                            //you can use checkboxlistTile too
                                          ),
                                          //  Row(
                                          //   mainAxisAlignment:
                                          //       MainAxisAlignment.spaceBetween,
                                          //   children: [
                                          //     Row(
                                          //       children: [
                                          //         Icon(Icons.check_box, color: white),
                                          //         SizedBox(
                                          //           width: 5.w,
                                          //         ),
                                          //         Text(
                                          //             takeExercise["exercise_details"]
                                          //                     [0]["exercise_lessons"]
                                          //                 [index]["lesson_name"],
                                          //             //"Test Course_101",
                                          //             //maxLines: 2,
                                          //             style: GoogleFonts.gothicA1(
                                          //                 fontSize: kSixteenFont,
                                          //                 color: white,
                                          //                 fontWeight: kFW500)),
                                          //       ],
                                          //     ),
                                          //     Text(
                                          //         "${takeExercise["exercise_details"][0]["exercise_lessons"][index]["exercise_questions"].length.toString()} Questions",
                                          //         //"Test Course_101",
                                          //         //maxLines: 2,
                                          //         style: GoogleFonts.gothicA1(
                                          //             fontSize: kSixteenFont,
                                          //             color: white,
                                          //             fontWeight: kFW500)),
                                          //   ],
                                          // )
                                        ),
                                      );
                                    })),
                                SizedBox(height: 10.h),

                                //  CandidateProgresses(),
                                SizedBox(
                                  height: 50.h,
                                ),
                              ],
                            )
                          : const Center(
                              child: CircularProgressIndicator(
                              color: Gold,
                            ))),
                ),
              ],
            ));
  }

  void _onSelected(bool selected, String dataName) {
    if (selected == true) {
      setState(() {
        userChecked.add(dataName);
      });
    } else {
      setState(() {
        userChecked.remove(dataName);
      });
    }
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}

import 'dart:ui';

import '../../utils/export_file.dart';

class ExerciseInfo extends StatefulWidget {
  const ExerciseInfo({super.key});

  @override
  State<ExerciseInfo> createState() => _ExerciseInfoState();
}

class _ExerciseInfoState extends State<ExerciseInfo> {
  var id = Get.arguments;
  Map individualexercise = {};
  Map individualexercisetwo = {};
  bool isLoading = false;
  Future exercisewishlistHandler(int id) async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.WhishlistedExercises(id);

    try {
      if (data["data"]["data"]["status"] == "1") {
        Fluttertoast.showToast(
          msg: data["data"]["data"]["message"],
        );
      } else {
        Fluttertoast.showToast(
          msg: data["data"]["data"]["message"],
        );
      }
      //  assementdetails = data["data"]["data"];
      // preparePayload();
    } catch (e) {
      Fluttertoast.showToast(msg: "Something Went Wrong");
    }

    //  print(data["data"][0]["data"]);
    setState(() {
      isLoading = false;
    });
  }

  Future exerciseHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.getindividualexercise(id);
    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      individualexercise = data["data"]["data"]["exercise_details"][0];
      individualexercisetwo = data["data"]["data"];
      print(data["data"]["data"]);
    }
    setState(() {
      isLoading = false;
    });
  }

  String moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return value;
    }
    return price;
  }

  @override
  void initState() {
    super.initState();
    exerciseHandler();
  }

  List<String> interests = [
    'Product Designer',
    'Visual Designer',
    'COD',
    'CID',
    'Software',
    'Full Stack Development',
    'Python',
  ];
  @override
  Widget build(BuildContext context) {
    return isLoading == false && individualexercisetwo.isNotEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                width: double.infinity,
                child: individualexercise["image"] == null
                    ? Image.asset(
                        'assets/images/default_image.png',
                        fit: BoxFit.fill,
                      )
                    : Image(
                        image: NetworkImage(
                          kExerciseURL + individualexercise["image"],
                        ),
                        errorBuilder: (c, o, s) => Image.asset(
                              'assets/images/default_image.png',
                              fit: BoxFit.fill,
                            )),
              ),
              // Stack(
              //   children: [

              //     Positioned(
              //       right: 20,
              //       bottom: 20,
              //       child: Image.asset(
              //         'assets/images/love.png',
              //         height: 18.h,
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                width: 200.w,
                child: Text(
                  //  "flutter",
                  individualexercise["title"] ?? "",
                  //   individualjob["job_details"]!["title"].toString(),
                  maxLines: 2,
                  style: GoogleFonts.gothicA1(
                      fontSize: kFourteenFont,
                      color: white,
                      fontWeight: kFW600),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                " ₹ ${moneyFormat(individualexercise["price"].toString())}",
                style: GoogleFonts.gothicA1(
                    fontSize: kFourteenFont, color: Gold, fontWeight: kFW700),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/timer.png',
                        height: 18.h,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "${individualexercise["time"].toString()} mins",
                        //   ,
                        //  "20 min",
                        style: GoogleFonts.gothicA1(
                          fontSize: 11.sp,
                          color: Gold,
                          fontWeight: kFW500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/person1.png',
                        height: 18.h,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "${individualexercise["candidates"].length.toString()} candidates",
                        //    "",
                        //   "06",
                        style: GoogleFonts.gothicA1(
                          fontSize: 11.sp,
                          color: whitetwo,
                          fontWeight: kFW500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/practise.png',
                        height: 18.h,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "${individualexercise["exercise_assignments"].length.toString()} assignments",

                        //    "06 Questions",
                        style: GoogleFonts.gothicA1(
                          fontSize: 11.sp,
                          color: whitetwo,
                          fontWeight: kFW500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              SizedBox(
                width: 150.w,
                child: Text(
                  individualexercise["subtitle"] ?? "",
                  maxLines: 2,
                  style: GoogleFonts.gothicA1(
                      fontSize: kFourteenFont,
                      color: white,
                      fontWeight: kFW400),
                ),
              ),
              SizedBox(height: 10.h),
              Wrap(
                children: [
                  for (int i = 0;
                      i < individualexercise["skill_masters"].length;
                      i++)
                    Container(
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
                        individualexercise["skill_masters"][i]["title"],
                        //  interests[i],
                        style: GoogleFonts.gothicA1(
                            fontSize: 11.sp,
                            color: darktwo,
                            fontWeight: kFW600),
                      ),
                    ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     SizedBox(
              //       width: 150.w,
              //       child: Text(
              //         individualexercise["subtitle"] ?? "",
              //         maxLines: 2,
              //         style: GoogleFonts.gothicA1(
              //             fontSize: 11.sp, color: white, fontWeight: kFW500),
              //       ),
              //     ),
              //     // SizedBox(width: 30.w),
              //     Text(
              //       "${individualexercise["time"].toString()}  mins",

              //       //     "",
              //       style: GoogleFonts.gothicA1(
              //           fontSize: 11.sp, color: white, fontWeight: kFW500),
              //     ),
              //     // SizedBox(width: 30.w),
              //     Text(
              //       "${individualexercisetwo["sales"].toString()}  sales",
              //       style: GoogleFonts.gothicA1(
              //           fontSize: 11.sp, color: white, fontWeight: kFW500),
              //     ),
              //   ],
              // ),
              // SizedBox(height: 20.h),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       width: 180.w,
              //       child: Text(
              //         "${individualexercisetwo["all_lessons_count"].toString()}  lessons",

              //         // "Hyderabad",
              //         // individualjob["individual_jobs"]!["company"]![
              //         //         "address"]
              //         //     .toString(),

              //         style: GoogleFonts.gothicA1(
              //             fontSize: kTwelveFont,
              //             color: white,
              //             fontWeight: kFW700),
              //       ),
              //     ),
              //     // Text(
              //     //   "Price  ${individualexercise["price"].toString()}",
              //     //   //  ,

              //     //   // "data",
              //     //   // '${individualjob["job_details"]?["min_sal"]}'
              //     //   //         ' - '
              //     //   //         '${individualjob["job_details"]?["max_sal"]}' ??
              //     //   //     "",
              //     //   style: GoogleFonts.gothicA1(
              //     //       fontSize: 15.sp, color: Gold, fontWeight: kFW900),
              //     // ),
              //   ],
              // ),

              // SizedBox(
              //   height: 40.h,
              // ),
              // Text("Exercise Description",
              //     style: GoogleFonts.gothicA1(
              //         fontSize: kSixteenFont,
              //         color: white,
              //         fontWeight: kFW700)),
              // SizedBox(
              //   height: 10.h,
              // ),
              // // GridView.builder(
              // //     shrinkWrap: true,
              // //     physics: const NeverScrollableScrollPhysics(),
              // //     itemCount: 4,
              // //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              // //         crossAxisCount: 2,
              // //         mainAxisSpacing: 2,
              // //         //childAspectRatio: (0.31 / 0.57)),
              // //         childAspectRatio: (1 / 0.25)),
              // //     itemBuilder: ((context, index) {
              // //       return Container(
              // //           margin: EdgeInsets.only(bottom: 5.h, right: 5.w),
              // //           width: double.infinity,
              // //           alignment: Alignment.center,
              // //           decoration: BoxDecoration(
              // //             borderRadius: BorderRadius.circular(20.r),
              // //             boxShadow: [
              // //               BoxShadow(
              // //                 blurRadius: 20,
              // //                 spreadRadius: 5,
              // //                 color: const Color.fromARGB(255, 13, 12, 12)
              // //                     .withOpacity(0.1),
              // //               )
              // //             ],
              // //             color: white,
              // //             //  gradient:LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors:[grey.withOpacity(0.5),grey1.withOpacity(0.5),Color.fromARGB(255, 58, 55, 55).withOpacity(0.1),
              // //             //  ])
              // //           ),
              // //           child: Text(
              // //             "data",
              // //             // individualjob["job_details"]!["job_type"]!["type"]
              // //             //     .toString(),
              // //             style: GoogleFonts.gothicA1(
              // //                 fontSize: 11.sp, color: darkGrey, fontWeight: kFW600),
              // //           ));
              // //     })),
              // SizedBox(height: 10.h),
              // Text(
              //   // "data",
              //   individualexercise["overview"] ?? "",

              //   //   individualjob["job_details"]!["summary"].toString(),

              //   style: GoogleFonts.gothicA1(
              //       fontSize: kFourteenFont, color: white, fontWeight: kFW400),
              // ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      exercisewishlistHandler(id);
                    },
                    child: GlassmorphicContainer(
                      height: 41.h,
                      width: 160.w,
                      borderRadius: 13.r,
                      blur: 15,
                      alignment: Alignment.center,
                      border: 0.5,
                      linearGradient: LinearGradient(colors: [
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.01)
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderGradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            white.withOpacity(0.5),
                            white.withOpacity(0.5),
                            Gold.withOpacity(0.5)
                          ]),
                      child: Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            blurRadius: 16,
                            spreadRadius: 16,
                            color: Colors.black.withOpacity(0.1),
                          )
                        ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 20.0,
                              sigmaY: 20.0,
                            ),
                            child: Text("Add to Wishlist",
                                //maxLines: 2,
                                style: GoogleFonts.gothicA1(
                                    fontSize: kFourteenFont,
                                    color: white,
                                    fontWeight: kFW500)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        KTakeExercises,
                        // KAssesment,
                        arguments: individualexercise["id"] ?? "",
                      );
                    },
                    child: GlassmorphicContainer(
                      height: 41.h,
                      width: 160.w,
                      borderRadius: 13.r,
                      blur: 15,
                      alignment: Alignment.center,
                      border: 0.5,
                      linearGradient: LinearGradient(colors: [
                        white.withOpacity(0.1),
                        white.withOpacity(0.01)
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderGradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            white.withOpacity(0.5),
                            white.withOpacity(0.5),
                            Gold.withOpacity(0.5)
                          ]),
                      child: Container(
                        height: 40.5.h,
                        width: 159.5.w,
                        // height: 41.h,
                        // width: 160.w,
                        //   borderRadius: 13.r,
                        // alignment: Alignment.center,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            blurRadius: 16,
                            spreadRadius: 15,
                            color: Colors.black.withOpacity(0.1),
                          )
                        ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 20.0,
                              sigmaY: 20.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.play_arrow, color: Gold),
                                SizedBox(width: 5.w),
                                Text(
                                    individualexercise["price"] > 0
                                        ? "Buy Now"
                                        : "Take Exercise",
                                    // "Retake Ex",
                                    //maxLines: 2,
                                    style: GoogleFonts.gothicA1(
                                        fontSize: kSixteenFont,
                                        color: white,
                                        fontWeight: kFW700)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Text(
                "More Exercises By This Author",
                style: GoogleFonts.gothicA1(
                    fontSize: kSixteenFont, color: white, fontWeight: kFW700),
              ),
              SizedBox(height: 15.h),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: individualexercisetwo.isNotEmpty
                      ? individualexercisetwo["more_exercises_by_this_author"]
                                  .length >
                              0
                          ? individualexercisetwo[
                                  "more_exercises_by_this_author"]
                              .length
                          : 0
                      : 0,
                  //$.[]data.[]relevant_exercise_details.length,

                  //  coursepackview["relavant_course_packs"].length,
                  //$.[]data.relavant_course_packs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                      childAspectRatio: (0.31 / 0.46)),
                  itemBuilder: ((context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 180,
                          width: double.infinity,
                          child: individualexercisetwo[
                                          "more_exercises_by_this_author"]
                                      [index]["image"] ==
                                  null
                              ? Image.asset(
                                  'assets/images/logo.png',
                                )
                              : Image(
                                  image: NetworkImage(
                                    kExerciseURL +
                                            individualexercisetwo[
                                                    "more_exercises_by_this_author"]
                                                [index]["image"] ??
                                        "",
                                  ),
                                  errorBuilder: (c, o, s) => Image.asset(
                                        'assets/images/logo.png',
                                      )
                                  // Center(
                                  //   child: Text(
                                  //     "Unable to Load Image",
                                  //     style: GoogleFonts.gothicA1(
                                  //       fontSize: kFourteenFont,
                                  //       color: white,
                                  //       fontWeight: kFW700,
                                  //     ),
                                  //   ),
                                  // ),
                                  ),
                        ),

                        // Container(
                        //   height: 170.h,
                        //   margin: EdgeInsets.only(right: 7.w),
                        //   decoration: BoxDecoration(
                        //       border: const GradientBoxBorder(
                        //         gradient: LinearGradient(
                        //             colors: [grey, Gold]),
                        //         width: 1,
                        //       ),
                        //       borderRadius:
                        //           BorderRadius.circular(15.r)),
                        //   child: Image(
                        //       image: NetworkImage(
                        //     kExerciseURL +
                        //             coursepackview[
                        //                     "relavant_course_packs"]
                        //                 [index]["image"] ??
                        //         "",
                        //   )),
                        // ),
                        SizedBox(
                          height: 4.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                individualexercisetwo[
                                            "more_exercises_by_this_author"]
                                        [index]["title"] ??
                                    "",
                                maxLines: 1,
                                style: GoogleFonts.gothicA1(
                                    fontSize: 15.sp,
                                    color: white,
                                    fontWeight: kFW700)),
                            Text(
                                individualexercisetwo[
                                            "more_exercises_by_this_author"]
                                        [index]["subtitle"] ??
                                    "",
                                maxLines: 1,
                                style: GoogleFonts.gothicA1(
                                    fontSize: kTwelveFont,
                                    color: white,
                                    fontWeight: kFW500)),
                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  '\u{20B9}${moneyFormat(individualexercisetwo["more_exercises_by_this_author"][index]["price"].toString())}',
                                  //   "₹ ${coursepackview["relavant_course_packs"][index]["price"].toString()}",
                                  //   "₹ ${}",

                                  // '\u{20B9}${individualcourseview["other_relavant_courses"][index]["price"]}',
                                  style: GoogleFonts.gothicA1(
                                      fontSize: kFourteenFont,
                                      color: Gold,
                                      fontWeight: kFW700),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  })),
              SizedBox(height: 15.h),
              Text(
                "Relevant exercise details",
                style: GoogleFonts.gothicA1(
                    fontSize: kSixteenFont, color: white, fontWeight: kFW700),
              ),
              SizedBox(height: 5.h),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      individualexercisetwo["relevant_exercise_details"] == null
                          ? 0
                          : individualexercisetwo["relevant_exercise_details"]
                              .length,
                  //$.[]data.[]relevant_exercise_details.length,

                  //  coursepackview["relavant_course_packs"].length,
                  //$.[]data.relavant_course_packs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                      childAspectRatio: (0.31 / 0.47)),
                  itemBuilder: ((context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 180,
                          width: double.infinity,
                          child:
                              individualexercisetwo["relevant_exercise_details"]
                                          [index]["image"] ==
                                      null
                                  ? Image.asset(
                                      'assets/images/logo.png',
                                    )
                                  : Image(
                                      image: NetworkImage(
                                        kExerciseURL +
                                                individualexercisetwo[
                                                        "relevant_exercise_details"]
                                                    [index]["image"] ??
                                            "",
                                      ),
                                      errorBuilder: (c, o, s) => Image.asset(
                                            'assets/images/logo.png',
                                          )
                                      //  Center(
                                      //       child: Text(
                                      //         "Unable to Load Image",
                                      //         style: GoogleFonts.gothicA1(
                                      //           fontSize: kFourteenFont,
                                      //           color: white,
                                      //           fontWeight: kFW700,
                                      //         ),
                                      //       ),
                                      //     )
                                      ),
                        ),

                        // Container(
                        //   height: 170.h,
                        //   margin: EdgeInsets.only(right: 7.w),
                        //   decoration: BoxDecoration(
                        //       border: const GradientBoxBorder(
                        //         gradient: LinearGradient(
                        //             colors: [grey, Gold]),
                        //         width: 1,
                        //       ),
                        //       borderRadius:
                        //           BorderRadius.circular(15.r)),
                        //   child: Image(
                        //       image: NetworkImage(
                        //     kExerciseURL +
                        //             coursepackview[
                        //                     "relavant_course_packs"]
                        //                 [index]["image"] ??
                        //         "",
                        //   )),
                        // ),
                        SizedBox(
                          height: 4.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                individualexercisetwo[
                                            "relevant_exercise_details"][index]
                                        ["title"] ??
                                    "",
                                maxLines: 1,
                                style: GoogleFonts.gothicA1(
                                    fontSize: 15.sp,
                                    color: white,
                                    fontWeight: kFW700)),
                            Text(
                                individualexercisetwo[
                                            "relevant_exercise_details"][index]
                                        ["subtitle"] ??
                                    "",
                                maxLines: 1,
                                style: GoogleFonts.gothicA1(
                                    fontSize: kTwelveFont,
                                    color: white,
                                    fontWeight: kFW500)),
                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  '\u{20B9}${moneyFormat(individualexercisetwo["relevant_exercise_details"][index]["price"].toString())}',
                                  // "₹ ${individualexercisetwo["relevant_exercise_details"][index]["price"].toString()}",

                                  // '\u{20B9}${individualcourseview["other_relavant_courses"][index]["price"]}',
                                  style: GoogleFonts.gothicA1(
                                      fontSize: kFourteenFont,
                                      color: Gold,
                                      fontWeight: kFW700),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  }))
            ],
          )
        : Center(
            child: CircularProgressIndicator(
            color: Gold,
          ));
  }
}

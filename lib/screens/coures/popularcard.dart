import 'dart:ui';

import '../../utils/export_file.dart';

class CardPopular extends StatefulWidget {
  const CardPopular({super.key});

  @override
  State<CardPopular> createState() => _CardPopularState();
}

class _CardPopularState extends State<CardPopular> {
  var id = Get.arguments;
  Map individualcourseview = {};
  // Map individualexercisetwo = {};
  bool isLoading = false;
  Future courseviewhandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.individualcoursebyId(id);
    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      individualcourseview = data["data"]["data"];
      //  individualexercisetwo = data["data"]["data"];
      print(data["data"]["data"]);
    }
    setState(() {
      isLoading = false;
    });
  }
  // var id = Get.arguments;
  // Map individualcourse = {};
  // bool isLoading = false;
  // Future jobHandler() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   Map data = await Services.getPreviewCourse();
  //   if (data["message"] != null) {
  //     Fluttertoast.showToast(
  //       msg: data["message"],
  //     );
  //   } else {
  //     individualcourse = data["data"]["data"];
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  ////////////////////////////////////////////////////
  //List AllCourses = [];

  // bool isLoading = false;
  // Future AllCoursesListHandler() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   Map data = await Services.getPreviewCourse();
  //   if (data["message"] != null) {
  //     Fluttertoast.showToast(
  //       msg: data["message"],
  //     );
  //   } else {
  //     AllCourses = data["data"]["data"]["primary_courses"][0];
  //     //coaches = data["data"]["data"];
  //   }
  //   print(data["data"]["data"]);
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  void initState() {
    super.initState();

    courseviewhandler();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    child: Image(
                      image: NetworkImage(
                        kCourseURL +
                                individualcourseview["course_details"][0]
                                    ["course_banner"] ??
                            "",
                      ),
                      errorBuilder: (c, o, s) => Center(
                        child: Text(
                          "Unable to Load Image",
                          style: GoogleFonts.gothicA1(
                            fontSize: kFourteenFont,
                            color: white,
                            fontWeight: kFW700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //     top: 50.h,
                  //     left: 125.h,
                  //     child: Image.asset(
                  //       'assets/images/played 1.png',
                  //       height: 35.h,
                  //       color: Colors.black,
                  //     )),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      // "data",
                      individualcourseview["course_details"][0]["title"] ?? "",
                      maxLines: 2,
                      style: GoogleFonts.gothicA1(
                          fontSize: kEighteenFont,
                          color: white,
                          fontWeight: kFW700),
                    ),
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 18.h,
                    unratedColor: white,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Gold,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    //  "20",

                    '\u{20B9}${individualcourseview["course_details"][0]["price"].toString()}',
                    style: GoogleFonts.gothicA1(
                        fontSize: kEighteenFont,
                        color: Gold,
                        fontWeight: kFW700),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    // "20",
                    '\u{20B9}${0}',
                    style: GoogleFonts.gothicA1(
                        decoration: TextDecoration.lineThrough,
                        fontSize: kTwelveFont,
                        color: white,
                        fontWeight: kFW700),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Text(
                // "20",
                // individualcourseview[0]?["sub_title"] ?? "",
                individualcourseview["course_details"][0]["sub_title"] ?? "",
                style: GoogleFonts.gothicA1(
                    fontSize: kSixteenFont, color: white, fontWeight: kFW600),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Introduction",
                // individualcourseview[0]?["sub_title"] ?? "",
                // individualcourseview["course_details"][0]["sub_title"] ?? "",
                style: GoogleFonts.gothicA1(
                    fontSize: kSixteenFont, color: white, fontWeight: kFW700),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                // "Introduction",
                // individualcourseview[0]?["sub_title"] ?? "",
                individualcourseview["course_details"][0]["description"] ?? "",
                style: GoogleFonts.gothicA1(
                    fontSize: kFourteenFont, color: white, fontWeight: kFW400),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "More Information",
                // individualcourseview[0]?["sub_title"] ?? "",
                // individualcourseview["course_details"][0]["sub_title"] ?? "",
                style: GoogleFonts.gothicA1(
                    fontSize: kSixteenFont, color: white, fontWeight: kFW700),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                // "Introduction",
                // individualcourseview[0]?["sub_title"] ?? "",
                individualcourseview["course_details"][0]["more_inforamtion"] ??
                    "",
                style: GoogleFonts.gothicA1(
                    fontSize: kFourteenFont, color: white, fontWeight: kFW400),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "You will learn",
                // individualcourseview[0]?["sub_title"] ?? "",
                // individualcourseview["course_details"][0]["sub_title"] ?? "",
                style: GoogleFonts.gothicA1(
                    fontSize: kSixteenFont, color: white, fontWeight: kFW700),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                // "Introduction",
                // individualcourseview[0]?["sub_title"] ?? "",
                individualcourseview["course_details"][0]["course_learn_points"]
                        [0]["points_to_learn"] ??
                    "",
                style: GoogleFonts.gothicA1(
                    fontSize: kFourteenFont, color: white, fontWeight: kFW400),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Course Content",
                style: GoogleFonts.gothicA1(
                    fontSize: kSixteenFont, color: white, fontWeight: kFW700),
              ),
              ListView.builder(
                  itemCount: individualcourseview["course_details"][0]
                          ["course_modules"]
                      .length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: ((context, index) {
                    return isLoading == false
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                "${index + 1}${" "}${individualcourseview["course_details"][0]["course_modules"][index]["title"] ?? ""}",
                                style: GoogleFonts.gothicA1(
                                    fontSize: kSixteenFont,
                                    color: white,
                                    fontWeight: kFW700),
                              ),
                              ListView.builder(
                                  itemCount:
                                      individualcourseview["course_details"][0]
                                                  ["course_modules"][index]
                                              ["lessons"]
                                          .length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: ((context, i) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10.h),
                                        Text(
                                          individualcourseview["course_details"]
                                                          [0]["course_modules"]
                                                      [index]["lessons"][i]
                                                  ["title"] ??
                                              "",
                                          style: GoogleFonts.gothicA1(
                                              fontSize: 15.sp,
                                              color: white,
                                              fontWeight: kFW600),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "${individualcourseview["course_details"][0]["course_modules"][index]["lessons"][i]["lesson_assignments"].length.toString()} Assignments",
                                              style: GoogleFonts.gothicA1(
                                                  fontSize: kFourteenFont,
                                                  color: white,
                                                  fontWeight: kFW400),
                                            ),
                                            Text(
                                              "  ${individualcourseview["course_details"][0]["course_modules"][index]["lessons"][i]["course_exercise"].length.toString()} Exercises",
                                              style: GoogleFonts.gothicA1(
                                                  fontSize: kFourteenFont,
                                                  color: white,
                                                  fontWeight: kFW400),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  })),
                            ],
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                            color: Gold,
                          ));
                  })),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Authors",
                // individualcourseview[0]?["sub_title"] ?? "",
                // individualcourseview["course_details"][0]["sub_title"] ?? "",
                style: GoogleFonts.gothicA1(
                    fontSize: kSixteenFont, color: white, fontWeight: kFW700),
              ),
              SizedBox(
                height: 10.h,
              ),
              isLoading == false
                  ? SizedBox(
                      height: 150.h,
                      child: ListView.builder(
                          // itemCount: SearchMentor.length,
                          // itemCount: individualcourseview["course_details"]
                          //         ["coaches"]["user"]["name"]

                          //     .length,
                          //  itemCount: 7,
                          // itemCount: individualcourseview["course_details"][0]
                          //         ["coaches"]["user"]["name"]
                          //     .length,
                          itemCount: individualcourseview["course_details"][0]
                                  ["coaches"]
                              .length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            return Wrap(
                              children: [
                                GlassmorphicContainer(
                                  margin: EdgeInsets.only(right: 15.w),
                                  height: 140.h,
                                  width: 120.w,
                                  borderRadius: 13.r,
                                  blur: 15,
                                  alignment: Alignment.center,
                                  border: 2,
                                  linearGradient: LinearGradient(
                                      colors: [
                                        white.withOpacity(0.1),
                                        white.withOpacity(0.01)
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                  borderGradient: LinearGradient(
                                      colors: [white.withOpacity(0.5), Gold]),
                                  child: Container(
                                    margin: EdgeInsets.all(1.h),
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
                                        child: Container(
                                            //  margin: EdgeInsets.all(2.h),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                border: const GradientBoxBorder(
                                                  gradient:
                                                      LinearGradient(colors: [
                                                    Color.fromARGB(97, 7, 7, 7),
                                                    darkGrey
                                                  ]),
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16.r)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 20.h),
                                                  //alignment: Alignment.center,
                                                  child: CircleAvatar(
                                                      backgroundColor:
                                                          kBackground,
                                                      radius: 30.r,
                                                      child: Image.asset(
                                                          'assets/images/darkWoman.png',
                                                          height: 52.h)),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 10.h,
                                                      left: 10.w,
                                                      bottom: 7.h),
                                                  child: Row(
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            Colors.green,
                                                        radius: 5.r,
                                                      ),
                                                      SizedBox(width: 10.w),
                                                      SizedBox(
                                                        width: 70,

                                                        //  course_details.[]coaches.[]user.[]name
                                                        child: Text(
                                                          individualcourseview["course_details"]
                                                                              [
                                                                              0]
                                                                          [
                                                                          "coaches"]
                                                                      [index][
                                                                  "user"]["name"] ??
                                                              "",
                                                          maxLines: 1,
                                                          style: GoogleFonts
                                                              .gothicA1(
                                                                  fontSize:
                                                                      kFourteenFont,
                                                                  color: white,
                                                                  fontWeight:
                                                                      kFW600),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.toNamed(
                                                      KAuthorProfile,
                                                      arguments: individualcourseview[
                                                                      "course_details"]
                                                                  [0]["coaches"]
                                                              [index]["user_id"]
                                                          .toString(),
                                                    );
                                                    // Get.toNamed(KAuthorProfile,
                                                    //     arguments: individualcourseview[
                                                    //                     "course_details"][0]
                                                    //                 [
                                                    //                 "coaches"][index]
                                                    //             [
                                                    //             "user"]["id"] ??
                                                    //         "");
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 15.w),
                                                    child: Text(
                                                      individualcourseview[
                                                                      "course_details"]
                                                                  [0]["coaches"]
                                                              [index]["user_id"]
                                                          .toString(),
                                                      //  "Visit Profile",
                                                      style:
                                                          GoogleFonts.gothicA1(
                                                              fontSize: 11.sp,
                                                              color: white,
                                                              fontWeight:
                                                                  kFW500),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          })),
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                      color: Gold,
                    )),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GlassmorphicContainer(
                    height: 42.h,
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
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        KTakeCourse,
                        arguments: individualcourseview["course_details"][0]
                                ["id"] ??
                            "",
                      );
                    },
                    child: GlassmorphicContainer(
                      height: 42.h,
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
                            child: Text(" Take Course",
                                //maxLines: 2,
                                style: GoogleFonts.gothicA1(
                                    fontSize: kSixteenFont,
                                    color: white,
                                    fontWeight: kFW700)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Text(
                "Other Relevant Courses",
                // individualcourseview[0]?["sub_title"] ?? "",
                // individualcourseview["course_details"][0]["sub_title"] ?? "",
                style: GoogleFonts.gothicA1(
                    fontSize: kSixteenFont, color: white, fontWeight: kFW700),
              ),
              SizedBox(height: 15.h),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      individualcourseview["other_relavant_courses"].length,
                  // itemCount: 5,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                      childAspectRatio: (0.31 / 0.45)),
                  itemBuilder: ((context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 170.h,
                          margin: EdgeInsets.only(right: 7.w),
                          decoration: BoxDecoration(
                              border: const GradientBoxBorder(
                                gradient: LinearGradient(colors: [grey, Gold]),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15.r)),
                          child: Image(
                            image: NetworkImage(kCourseURL +
                                    individualcourseview[
                                            "other_relavant_courses"][index]
                                        ["course_banner"] ??
                                ""),
                            errorBuilder: (c, o, s) => Center(
                              child: Text(
                                "Unable to Load Image",
                                style: GoogleFonts.gothicA1(
                                  fontSize: kFourteenFont,
                                  color: white,
                                  fontWeight: kFW700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                individualcourseview["other_relavant_courses"]
                                    [index]["title"],
                                //'React Native',
                                maxLines: 1,
                                style: GoogleFonts.gothicA1(
                                    fontSize: 15.sp,
                                    color: white,
                                    fontWeight: kFW700)),
                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  '\u{20B9}${individualcourseview["other_relavant_courses"][index]["price"]}',
                                  style: GoogleFonts.gothicA1(
                                      fontSize: kFourteenFont,
                                      color: Gold,
                                      fontWeight: kFW700),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  individualcourseview["other_relavant_courses"]
                                      [index]["level"],
                                  //  '\u{20B9}${1699}',
                                  style: GoogleFonts.gothicA1(
                                      fontSize: kTwelveFont,
                                      color: white,
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
        : const Center(
            child: CircularProgressIndicator(
            color: Gold,
          ));
  }
}

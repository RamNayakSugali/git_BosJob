import 'dart:ui';

import '../../utils/export_file.dart';

class IndividualPack extends StatefulWidget {
  const IndividualPack({super.key});

  @override
  State<IndividualPack> createState() => _IndividualPackState();
}

class _IndividualPackState extends State<IndividualPack> {
  var id = Get.arguments;
  Map coursepackview = {};
  // Map individualexercisetwo = {};
  bool isLoading = false;

  Future coursepackswishlistHandler(int id) async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.coursespacksWhishlist(id);

    try {
      if (data["data"]["data"]["status"] == "1") {
        courseviewhandler();
        Fluttertoast.showToast(
          msg: data["data"]["data"]["message"],
        );
      } else {
        courseviewhandler();
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

  Future courseviewhandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.individualcoursepacksbyId(id);
    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      coursepackview = data["data"]["data"];
      //  individualexercisetwo = data["data"]["data"];
      print(data["data"]["data"]);
    }
    // favourated_or_not  // 1
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

    courseviewhandler();
  }

  List<String> interests = [
    'Product Designer',
    'Visual Designer',
    'COD',
    'CID',
    'Software',
    'Full Stack Development',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackground,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: white),
          title: Text(
            'View Course Pack',
            style: GoogleFonts.gothicA1(
                letterSpacing: 1,
                fontSize: 16.sp,
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
        body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(15.w),
              child: isLoading == false
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 180,
                              width: double.infinity,
                              child: coursepackview["course_pack"][0]
                                          ["image"] ==
                                      null
                                  ? Image.asset(
                                      'assets/images/default_image.png',
                                      fit: BoxFit.fill,
                                    )
                                  // Image.asset(
                                  //     'assets/images/no image.jpg',
                                  //   )
                                  : Image(
                                      image: NetworkImage(
                                        kExerciseURL +
                                                coursepackview["course_pack"][0]
                                                    ["image"] ??
                                            "",
                                      ),
                                      errorBuilder: (c, o, s) => Center(
                                          child: Image.asset(
                                        'assets/images/default_image.png',
                                        fit: BoxFit.fill,
                                        height: 320.h,
                                      )
                                          // Text(
                                          //   "Unable to Load Image",
                                          //   style: GoogleFonts.gothicA1(
                                          //     fontSize: kFourteenFont,
                                          //     color: white,
                                          //     fontWeight: kFW700,
                                          //   ),
                                          // ),
                                          ),
                                    ),
                            ),
                            Positioned(
                              bottom: 20,
                              left: 20,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    //   'assets/images/meter.png',
                                    coursepackview["course_pack"][0]["level"] ==
                                            "Beginner"
                                        ? "assets/images/meter.png"
                                        : coursepackview["course_pack"][0]
                                                    ["level"] ==
                                                "Intermediate"
                                            ? "assets/images/intermediat_meter.png"
                                            : "assets/images/advanced.png",
                                    height: 24.h,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    coursepackview["course_pack"][0]["level"],
                                    //   "Beginner",
                                    style: GoogleFonts.gothicA1(
                                      fontSize: kFourteenFont,
                                      color: coursepackview["course_pack"][0]
                                                  ["level"] ==
                                              "Beginner"
                                          ? Customgreen
                                          : coursepackview["course_pack"][0]
                                                      ["level"] ==
                                                  "Intermediate"
                                              ? klightOrange
                                              : kdarkred,
                                      // color: Customgreen,
                                      fontWeight: kFW700,
                                    ),
                                  ),
                                ],
                              ),
                            ),

/////////////////////////////////////////////
                            // Container(
                            //   height: 180,
                            //   width: double.infinity,
                            //   child: Image(
                            //       image: NetworkImage(
                            //     kCourseURL +
                            //             coursepackview["course_pack"][0]
                            //                 ["image"] ??
                            //         "",
                            //   )),
                            // ),
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
                                coursepackview["course_pack"][0]["title"] ?? "",
                                maxLines: 2,
                                style: GoogleFonts.gothicA1(
                                    fontSize: kEighteenFont,
                                    color: white,
                                    fontWeight: kFW700),
                              ),
                            ),
                            coursepackview["course_pack"][0]
                                        ["tot_rating_sum"] ==
                                    null
                                ? RatingBar.builder(
                                    initialRating: 0,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 16,
                                    unratedColor: white,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 10,
                                    ),
                                    onRatingUpdate: (rating) {},
                                  )
                                : RatingBar.builder(
                                    initialRating: double.parse(
                                        coursepackview["course_pack"][0]
                                            ["tot_rating_sum"]),
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 20,
                                    unratedColor: white,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 10,
                                    ),
                                    onRatingUpdate: (rating) {},
                                  ),
                            // RatingBar.builder(
                            //   initialRating: 3,
                            //   minRating: 1,
                            //   direction: Axis.horizontal,
                            //   allowHalfRating: true,
                            //   itemCount: 5,
                            //   itemSize: 18.h,
                            //   unratedColor: white,
                            //   itemPadding:
                            //       const EdgeInsets.symmetric(horizontal: 0.5),
                            //   itemBuilder: (context, _) => const Icon(
                            //     Icons.star,
                            //     color: Gold,
                            //   ),
                            //   onRatingUpdate: (rating) {},
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              // "20",
//coursepackview["course_pack"][0]
                              //                                           ["image"] ??
                              //'\u{20B9}${coursepackview["course_pack"][0]["price"].toString()}',
                              '\u{20B9}${moneyFormat(coursepackview["course_pack"][0]["price"].toString())}',
                              style: GoogleFonts.gothicA1(
                                  fontSize: kEighteenFont,
                                  color: Gold,
                                  fontWeight: kFW700),
                            ),
                            Text(
                              coursepackview["course_pack"][0]
                                          ["tot_rating_sum"] ==
                                      null
                                  ? "0/5"
                                  : "${coursepackview["course_pack"][0]["tot_rating_sum"].toString()}/5",
                              //  "4.5/5 (200)",
                              style: GoogleFonts.gothicA1(
                                  fontSize: kTwelveFont,
                                  color: customgrey,
                                  fontWeight: kFW700),
                            ),
                            // Text(
                            //   coursepackview["course_pack"][0]
                            //           ["course_type_master"]["title"] ??
                            //       "",
                            //   //   $.[]data.course_pack.[]course_type_master.title
                            //   //   '\u{20B9}${0}',
                            //   style: GoogleFonts.gothicA1(
                            //       fontSize: kTwelveFont,
                            //       color: white,
                            //       fontWeight: kFW700),
                            // ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          coursepackview["course_pack"][0]["course_type_master"]
                                  ["title"] ??
                              "",
                          style: GoogleFonts.gothicA1(
                              fontSize: kTwelveFont,
                              color: customgrey,
                              fontWeight: kFW700),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/Frame.png',
                                  height: 18.h,
                                  color: whitetwo,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  "Jobs - ${coursepackview["course_pack"][0]["job_count"] ?? ""}",

                                  //  "Jobs - 06",
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
                                  "Lessons - ${coursepackview["course_pack"][0]["tot_lessons"] ?? ""}",

                                  // "10 Lessons",
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
                                  'assets/images/person1.png',
                                  height: 18.h,
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  "Candidates - ${coursepackview["course_pack"][0]["tot_candidates"] ?? ""}",
                                  //      "Seats - ${coursepackview["total_seats"] ?? ""}",
                                  //  ""
                                  //  "Author - 06",
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
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          // "20",

                          coursepackview["course_pack"][0]["subtitle"] ?? "",
                          style: GoogleFonts.gothicA1(
                              fontSize: kFourteenFont,
                              color: white,
                              fontWeight: kFW400),
                        ),
                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        // Text(
                        //   "Introduction",
                        //   style: GoogleFonts.gothicA1(
                        //       fontSize: kSixteenFont,
                        //       color: white,
                        //       fontWeight: kFW700),
                        // ),
                        // SizedBox(
                        //   height: 10.h,
                        // ),
                        // Text(
                        //   // "Introduction",
                        //   coursepackview["course_pack"][0]["overview"] ?? "",

                        //   style: GoogleFonts.gothicA1(
                        //       fontSize: kFourteenFont,
                        //       color: white,
                        //       fontWeight: kFW400),
                        // ),
                        // SizedBox(
                        //   height: 15.h,
                        // ),
                        // SizedBox(
                        //   height: 15.h,
                        // ),
                        // Text(
                        //   "Course Content",
                        //   style: GoogleFonts.gothicA1(
                        //       fontSize: kSixteenFont,
                        //       color: white,
                        //       fontWeight: kFW700),
                        // ),
                        // ListView.builder(
                        //     itemCount: coursepackview["course_pack"][0]
                        //             ["courses"]
                        //         .length,
                        //     //  $.[]data.course_pack.[]courses.length,
                        //     // itemCount: 2,
                        //     // itemCount:
                        //     //     individualcourseview["course_details"][0]
                        //     //                 ["course_modules"][index]
                        //     //             ["lessons"]
                        //     //         .length,
                        //     shrinkWrap: true,
                        //     physics: NeverScrollableScrollPhysics(),
                        //     itemBuilder: ((context, i) {
                        //       return Column(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           SizedBox(height: 10.h),
                        //           Text(
                        //             coursepackview["course_pack"][0]["courses"]
                        //                     [i]["title"] ??
                        //                 "",
                        //             //  "acds",
                        //             //[]title
                        //             // individualcourseview["course_details"]
                        //             //                 [0]["course_modules"]
                        //             //             [index]["lessons"][i]
                        //             //         ["title"] ??
                        //             //     "",
                        //             style: GoogleFonts.gothicA1(
                        //                 fontSize: kEighteenFont,
                        //                 color: white,
                        //                 fontWeight: kFW700),
                        //           ),
                        //           SizedBox(
                        //             height: 15.h,
                        //           ),
                        //           SizedBox(
                        //             width: 350.w,
                        //             child: Text(
                        //               coursepackview["course_pack"][0]
                        //                       ["courses"][i]["sub_title"] ??
                        //                   "",
                        //               //   "${individualcourseview["course_details"][0]["course_modules"][index]["lessons"][i]["lesson_assignments"].length.toString()} Assignments",
                        //               style: GoogleFonts.gothicA1(
                        //                   fontSize: kSixteenFont,
                        //                   color: white,
                        //                   fontWeight: kFW500),
                        //             ),
                        //           ),
                        //           SizedBox(
                        //             height: 15.h,
                        //           ),
                        //           SizedBox(
                        //             width: 350.w,
                        //             child: Text(
                        //               parse(coursepackview["course_pack"][0]
                        //                               ["courses"][i]
                        //                           ["description"] ??
                        //                       "")
                        //                   .body!
                        //                   .text,

                        //               //   "${individualcourseview["course_details"][0]["course_modules"][index]["lessons"][i]["lesson_assignments"].length.toString()} Assignments",
                        //               style: GoogleFonts.gothicA1(
                        //                   fontSize: kFourteenFont,
                        //                   color: white,
                        //                   fontWeight: kFW400),
                        //             ),
                        //           ),
                        //           SizedBox(
                        //             height: 15.h,
                        //           ),
                        //         ],
                        //       );
                        //     })),
                        SizedBox(
                          height: 10.h,
                        ),

                        coursepackview["course_pack"][0]["courses"].length >= 1
                            ? 
                            Wrap(
                                children: [
                                  for (int i = 0;
                                      //  i < interests.length;
                                      i <
                                          coursepackview["course_pack"][0]
                                                      ["courses"][0]
                                                  ["skill_masters"]
                                              .length;
                                      i++)
                                    Container(
                                      margin: EdgeInsets.only(
                                        right: 10.w,
                                        top: 10.h,
                                      ),
                                      padding: EdgeInsets.only(
                                          left: 14.w,
                                          right: 14.w,
                                          top: 6.h,
                                          bottom: 6),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        color: customgrey,
                                      ),
                                      child: Text(
                                        coursepackview["course_pack"][0]
                                                ["courses"][0]["skill_masters"]
                                            [i]["title"],
                                        //  interests[i],
                                        style: GoogleFonts.gothicA1(
                                            fontSize: 11.sp,
                                            color: darktwo,
                                            fontWeight: kFW600),
                                      ),
                                    ),
                                ],
                              )
                            : SizedBox(),
                        SizedBox(
                          height: 40.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                coursepackswishlistHandler(id);
                              },
                              child: GlassmorphicContainer(
                                height: 42.h,
                                width: 160.w,
                                borderRadius: 13.r,
                                blur: 15,
                                alignment: Alignment.center,
                                border: 0.5,
                                linearGradient: LinearGradient(
                                    colors: [
                                      Colors.black.withOpacity(0.1),
                                      Colors.black.withOpacity(0.01)
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
                                      child: Text(
                                          coursepackview["course_pack"][0]
                                                      ["favourated_or_not"] ==
                                                  1
                                              ? "Already Added"
                                              : "Add to Wishlist",
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
                                // Get.toNamed(
                                //   KTakeCourse,
                                //   // arguments: individualcourseview["course_details"][0]
                                //   //         ["id"] ??
                                //   //     "",
                                // );
                              },
                              child: GlassmorphicContainer(
                                height: 42.h,
                                width: 160.w,
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
                                      child: Text(" Buy Now",
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
                          "Relavant course packs",
                          // individualcourseview[0]?["sub_title"] ?? "",
                          // individualcourseview["course_details"][0]["sub_title"] ?? "",
                          style: GoogleFonts.gothicA1(
                              fontSize: kSixteenFont,
                              color: white,
                              fontWeight: kFW700),
                        ),
                        SizedBox(height: 15.h),
                        GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            // itemCount:
                            //  individualcourseview["other_relavant_courses"].length,
                            //   itemCount: 5,
                            itemCount:
                                coursepackview["relavant_course_packs"].length,
                            //$.[]data.relavant_course_packs.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 2,
                                    childAspectRatio: (0.31 / 0.45)),
                            itemBuilder: ((context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    height: 180,
                                    width: double.infinity,
                                    child: coursepackview[
                                                    "relavant_course_packs"]
                                                [index]["image"] ==
                                            null
                                        ? Image.asset(
                                            'assets/images/logo.png',
                                          )
                                        : Image(
                                            image: NetworkImage(
                                              kExerciseURL +
                                                      coursepackview[
                                                              "relavant_course_packs"]
                                                          [index]["image"] ??
                                                  "",
                                            ),
                                            errorBuilder: (c, o, s) => Center(
                                                child: Image.asset(
                                              'assets/images/logo.png',
                                            )),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          coursepackview[
                                                  "relavant_course_packs"]
                                              [index]["title"],
                                          // individualcourseview["other_relavant_courses"]
                                          //     [index]["title"],
                                          //  'React Native',
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
                                            '\u{20B9}${moneyFormat(coursepackview["relavant_course_packs"][index]["price"].toString())}',
                                            //  "₹ ${coursepackview["relavant_course_packs"][index]["price"].toString()}",

                                            // "blhjj",
                                            // '\u{20B9}${individualcourseview["other_relavant_courses"][index]["price"]}',
                                            style: GoogleFonts.gothicA1(
                                                fontSize: kFourteenFont,
                                                color: Gold,
                                                fontWeight: kFW700),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Text(
                                            coursepackview[
                                                    "relavant_course_packs"]
                                                [index]["level"],
                                            // individualcourseview["other_relavant_courses"]
                                            //     [index]["level"],
                                            // "vkj j",
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
                    ))),
        ));
  }
}

import 'dart:ui';
// import 'package:bossjobs/screens/courses/course_view_tabs.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../utils/export_file.dart';
import 'moreCourceFromAuthor.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  ///////////////////////////////////////////////////////////EnrollCourse
  bool enrollLoading = false;
  Future enrollHandler() async {
    setState(() {
      enrollLoading = true;
    });
    Map payload = {
      "candidate_id": UserSimplePreferences.getCandidateId(),
      "enroll_for": "course",
      "entity_id": id,
      "schedule_id": null
    };
    // {
    //   "first_name": data.fristname,
    //   //"last_name": data.lastname,
    //   "email": data.email,
    //   "phone": data.mobile,
    //   "password": data.password,
    //   "cpassword": data.cpassword,
    //   "requirement": [
    //     {"id": 1, "value": "learner", "description": "Learner", "active": true},
    //   ],
    // };

    Map value = await Services.enrollCourse(payload);
    print(value);
    // if (value["message"] != null) {
    //   Fluttertoast.showToast(msg: value["message"]);
    // } else {
    //   await UserSimplePreferences.setLoginStatus(loginStatus: true);
    //   await UserSimplePreferences.setUserdata(
    //       userData: json.encode(value["user_details"]));
    //   await UserSimplePreferences.setToken(token: value["token"]);
    //   Get.toNamed(KLogin);
    // }

    if (value["data"]["message"] == "Course purchased successfully") {
      Fluttertoast.showToast(msg: value["data"]["message"]);
      courseviewhandler();
      print(value);
    } else {
      // await UserSimplePreferences.setToken(token: value["token"]);

      print(value);
    }

    setState(() {
      enrollLoading = false;
    });
  }

  ////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////
  List favouritedCourse = [];

  // List<int> wishlisted = <int>[];
  bool isLoading = false;
  var isCourseFav = 0;
  Future searchcourseHandler(individualcourseview) async {
    setState(() {
      isLoading = true;
    });
    Map payload = {
      "candidate_id": UserSimplePreferences.getCandidateId(),
      "listing_type": "favourate_courses",
    };

    var value = await Services.FavouritedCourse(payload);

    if (value["data"] == null) {
      Fluttertoast.showToast(msg: value["message"]);
    } else {
      favouritedCourse = value["data"];
      for (int i = 0; i < favouritedCourse.length; i++) {
        if (favouritedCourse[i]["id"] ==
            individualcourseview["course_details"][0]["id"]) {
          setState(() {
            isCourseFav = 1;
          });
        }
      }
    }
    print(isCourseFav);
    print(value["data"]);
    setState(() {
      isLoading = false;
    });
  }

  ////////////////////////////////
  bool courseWishisLoading = false;
  Future coursewishlistHandler(int id) async {
    setState(() {
      courseWishisLoading = true;
    });
    Map data = await Services.coursesWhishlist(id);

    try {
      if (data["data"]["data"]["status"] == "1") {
        Fluttertoast.showToast(
          msg: data["data"]["data"]["message"],
        );
        isCourseFav = 1;
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
      courseWishisLoading = false;
    });
  }

  var id = Get.arguments;
  Map individualcourseview = {};
  bool courcseisLoading = false;
  Future courseviewhandler() async {
    setState(() {
      courcseisLoading = true;
    });
    var payloadData = {
      "pg_type": "take",
      "course_id": id.toString(),
      "candidate_id": UserSimplePreferences.getCandidateId(),
    };
    Map data = await Services.getHomeTakecourseApis(payloadData);
    if (data["data"]["message"] != null) {
      Fluttertoast.showToast(
        msg: data["data"]["message"],
      );
    } else {
      individualcourseview = data["data"];
      searchcourseHandler(individualcourseview);
      //  individualexercisetwo = data["data"]["data"];
    }
    setState(() {
      courcseisLoading = false;
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
  String moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return value;
    }
    return price;
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
  void initState() {
    super.initState();
    courseviewhandler();
  }

  @override
  Widget build(BuildContext context) {
    return courcseisLoading == false
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    child: individualcourseview["course_details"][0]
                                ["course_banner"] ==
                            null
                        ? Image.asset(
                            'assets/images/default_image.png',
                            fit: BoxFit.fill,
                          )
                        : Image(
                            image: NetworkImage(kCourseURL +
                                individualcourseview["course_details"][0]
                                    ["course_banner"]),
                            errorBuilder: (c, o, s) => Image.asset(
                                  'assets/images/default_image.png',
                                  fit: BoxFit.fill,
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
                  Positioned(
                      bottom: 8,
                      left: 8,
                      child: SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              individualcourseview["course_details"][0]
                                          ["level"] ==
                                      "Beginner"
                                  ? "assets/images/meter.png"
                                  : individualcourseview["course_details"][0]
                                              ["level"] ==
                                          "Intermediate"
                                      ? "assets/images/intermediat_meter.png"
                                      : "assets/images/advanced.png",

                              // individualcourseview["course_details"][0]
                              //             ["level"] ==
                              //         "Beginner"
                              //     ? 'assets/images/meter.png'
                              //     : 'assets/images/advanced.png',
                              height: 24.h,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              individualcourseview["course_details"][0]
                                      ["level"] ??
                                  "",
                              // "Beginner",
                              style: GoogleFonts.gothicA1(
                                fontSize: kFourteenFont,
                                color: individualcourseview["course_details"][0]
                                            ["level"] ==
                                        "Beginner"
                                    ? Customgreen
                                    : individualcourseview["course_details"][0]
                                                ["level"] ==
                                            "Intermediate"
                                        ? klightOrange
                                        : kdarkred,
                                // color: individualcourseview["course_details"][0]
                                //             ["level"] ==
                                //         "Beginner"
                                //     ? Customgreen
                                //     : kdarkred,
                                fontWeight: kFW700,
                              ),
                            ),
                          ],
                        ),
                      )),
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
                      individualcourseview["course_details"][0]["title"] ?? "",
                      maxLines: 2,
                      style: GoogleFonts.gothicA1(
                        fontSize: kFourteenFont,
                        color: white,
                        fontWeight: kFW700,
                      ),
                    ),
                  ),
                  // RatingBar.builder(
                  //   initialRating: 3,
                  //   minRating: 1,
                  //   direction: Axis.horizontal,
                  //   allowHalfRating: true,
                  //   itemCount: 5,
                  //   itemSize: 18.h,
                  //   unratedColor: white,
                  //   itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
                  //   itemBuilder: (context, _) => const Icon(
                  //     Icons.star,
                  //     color: Gold,
                  //   ),
                  //   onRatingUpdate: (rating) {},
                  // ),
                  individualcourseview["course_details"][0]["course_reviews"]
                              .length ==
                          0
                      ? RatingBar.builder(
                          ignoreGestures: true,
                          initialRating: 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 16.sp,
                          unratedColor: white,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 10,
                          ),
                          onRatingUpdate: (rating) {},
                        )
                      : RatingBar.builder(
                          //initialRating: 4,

                          initialRating: double.parse(
                              individualcourseview["course_details"][0]
                                  ["course_reviews"][0]["rating"]),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 20,
                          unratedColor: white,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 10,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\u{20B9}${individualcourseview["course_details"][0]["price"].toString()}',
                    style: GoogleFonts.gothicA1(
                      fontSize: kEighteenFont,
                      color: Gold,
                      fontWeight: kFW700,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        // individualcourseview["course_details"][0]["course_reviews"]
                        //             [0]["rating"] ==
                        //         null
                        //     ? "0/5"
                        //     : individualcourseview["course_details"][0]
                        //             ["course_reviews"][0]["rating"]
                        //         .toString(),
                        //       "4.5/5 (200)",
                        individualcourseview["course_details"][0]
                                        ["course_reviews"]
                                    .length ==
                                0
                            ? "0/5"
                            : "${individualcourseview["course_details"][0]["course_reviews"][0]["rating"].toString()} /5",

                        style: GoogleFonts.gothicA1(
                            fontSize: kTwelveFont,
                            color: customgrey,
                            fontWeight: kFW700),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      GestureDetector(
                          onTap: () async {
                            await Clipboard.setData(ClipboardData(
                                text:
                                    "https://devb.bossjobs.in/#/student/browseCourseView/${individualcourseview["course_details"][0]["id"].toString()}"
                                //   "https://dev.bossjobs.co.in/#/student/browseCourseView/${widget.searchExerciseData[index]?["id"]}"
                                ));
                          },
                          child: Icon(
                            Icons.copy,
                            color: whitetwo,
                            size: 20.sp,
                          )
                          // Image.asset(
                          //   'assets/images/share_image.png',
                          //   height: 20.h,
                          // ),
                          ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    individualcourseview["course_details"][0]
                            ["course_type_master"]["title"] ??
                        "no Mode",
                    style: GoogleFonts.gothicA1(
                        fontSize: kTwelveFont,
                        color: customgrey,
                        fontWeight: kFW700),
                  ),
                  Text(
                    individualcourseview["purchased_counts"].toString() ?? "0",
                    style: GoogleFonts.gothicA1(
                        fontSize: kTwelveFont,
                        color: customgrey,
                        fontWeight: kFW700),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Text(
                individualcourseview["course_details"][0]["sub_title"] ?? "",
                style: GoogleFonts.gothicA1(
                    fontSize: 11.sp, color: white, fontWeight: kFW400),
                // style: GoogleFonts.gothicA1(
                //   fontSize: kFourteenFont,
                //   color: white,
                //   fontWeight: kFW400,
                // ),
              ),
              SizedBox(
                height: 15.h,
              ),

              // Container(
              //   alignment: Alignment.center,
              //   //height: MediaQuery.of(context).size.height * 0.0,
              //   child: Wrap(
              //       children: interests
              //           .map((interest) =>
              //           Container(
              //                 margin: EdgeInsets.only(right: 10.w, top: 10.h),
              //                 decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.circular(12.r),
              //                     border:
              //                         Border.all(color: grey.withOpacity(0.2))),
              //                 padding: EdgeInsets.symmetric(
              //                     horizontal:
              //                         MediaQuery.of(context).size.width * 0.040,
              //                     vertical: MediaQuery.of(context).size.height *
              //                         0.0035),
              //                 child: Text(interest,
              //                     style: TextStyle(
              //                         fontSize: 11.5.sp,
              //                         fontWeight: kFW600,
              //                         color: Colors.black.withOpacity(0.9))),
              //               ))
              //           .toList()),
              // ),
              Wrap(
                children: [
                  for (int i = 0;
                      i <
                          individualcourseview["course_details"][0]
                                  ["skill_masters"]
                              .length;
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
                        individualcourseview["course_details"][0]
                            ["skill_masters"][i]["title"],
                        //   interests[i],
                        style: GoogleFonts.gothicA1(
                            fontSize: 11.sp,
                            color: darktwo,
                            fontWeight: kFW600),
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Authors",
                style: GoogleFonts.gothicA1(
                    fontSize: kSixteenFont, color: white, fontWeight: kFW700),
              ),
              SizedBox(
                height: 10.h,
              ),
              individualcourseview["course_details"][0]["coaches"].length == 0
                  ? SizedBox()
                  : SizedBox(
                      height: 100.h,
                      child: ListView.builder(
                        itemCount: individualcourseview["course_details"][0]
                                ["coaches"]
                            .length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return Wrap(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                    KAuthorProfile,
                                    arguments:
                                        individualcourseview["course_details"]
                                            [0]["coaches"][index]["user"],
                                  );
                                },
                                child: GlassmorphicContainer(
                                  margin: EdgeInsets.only(right: 15.w),
                                  height: 62.h,
                                  width: 170.w,
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
                                    end: Alignment.bottomRight,
                                  ),
                                  borderGradient: LinearGradient(
                                      colors: [white.withOpacity(0.5), Gold]),
                                  child: Container(
                                    margin: EdgeInsets.all(1.h),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 16,
                                          spreadRadius: 16,
                                          color: Colors.black.withOpacity(0.1),
                                        )
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 20.0,
                                          sigmaY: 20.0,
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: const GradientBoxBorder(
                                              gradient: LinearGradient(colors: [
                                                Color.fromARGB(97, 7, 7, 7),
                                                darkGrey
                                              ]),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                          ),
                                          child: Row(
                                            // crossAxisAlignment:
                                            //     CrossAxisAlignment. ,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(width: 15.w),
                                              Stack(
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        kBackground,
                                                    radius: 20.r,
                                                    child: Image.asset(
                                                      'assets/images/darkWoman.png',
                                                      // height: 52.h,
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: 0,
                                                    right: 0,
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.green,
                                                      radius: 5.r,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 15.w),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 90.w,
                                                    child: Text(
                                                      individualcourseview["course_details"]
                                                                          [0][
                                                                      "coaches"]
                                                                  [index][
                                                              "user"]["name"] ??
                                                          "",
                                                      maxLines: 1,
                                                      style:
                                                          GoogleFonts.gothicA1(
                                                        fontSize: kFourteenFont,
                                                        color: white,
                                                        fontWeight: kFW600,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "profile",
                                                    style: GoogleFonts.gothicA1(
                                                      fontSize: 12.sp,
                                                      color: white,
                                                      fontWeight: kFW500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
              //  SizedBox(height: 20.h),
              SizedBox(
                height: 300.h,
                child: ContainedTabBarView(
                  tabs: [
                    Text('Introduction'), //
                    Text('You will Learn'), //
                    Text('Course Content'),
                    Text('More Information'), //
                  ],
                  tabBarProperties: TabBarProperties(
                    labelPadding: EdgeInsets.only(right: 10, left: 10.w),
                    isScrollable: true,
                    width: double.infinity,
                    height: 35.h,
                    // padding: EdgeInsets.all(15.w),
                    // padding: EdgeInsets.symmetric(
                    //   horizontal: 32.0,
                    //   vertical: 8.0,
                    // ),
                    indicator: ContainerTabIndicator(
                      radius: BorderRadius.circular(16.0),
                      color: grey,
                      // borderWidth: 2.0,
                      // borderColor: Colors.black,
                    ),
                    labelColor: Gold,
                    padding: EdgeInsets.all(0),
                    unselectedLabelColor: whitetwo,
                  ),

                  // tabBarProperties: TabBarProperties(
                  //   isScrollable: true,
                  //   width: double.infinity,
                  //   labelPadding: EdgeInsets.only(right: 10, left: 10.w),
                  //   height: 32,
                  //   background: Container(
                  //     decoration: BoxDecoration(
                  //       color: kBackground,
                  //       borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.black.withOpacity(0.4),
                  //           spreadRadius: 0.5,
                  //           blurRadius: 2,
                  //           offset: Offset(1, -1),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  //   position: TabBarPosition.top,
                  //   alignment: TabBarAlignment.center,
                  //   indicatorColor: Colors.transparent,
                  //   labelColor: Gold,
                  //   unselectedLabelColor: Colors.grey[400],
                  // ),
                  views: [
                    Container(
                      margin: EdgeInsets.all(10.w),
                      child: Text(
                          parse(individualcourseview["course_details"][0]
                                      ["description"] ??
                                  "")
                              .body!
                              .text,
                          style: GoogleFonts.gothicA1(
                              fontSize: 11.sp,
                              color: white,
                              fontWeight: kFW400)),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.w),
                      child: Text(
                          parse(individualcourseview["course_details"][0]
                                          ["course_learn_points"][0]
                                      ["points_to_learn"] ??
                                  "")
                              .body!
                              .text,
                          style: GoogleFonts.gothicA1(
                              fontSize: 11.sp,
                              color: white,
                              fontWeight: kFW400)),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.w),
                      child: ListView.builder(
                        // itemCount: 1,
                        itemCount: individualcourseview["course_details"]?[0]
                                    ["course_modules"]
                                .length ??
                            0,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return courcseisLoading == false
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
                                        fontWeight: kFW700,
                                      ),
                                    ),
                                    ListView.builder(
                                      itemCount:
                                          individualcourseview["course_details"]
                                                          ?[0]["course_modules"]
                                                      ?[index]["lessons"] !=
                                                  null
                                              ? individualcourseview[
                                                              "course_details"]
                                                          [0]["course_modules"]
                                                      [index]["lessons"]
                                                  .length
                                              : 0,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
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
                                                                  [0]
                                                              ["course_modules"]
                                                          [index]["lessons"][i]
                                                      ["title"] ??
                                                  "",
                                              style: GoogleFonts.gothicA1(
                                                fontSize: 15.sp,
                                                color: white,
                                                fontWeight: kFW600,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "${individualcourseview["course_details"][0]["course_modules"][index]["lessons"][i]["lesson_assignments"].length.toString()} Assignments",
                                                  style: GoogleFonts.gothicA1(
                                                    fontSize: 11.sp,
                                                    color: white,
                                                    fontWeight: kFW400,
                                                  ),
                                                ),
                                                Text(
                                                  "  ${individualcourseview["course_details"][0]["course_modules"][index]["lessons"][i]["course_exercise"].length.toString()} Exercises",
                                                  style: GoogleFonts.gothicA1(
                                                    fontSize: kFourteenFont,
                                                    color: white,
                                                    fontWeight: kFW400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      }),
                                    ),
                                  ],
                                )
                              : const Center(
                                  child: CircularProgressIndicator(
                                  color: Gold,
                                ));
                        }),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.w),
                      child: Text(
                          parse(individualcourseview["course_details"][0]
                                      ["more_inforamtion"] ??
                                  "")
                              .body!
                              .text,
                          style: GoogleFonts.gothicA1(
                              fontSize: 11.sp,
                              color: white,
                              fontWeight: kFW400)),
                    ),
                  ],
                ),
              ),
              // CourseVIewTabs(),
              SizedBox(height: 15.h),
              // Text(
              //   "Introduction",
              //   style: GoogleFonts.gothicA1(
              //     fontSize: kSixteenFont,
              //     color: white,
              //     fontWeight: kFW700,
              //   ),
              // ),
              // SizedBox(
              //   height: 10.h,
              // ),
              // Text(
              //   parse(individualcourseview["course_details"][0]
              //               ["description"] ??
              //           "")
              //       .body!
              //       .text,
              //   // ,
              //   style: GoogleFonts.gothicA1(
              //     fontSize: kFourteenFont,
              //     color: white,
              //     fontWeight: kFW400,
              //   ),
              // ),
              // SizedBox(
              //   height: 15.h,
              // ),
              // Text(
              //   "More Information",
              //   style: GoogleFonts.gothicA1(
              //     fontSize: kSixteenFont,
              //     color: white,
              //     fontWeight: kFW700,
              //   ),
              // ),
              // SizedBox(
              //   height: 10.h,
              // ),
              // Text(
              //   parse(individualcourseview["course_details"][0]
              //               ["more_inforamtion"] ??
              //           "")
              //       .body!
              //       .text,
              //   // individualcourseview["course_details"][0]["more_inforamtion"] ??
              //   //     "",
              //   style: GoogleFonts.gothicA1(
              //     fontSize: kFourteenFont,
              //     color: white,
              //     fontWeight: kFW400,
              //   ),
              // ),
              // SizedBox(
              //   height: 15.h,
              // ),
              // Text(
              //   "You will learn",
              //   style: GoogleFonts.gothicA1(
              //     fontSize: kSixteenFont,
              //     color: white,
              //     fontWeight: kFW700,
              //   ),
              // ),
              // SizedBox(
              //   height: 10.h,
              // ),
              // Text(
              //   parse(individualcourseview["course_details"][0]
              //               ["course_learn_points"][0]["points_to_learn"] ??
              //           "")
              //       .body!
              //       .text,
              //   // individualcourseview["course_details"][0]["course_learn_points"]
              //   //         [0]["points_to_learn"] ??
              //   //     "",
              //   style: GoogleFonts.gothicA1(
              //     fontSize: kFourteenFont,
              //     color: white,
              //     fontWeight: kFW400,
              //   ),
              // ),
              // SizedBox(
              //   height: 15.h,
              // ),
              // Text(
              //   "Course Content",
              //   style: GoogleFonts.gothicA1(
              //     fontSize: kSixteenFont,
              //     color: white,
              //     fontWeight: kFW700,
              //   ),
              // ),
              // ListView.builder(
              //   // itemCount: 1,
              //   itemCount: individualcourseview["course_details"]?[0]
              //               ["course_modules"]
              //           .length ??
              //       0,
              //   shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              //   itemBuilder: ((context, index) {
              //     return isLoading == false
              //         ? Column(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               SizedBox(
              //                 height: 20.h,
              //               ),
              //               Text(
              //                 "${index + 1}${" "}${individualcourseview["course_details"][0]["course_modules"][index]["title"] ?? ""}",
              //                 style: GoogleFonts.gothicA1(
              //                   fontSize: kSixteenFont,
              //                   color: white,
              //                   fontWeight: kFW700,
              //                 ),
              //               ),
              //               ListView.builder(
              //                 itemCount: individualcourseview["course_details"]
              //                                 ?[0]["course_modules"]?[index]
              //                             ["lessons"] !=
              //                         null
              //                     ? individualcourseview["course_details"][0]
              //                             ["course_modules"][index]["lessons"]
              //                         .length
              //                     : 0,
              //                 shrinkWrap: true,
              //                 physics: const NeverScrollableScrollPhysics(),
              //                 itemBuilder: ((context, i) {
              //                   return Column(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       SizedBox(height: 10.h),
              //                       Text(
              //                         individualcourseview["course_details"][0]
              //                                     ["course_modules"][index]
              //                                 ["lessons"][i]["title"] ??
              //                             "",
              //                         style: GoogleFonts.gothicA1(
              //                           fontSize: 15.sp,
              //                           color: white,
              //                           fontWeight: kFW600,
              //                         ),
              //                       ),
              //                       Row(
              //                         children: [
              //                           Text(
              //                             "${individualcourseview["course_details"][0]["course_modules"][index]["lessons"][i]["lesson_assignments"].length.toString()} Assignments",
              //                             style: GoogleFonts.gothicA1(
              //                               fontSize: kFourteenFont,
              //                               color: white,
              //                               fontWeight: kFW400,
              //                             ),
              //                           ),
              //                           Text(
              //                             "  ${individualcourseview["course_details"][0]["course_modules"][index]["lessons"][i]["course_exercise"].length.toString()} Exercises",
              //                             style: GoogleFonts.gothicA1(
              //                               fontSize: kFourteenFont,
              //                               color: white,
              //                               fontWeight: kFW400,
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                     ],
              //                   );
              //                 }),
              //               ),
              //             ],
              //           )
              //         : const Center(child: CircularProgressIndicator());
              //   }),
              // ),

              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (isCourseFav == 0) {
                        coursewishlistHandler(id);
                      }
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
                        end: Alignment.bottomRight,
                      ),
                      borderGradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          white.withOpacity(0.5),
                          white.withOpacity(0.5),
                          Gold.withOpacity(0.5)
                        ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 16,
                              spreadRadius: 16,
                              color: Colors.black.withOpacity(0.1),
                            )
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 20.0,
                              sigmaY: 20.0,
                            ),
                            child: Text(
                              isCourseFav == 0
                                  ? "Add to Wishlist"
                                  : "Favourated",
                              style: GoogleFonts.gothicA1(
                                fontSize: kFourteenFont,
                                color: white,
                                fontWeight: kFW500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  individualcourseview["purchased"] == "yes"
                      ? GestureDetector(
                          onTap: () {
                            Get.toNamed(KTakeCourse,
                                arguments: individualcourseview);
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
                              end: Alignment.bottomRight,
                            ),
                            borderGradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                white.withOpacity(0.5),
                                white.withOpacity(0.5),
                                Gold.withOpacity(0.5)
                              ],
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 16,
                                    spreadRadius: 15,
                                    color: Colors.black.withOpacity(0.1),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 20.0,
                                    sigmaY: 20.0,
                                  ),
                                  child: Text(
                                    " Take Course",
                                    style: GoogleFonts.gothicA1(
                                      fontSize: kSixteenFont,
                                      color: white,
                                      fontWeight: kFW700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            enrollHandler();
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
                              end: Alignment.bottomRight,
                            ),
                            borderGradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                white.withOpacity(0.5),
                                white.withOpacity(0.5),
                                Gold.withOpacity(0.5)
                              ],
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 16,
                                    spreadRadius: 15,
                                    color: Colors.black.withOpacity(0.1),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 20.0,
                                    sigmaY: 20.0,
                                  ),
                                  child: Text(
                                    "Buy Now",
                                    style: GoogleFonts.gothicA1(
                                      fontSize: kSixteenFont,
                                      color: white,
                                      fontWeight: kFW700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                ],
              ),
              /////////////////////////////////////////////////
              SizedBox(height: 15.h),
              Text(
                "More Courses By this Author",
                style: GoogleFonts.gothicA1(
                  fontSize: kSixteenFont,
                  color: white,
                  fontWeight: kFW700,
                ),
              ),
              SizedBox(height: 15.h),
              individualcourseview["primary_courses"].length == 0 ||
                      individualcourseview["primary_courses"] == null
                  ? Text(
                      "No Courses By this Author",
                      style: GoogleFonts.gothicA1(
                        fontSize: kFourteenFont,
                        color: white,
                        fontWeight: kFW500,
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: individualcourseview["primary_courses"].length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 2,
                        childAspectRatio: (0.31 / 0.50),
                      ),
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(MoreCourseDetails(
                              moreData: individualcourseview["primary_courses"]
                                  [index],
                            ));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                height: 170.h,
                                margin: EdgeInsets.only(right: 7.w),
                                decoration: BoxDecoration(
                                    border: const GradientBoxBorder(
                                      gradient:
                                          LinearGradient(colors: [grey, Gold]),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(15.r)),
                                child: individualcourseview["primary_courses"]
                                            [index]["course_banner"] ==
                                        null
                                    ? Image.asset(
                                        'assets/images/logo.png',
                                      )
                                    // : CachedNetworkImage(
                                    //     imageUrl:
                                    //         "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
                                    //     errorWidget: (context, url, error) =>
                                    //         Image.asset(
                                    //           'assets/images/no image.jpg',
                                    //         ),
                                    //     placeholder: (context, url) => Image.asset(
                                    //           'assets/images/no image.jpg',
                                    //         )),

                                    : Image(
                                        image: NetworkImage(kCourseURL +
                                            individualcourseview[
                                                    "primary_courses"][index]
                                                ["course_banner"]),
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
                              SizedBox(
                                height: 4.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    individualcourseview["primary_courses"]
                                        [index]["title"],
                                    maxLines: 1,
                                    style: GoogleFonts.gothicA1(
                                      fontSize: 15.sp,
                                      color: white,
                                      fontWeight: kFW700,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '\u{20B9}${moneyFormat(individualcourseview["primary_courses"][index]["price"].toString())}',
                                        //  '\u{20B9}${}',
                                        style: GoogleFonts.gothicA1(
                                          fontSize: kFourteenFont,
                                          color: Gold,
                                          fontWeight: kFW700,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        individualcourseview["primary_courses"]
                                            [index]["level"],
                                        style: GoogleFonts.gothicA1(
                                          fontSize: kTwelveFont,
                                          color: white,
                                          fontWeight: kFW700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                    ),

              ////////////////////////////////////////////////////////////////////////////////////////////////////
              SizedBox(height: 15.h),
              Text(
                "Other Relevant Courses",
                style: GoogleFonts.gothicA1(
                  fontSize: kSixteenFont,
                  color: white,
                  fontWeight: kFW700,
                ),
              ),
              SizedBox(height: 15.h),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    individualcourseview["other_relavant_courses"].length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: (0.31 / 0.50),
                ),
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(MoreCourseDetails(
                        moreData: individualcourseview["other_relavant_courses"]
                            [index],
                      ));
                    },
                    child: Column(
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
                          child: individualcourseview["other_relavant_courses"]
                                      [index]["course_banner"] ==
                                  null
                              ? Image.asset(
                                  'assets/images/logo.png',
                                )
                              // : CachedNetworkImage(
                              //     imageUrl:
                              //         "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
                              //     errorWidget: (context, url, error) =>
                              //         Image.asset(
                              //           'assets/images/no image.jpg',
                              //         ),
                              //     placeholder: (context, url) => Image.asset(
                              //           'assets/images/no image.jpg',
                              //         )),

                              : Image(
                                  image: NetworkImage(kCourseURL +
                                      individualcourseview[
                                              "other_relavant_courses"][index]
                                          ["course_banner"]),
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
                              maxLines: 1,
                              style: GoogleFonts.gothicA1(
                                fontSize: 15.sp,
                                color: white,
                                fontWeight: kFW700,
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  '\u{20B9}${moneyFormat(individualcourseview["other_relavant_courses"][index]["price"].toString())}',
                                  //  '\u{20B9}${}',
                                  style: GoogleFonts.gothicA1(
                                    fontSize: kFourteenFont,
                                    color: Gold,
                                    fontWeight: kFW700,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  individualcourseview["other_relavant_courses"]
                                      [index]["level"],
                                  style: GoogleFonts.gothicA1(
                                    fontSize: kTwelveFont,
                                    color: white,
                                    fontWeight: kFW700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
              ),
              SizedBox(height: 15.h),
              individualcourseview['skilljobs'] != null
                  ? individualcourseview['skilljobs'].length == 0
                      ? const SizedBox()
                      : Text(
                          "Course Relavent Jobs",
                          style: GoogleFonts.gothicA1(
                            fontSize: kSixteenFont,
                            color: white,
                            fontWeight: kFW700,
                          ),
                        )
                  : SizedBox(),
              individualcourseview['skilljobs'] != null
                  ? individualcourseview['skilljobs'].length == 0
                      ? const SizedBox()
                      : SizedBox(height: 15.h)
                  : SizedBox(),
              individualcourseview['skilljobs'] != null
                  ? individualcourseview['skilljobs'].length == 0
                      ? const SizedBox()
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: individualcourseview['skilljobs'].length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 2,
                            childAspectRatio: (0.31 / 0.50),
                          ),
                          itemBuilder: ((context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                    height: 170.h,
                                    margin: EdgeInsets.only(right: 7.w),
                                    decoration: BoxDecoration(
                                        border: const GradientBoxBorder(
                                          gradient: LinearGradient(
                                              colors: [grey, Gold]),
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15.r)),
                                    child: Image.asset(
                                      'assets/images/no image.jpg',
                                    )
                                    // : CachedNetworkImage(
                                    //     imageUrl:
                                    //         "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
                                    //     errorWidget: (context, url, error) =>
                                    //         Image.asset(
                                    //           'assets/images/no image.jpg',
                                    //         ),
                                    //     placeholder: (context, url) => Image.asset(
                                    //           'assets/images/no image.jpg',
                                    //         )),

                                    // : Image(
                                    //     image: NetworkImage(kCourseURL +
                                    //         individualcourseview[
                                    //                 "other_relavant_courses"][index]
                                    //             ["course_banner"]),
                                    //     errorBuilder: (c, o, s) => Center(
                                    //       child: Text(
                                    //         "Unable to Load Image",
                                    //         style: GoogleFonts.gothicA1(
                                    //           fontSize: kFourteenFont,
                                    //           color: white,
                                    //           fontWeight: kFW700,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    ),
                                SizedBox(
                                  height: 4.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      individualcourseview['skilljobs'][index]
                                          ["title"],
                                      maxLines: 1,
                                      style: GoogleFonts.gothicA1(
                                        fontSize: 15.sp,
                                        color: white,
                                        fontWeight: kFW700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "No.of Opennings",
                                          style: GoogleFonts.gothicA1(
                                            fontSize: kTwelveFont,
                                            color: white,
                                            fontWeight: kFW700,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          '${individualcourseview['skilljobs'][index]["no_openings"]}',
                                          style: GoogleFonts.gothicA1(
                                            fontSize: kFourteenFont,
                                            color: Gold,
                                            fontWeight: kFW700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }),
                        )
                  : SizedBox()
            ],
          )
        : const Center(
            child: CircularProgressIndicator(
            color: Gold,
          ));
  }
}

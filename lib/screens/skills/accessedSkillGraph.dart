import 'dart:ui';

import 'package:bossjobs/utils/export_file.dart';
import 'package:dio/dio.dart' as dio;

class AccessedSkillGraphView extends StatefulWidget {
  const AccessedSkillGraphView({super.key});

  @override
  State<AccessedSkillGraphView> createState() => _AccessedSkillGraphViewState();
}

class _AccessedSkillGraphViewState extends State<AccessedSkillGraphView> {
  @override
  void initState() {
    getSkillInfo();
    getSkillExercise();
    getSkillCourseInfo();
    getSkillJobs();
    super.initState();
  }

  bool isSkillLoading = false;
  Map skillInfo = {};
  Future getSkillInfo() async {
    setState(() {
      isSkillLoading = true;
    });
    Map data = await Services.getSkillInfo(Get.arguments["skillId"]);
    if (data["data"]["message"] != null) {
      Fluttertoast.showToast(
        msg: data["data"]["message"],
      );
    } else {
      skillInfo = data["data"]["data"];
    }
    print(data["data"]["data"]);
    setState(() {
      isSkillLoading = false;
    });
  }

  bool isSkillJobsLoading = false;
  Map skillJobs = {};
  Future getSkillJobs() async {
    setState(() {
      isSkillJobsLoading = true;
    });
    Map data = await Services.getSkillJobs(Get.arguments["skillId"]);
    if (data["data"]["message"] != null) {
    } else {
      skillJobs = data["data"];
    }
    setState(() {
      isSkillJobsLoading = false;
    });
  }

  bool isSkillCourseLoading = false;
  List skillCourse = [];
  Future getSkillCourseInfo() async {
    setState(() {
      isSkillCourseLoading = true;
    });
    Map data = await Services.getSkillCourseInfo(Get.arguments["skillId"]);
    if (data["data"]["message"] != null) {
      skillCourse = [];
    } else {
      skillCourse = data["data"]["data"];
    }
    print(data["data"]["data"]);
    setState(() {
      isSkillCourseLoading = false;
    });
  }

  bool isSkillExerciseLoading = false;
  List skillExercise = [];
  Future getSkillExercise() async {
    setState(() {
      isSkillExerciseLoading = true;
    });
    Map data = await Services.getSkillExercise(Get.arguments["skillId"]);
    if (data["data"]["message"] != null) {
      skillExercise = [];
    } else {
      skillExercise = data["data"]["data"];
    }
    setState(() {
      isSkillExerciseLoading = false;
    });
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: white),
              automaticallyImplyLeading: true,
              backgroundColor: darktwo,
              elevation: 0,
              centerTitle: false,
              title: Text(
                'Assessed Skill',
                style: GoogleFonts.gothicA1(
                  letterSpacing: 1,
                  fontSize: kEighteenFont,
                  color: white,
                  fontWeight: kFW700,
                ),
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
                          child: const CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 13.w,
                )
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 30.h,
                  margin: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: grey,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    labelColor: Gold,
                    labelStyle: GoogleFonts.gothicA1(
                      color: whitetwo,
                      fontWeight: kFW700,
                      fontSize: kTwelveFont,
                    ),
                    unselectedLabelColor: white,
                    tabs: const [
                      Tab(
                        child: Text("Jobs"),
                      ),
                      Tab(
                        child: Text("Courses"),
                      ),
                      Tab(
                        child: Text("Assessments"),
                      )
                    ],
                  ),
                ),
              )),
          body: Stack(children: [
            const Background(),
            isSkillLoading == false
                ? Container(
                    margin: EdgeInsets.all(15.w),
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                            child: JobsView(
                          allJobs: skillJobs["data"],
                        )),
                        SingleChildScrollView(
                            child:
                                RecommendedAssessed(browseCourse: skillCourse)),
                        AssesmentView(
                          myExercise: skillExercise,
                        )
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: white,
                    ),
                  )
          ]),
        ));
  }
}

class JobsView extends StatefulWidget {
  List allJobs;
  JobsView({super.key, required this.allJobs});

  @override
  State<JobsView> createState() => _JobsViewState();
}

class _JobsViewState extends State<JobsView> {
  Future addJobToWishList(int id, int index) async {
    dio.Response response = await Services.addOrRemoveJobFromWishlist(id);
    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        if (response.data['data']["status"] == 1) {
          setState(() {
            widget.allJobs[index]["isFavourite"] = 1;
          });
        } else {
          setState(() {
            widget.allJobs[index]["isFavourite"] = 2;
          });
        }
      }
    }
  }

  Future applyForJobHandler(int id, int index) async {
    dio.Response response = await Services.applyForJob(id);
    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        if (response.data['data']["status"] == 1) {
          setState(() {
            widget.allJobs[index]["isApplied"] = 1;
          });
        } else {
          setState(() {
            widget.allJobs[index]["isApplied"] = 2;
          });
        }
        Fluttertoast.showToast(msg: response.data['data']['message']);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.allJobs.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            Get.toNamed(
              KJob_Description,
              arguments: widget.allJobs[index]["id"] ?? "",
            );
          },
          child: GlassmorphicContainer(
            margin: EdgeInsets.only(bottom: 8.h),
            // height: 210.h,
            height: 160.h,
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
                    padding: EdgeInsets.all(15.r),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // mainAxisAlignment:
                      //     MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.allJobs[index]["title"] ?? "",
                                  style: GoogleFonts.gothicA1(
                                    fontSize: kSixteenFont,
                                    color: whitetwo,
                                    fontWeight: kFW700,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  widget.allJobs[index]["company"]["title"],
                                  style: GoogleFonts.gothicA1(
                                    fontSize: kTwelveFont,
                                    color: klightdark,
                                    fontWeight: kFW500,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                widget.allJobs[index]["noOfViews"] == null
                                    ? const SizedBox()
                                    : Column(
                                        children: [
                                          Icon(
                                            Icons.remove_red_eye,
                                            color: whitetwo,
                                            size: kSixteenFont,
                                          ),
                                          Text(
                                            widget.allJobs[index]["noOfViews"]
                                                .toString(),
                                            // $.[]data.[]no_of_views
                                            //"101",
                                            maxLines: 1,
                                            style: GoogleFonts.gothicA1(
                                              fontSize: 8.sp,
                                              color: whitetwo,
                                              fontWeight: kFW500,
                                            ),
                                          ),
                                        ],
                                      ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    addJobToWishList(
                                        widget.allJobs[index]["id"], index);
                                    setState(() {});
                                  },
                                  child: Icon(
                                    widget.allJobs[index]["isFavourite"] == 1
                                        ? Icons.favorite_rounded
                                        : Icons.favorite_outline_rounded,
                                    color: widget.allJobs[index]
                                                ["isFavourite"] ==
                                            1
                                        ? Colors.red
                                        : whitetwo,
                                    size: 24,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        widget.allJobs[index]["almamater_masters"] == null
                            ? const SizedBox()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    //$.[]data.[]almamater_masters.[]name
                                    //   allJobs.almamater_masters[index] ?? "",
                                    //  allJobs[index].title ?? "",
                                    //     allJobs[0]["almamater_masters"][0]["AlmamaterMasters"]["name"]??"",
                                    widget.allJobs[index]
                                                ["almamater_masters"] ==
                                            null
                                        ? " - "
                                        : widget.allJobs[index]
                                            ["almamater_masters"][0]["name"],
                                    style: GoogleFonts.gothicA1(
                                      fontSize: 11.sp,
                                      color: whitetwo,
                                      fontWeight: kFW500,
                                    ),
                                  ),
                                  Text(
                                    '${widget.allJobs[index]["min_exp"]} - ${widget.allJobs[index]["max_exp"]} Years',
                                    style: GoogleFonts.gothicA1(
                                      fontSize: 11.sp,
                                      color: whitetwo,
                                      fontWeight: kFW500,
                                    ),
                                  ),
                                  widget.allJobs[index]["cities"] == null
                                      ? const SizedBox()
                                      : Row(
                                          children: [
                                            Image.asset(
                                              'assets/images/link.png',
                                              width: 18.w,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(
                                              widget.allJobs[index]["cities"][0]
                                                  ["name"]!,
                                              //  "Hyderabad, Telangana",
                                              style: GoogleFonts.gothicA1(
                                                fontSize: 10.sp,
                                                color: white,
                                                fontWeight: kFW700,
                                              ),
                                            ),
                                          ],
                                        ),
                                ],
                              ),
                        // Row(
                        //   mainAxisAlignment:
                        //       MainAxisAlignment
                        //           .spaceBetween,
                        //   children: [
                        //     allJobs[index]
                        //                 .company!
                        //                 .address !=
                        //             null
                        //         ? Row(
                        //             children: [
                        //               Image.asset(
                        //                 'assets/images/link.png',
                        //                 width: 20.w,
                        //               ),
                        //               Text(
                        //                 allJobs[index]
                        //                         .company!
                        //                         .address ??
                        //                     "",
                        //                 style: GoogleFonts
                        //                     .gothicA1(
                        //                   fontSize:
                        //                       11.sp,
                        //                   color:
                        //                       white,
                        //                   fontWeight:
                        //                       kFW700,
                        //                 ),
                        //               ),
                        //             ],
                        //           )
                        //         : const SizedBox(),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 13.h,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // Container(
                            //   padding:
                            //       EdgeInsets.all(5.r),
                            //   color: white
                            //       .withOpacity(0.5),
                            //   child: Text(
                            //     allJobs[index]
                            //             .jobType!
                            //             .title ??
                            //         "",
                            //     style: GoogleFonts
                            //         .gothicA1(
                            //       fontSize: 11.sp,
                            //       color: white,
                            //       fontWeight: kFW700,
                            //     ),
                            //   ),
                            // ),
                            widget.allJobs[index]["job_skills"] == null
                                ? const SizedBox()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            color: white.withOpacity(0.5)),
                                        padding: EdgeInsets.all(5.r),
                                        child: Text(
                                          widget.allJobs[index]["job_skills"][0]
                                              ["skill_master"]["title"],
                                          style: GoogleFonts.gothicA1(
                                            fontSize: 11.sp,
                                            color: darktwo,
                                            fontWeight: kFW600,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      widget.allJobs[index]["job_skills"]
                                                  .length >=
                                              2
                                          ? Container(
                                              width: 200.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.r),
                                                  color:
                                                      white.withOpacity(0.5)),
                                              padding: EdgeInsets.all(5.r),
                                              child: Text(
                                                widget.allJobs[index]
                                                        ["job_skills"][1]
                                                    ["skill_master"]["title"],
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                // "Skill will be covered here to show   ",
                                                style: GoogleFonts.gothicA1(
                                                  fontSize: 11.sp,
                                                  color: darktwo,
                                                  fontWeight: kFW600,
                                                ),
                                              ))
                                          : const SizedBox()
                                    ],
                                  ),
                            widget.allJobs[index]["job_type"] == null
                                ? const SizedBox()
                                : Column(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment
                                    //         .end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        widget.allJobs[index]["job_type"]
                                                ["title"] ??
                                            "",
                                        //   "Salary",
                                        style: GoogleFonts.gothicA1(
                                          fontSize: 8.sp,
                                          color: whitetwo,
                                          fontWeight: kFW600,
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      Text(
                                        '${widget.allJobs[index]["min_sal"]} - ${widget.allJobs[index]["max_sal"]} LPA',
                                        style: GoogleFonts.gothicA1(
                                          fontSize: kTwelveFont,
                                          color: Gold,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                        // SizedBox(
                        //   height: 10.h,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                    backgroundColor: kBackground,
                                    radius: 15.r,
                                    child: Image.asset(
                                        'assets/images/darkWoman.png',
                                        height: 52.h)),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  '${widget.allJobs[index]["industry"]!["title"]}',
                                  maxLines: 1,
                                  style: GoogleFonts.gothicA1(
                                    fontSize: kTwelveFont,
                                    color: white,
                                    fontWeight: kFW700,
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   width: 10.w,
                            // ),
                            GestureDetector(
                              onTap: widget.allJobs[index]["isApplied"] == 1
                                  ? () {}
                                  : () {
                                      applyForJobHandler(
                                          widget.allJobs[index]["id"]!, index);
                                    },
                              child: Container(
                                width: 85.w,
                                height: 32.h,
                                // padding:
                                //     EdgeInsets.only(
                                //         left: 8.w,
                                //         right: 8.w,
                                //         top: 24.h,
                                //         bottom: 24.h),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 20,
                                        spreadRadius: 5,
                                        color: Color.fromARGB(255, 11, 2, 2)
                                            .withOpacity(0.4)),
                                  ],
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      grey.withOpacity(0.5),
                                      grey1.withOpacity(0.5),
                                      const Color.fromARGB(255, 58, 55, 55)
                                          .withOpacity(0.1),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  widget.allJobs[index]["isApplied"] == 1
                                      ? "Applied"
                                      : "Apply",
                                  style: GoogleFonts.gothicA1(
                                    fontSize: kTwelveFont,
                                    color: whitetwo,
                                    fontWeight: kFW600,
                                  ),
                                ),
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
        );
      }),
    );
  }
}

class AssesmentView extends StatefulWidget {
  List myExercise;
  AssesmentView({super.key, required this.myExercise});

  @override
  State<AssesmentView> createState() => _AssesmentViewState();
}

class _AssesmentViewState extends State<AssesmentView> {
  @override
  List<int> wishlisted = <int>[];
  List myfavouritedExercisedata = [];
  String moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return value;
    }
    return price;
  }

  bool isLoadingData = false;
  Future myexercisewishlistHandler(int id) async {
    setState(() {
      isLoadingData = true;
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
    } catch (e) {
      Fluttertoast.showToast(msg: "Something Went Wrong");
    }
    setState(() {
      isLoadingData = false;
    });
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.myExercise.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            Get.toNamed(
              KExerciseDescription,
              arguments: widget.myExercise[index]?["id"] ?? "",
            );
            // Get.toNamed(
            //   // KProductionScreen,
            //   // arguments: myCourse[
            //   //             index]
            //   //         ["id"] ??
            //   //     "",
            // );
          },
          // onTap: () {
          //   Get.toNamed(
          //     KExerciseDescription,
          //     arguments: widget.searchExerciseData[index]?["id"] ?? "",
          //   );
          // },
          child: GlassmorphicContainer(
            margin: EdgeInsets.only(bottom: 15.h),
            // height: 210.h,
            height: 150.h,
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
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.myExercise[index]?["title"] ?? "Excerises",
                              style: GoogleFonts.gothicA1(
                                fontSize: kEighteenFont,
                                color: whitetwo,
                                fontWeight: kFW700,
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(width: 25.w),
                                GestureDetector(
                                    onTap: () async {
                                      await Clipboard.setData(ClipboardData(
                                          text:
                                              "https://dev.bossjobs.co.in/#/student/exercisesView/${widget.myExercise[index]?["id"]}"));
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
                                // Image.asset(
                                //   'assets/images/share_image.png',
                                //   height: 20.h,
                                // ),
                              ],
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   height: 15.h,
                        // ),
                        Row(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/timer.png',
                                  height: 18.h,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "${widget.myExercise[index]["time"].toString()} mins",
                                  // "20 min",
                                  style: GoogleFonts.gothicA1(
                                    fontSize: 11.sp,
                                    color: Gold,
                                    fontWeight: kFW500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/person1.png',
                                  height: 18.h,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "06",
                                  style: GoogleFonts.gothicA1(
                                    fontSize: 11.sp,
                                    color: whitetwo,
                                    fontWeight: kFW500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/practise.png',
                                  height: 18.h,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  "${widget.myExercise[index]["exercise_assignments"].length.toString()} Questions",
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
                        Row(
                          children: [
                            Container(
                              width: 120.w,
                              padding: EdgeInsets.only(
                                  left: 14.w, right: 14.w, top: 6.h, bottom: 6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                color: customgrey,
                              ),
                              child: Text(
                                widget.myExercise[index]?["skill_masters"][0]
                                    ["title"],
                                maxLines: 1,
                                // "Product Designer",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.gothicA1(
                                    fontSize: 11.sp,
                                    color: darktwo,
                                    fontWeight: kFW600),
                              ),
                            ),
                            SizedBox(width: 15.w),
                            widget.myExercise[index]["skill_masters"].length >=
                                    3
                                ? Container(
                                    width: 120.w,
                                    padding: EdgeInsets.only(
                                        left: 14.w,
                                        right: 14.w,
                                        top: 6.h,
                                        bottom: 6),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                      color: customgrey,
                                    ),
                                    child: Text(
                                      widget.myExercise[index]?["skill_masters"]
                                          [1]["title"],
                                      maxLines: 1,
                                      // "Product Designer",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.gothicA1(
                                          fontSize: 11.sp,
                                          color: darktwo,
                                          fontWeight: kFW600),
                                    ),
                                  )
                                : SizedBox(),
                            // Container(
                            //   padding: EdgeInsets.only(
                            //       left: 14.w, right: 14.w, top: 6.h, bottom: 6),
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(20.r),
                            //     color: customgrey,
                            //   ),
                            //   child: Text(

                            //                 widget.searchExerciseData[index]
                            //                     ["skill_masters"]
                            //                 .length >=
                            //             3
                            //         ? widget.searchExerciseData[index]
                            //             ["skill_masters"][1]["title"]
                            //         : "No other skill",
                            //     // widget.searchExerciseData[0]["category_master"]
                            //     //             .length >=
                            //     //         3
                            //     //     ? widget.searchExerciseData[1]
                            //     //         ["category_master"]["title"]
                            //     //     : "ram",
                            //     //     "Visual Designer",
                            //     style: GoogleFonts.gothicA1(
                            //         fontSize: 11.sp,
                            //         color: darktwo,
                            //         fontWeight: kFW600),
                            //   ),
                            // ),
                          ],
                        ),

                        // SizedBox(
                        //   height: 15.h,
                        // ),
                        // Row(
                        //   children: [
                        //     Container(
                        //       padding: EdgeInsets.only(
                        //           left: 14.w,
                        //           right: 14.w,
                        //           top: 6.h,
                        //           bottom: 6),
                        //       decoration: BoxDecoration(
                        //         borderRadius:
                        //             BorderRadius.circular(20.r),
                        //         color: customgrey,
                        //       ),
                        //       child: Text(
                        //         "Product Designer",
                        //         style: GoogleFonts.gothicA1(
                        //             fontSize: 11.sp,
                        //             color: darktwo,
                        //             fontWeight: kFW600),
                        //       ),
                        //     ),
                        //     SizedBox(width: 15.w),
                        //     Container(
                        //       padding: EdgeInsets.only(
                        //           left: 14.w,
                        //           right: 14.w,
                        //           top: 6.h,
                        //           bottom: 6),
                        //       decoration: BoxDecoration(
                        //         borderRadius:
                        //             BorderRadius.circular(20.r),
                        //         color: customgrey,
                        //       ),
                        //       child: Text(
                        //         "Visual Designer",
                        //         style: GoogleFonts.gothicA1(
                        //             fontSize: 11.sp,
                        //             color: darktwo,
                        //             fontWeight: kFW600),
                        //       ),
                        //     ),
                        //   ],
                        // ),

                        // SizedBox(height: 15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                    backgroundColor: kBackground,
                                    radius: 15.r,
                                    child: Image.asset(
                                        'assets/images/darkWoman.png',
                                        height: 52.h)),
                                SizedBox(width: 8.w),
                                Text(
                                  widget.myExercise[index]?["coach"]["user"]
                                      ["name"],
                                  style: GoogleFonts.gothicA1(
                                      fontSize: 11.sp,
                                      color: whitetwo,
                                      fontWeight: kFW600),
                                ),
                              ],
                            ),
                            Text(
                              "₹ ${moneyFormat(widget.myExercise[index]["price"].toString())}",
                              style: GoogleFonts.gothicA1(
                                  fontSize: kEighteenFont,
                                  color: Gold,
                                  fontWeight: kFW700),
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
        );
      }),
    );
  }
}

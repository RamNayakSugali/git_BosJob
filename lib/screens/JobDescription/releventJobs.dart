// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:ui';

import 'package:dio/dio.dart' as dio;

import '../../models/job_model.dart';
import '../../utils/export_file.dart';

class ReleventJobs extends StatefulWidget {
  Map? releventData;
  ReleventJobs({super.key, this.releventData});

  @override
  State<ReleventJobs> createState() => _ReleventJobsPageState();
}

class _ReleventJobsPageState extends State<ReleventJobs> {
  var id = Get.arguments;
  Map individualjob = {};
  bool isLoading = false;
  var _isAlreadyAdded = false;
  List<JobModel> favouriteJobs = [];
  Future jobHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.getindividualjob(id);
    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      individualjob = data["data"]["data"];
    }
    setState(() {
      _isAlreadyAdded = favouriteJobs
              .where(
                  (element) => element.id == individualjob["job_details"]['id'])
              .toList()
              .isNotEmpty
          ? true
          : false;
    });
    setState(() {
      isLoading = false;
    });
  }

  Future favoriteJobListHandler() async {
    setState(() {
      isLoading = true;
    });
    favouriteJobs.clear();

    dio.Response response = await Services.getFavoriteJobList();

    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        response.data['data'].forEach((v) {
          if (v['is_favourated'] == "1") {
            favouriteJobs.add(JobModel.fromJson(v));
          }
        });
      }
    }
    await browseJobHandler();
    setState(() {
      isLoading = false;
    });
  }

  List<JobModel> allJobs = [];
  Future browseJobHandler() async {
    allJobs.clear();
    dio.Response response = await Services.getAllJobs();
    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        response.data['data'].forEach((v) => allJobs.add(JobModel.fromJson(v)));
      }
    }
  }

  Future addJobToWishList(int id) async {
    dio.Response response = await Services.addOrRemoveJobFromWishlist(id);

    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        Fluttertoast.showToast(msg: response.data['data']['message']);
      }
      favoriteJobListHandler();
    }
  }

  Future applyForJobHandler(int id) async {
    dio.Response response = await Services.applyForJob(id);

    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        Fluttertoast.showToast(msg: response.data['data']['message']);
      }
      browseJobHandler();
    }
  }

  @override
  void initState() {
    super.initState();
    favoriteJobListHandler();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == false && widget.releventData!.isNotEmpty
        ? Scaffold(
            backgroundColor: kBackground,
            appBar: AppBar(
              iconTheme: const IconThemeData(color: white),
              backgroundColor: darktwo,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'Job',
                style: GoogleFonts.gothicA1(
                    letterSpacing: 1,
                    fontSize: kEighteenFont,
                    color: white,
                    fontWeight: kFW700),
              ),
              actions: [
                Icon(
                  Icons.favorite_border_outlined,
                  color: white,
                  size: 25.sp,
                ),
                SizedBox(
                  width: 13.w,
                ),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  //"flutter",

                                  widget.releventData!["title"].toString(),

                                  style: GoogleFonts.gothicA1(
                                      fontSize: kEighteenFont,
                                      color: white,
                                      fontWeight: kFW700),
                                ),
                                // Column(
                                //   children: [
                                //     // Icon(Icons.remove_red_eye_outlined),
                                //     Icon(Icons.remove_red_eye_sharp,
                                //         color: white, size: 20.sp),
                                //     Text(
                                //       "101",
                                //       style: GoogleFonts.gothicA1(
                                //           fontSize: 8.sp, color: white, fontWeight: kFW500),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  // "data",
                                  widget.releventData!["job_type"] != null
                                      ? widget.releventData!["job_type"]
                                          ["title"]
                                      : "-",
                                  style: GoogleFonts.gothicA1(
                                      fontSize: 11.sp,
                                      color: white,
                                      fontWeight: kFW500),
                                ),
                                // SizedBox(width: 30.w),
                                Text(
                                  '${widget.releventData!["min_exp"] ?? "-"}'
                                  ' - '
                                  '${widget.releventData!["max_exp"] ?? "-"}Years',
                                  style: GoogleFonts.gothicA1(
                                      fontSize: 11.sp,
                                      color: white,
                                      fontWeight: kFW500),
                                ),
                                // SizedBox(width: 30.w),
                                Text(
                                  // "data",
                                  widget.releventData!["job_type"]!["type"]
                                      .toString(),

                                  style: GoogleFonts.gothicA1(
                                      fontSize: 11.sp,
                                      color: white,
                                      fontWeight: kFW500),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                widget.releventData!["company"]!["address"]
                                            .toString() !=
                                        "null"
                                    ? Row(
                                        children: [
                                          const Icon(Icons.location_on_outlined,
                                              color: Gold),
                                          SizedBox(width: 5.h),
                                          Container(
                                            width: 180.w,
                                            child: Text(
                                              // "Hyderabad",
                                              widget.releventData!["company"]![
                                                      "address"]
                                                  .toString(),

                                              style: GoogleFonts.gothicA1(
                                                  fontSize: kTwelveFont,
                                                  color: white,
                                                  fontWeight: kFW700),
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox(),
                                Text(
                                  // "data",
                                  '${widget.releventData!["min_sal"]}LPA'
                                  ' - '
                                  '${widget.releventData!["max_sal"]}LPA',
                                  style: GoogleFonts.gothicA1(
                                      fontSize: 15.sp,
                                      color: Gold,
                                      fontWeight: kFW900),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Text("Skill Requirements",
                            style: GoogleFonts.gothicA1(
                                fontSize: kSixteenFont,
                                color: white,
                                fontWeight: kFW700)),

                        SizedBox(
                          height: 15.h,
                        ),

                        // Text(
                        //     //"Job Description",
                        //     individualjob["job_qualification"][0]["title"],
                        //     style: GoogleFonts.gothicA1(
                        //         fontSize: kFourteenFont,
                        //         color: white,
                        //         fontWeight: kFW500)),
                        // SizedBox(
                        //   height: 10.h,
                        // ),
                        GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                widget.releventData!["job_skills"].length,

                            //$.[]data.job_qualification.[]job_skill_masters.[]skill_master.title.length
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 2,
                                    //childAspectRatio: (0.31 / 0.57)),
                                    childAspectRatio: (1 / 0.25)),
                            itemBuilder: ((context, index) {
                              return widget.releventData!["job_skills"][index]
                                          ["skill_master"] !=
                                      null
                                  ? Container(
                                      margin: EdgeInsets.only(
                                          bottom: 5.h, right: 5.w),
                                      padding: EdgeInsets.only(
                                          left: 10.w,
                                          right: 10.w,
                                          top: 5.h,
                                          bottom: 5.h),
                                      width: double.infinity,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        color: customgrey,
                                      ),
                                      // decoration: BoxDecoration(
                                      //   borderRadius:
                                      //       BorderRadius.circular(20.r),
                                      //   boxShadow: [
                                      //     BoxShadow(
                                      //       blurRadius: 20,
                                      //       spreadRadius: 5,
                                      //       color: const Color.fromARGB(
                                      //               255, 13, 12, 12)
                                      //           .withOpacity(0.1),
                                      //     )
                                      //   ],
                                      //   color: white,
                                      //   //  gradient:LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors:[grey.withOpacity(0.5),grey1.withOpacity(0.5),Color.fromARGB(255, 58, 55, 55).withOpacity(0.1),
                                      //   //  ])
                                      // ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 120.w,
                                            child: Text(
                                              // "data",
                                              //   individualjob["job_details"]!["job_type"]!["type"]
                                              //    .toString(),
                                              widget.releventData!["job_skills"]
                                                              [index]
                                                          ["skill_master"] !=
                                                      null
                                                  ? widget.releventData![
                                                          "job_skills"][index]
                                                      ["skill_master"]["title"]
                                                  : " ",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.gothicA1(
                                                  fontSize: 11.sp,
                                                  color: darkGrey,
                                                  fontWeight: kFW600),
                                            ),
                                          ),
                                        ],
                                      ))
                                  : SizedBox();
                            })),
                        // :    Text(
                        //             //   $.[]data.job_qualification.[]job_skill_masters.[]rating
                        //           "No Skills",
                        //             style: GoogleFonts.gothicA1(
                        //                 fontSize: 11.sp,
                        //                 color: darkGrey,
                        //                 fontWeight: kFW600),
                        //           ),
                        SizedBox(height: 10.h),
                        Text(
                          // "data",
                          parse(widget.releventData!["summary"].toString())
                              .body!
                              .text,
                          // individualjob["job_details"]!["summary"].toString(),
                          style: GoogleFonts.gothicA1(
                              fontSize: kFourteenFont,
                              color: white,
                              fontWeight: kFW400),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                addJobToWishList(
                                    individualjob["job_details"]['id']);
                              },
                              child: GlassmorphicContainer(
                                height: 41.h,
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
                                          _isAlreadyAdded == false
                                              ? "Add to Wishlist"
                                              : "Already Added",
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
                                allJobs
                                        .where((element) =>
                                            element.id ==
                                            widget.releventData!["id"])
                                        .toList()
                                        .isNotEmpty
                                    ? null
                                    : applyForJobHandler(
                                        widget.releventData!["id"]);
                              },
                              child: GlassmorphicContainer(
                                height: 41.h,
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
                                      child: Text(
                                          allJobs
                                                  .where((element) =>
                                                      element.id ==
                                                      widget
                                                          .releventData!["id"])
                                                  .toList()
                                                  .isNotEmpty
                                              ? "Applied"
                                              : "Apply",
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
                        // SizedBox(height: 10.h),
                        // individualjob['individual_jobs'].length == 0
                        //     ? const SizedBox()
                        //     : Text(
                        //         "Relavent Jobs",
                        //         style: GoogleFonts.gothicA1(
                        //           fontSize: kSixteenFont,
                        //           color: white,
                        //           fontWeight: kFW700,
                        //         ),
                        //       ),
                        // individualjob['individual_jobs'].length == 0
                        //     ? const SizedBox()
                        //     : SizedBox(height: 15.h),
                        // individualjob['individual_jobs'].length == 0
                        //     ? const SizedBox()
                        //     : GridView.builder(
                        //         shrinkWrap: true,
                        //         physics: const NeverScrollableScrollPhysics(),
                        //         itemCount: individualjob['individual_jobs'].length,
                        //         gridDelegate:
                        //             const SliverGridDelegateWithFixedCrossAxisCount(
                        //           crossAxisCount: 2,
                        //           mainAxisSpacing: 2,
                        //           childAspectRatio: (0.31 / 0.50),
                        //         ),
                        //         itemBuilder: ((context, index) {
                        //           return Column(
                        //             crossAxisAlignment: CrossAxisAlignment.stretch,
                        //             children: [
                        //               Container(
                        //                   height: 170.h,
                        //                   margin: EdgeInsets.only(right: 7.w),
                        //                   decoration: BoxDecoration(
                        //                       border: const GradientBoxBorder(
                        //                         gradient:
                        //                             LinearGradient(colors: [grey, Gold]),
                        //                         width: 1,
                        //                       ),
                        //                       borderRadius: BorderRadius.circular(15.r)),
                        //                   child: Image.asset(
                        //                     'assets/images/no image.jpg',
                        //                   )
                        //                   // : CachedNetworkImage(
                        //                   //     imageUrl:
                        //                   //         "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80",
                        //                   //     errorWidget: (context, url, error) =>
                        //                   //         Image.asset(
                        //                   //           'assets/images/no image.jpg',
                        //                   //         ),
                        //                   //     placeholder: (context, url) => Image.asset(
                        //                   //           'assets/images/no image.jpg',
                        //                   //         )),

                        //                   // : Image(
                        //                   //     image: NetworkImage(kCourseURL +
                        //                   //         individualcourseview[
                        //                   //                 "other_relavant_courses"][index]
                        //                   //             ["course_banner"]),
                        //                   //     errorBuilder: (c, o, s) => Center(
                        //                   //       child: Text(
                        //                   //         "Unable to Load Image",
                        //                   //         style: GoogleFonts.gothicA1(
                        //                   //           fontSize: kFourteenFont,
                        //                   //           color: white,
                        //                   //           fontWeight: kFW700,
                        //                   //         ),
                        //                   //       ),
                        //                   //     ),
                        //                   //   ),
                        //                   ),
                        //               SizedBox(
                        //                 height: 4.w,
                        //               ),
                        //               Column(
                        //                 mainAxisAlignment: MainAxisAlignment.start,
                        //                 crossAxisAlignment: CrossAxisAlignment.start,
                        //                 children: [
                        //                   Text(
                        //                     individualjob['individual_jobs'][index]
                        //                         ["title"],
                        //                     maxLines: 1,
                        //                     style: GoogleFonts.gothicA1(
                        //                       fontSize: 15.sp,
                        //                       color: white,
                        //                       fontWeight: kFW700,
                        //                     ),
                        //                   ),
                        //                   SizedBox(
                        //                     height: 3.h,
                        //                   ),
                        //                   Row(
                        //                     children: [
                        //                       Text(
                        //                         "No.of Opennings",
                        //                         style: GoogleFonts.gothicA1(
                        //                           fontSize: kTwelveFont,
                        //                           color: white,
                        //                           fontWeight: kFW700,
                        //                         ),
                        //                       ),
                        //                       SizedBox(
                        //                         width: 10.w,
                        //                       ),
                        //                       Text(
                        //                         '${individualjob['individual_jobs'][index]["no_openings"]}',
                        //                         style: GoogleFonts.gothicA1(
                        //                           fontSize: kFourteenFont,
                        //                           color: Gold,
                        //                           fontWeight: kFW700,
                        //                         ),
                        //                       ),
                        //                     ],
                        //                   ),
                        //                 ],
                        //               ),
                        //             ],
                        //           );
                        //         }),
                        //       )
                      ],
                    ),
                  ),
                ),
              ],
            ))
        : const Center(
            child: CircularProgressIndicator(
            color: Gold,
          ));
  }
}

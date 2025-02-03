// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:ui';

import 'package:bossjobs/screens/JobDescription/releventJobs.dart';

import '../../models/job_model.dart';
import '../../utils/export_file.dart';
import 'package:dio/dio.dart' as dio;

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  Future jobDescriptionwishlistHandler(int id) async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.jobdescriptionWhishlist(id);

    try {
      if (data["data"]["data"]["status"] == "1") {
        Fluttertoast.showToast(
          msg: data["data"]["data"]["message"],
        );
        jobHandler();
      } else {
        Fluttertoast.showToast(
          msg: data["data"]["data"]["message"],
        );
        jobHandler();
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
      jobHandler();
    }
    jobHandler();
    setState(() {
      isLoading = false;
    });
  }

  Future addJobToWishList(int id) async {
    dio.Response response = await Services.addOrRemoveJobFromWishlist(id);

    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        setState(() {
          // _isAlreadyAdded=
        });
        Fluttertoast.showToast(msg: response.data['data']['message']);
        jobHandler();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    favoriteJobListHandler();
    // jobHandler();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == false && individualjob.isNotEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Job Position",
                      style: GoogleFonts.gothicA1(
                          fontSize: 11.sp, color: white, fontWeight: kFW900),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        individualjob["job_details"]!["title"].toString(),
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
                      //           fontSize: 8.sp,
                      //           color: white,
                      //           fontWeight: kFW500),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Qualification",
                              style: GoogleFonts.gothicA1(
                                  fontSize: 10.sp,
                                  color: white,
                                  fontWeight: kFW900),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              individualjob["job_details"]!["almamater_masters"]
                                      .isEmpty
                                  ? "No name"
                                  : individualjob["job_details"]![
                                          "almamater_masters"][0]["name"] ??
                                      "",
                              style: GoogleFonts.gothicA1(
                                  fontSize: 12.sp,
                                  color: white,
                                  fontWeight: kFW500),
                            )
                          ]),
                      Column(children: [
                        Text(
                          "Experience",
                          style: GoogleFonts.gothicA1(
                              fontSize: 10.sp,
                              color: white,
                              fontWeight: kFW900),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          // "data",
                          '${individualjob["job_details"]?["min_exp"]}'
                                  ' - '
                                  '${individualjob["job_details"]?["max_exp"]}Years' ??
                              "",
                          style: GoogleFonts.gothicA1(
                              fontSize: 12.sp,
                              color: white,
                              fontWeight: kFW500),
                        )
                      ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Job Type",
                              style: GoogleFonts.gothicA1(
                                  fontSize: 10.sp,
                                  color: white,
                                  fontWeight: kFW900),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              // "data",
                              individualjob["job_details"]!["job_type"]![
                                      "title"]
                                  .toString(),

                              style: GoogleFonts.gothicA1(
                                  fontSize: 11.sp,
                                  color: white,
                                  fontWeight: kFW500),
                            )
                          ]),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Job Preference",
                              style: GoogleFonts.gothicA1(
                                  fontSize: 10.sp,
                                  color: white,
                                  fontWeight: kFW900),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              individualjob["job_details"]!["join_period"]
                                      ["title"] ??
                                  "-",
                              style: GoogleFonts.gothicA1(
                                  fontSize: 12.sp,
                                  color: white,
                                  fontWeight: kFW500),
                            )
                          ]),
                      Column(children: [
                        Text(
                          "No.Of Positions",
                          style: GoogleFonts.gothicA1(
                              fontSize: 10.sp,
                              color: white,
                              fontWeight: kFW900),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          "${individualjob["job_details"]["no_openings"] ?? "-"}",
                          style: GoogleFonts.gothicA1(
                              fontSize: 12.sp,
                              color: white,
                              fontWeight: kFW500),
                        )
                      ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Location",
                              style: GoogleFonts.gothicA1(
                                  fontSize: 10.sp,
                                  color: white,
                                  fontWeight: kFW900),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              individualjob["job_details"]!["cities"][0]
                                      ["name"] ??
                                  "-",
                              style: GoogleFonts.gothicA1(
                                  fontSize: 11.sp,
                                  color: white,
                                  fontWeight: kFW500),
                            )
                          ]),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "CTC Offered",
                  style: GoogleFonts.gothicA1(
                      fontSize: 10.sp, color: white, fontWeight: kFW900),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    individualjob["job_details"]!["company"]!["address"]
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
                                  individualjob["job_details"]!["company"]![
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
                      '${individualjob["job_details"]?["min_sal"]}LPA'
                              ' - '
                              '${individualjob["job_details"]?["max_sal"]}LPA' ??
                          "",
                      style: GoogleFonts.gothicA1(
                          fontSize: 15.sp, color: Gold, fontWeight: kFW900),
                    ),
                  ],
                )
              ]),
              SizedBox(
                height: 20.h,
              ),
              Text("Skill Requirements",
                  style: GoogleFonts.gothicA1(
                      fontSize: 14.sp, color: white, fontWeight: kFW700)),
              SizedBox(
                height: 8.h,
              ),
              // GridView.builder(
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemCount: 0,
              //     //  individualjob["job_qualification"][0]
              //     //         ["job_skill_masters"]
              //     //     .length,
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2,
              //         mainAxisSpacing: 2,
              //         //childAspectRatio: (0.31 / 0.57)),
              //         childAspectRatio: (1 / 0.25)),
              //     itemBuilder: ((context, index) {
              //       return individualjob["job_qualification"][0]
              //                   ["job_skill_masters"][index]["skill_master"] !=
              //               null
              //           ? Container(
              //               margin: EdgeInsets.only(bottom: 5.h, right: 5.w),
              //               padding: EdgeInsets.only(
              //                   left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
              //               width: double.infinity,
              //               alignment: Alignment.center,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(20.r),
              //                 color: customgrey,
              //               ),
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   SizedBox(
              //                     width: 100.w,
              //                     child: Text(
              //                       // "data",
              //                       //   individualjob["job_details"]!["job_type"]!["type"]
              //                       //    .toString(),
              //                       individualjob["job_qualification"][0]
              //                                       ["job_skill_masters"][index]
              //                                   ["skill_master"] !=
              //                               null
              //                           ? individualjob["job_qualification"][0]
              //                                   ["job_skill_masters"][index]
              //                               ["skill_master"]["title"]
              //                           : " ",
              //                       maxLines: 1,
              //                       overflow: TextOverflow.ellipsis,
              //                       style: GoogleFonts.gothicA1(
              //                           fontSize: 11.sp,
              //                           color: darkGrey,
              //                           fontWeight: kFW600),
              //                     ),
              //                   ),
              //                   Text(
              //                     individualjob["job_qualification"][0]
              //                                     ["job_skill_masters"][index]
              //                                 ["skill_master"] !=
              //                             null
              //                         ? "${individualjob["job_qualification"][0]["job_skill_masters"][index]["rating"] ?? " "} / 10"
              //                         : " ",
              //                     style: GoogleFonts.gothicA1(
              //                         fontSize: 11.sp,
              //                         color: darkGrey,
              //                         fontWeight: kFW600),
              //                   ),
              //                 ],
              //               ))
              //           : const SizedBox();
              //     })),

              SizedBox(
                height: 8.h,
              ),
              Text("Recruiter",
                  style: GoogleFonts.gothicA1(
                      fontSize: 14.sp, color: white, fontWeight: kFW700)),
              SizedBox(
                height: 8.h,
              ),
              Text(individualjob["job_details"]["company"]["title"] ?? "-",
                  style: GoogleFonts.gothicA1(
                      fontSize: 12.sp, color: white, fontWeight: kFW500)),
              SizedBox(
                height: 20.h,
              ),
              Text("Job Summary",
                  style: GoogleFonts.gothicA1(
                      fontSize: 14.sp, color: white, fontWeight: kFW700)),
              SizedBox(
                height: 8.h,
              ),
              Text(
                parse(individualjob["job_details"]!["summary"].toString())
                    .body!
                    .text,
                style: GoogleFonts.gothicA1(
                    fontSize: 12.sp, color: white, fontWeight: kFW500),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text("Roles & Resposibilities",
                  style: GoogleFonts.gothicA1(
                      fontSize: 14.sp, color: white, fontWeight: kFW700)),
              SizedBox(height: 10.h),
              for (int j = 0;
                  j <
                      individualjob["job_details"]!["roles"]
                              .toString()
                              .split('.')
                              .length -
                          1;
                  j++) ...[
                Container(
                  padding: EdgeInsets.only(bottom: 8.r),
                  child: Row(
                    children: [
                      Icon(
                        Icons.near_me_rounded,
                        size: 8.sp.sp,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(
                        width: 300.w,
                        child: Text(
                          parse(individualjob["job_details"]!["roles"]
                                  .toString()
                                  .split('.')[j])
                              .body!
                              .text,
                          maxLines: 3,
                          style: GoogleFonts.gothicA1(
                              fontSize: 12.sp,
                              color: white,
                              fontWeight: kFW500),
                        ),
                      )
                    ],
                  ),
                )
              ],
              SizedBox(
                height: 8.h,
              ),
              Text("Other Info",
                  style: GoogleFonts.gothicA1(
                      fontSize: 14.sp, color: white, fontWeight: kFW700)),
              SizedBox(height: 10.h),
              for (int j = 0;
                  j <
                      individualjob["job_details"]!["job_otherinfo"]
                              .toString()
                              .split('.')
                              .length -
                          1;
                  j++) ...[
                Container(
                  padding: EdgeInsets.only(bottom: 8.r),
                  child: Row(
                    children: [
                      Icon(
                        Icons.near_me_rounded,
                        size: 8.sp.sp,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Container(
                        width: 300.w,
                        child: Text(
                          parse(individualjob["job_details"]!["job_otherinfo"]
                                  .toString()
                                  .split('.')[j])
                              .body!
                              .text,
                          maxLines: 3,
                          style: GoogleFonts.gothicA1(
                              fontSize: 12.sp,
                              color: white,
                              fontWeight: kFW500),
                        ),
                      )
                    ],
                  ),
                )
              ],
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      addJobToWishList(individualjob["job_details"]['id']);
                    },
                    child: GlassmorphicContainer(
                      height: 35.h,
                      width: 120.w,
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
                            child: Text(
                                individualjob["job_details"]["is_favourated"] ==
                                        0
                                    // _isAlreadyAdded == false
                                    ? "Add to Wishlist"
                                    : "Already Added",
                                style: GoogleFonts.gothicA1(
                                    fontSize: 12.sp,
                                    color: white,
                                    fontWeight: kFW900)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      jobDescriptionwishlistHandler(
                          individualjob["job_details"]['id']);
                    },
                    child: GlassmorphicContainer(
                      height: 35.h,
                      width: 120.w,
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
                            child: Text(
                                individualjob["job_details"]["is_applied"] == 1
                                    ? "Applied"
                                    : "Apply",

                                // "Apply",

                                style: GoogleFonts.gothicA1(
                                    fontSize: 12.sp,
                                    color: white,
                                    fontWeight: kFW900)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              individualjob['individual_jobs'].length == 0
                  ? const SizedBox()
                  : Text(
                      "Relavent Jobs",
                      style: GoogleFonts.gothicA1(
                        fontSize: 14.sp,
                        color: white,
                        fontWeight: kFW900,
                      ),
                    ),
              individualjob['individual_jobs'].length == 0
                  ? const SizedBox()
                  : SizedBox(height: 15.h),
              individualjob['individual_jobs'].length == 0
                  ? const SizedBox()
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: individualjob['individual_jobs'].length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 2,
                        childAspectRatio: (0.31 / 0.50),
                      ),
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(ReleventJobs(
                              releventData: individualjob['individual_jobs']
                                  [index],
                            ));
                          },
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                  height: 120.h,
                                  margin: EdgeInsets.all(8.0),
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: const GradientBoxBorder(
                                        gradient: LinearGradient(
                                            colors: [grey, Gold]),
                                        width: 1,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(15.r)),
                                  child: Image.asset(
                                    'assets/images/logo.png',
                                    width: 150.w,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    individualjob['individual_jobs'][index]
                                        ["title"],
                                    maxLines: 1,
                                    style: GoogleFonts.gothicA1(
                                      fontSize: 12.sp,
                                      color: white,
                                      fontWeight: kFW900,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "No.of Opennings",
                                        style: GoogleFonts.gothicA1(
                                          fontSize: kTwelveFont,
                                          color: white,
                                          fontWeight: kFW900,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text(
                                        '${individualjob['individual_jobs'][index]["no_openings"]}',
                                        style: GoogleFonts.gothicA1(
                                          fontSize: 12.sp,
                                          color: Gold,
                                          fontWeight: kFW900,
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
                    )
            ],
          )
        : const Center(
            child: CircularProgressIndicator(
            color: Gold,
          ));
  }
}

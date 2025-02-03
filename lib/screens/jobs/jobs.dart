import 'dart:ui';

import 'package:bossjobs/models/job_model.dart';

import '../../utils/export_file.dart';
import 'package:dio/dio.dart' as dio;

class Jobs extends StatefulWidget {
  bool? isHome;
  Jobs({super.key, this.isHome});

  @override
  State<Jobs> createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  bool isLoading = false;
  List<JobModel> allJobs = [];
  List<JobModel> allOriginalJobs = [];
  List<JobModel> appliedJobs = [];

  Future browseJobHandler() async {
    setState(() {
      isLoading = true;
    });

    allJobs.clear();

    dio.Response response = await Services.getAllJobs();
    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        response.data['data'].forEach((v) => allJobs.add(JobModel.fromJson(v)));
        response.data['data']
            .forEach((v) => allOriginalJobs.add(JobModel.fromJson(v)));
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  Future appliedJobHandler() async {
    setState(() {
      isLoading = true;
    });

    appliedJobs.clear();

    dio.Response response = await Services.getAppliedJobs();
    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        response.data['data']
            .forEach((v) => appliedJobs.add(JobModel.fromJson(v)));
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  Future addJobToWishList(int id, int index) async {
    dio.Response response = await Services.addOrRemoveJobFromWishlist(id);
    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        if (response.data['data']["status"] == 1) {
          setState(() {
            allJobs[index].isFavourite = 1;
          });
          Fluttertoast.showToast(msg: response.data['data']['message']);
        } else {
          setState(() {
            allJobs[index].isFavourite = 2;
          });
          Fluttertoast.showToast(msg: response.data['data']['message']);
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
            allJobs[index].isApplied = 1;
          });
          Fluttertoast.showToast(msg: response.data['data']['message']);
        } else {
          setState(() {
            allJobs[index].isApplied = 2;
          });
          Fluttertoast.showToast(msg: response.data['data']['message']);
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    browseJobHandler();
    appliedJobHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: widget.isHome == true
          ? AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              backgroundColor: darktwo,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'Browse Jobs',
                style: GoogleFonts.gothicA1(
                  letterSpacing: 1,
                  fontSize: kEighteenFont,
                  color: white,
                  fontWeight: kFW700,
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(KWish_List);
                      //  Get.toNamed(KWish_List);
                    },
                    child: Image.asset(
                      'assets/images/love.png',
                      width: 18.w,
                    ),
                  ),
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
            )
          : AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: darktwo,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'Browse Jobs',
                style: GoogleFonts.gothicA1(
                  letterSpacing: 1,
                  fontSize: kEighteenFont,
                  color: white,
                  fontWeight: kFW700,
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(KWish_List);
                      //  Get.toNamed(KWish_List);
                    },
                    child: Image.asset(
                      'assets/images/love.png',
                      width: 18.w,
                    ),
                  ),
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
            ),
      body: Stack(
        children: [
          const Background(),
          Container(
            margin: EdgeInsets.all(15.w),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 8.h),
                  TextFormField(
                    maxLength: 8,
                    decoration: InputDecoration(
                      counter: const Offstage(),
                      contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                      prefixIcon: const Icon(Icons.search, color: Gold),
                      filled: true,
                      fillColor: white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: const BorderSide(
                          color: white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: const BorderSide(
                          color: white,
                        ),
                      ),
                      hintText: "Job Title",
                    ),
                    onChanged: (value) {
                      setState(() {
                        allJobs = allOriginalJobs
                            .where((element) => element.title!
                                .toLowerCase()
                                .contains(value.toString().toLowerCase()))
                            .toList();
                        debugPrint("$allJobs");
                      });
                    },
                    onTap: () {
                      //Get.toNamed(KSearch);
                    },
                  ),
                  SizedBox(height: 8.h),
                  isLoading == false
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: allJobs.length,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  KJob_Description,
                                  arguments: allJobs[index].id ?? "",
                                );
                              },
                              child: GlassmorphicContainer(
                                margin: EdgeInsets.only(bottom: 8.h),
                                // height: 210.h,
                                height: 180.h,
                                width: double.infinity,
                                borderRadius: 10.r,
                                blur: 15,
                                alignment: Alignment.center,
                                border: 2,
                                linearGradient: LinearGradient(
                                  colors: [
                                    white.withOpacity(0.15),

                                    white.withOpacity(0.15),

                                    // kBackground.withOpacity(0.7),
                                    // kBackground.withOpacity(0.7)
                                    // white.withOpacity(0.15),
                                    // white.withOpacity(0.15)
                                  ],
                                  // begin: Alignment.topLeft,
                                  // end: Alignment.bottomRight,
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
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      allJobs[index].title ??
                                                          "",
                                                      style:
                                                          GoogleFonts.gothicA1(
                                                        fontSize: kSixteenFont,
                                                        color: whitetwo,
                                                        fontWeight: kFW700,
                                                      ),
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Text(
                                                      allJobs[index]
                                                          .company!
                                                          .title!,
                                                      style:
                                                          GoogleFonts.gothicA1(
                                                        fontSize: kTwelveFont,
                                                        color: klightdark,
                                                        fontWeight: kFW500,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Icon(
                                                          Icons.remove_red_eye,
                                                          color: whitetwo,
                                                          size: kSixteenFont,
                                                        ),
                                                        Text(
                                                          allJobs[index]
                                                              .noOfViews
                                                              .toString(),
                                                          // $.[]data.[]no_of_views
                                                          //"101",
                                                          maxLines: 1,
                                                          style: GoogleFonts
                                                              .gothicA1(
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
                                                            allJobs[index].id!,
                                                            index);
                                                        setState(() {});
                                                      },
                                                      child: Icon(
                                                        allJobs[index]
                                                                    .isFavourite ==
                                                                1
                                                            ? Icons
                                                                .favorite_rounded
                                                            : Icons
                                                                .favorite_outline_rounded,
                                                        color: allJobs[index]
                                                                    .isFavourite ==
                                                                1
                                                            ? Colors.red
                                                            : whitetwo,
                                                        size: 24,
                                                      ),
                                                    ),
                                                    // IconButton(
                                                    //   onPressed: () {
                                                    //     addJobToWishList(
                                                    //         allJobs[index]
                                                    //             .id!);
                                                    //     setState(() {});
                                                    //   },
                                                    //   icon: Icon(
                                                    //     allJobs[index]
                                                    //                 .isFavourite ==
                                                    //             1
                                                    //         ? Icons
                                                    //             .favorite_rounded
                                                    //         : Icons
                                                    //             .favorite_outline_rounded,
                                                    //     color: allJobs[index]
                                                    //                 .isFavourite ==
                                                    //             1
                                                    //         ? Colors.red
                                                    //         : whitetwo,
                                                    //     size: 24,
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            // SizedBox(
                                            //   height: 8.h,
                                            // ),

                                            // SizedBox(
                                            //   height: 8.h,
                                            // ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  //$.[]data.[]almamater_masters.[]name
                                                  //   allJobs.almamater_masters[index] ?? "",
                                                  //  allJobs[index].title ?? "",
                                                  //     allJobs[0]["almamater_masters"][0]["AlmamaterMasters"]["name"]??"",
                                                  allJobs[index]
                                                      .almamaterMasters![0]
                                                      .name!,
                                                  style: GoogleFonts.gothicA1(
                                                    fontSize: 11.sp,
                                                    color: whitetwo,
                                                    fontWeight: kFW500,
                                                  ),
                                                ),
                                                Text(
                                                  '${allJobs[index].minExp} - ${allJobs[index].maxExp} Years',
                                                  style: GoogleFonts.gothicA1(
                                                    fontSize: 11.sp,
                                                    color: whitetwo,
                                                    fontWeight: kFW500,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/link.png',
                                                      width: 18.w,
                                                    ),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    Text(
                                                      allJobs[index]
                                                          .cities![0]
                                                          .name!,
                                                      //  "Hyderabad, Telangana",
                                                      style:
                                                          GoogleFonts.gothicA1(
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
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
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.r),
                                                          color:
                                                              white.withOpacity(
                                                                  0.5)),
                                                      padding:
                                                          EdgeInsets.all(5.r),
                                                      child: Text(
//   allJobs[index]
                                                        // .almamaterMasters![0]
                                                        // .name!,

//  $.[]data.[]job_skills.[]skill_master.title
                                                        //   "Skill will be covered here to show   ",
                                                        allJobs[index]
                                                            .jobSkills![0]
                                                            .skillMaster!
                                                            .title!,
                                                        style: GoogleFonts
                                                            .gothicA1(
                                                          fontSize: 11.sp,
                                                          color: darktwo,
                                                          fontWeight: kFW600,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    allJobs[index]
                                                                .jobSkills!
                                                                .length >=
                                                            2
                                                        ? Container(
                                                            width: 200.w,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(5
                                                                            .r),
                                                                color: white
                                                                    .withOpacity(
                                                                        0.5)),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5.r),
                                                            child: Text(
                                                              allJobs[index]
                                                                  .jobSkills![1]
                                                                  .skillMaster!
                                                                  .title!,
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              // "Skill will be covered here to show   ",
                                                              style: GoogleFonts
                                                                  .gothicA1(
                                                                fontSize: 11.sp,
                                                                color: darktwo,
                                                                fontWeight:
                                                                    kFW600,
                                                              ),
                                                            ))
                                                        : SizedBox()
                                                  ],
                                                ),
                                                Column(
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment
                                                  //         .end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      allJobs[index]
                                                              .jobType!
                                                              .title ??
                                                          "",
                                                      //   "Salary",
                                                      style:
                                                          GoogleFonts.gothicA1(
                                                        fontSize: 8.sp,
                                                        color: whitetwo,
                                                        fontWeight: kFW600,
                                                      ),
                                                    ),
                                                    SizedBox(height: 5.h),
                                                    Text(
                                                      '${allJobs[index].minSal} - ${allJobs[index].maxSal} LPA',
                                                      style:
                                                          GoogleFonts.gothicA1(
                                                        fontSize: kTwelveFont,
                                                        color: Gold,
                                                        fontWeight:
                                                            FontWeight.w900,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                        backgroundColor:
                                                            kBackground,
                                                        radius: 15.r,
                                                        child: Image.asset(
                                                            'assets/images/darkWoman.png',
                                                            height: 52.h)),
                                                    SizedBox(
                                                      width: 8.w,
                                                    ),
                                                    Text(
                                                      '${allJobs[index].industry!.title}',
                                                      maxLines: 1,
                                                      style:
                                                          GoogleFonts.gothicA1(
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
                                                  onTap: allJobs[index]
                                                              .isApplied ==
                                                          1
                                                      ? () {}
                                                      : () {
                                                          applyForJobHandler(
                                                              allJobs[index]
                                                                  .id!,
                                                              index);
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            blurRadius: 20,
                                                            spreadRadius: 5,
                                                            color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        11,
                                                                        2,
                                                                        2)
                                                                .withOpacity(
                                                                    0.4)),
                                                      ],
                                                      gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topLeft,
                                                        end: Alignment
                                                            .bottomRight,
                                                        colors: [
                                                          grey.withOpacity(0.5),
                                                          grey1
                                                              .withOpacity(0.5),
                                                          const Color.fromARGB(
                                                                  255,
                                                                  58,
                                                                  55,
                                                                  55)
                                                              .withOpacity(0.1),
                                                        ],
                                                      ),
                                                    ),
                                                    child: Text(
                                                      allJobs[index]
                                                                  .isApplied ==
                                                              1
                                                          ? "Applied"
                                                          : "Apply",
                                                      style:
                                                          GoogleFonts.gothicA1(
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
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            color: Gold,
                          ),
                        ),
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

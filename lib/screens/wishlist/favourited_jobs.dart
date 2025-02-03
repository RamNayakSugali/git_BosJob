import 'dart:ui';
import 'package:bossjobs/models/job_model.dart';
import '../../../utils/export_file.dart';
import 'package:dio/dio.dart' as dio;

class FavoriteJobList extends StatefulWidget {
  List? favouriteJobs;
  FavoriteJobList({super.key, this.favouriteJobs});

  @override
  State<FavoriteJobList> createState() => _FavoriteJobListState();
}

class _FavoriteJobListState extends State<FavoriteJobList> {
  bool isLoading = false;
  // List<JobModel> favouriteJobs = [];

  // Future favoriteJobListHandler() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   favouriteJobs.clear();

  //   dio.Response response = await Services.getFavoriteJobList();

  //   if (response.statusCode == 200) {
  //     if (response.data['data'] != null) {
  //       response.data['data'].forEach((v) {
  //         if (v['is_favourated'] == "1") {
  //           favouriteJobs.add(JobModel.fromJson(v));
  //         }
  //       });
  //     }
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  Future removeJobFromWishList(int id) async {
    dio.Response response = await Services.addOrRemoveJobFromWishlist(id);

    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        Fluttertoast.showToast(msg: response.data['data']['message']);
      }
    }
  }

  Future applyForJobHandler(int id) async {
    dio.Response response = await Services.applyForJob(id);

    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        Fluttertoast.showToast(msg: response.data['data']['message']);
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.favouriteJobs!.length,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(
                    KJob_Description,
                    arguments: widget.favouriteJobs![index].id ?? "",
                  );
                },
                child: GlassmorphicContainer(
                  margin: EdgeInsets.only(bottom: 15.h),
                  // height: 210.h,
                  height: 200.h,
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
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // mainAxisAlignment:
                            //     MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.favouriteJobs![index].title ??
                                            "",
                                        style: GoogleFonts.gothicA1(
                                          fontSize: kSixteenFont,
                                          color: whitetwo,
                                          fontWeight: kFW700,
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        widget.favouriteJobs![index].company!
                                            .title!,
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
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.remove_red_eye,
                                            color: whitetwo,
                                            size: kSixteenFont,
                                          ),
                                          Text(
                                            widget
                                                .favouriteJobs![index].noOfViews
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
                                          removeJobFromWishList(
                                              widget.favouriteJobs![index].id!);
                                          setState(() {});
                                        },
                                        child: Icon(
                                          widget.favouriteJobs![index]
                                                      .isFavourite ==
                                                  1
                                              ? Icons.favorite_rounded
                                              : Icons.favorite_outline_rounded,
                                          color: widget.favouriteJobs![index]
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
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    //$.[]data.[]almamater_masters.[]name
                                    //   allJobs.almamater_masters[index] ?? "",
                                    //  allJobs[index].title ?? "",
                                    //     allJobs[0]["almamater_masters"][0]["AlmamaterMasters"]["name"]??"",
                                    widget.favouriteJobs![index]
                                        .almamaterMasters![0].name!,
                                    style: GoogleFonts.gothicA1(
                                      fontSize: 11.sp,
                                      color: whitetwo,
                                      fontWeight: kFW500,
                                    ),
                                  ),
                                  Text(
                                    '${widget.favouriteJobs![index].minExp} - ${widget.favouriteJobs![index].maxExp} Years',
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
                                        widget.favouriteJobs![index].cities![0]
                                            .name!,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  Column(
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
//   allJobs[index]
                                          // .almamaterMasters![0]
                                          // .name!,

//  $.[]data.[]job_skills.[]skill_master.title
                                          //   "Skill will be covered here to show   ",
                                          widget
                                              .favouriteJobs![index]
                                              .jobSkills![0]
                                              .skillMaster!
                                              .title!,
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
                                      widget.favouriteJobs![index].jobSkills!
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
                                                widget
                                                    .favouriteJobs![index]
                                                    .jobSkills![1]
                                                    .skillMaster!
                                                    .title!,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                // "Skill will be covered here to show   ",
                                                style: GoogleFonts.gothicA1(
                                                  fontSize: 11.sp,
                                                  color: darktwo,
                                                  fontWeight: kFW600,
                                                ),
                                              ))
                                          : SizedBox()
                                    ],
                                  ),
                                  Column(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment
                                    //         .end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        widget.favouriteJobs![index].jobType!
                                                .title ??
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
                                        '${widget.favouriteJobs![index].minSal} - ${widget.favouriteJobs![index].maxSal} LPA',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                        '${widget.favouriteJobs![index].industry!.title}',
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
                                    onTap: widget.favouriteJobs![index]
                                                .isApplied ==
                                            1
                                        ? () {}
                                        : () {
                                            applyForJobHandler(widget
                                                .favouriteJobs![index].id!);
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
                                            BorderRadius.circular(10.r),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 20,
                                              spreadRadius: 5,
                                              color:
                                                  Color.fromARGB(255, 11, 2, 2)
                                                      .withOpacity(0.4)),
                                        ],
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            grey.withOpacity(0.5),
                                            grey1.withOpacity(0.5),
                                            const Color.fromARGB(
                                                    255, 58, 55, 55)
                                                .withOpacity(0.1),
                                          ],
                                        ),
                                      ),
                                      child: Text(
                                        widget.favouriteJobs![index]
                                                    .isApplied ==
                                                1
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

              // GestureDetector(
              //   onTap: () {
              //     Get.toNamed(KJob_Description,
              //         arguments: widget.favouriteJobs![index].id!);
              //   },
              //   child: GlassmorphicContainer(
              //     margin: EdgeInsets.only(bottom: 15.h),
              //     height: 210.h,
              //     width: double.infinity,
              //     borderRadius: 15,
              //     blur: 15,
              //     alignment: Alignment.center,
              //     border: 2,
              //     linearGradient: LinearGradient(
              //       colors: [white.withOpacity(0.15), white.withOpacity(0.15)],
              //       begin: Alignment.topLeft,
              //       end: Alignment.bottomRight,
              //     ),
              //     borderGradient: LinearGradient(
              //       colors: [white.withOpacity(0.5), Gold.withOpacity(0.01)],
              //     ),
              //     child: Container(
              //       decoration: BoxDecoration(
              //         boxShadow: [
              //           BoxShadow(
              //             blurRadius: 20,
              //             spreadRadius: 16,
              //             color: Colors.black.withOpacity(0.1),
              //           ),
              //         ],
              //       ),
              //       child: ClipRRect(
              //         borderRadius: BorderRadius.circular(15.0),
              //         child: BackdropFilter(
              //           filter: ImageFilter.blur(
              //             sigmaX: 10.0,
              //             sigmaY: 10.0,
              //           ),
              //           child: Container(
              //             width: double.infinity,
              //             padding: EdgeInsets.all(10.r),
              //             decoration: BoxDecoration(
              //               border: const GradientBoxBorder(
              //                 gradient: LinearGradient(
              //                     colors: [Colors.white38, Gold]),
              //                 width: 0.5,
              //               ),
              //               borderRadius: BorderRadius.circular(16.r),
              //             ),
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Text(
              //                       widget.favouriteJobs![index].title ?? "",
              //                       maxLines: 1,
              //                       style: GoogleFonts.gothicA1(
              //                         fontSize: kSixteenFont,
              //                         color: white,
              //                         fontWeight: kFW700,
              //                       ),
              //                     ),
              //                     IconButton(
              //                       onPressed: () {
              //                         removeJobFromWishList(
              //                             widget.favouriteJobs![index].id!);
              //                         widget.favouriteJobs!.removeAt(index);
              //                         setState(() {});
              //                       },
              //                       icon: const Icon(
              //                         Icons.favorite_rounded,
              //                         color: Colors.red,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //                 SizedBox(
              //                   height: 8.h,
              //                 ),
              //                 Text(
              //                   widget.favouriteJobs![index].company!.title!,
              //                   style: GoogleFonts.gothicA1(
              //                     fontSize: 11.sp,
              //                     color: white,
              //                     fontWeight: kFW700,
              //                   ),
              //                 ),
              //                 Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Text(
              //                       '${widget.favouriteJobs![index].minExp} - ${widget.favouriteJobs![index].maxExp}Years',
              //                       style: GoogleFonts.gothicA1(
              //                         fontSize: 11.sp,
              //                         color: white,
              //                         fontWeight: kFW700,
              //                       ),
              //                     ),
              //                     SizedBox(
              //                       width: 100.w,
              //                       child: Row(
              //                         mainAxisAlignment: MainAxisAlignment.end,
              //                         children: [
              //                           Image.asset(
              //                             'assets/images/link.png',
              //                             width: 20.w,
              //                           ),
              //                           Expanded(
              //                             child: Text(
              //                               widget.favouriteJobs![index]
              //                                       .company!.address ??
              //                                   "",
              //                               overflow: TextOverflow.ellipsis,
              //                               style: GoogleFonts.gothicA1(
              //                                 fontSize: 11.sp,
              //                                 color: white,
              //                                 fontWeight: kFW700,
              //                               ),
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //                 SizedBox(
              //                   height: 12.h,
              //                 ),
              //                 Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Container(
              //                       padding: EdgeInsets.all(5.r),
              //                       color: white.withOpacity(0.5),
              //                       child: Text(
              //                         widget.favouriteJobs![index].jobType!
              //                                 .title ??
              //                             "",
              //                         style: GoogleFonts.gothicA1(
              //                           fontSize: 11.sp,
              //                           color: white,
              //                           fontWeight: kFW700,
              //                         ),
              //                       ),
              //                     ),
              //                     Column(
              //                       mainAxisAlignment: MainAxisAlignment.end,
              //                       children: [
              //                         Text(
              //                           "Salary",
              //                           style: GoogleFonts.gothicA1(
              //                             fontSize: 11.sp,
              //                             color: white,
              //                             fontWeight: kFW700,
              //                           ),
              //                         ),
              //                         Text(
              //                           '${widget.favouriteJobs![index].minSal}'
              //                           ' - '
              //                           '${widget.favouriteJobs![index].maxSal} LPA',
              //                           style: GoogleFonts.gothicA1(
              //                             fontSize: kFourteenFont,
              //                             color: Gold,
              //                             fontWeight: kFW700,
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //                 SizedBox(
              //                   height: 10.h,
              //                 ),
              //                 Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Text(
              //                       widget.favouriteJobs![index].industry!
              //                               .title ??
              //                           "",
              //                       maxLines: 1,
              //                       style: GoogleFonts.gothicA1(
              //                         fontSize: 11.sp,
              //                         color: white,
              //                         fontWeight: kFW700,
              //                       ),
              //                     ),
              //                     SizedBox(
              //                       width: 10.w,
              //                     ),
              //                     SizedBox(
              //                       height: 40.h,
              //                       width: 110.w,
              //                       child: TextButton(
              //                         onPressed: widget.favouriteJobs![index]
              //                                     .isApplied ==
              //                                 1
              //                             ? () {}
              //                             : () {
              //                                 applyForJobHandler(widget
              //                                     .favouriteJobs![index].id!);
              //                               },
              //                         style: TextButton.styleFrom(
              //                           backgroundColor: grey,
              //                           shape: RoundedRectangleBorder(
              //                             borderRadius:
              //                                 BorderRadius.circular(10.r),
              //                             side: const BorderSide(color: grey),
              //                           ),
              //                         ),
              //                         child: Text(
              //                           widget.favouriteJobs![index]
              //                                       .isApplied ==
              //                                   1
              //                               ? "Applied"
              //                               : "Apply",
              //                           style: GoogleFonts.gothicA1(
              //                             fontSize: kTwelveFont,
              //                             color: white,
              //                             fontWeight: kFW600,
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // );
            }),
          )
        : const Center(
            child: CircularProgressIndicator(
              color: Gold,
            ),
          );
  }
}

// ignore_for_file: camel_case_types

import 'dart:ui';

import 'package:intl/intl.dart';

import '../utils/export_file.dart';

class glass_card extends StatefulWidget {
  const glass_card({super.key});

  @override
  State<glass_card> createState() => _glasscardState();
}

class _glasscardState extends State<glass_card> {
  bool status = false;
  List<dynamic> schedulelist = [];
  bool isLoading = false;
  Future ScheduleListHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.getjobinterview();
    if (data["message"] != null) {
      if (data["message"] == "Token is Expired") {
        Get.toNamed(KLogin);
        Fluttertoast.showToast(
          msg: data["message"],
        );
      } else {
        Fluttertoast.showToast(
          msg: data["message"],
        );
      }
    } else {
      schedulelist = data["data"]["data"]["interview_schedules"]["data"];
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    ScheduleListHandler();
  }

  @override
  Widget build(BuildContext context) {
    return schedulelist.isNotEmpty
        ? SizedBox(
            height: 180.h,
            child:
                // ListView.builder(
                //     itemCount: schedulelist.length,
                //     scrollDirection: Axis.horizontal,
                //     physics: AlwaysScrollableScrollPhysics(),
                //     itemBuilder: ((context, index) {
                //       return

                Swiper(
                    itemHeight: 210.h,
                    itemWidth: double.infinity,
                    loop: true,
                    layout: SwiperLayout.STACK,
                    itemCount: schedulelist.length,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: ((BuildContext context, int index) {
                      return isLoading == false
                          ? GlassmorphicContainer(
                              // margin: EdgeInsets.only(right: 15.w),
                              height: 180.h,
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
                              borderGradient: LinearGradient(colors: [
                                Colors.white.withOpacity(0.5),
                                Gold.withOpacity(0.01)
                              ]),
                              child: Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    blurRadius: 20,
                                    spreadRadius: 16,
                                    color: Colors.black.withOpacity(0.1),
                                  )
                                ]),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 10.0,
                                      sigmaY: 10.0,
                                    ),
                                    child: Container(
                                        width: double.infinity,
                                        height: 180.h,
                                        padding: EdgeInsets.only(
                                            top: 10.r,
                                            right: 20.r,
                                            left: 20.r,
                                            bottom: 10.r),
                                        decoration: BoxDecoration(
                                            border: const GradientBoxBorder(
                                              gradient: LinearGradient(colors: [
                                                Colors.white38,
                                                Gold
                                              ]),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.r)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text("Role",
                                                style: GoogleFonts.gothicA1(
                                                    fontSize: 12.sp,
                                                    color: Gold,
                                                    fontWeight: kFW700)),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text(schedulelist[index]["title"],
                                                maxLines: 1,
                                                style: GoogleFonts.gothicA1(
                                                    fontSize: 16.sp,
                                                    color: white,
                                                    fontWeight: kFW900)),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            // Row(
                                            //   crossAxisAlignment:
                                            //       CrossAxisAlignment.start,
                                            //   mainAxisAlignment:
                                            //       MainAxisAlignment
                                            //           .spaceBetween,
                                            //   children: [
                                            //     Column(
                                            //       mainAxisAlignment:
                                            //           MainAxisAlignment.start,
                                            //       crossAxisAlignment:
                                            //           CrossAxisAlignment.start,
                                            //       children: [
                                            //         Text("Round",
                                            //             maxLines: 2,
                                            //             style: GoogleFonts
                                            //                 .gothicA1(
                                            //                     fontSize: 14.sp,
                                            //                     color: white,
                                            //                     fontWeight:
                                            //                         kFW700)),
                                            //         SizedBox(
                                            //           height: 6.h,
                                            //         ),
                                            //         Text(
                                            //             schedulelist[index][
                                            //                         "candidateinterview_schedules"]
                                            //                     [0]["title"]
                                            //                 .toString()
                                            //                 .capitalize!,
                                            //             //schedulelist[index]["title"],
                                            //             maxLines: 2,
                                            //             style: GoogleFonts
                                            //                 .gothicA1(
                                            //                     fontSize: 10.sp,
                                            //                     color: white,
                                            //                     fontWeight:
                                            //                         kFW600)),
                                            //       ],
                                            //     ),
                                            //     Column(
                                            //       mainAxisAlignment:
                                            //           MainAxisAlignment.start,
                                            //       crossAxisAlignment:
                                            //           CrossAxisAlignment.start,
                                            //       children: [
                                            //         Text("Date",
                                            //             maxLines: 2,
                                            //             style: GoogleFonts
                                            //                 .gothicA1(
                                            //                     fontSize: 14.sp,
                                            //                     color: white,
                                            //                     fontWeight:
                                            //                         kFW700)),
                                            //         SizedBox(
                                            //           height:5.h,
                                            //         ),
                                            //         SizedBox(
                                            //           width: 70.w,
                                            //           child: Text(
                                            // DateFormat("dd MMM")
                                            //     .format(DateTime.parse(
                                            //         schedulelist[index]
                                            //                 [
                                            //                 "candidateinterview_schedules"][0]
                                            //             [
                                            //             "interview_date"]))
                                            //     .toString()
                                            //                   .capitalize!,
                                            //               //schedulelist[index]["title"],
                                            //               maxLines: 1,
                                            //               style: GoogleFonts
                                            //                   .gothicA1(
                                            //                       fontSize:
                                            //                           kTwelveFont,
                                            //                       color: white,
                                            //                       fontWeight:
                                            //                           kFW600)),
                                            //         ),
                                            //       ],
                                            //     ),
                                            //     Column(
                                            //       mainAxisAlignment:
                                            //           MainAxisAlignment.start,
                                            //       crossAxisAlignment:
                                            //           CrossAxisAlignment.start,
                                            //       children: [
                                            //         Text("From Time",
                                            //             maxLines: 2,
                                            //             style: GoogleFonts
                                            //                 .gothicA1(
                                            //                     fontSize: 14.sp,
                                            //                     color: white,
                                            //                     fontWeight:
                                            //                         kFW700)),
                                            //         SizedBox(
                                            //           height: 5.h,
                                            //         ),
                                            //         Text(
                                            // schedulelist[index][
                                            //             "candidateinterview_schedules"]
                                            //         [0]["from_time"]
                                            //     .toString()
                                            //                 .capitalize!,
                                            //             //schedulelist[index]["title"],
                                            //             maxLines: 2,
                                            //             style: GoogleFonts
                                            //                 .gothicA1(
                                            //                     fontSize:
                                            //                         kTwelveFont,
                                            //                     color: white,
                                            //                     fontWeight:
                                            //                         kFW600)),
                                            //       ],
                                            //     )
                                            //   ],
                                            // ),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text("Schedule",
                                                        style: GoogleFonts
                                                            .gothicA1(
                                                                fontSize: 16.sp,
                                                                color: white,
                                                                fontWeight:
                                                                    kFW700)),
                                                    SizedBox(
                                                      height: 3.h,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                            schedulelist[index][
                                                                        "candidateinterview_schedules"][0]
                                                                    [
                                                                    "from_time"]
                                                                .toString(),
                                                            style: GoogleFonts
                                                                .gothicA1(
                                                                    fontSize:
                                                                        12.sp,
                                                                    color:
                                                                        white,
                                                                    fontWeight:
                                                                        kFW400)),
                                                        SizedBox(
                                                          width: 5.w,
                                                        ),
                                                        Text("to",
                                                            style: GoogleFonts
                                                                .gothicA1(
                                                                    fontSize:
                                                                        10.sp,
                                                                    color:
                                                                        white,
                                                                    fontWeight:
                                                                        kFW400)),
                                                        SizedBox(
                                                          width: 5.w,
                                                        ),
                                                        Text(
                                                            schedulelist[index]
                                                                        ["candidateinterview_schedules"][0]
                                                                    ["to_time"]
                                                                .toString(),
                                                            style: GoogleFonts
                                                                .gothicA1(
                                                                    fontSize:
                                                                        12.sp,
                                                                    color:
                                                                        white,
                                                                    fontWeight:
                                                                        kFW400)),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                        DateFormat("dd")
                                                            .format(DateTime.parse(
                                                                schedulelist[
                                                                            index]
                                                                        [
                                                                        "candidateinterview_schedules"][0]
                                                                    [
                                                                    "created_at"]))
                                                            // "interview_date"]))
                                                            .toString(),
                                                        style: GoogleFonts
                                                            .gothicA1(
                                                                fontSize: 25.sp,
                                                                color: white,
                                                                fontWeight:
                                                                    kFW900)),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 8.0),
                                                      child: Text(
                                                          DateFormat("MMM yyyy")
                                                              .format(DateTime.parse(
                                                                  schedulelist[
                                                                              index]
                                                                          [
                                                                          "candidateinterview_schedules"][0]
                                                                      [
                                                                      "created_at"]))
                                                              // "interview_date"]))
                                                              .toString(),
                                                          style: GoogleFonts
                                                              .gothicA1(
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: white,
                                                                  fontWeight:
                                                                      kFW400)),
                                                    )
                                                  ],
                                                ),
                                                // Row(
                                                //   mainAxisAlignment:
                                                //       MainAxisAlignment.start,
                                                //   crossAxisAlignment:
                                                //       CrossAxisAlignment.end,
                                                //   children: [
                                                //     Text(
                                                //         DateFormat("dd")
                                                //             .format(DateTime.parse(
                                                //                 schedulelist[
                                                //                             index]
                                                //                         [
                                                //                         "candidateinterview_schedules"][0]
                                                //                     [
                                                //                     "interview_date"]))
                                                //             .toString(),
                                                //         style: GoogleFonts
                                                //             .gothicA1(
                                                //                 fontSize: 25.sp,
                                                //                 color: white,
                                                //                 fontWeight:
                                                //                     kFW900)),
                                                //     SizedBox(
                                                //       width: 5.w,
                                                //     ),
                                                //     Padding(
                                                //       padding:
                                                //           const EdgeInsets.only(
                                                //               bottom: 8.0),
                                                //       child: Text(
                                                //           DateFormat("MMM yyyy")
                                                //               .format(DateTime.parse(
                                                //                   schedulelist[index]
                                                //                           [
                                                //                           "candidateinterview_schedules"][0]
                                                //                       [
                                                //                       "interview_date"]))
                                                //               .toString(),
                                                //           style: GoogleFonts
                                                //               .gothicA1(
                                                //                   fontSize:
                                                //                       12.sp,
                                                //                   color: white,
                                                //                   fontWeight:
                                                //                       kFW400)),
                                                //     )
                                                //   ],
                                                // ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                // GestureDetector(
                                                //   onTap: () async {
                                                //     await Clipboard.setData(
                                                //         ClipboardData(
                                                //             text: schedulelist[
                                                //                         index][
                                                //                     "candidateinterview_schedules"][0]
                                                //                 [
                                                //                 "meeting_link"]));
                                                //     // copied successfully
                                                //   },
                                                //   child: GlassmorphicContainer(
                                                //     height: 35.h,
                                                //     width: 100.w,
                                                //     borderRadius: 13.r,
                                                //     blur: 15,
                                                //     alignment: Alignment.center,
                                                //     border: 0.5,
                                                //     linearGradient:
                                                //         LinearGradient(
                                                //             colors: [
                                                //           Colors.black
                                                //               .withOpacity(0.1),
                                                //           Colors.black
                                                //               .withOpacity(0.01)
                                                //         ],
                                                //             begin: Alignment
                                                //                 .topLeft,
                                                //             end: Alignment
                                                //                 .bottomRight),
                                                //     borderGradient:
                                                //         LinearGradient(
                                                //             begin: Alignment
                                                //                 .centerLeft,
                                                //             end: Alignment
                                                //                 .bottomRight,
                                                //             colors: [
                                                //           white
                                                //               .withOpacity(0.5),
                                                //           white
                                                //               .withOpacity(0.5),
                                                //           Gold.withOpacity(0.5)
                                                //         ]),
                                                //     child: Container(
                                                //       decoration: BoxDecoration(
                                                //           boxShadow: [
                                                //             BoxShadow(
                                                //               blurRadius: 16,
                                                //               spreadRadius: 16,
                                                //               color: Colors
                                                //                   .black
                                                //                   .withOpacity(
                                                //                       0.1),
                                                //             )
                                                //           ]),
                                                //       child: ClipRRect(
                                                //         borderRadius:
                                                //             BorderRadius
                                                //                 .circular(15.0),
                                                //         child: BackdropFilter(
                                                //           filter:
                                                //               ImageFilter.blur(
                                                //             sigmaX: 20.0,
                                                //             sigmaY: 20.0,
                                                //           ),
                                                //           child: Text(
                                                //               "Copy Link",
                                                //               //maxLines: 2,
                                                //               style: GoogleFonts
                                                //                   .gothicA1(
                                                //                       fontSize:
                                                //                           kFourteenFont,
                                                //                       color:
                                                //                           white,
                                                //                       fontWeight:
                                                //                           kFW500)),
                                                //         ),
                                                //       ),
                                                //     ),
                                                //   ),
                                                // ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    _launchUrl(schedulelist[
                                                                index][
                                                            "candidateinterview_schedules"]
                                                        [0]["meeting_link"]);
                                                  },
                                                  child: GlassmorphicContainer(
                                                    height: 35.h,
                                                    width: 100.w,
                                                    borderRadius: 13.r,
                                                    blur: 15,
                                                    alignment: Alignment.center,
                                                    border: 0.5,
                                                    linearGradient:
                                                        LinearGradient(
                                                            colors: [
                                                          white
                                                              .withOpacity(0.1),
                                                          white
                                                              .withOpacity(0.01)
                                                        ],
                                                            begin: Alignment
                                                                .topLeft,
                                                            end: Alignment
                                                                .bottomRight),
                                                    borderGradient:
                                                        LinearGradient(
                                                            begin: Alignment
                                                                .centerLeft,
                                                            end: Alignment
                                                                .bottomRight,
                                                            colors: [
                                                          white
                                                              .withOpacity(0.5),
                                                          white
                                                              .withOpacity(0.5),
                                                          Gold.withOpacity(0.5)
                                                        ]),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 16,
                                                              spreadRadius: 15,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.1),
                                                            )
                                                          ]),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                        child: BackdropFilter(
                                                          filter:
                                                              ImageFilter.blur(
                                                            sigmaX: 20.0,
                                                            sigmaY: 20.0,
                                                          ),
                                                          child: Text("Join",
                                                              //maxLines: 2,
                                                              style: GoogleFonts
                                                                  .gothicA1(
                                                                      fontSize:
                                                                          kSixteenFont,
                                                                      color:
                                                                          white,
                                                                      fontWeight:
                                                                          kFW700)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )),
                                  ),
                                ),
                              ),
                            )
                          : const Center(
                              child: CircularProgressIndicator(
                              color: Gold,
                            ));
                    })),
          )
        : SizedBox();
  }

  // void launchURL(String url) async {
  //   // ignore: deprecated_member_use
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch ');
    }
  }
}

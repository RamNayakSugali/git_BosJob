// ignore_for_file: camel_case_types
//getsearchexerciseLis
import 'dart:ui';

import '../../utils/export_file.dart';

class Exercise_view extends StatefulWidget {
  List searchExerciseData;
  Exercise_view({super.key, required this.searchExerciseData});

  @override
  State<Exercise_view> createState() => _ExerciseviewState();
}

class _ExerciseviewState extends State<Exercise_view> {
  Future exercisewishlistHandler(int id) async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.WhishlistedExercises(id);

    try {
      if (data["data"]["data"]["status"] == "1") {
        favouratedexerciseHandler();
        Fluttertoast.showToast(
          msg: data["data"]["data"]["message"],
        );
      } else {
        favouratedexerciseHandler();
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

  bool isLoading = false;
  List favouritedExercisedata = [];
  List<int> wishlisted = <int>[];
  // List<int> wishlistedexercise = <int>[];
  var profiletoexerciseData = Get.arguments;
  Future favouratedexerciseHandler() async {
    setState(() {
      isLoading = true;
    });
    Map payload = {
      "type": "favourate",
      // "candidate_id": profiletoexerciseData["candidates"]["CandidateDetails"]
      //         ["id"]
      //     .toString(),
      "candidate_id": UserSimplePreferences.getCandidateId(),

      //"type": "purchased",
    };

    var value = await Services.getsearchexerciseList(payload);

    if (value["data"] == null) {
      Fluttertoast.showToast(msg: value["message"]);
    } else {
      favouritedExercisedata = value["data"];
    }
    print(value["data"]);
    setState(() {
      isLoading = false;
    });
  }
////

  List<int> wishlistedexercise = <int>[];
  // Future exerciseHandler() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   Map payload = {
  //     "candidate_id": widget.profiledata!["candidates"]["CandidateDetails"]
  //             ["id"]
  //         .toString(),
  //     "type": "search_exercise",
  //   };

  //   var value = await Services.getsearchexerciseList(payload);

  //   if (value["data"] == null) {
  //     Fluttertoast.showToast(msg: value["message"]);
  //   } else {
  //     SearchExercise = value["data"];
  //   }
  //   print(value["data"]);
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    favouratedexerciseHandler();
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
  //List exercises =[];
// List<dynamic> exercises = [];
//   bool isLoading = false;
//   Future exerciseListHandler() async {
//     setState(() {
//       isLoading = true;
//     });
//     Map data = await Services.getAllExercises();

//     if (data["message"] != null) {
//       Fluttertoast.showToast(
//         msg: data["message"],
//       );
//     } else {
//       exercises = data["data"]["data"];
//     }
//     print(data["data"]["data"]);
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();

//     exerciseListHandler();
//   }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.searchExerciseData.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            Get.toNamed(
              KExerciseDescription,
              arguments: widget.searchExerciseData[index]?["id"] ?? "",
            );
          },
          child: GlassmorphicContainer(
            margin: EdgeInsets.only(bottom: 15.h),
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
                            SizedBox(
                              width: 200.w,
                              child: Text(
                                widget.searchExerciseData[index]?["title"] ??
                                    "Excerises",
                                maxLines: 1,
                                style: GoogleFonts.gothicA1(
                                  fontSize: kEighteenFont,
                                  color: whitetwo,
                                  fontWeight: kFW700,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    exercisewishlistHandler(
                                        widget.searchExerciseData[index]["id"]);
                                    // if (!wishlistedexercise.contains(
                                    //     SearchExercise[index]["id"])) {
                                    //   wishlistedexercise.add(
                                    //       SearchExercise[index]["id"]);
                                    //   // Get.toNamed(
                                    //   //   KWish_List,
                                    //   //   arguments: wishlistedexercise,
                                    //   //   // arguments:
                                    //   //   //     browse[index]["id"] ??
                                    //   //   //         "",
                                    //   // );
                                    //   // Fluttertoast.showToast(
                                    //   //     msg:
                                    //   //         "Added to favourites successfully");

                                    //   //  Wishlist_jobs
                                    //   //  KWish_List));
                                    // } else {
                                    //   wishlistedexercise.remove(
                                    //       SearchExercise[index]["id"]);
                                    //   // Fluttertoast.showToast(
                                    //   //     msg:
                                    //   //         "Unfavourited successfully");
                                    // }
                                    setState(() {});
                                  },
                                  child: Icon(
                                    favouritedExercisedata
                                                .where((element) =>
                                                    element["id"] ==
                                                    widget.searchExerciseData[
                                                        index]["id"])
                                                .toList()
                                                .length >
                                            0
                                        ? Icons.favorite_rounded
                                        : Icons.favorite_outline_outlined,
                                    color:
                                        //  favouritedExercisedata[index]
                                        //     ?["title"] ??
                                        // "Excerises",

                                        favouritedExercisedata
                                                    .where((element) =>
                                                        element["id"] ==
                                                        widget.searchExerciseData[
                                                            index]["id"])
                                                    .toList()
                                                    .length >
                                                0
                                            // wishlistedexercise.contains(
                                            //         SearchExercise[index]["id"])
                                            ? Colors.red
                                            : white,
                                  ),
                                ),
                                // Image.asset(
                                //   'assets/images/love.png',
                                //   height: 18.h,
                                // ),
                                SizedBox(width: 25.w),
                                GestureDetector(
                                    onTap: () async {
                                      await Clipboard.setData(ClipboardData(
                                          text:
                                              "https://dev.bossjobs.co.in/#/student/browseCourseView/${widget.searchExerciseData[index]?["id"]}"));
                                      // copied successfully
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
                                  widget.searchExerciseData[index]!["time"]
                                          .toString() +
                                      " mins",
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
                                  widget.searchExerciseData[index]["coach_id"]
                                      .toString(),
                                  // $.[]data.0.coach.length
                                  //  "06",
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
                                  "${widget.searchExerciseData[index]!["exercise_questions"].length.toString()} Questions",
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
                        // SizedBox(
                        //   height: 15.h,
                        // ),
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
                                widget.searchExerciseData[index]
                                    ?["skill_masters"][0]["title"],
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
                            widget.searchExerciseData[index]["skill_masters"]
                                        .length >=
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
                                      widget.searchExerciseData[index]
                                          ?["skill_masters"][1]["title"],
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
                                  widget.searchExerciseData[index]?["coach"]
                                      ["user"]["name"],
                                  //  "Jagannadham Rao",
                                  style: GoogleFonts.gothicA1(
                                      fontSize: 11.sp,
                                      color: whitetwo,
                                      fontWeight: kFW600),
                                ),
                              ],
                            ),
                            Text(
                              '\u{20B9}${moneyFormat(widget.searchExerciseData[index]?["price"].toString() ?? "000")}',
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

    ////////////////////////////////////////////////////////////exercises with apis
    //isLoading == false
    // ? SingleChildScrollView(
    //     child:
    //     ListView.builder(
    //         shrinkWrap: true,
    //         physics: const NeverScrollableScrollPhysics(),
    //         itemCount: widget.searchExerciseData.length,
    //         itemBuilder: ((context, index) {
    //           return GestureDetector(
    //             onTap: () {
    //               Get.toNamed(
    //                 KExerciseDescription,
    //                 arguments:
    //                     widget.searchExerciseData[index]?["id"] ?? "",
    //               );
    //             },
    //             child:
    //             GlassmorphicContainer(
    //               margin: EdgeInsets.only(bottom: 15.h),
    //               // height: 210.h,
    //               height: 200.h,
    //               width: double.infinity,
    //               borderRadius: 10.r,
    //               blur: 15,
    //               alignment: Alignment.center,
    //               border: 2,
    //               linearGradient: LinearGradient(
    //                 colors: [
    //                   white.withOpacity(0.15),
    //                   white.withOpacity(0.15),
    //                 ],
    //               ),

    //               borderGradient: LinearGradient(
    //                 colors: [
    //                   kBackground,
    //                   //  white.withOpacity(0.5),
    //                   Gold.withOpacity(0.01)
    //                 ],
    //               ),
    //               child: Container(
    //                 decoration: BoxDecoration(
    //                   boxShadow: [
    //                     BoxShadow(
    //                       blurRadius: 20,
    //                       spreadRadius: 10.r,
    //                       color: Colors.black.withOpacity(0.1),
    //                     )
    //                   ],
    //                 ),
    //                 child: ClipRRect(
    //                   borderRadius: BorderRadius.circular(10.r),
    //                   child: BackdropFilter(
    //                     filter: ImageFilter.blur(
    //                       sigmaX: 10.0,
    //                       sigmaY: 10.0,
    //                     ),
    //                     child: Container(
    //                         width: double.infinity,
    //                         padding: EdgeInsets.all(15.r),
    //                         decoration: BoxDecoration(
    //                           border: const GradientBoxBorder(
    //                             gradient: LinearGradient(
    //                                 begin: Alignment.topLeft,
    //                                 end: Alignment.bottomRight,
    //                                 colors: [
    //                                   kBackground,
    //                                   kBackground,
    //                                   kBackground,
    //                                   Gold
    //                                 ]),
    //                             width: 0.5,
    //                           ),
    //                           borderRadius: BorderRadius.circular(10.r),
    //                         ),
    //                         child: Column(
    //                           mainAxisAlignment: MainAxisAlignment.start,
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             // SizedBox(
    //                             //   height: 8.h,
    //                             // ),
    //                             Row(
    //                               mainAxisAlignment:
    //                                   MainAxisAlignment.spaceBetween,
    //                               children: [
    //                                 Container(
    //                                   width: 230.w,
    //                                   child: Text(
    //                                       widget.searchExerciseData[index]
    //                                               ?["title"] ??
    //                                           "Excerises",
    //                                       maxLines: 2,
    //                                       // "Assessment 101",
    //                                       style: GoogleFonts.gothicA1(
    //                                           fontSize: kEighteenFont,
    //                                           color: white,
    //                                           fontWeight: kFW700)),
    //                                 ),
    //                                 GestureDetector(
    //                                   onTap: () {
    //                                     exercisewishlistHandler(
    //                                         widget.searchExerciseData[index]
    //                                             ["id"]);
    //                                     // if (!wishlistedexercise.contains(
    //                                     //     SearchExercise[index]["id"])) {
    //                                     //   wishlistedexercise.add(
    //                                     //       SearchExercise[index]["id"]);
    //                                     //   // Get.toNamed(
    //                                     //   //   KWish_List,
    //                                     //   //   arguments: wishlistedexercise,
    //                                     //   //   // arguments:
    //                                     //   //   //     browse[index]["id"] ??
    //                                     //   //   //         "",
    //                                     //   // );
    //                                     //   // Fluttertoast.showToast(
    //                                     //   //     msg:
    //                                     //   //         "Added to favourites successfully");

    //                                     //   //  Wishlist_jobs
    //                                     //   //  KWish_List));
    //                                     // } else {
    //                                     //   wishlistedexercise.remove(
    //                                     //       SearchExercise[index]["id"]);
    //                                     //   // Fluttertoast.showToast(
    //                                     //   //     msg:
    //                                     //   //         "Unfavourited successfully");
    //                                     // }
    //                                     setState(() {});
    //                                   },
    //                                   child: Icon(
    //                                     favouritedExercisedata
    //                                                 .where((element) =>
    //                                                     element["id"] ==
    //                                                     widget.searchExerciseData[
    //                                                         index]["id"])
    //                                                 .toList()
    //                                                 .length >
    //                                             0
    //                                         ? Icons.favorite_rounded
    //                                         : Icons
    //                                             .favorite_outline_outlined,
    //                                     color:
    //                                         //  favouritedExercisedata[index]
    //                                         //     ?["title"] ??
    //                                         // "Excerises",

    //                                         favouritedExercisedata
    //                                                     .where((element) =>
    //                                                         element["id"] ==
    //                                                         widget.searchExerciseData[
    //                                                                 index]
    //                                                             ["id"])
    //                                                     .toList()
    //                                                     .length >
    //                                                 0
    //                                             // wishlistedexercise.contains(
    //                                             //         SearchExercise[index]["id"])
    //                                             ? Colors.red
    //                                             : white,
    //                                   ),
    //                                 ),

    //                                 // SizedBox(
    //                                 //   width: 50.w,
    //                                 //   height: 22.w,
    //                                 //   child: Image.asset(
    //                                 //     'assets/images/love.png',
    //                                 //   ),
    //                                 // ),
    //                               ],
    //                             ),
    //                             SizedBox(
    //                               height: 8.h,
    //                             ),
    //                             RichText(
    //                               text: TextSpan(
    //                                 text: 'Duration ',
    //                                 style: GoogleFonts.gothicA1(
    //                                     fontSize: 11.sp,
    //                                     color: white,
    //                                     fontWeight: kFW500),
    //                                 children: [
    //                                   TextSpan(
    //                                     text: widget
    //                                         .searchExerciseData[index]
    //                                             ?["time"]
    //                                         .toString(),
    //                                     style: GoogleFonts.gothicA1(
    //                                         fontSize: 11.sp,
    //                                         color: Gold,
    //                                         fontWeight: kFW500),
    //                                   ),
    //                                 ],
    //                               ),
    //                             ),

    //                             SizedBox(
    //                               height: 4.h,
    //                             ),

    //                             Text(
    //                                 "Questions  ${widget.searchExerciseData[index]!["exercise_questions"].length.toString()} ",
    //                                 style: GoogleFonts.gothicA1(
    //                                     fontSize: 11.sp,
    //                                     color: white,
    //                                     fontWeight: kFW500)),
    //                             SizedBox(
    //                               height: 15.h,
    //                             ),
    //                             Wrap(
    //                               children: [
    //                                 Padding(
    //                                   padding: EdgeInsets.only(right: 10.w),
    //                                   child: Text(
    //                                       widget.searchExerciseData[index]
    //                                                   ?["category_master"]
    //                                               ?["title"] ??
    //                                           "New Skills",
    //                                       maxLines: 1,
    //                                       style: GoogleFonts.gothicA1(
    //                                           fontSize: 11.sp,
    //                                           color: white,
    //                                           fontWeight: kFW500)),
    //                                 ),
    //                               ],
    //                             ),

    //                             SizedBox(
    //                               height: 15.h,
    //                             ),
    //                             Text(
    //                                 '\u{20B9}${widget.searchExerciseData[index]?["price"] ?? "000"}',
    //                                 style: GoogleFonts.gothicA1(
    //                                     fontSize: kSixteenFont,
    //                                     color: Gold,
    //                                     fontWeight: kFW600))
    //                           ],
    //                         )),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           );
    //         })),
    //   )
    // : const Center(child: CircularProgressIndicator());
  }
}

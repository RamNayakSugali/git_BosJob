import 'dart:ui';

import '../../utils/export_file.dart';

class FavouriteExercises extends StatefulWidget {
  const FavouriteExercises({super.key});

  @override
  State<FavouriteExercises> createState() => _FavouriteExercisesState();
}

class _FavouriteExercisesState extends State<FavouriteExercises> {
  Map userData = {};
  Future favouriteexercisewishlistHandler(int id) async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.WhishlistedExercises(id);

    try {
      if (data["data"]["data"]["status"] == "1") {
        exerciseHandler();
        Fluttertoast.showToast(
          msg: data["data"]["data"]["message"],
        );
      } else {
        exerciseHandler();
        Fluttertoast.showToast(
          msg: data["data"]["data"]["message"],
        );
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Something Went Wrong");
    }

    setState(() {
      isLoading = false;
    });
  }

  bool isLoading = false;
  List FavouritedExercise = [];
  List originalFavouritedExercise = [];

  List<int> wishlisted = <int>[];
  List<int> wishlistedexercise = <int>[];
  var profiletoexerciseData = Get.arguments;
  Future exerciseHandler() async {
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
      FavouritedExercise = value["data"];
      originalFavouritedExercise = value["data"];
    }
    print(value["data"]);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    exerciseHandler();
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        backgroundColor: darktwo,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Wishlist',
          style: GoogleFonts.gothicA1(
              fontSize: kEighteenFont, color: white, fontWeight: kFW700),
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
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.gif',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
              child: Container(
            margin: EdgeInsets.all(15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  maxLength: 8,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: Gold),
                    filled: true,
                    fillColor: white,
                    contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
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
                    hintText: "Search",
                  ),
                  onChanged: (value) {
                    setState(() {
                      FavouritedExercise = originalFavouritedExercise
                          .where((element) => element["title"].contains(value))
                          .toList();
                      debugPrint("${FavouritedExercise.length}");
                    });
                  },
                ),

                Row(
                  children: [
                    SizedBox(
                      height: 20.h,
                      child: VerticalDivider(
                        color: Gold,
                        width: 2.w,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "Exercises",
                      style: GoogleFonts.gothicA1(
                        fontSize: kSixteenFont,
                        color: whitetwo,
                        fontWeight: kFW700,
                      ),
                    ),
                  ],
                ),
                // Search(),
                SizedBox(
                  height: 10.h,
                ),
                ListView.builder(
                    itemCount: FavouritedExercise.length,
                    //  itemCount: schedulelist.length,
//physics: AlwaysScrollableScrollPhysics(),
                    // itemCount: schedulelist.length,
                    //  itemcount:  data.[]data.length,
                    //  scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return isLoading == false
                          ? GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  KExerciseDescription,
                                  arguments:
                                      FavouritedExercise[index]?["id"] ?? "",
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
                                        padding: EdgeInsets.only(
                                            left: 15.w, right: 15.w),
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
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  FavouritedExercise[index]
                                                          ?["title"] ??
                                                      "Excerises",
                                                  style: GoogleFonts.gothicA1(
                                                    fontSize: kEighteenFont,
                                                    color: whitetwo,
                                                    fontWeight: kFW700,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                        onTap: () {
                                                          favouriteexercisewishlistHandler(
                                                              FavouritedExercise[
                                                                  index]["id"]);
                                                          wishlisted.remove(
                                                              FavouritedExercise[
                                                                  index]["id"]);
                                                          // if (!wishlisted.contains(
                                                          //     FavouritedExercise[
                                                          //         index]["id"])) {
                                                          //   wishlisted.add(
                                                          //       FavouritedExercise[
                                                          //           index]["id"]);

                                                          //   // Fluttertoast.showToast(
                                                          //   //     msg:
                                                          //   //         "Added to favourites successfully");

                                                          //   //  Wishlist_jobs
                                                          //   //  KWish_List));
                                                          // } else {
                                                          //   wishlisted.remove(
                                                          //       FavouritedExercise[
                                                          //           index]["id"]);
                                                          //   // Fluttertoast.showToast(
                                                          //   //     msg:
                                                          //   //         "Unfavourited successfully");
                                                          // }
                                                          setState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .favorite_rounded,
                                                          color: Colors.red,
                                                        )
                                                        // Icon(
                                                        //   wishlisted.contains(
                                                        //           FavouritedExercise[
                                                        //                       index]
                                                        //                   [
                                                        //                   "id"] ??
                                                        //               "")
                                                        //       ? Icons
                                                        //           .favorite_rounded
                                                        //       : Icons
                                                        //           .favorite_outline_outlined,
                                                        //   color: wishlisted.contains(
                                                        //           FavouritedExercise[
                                                        //                   index]
                                                        //               ["id"])
                                                        //       ? Colors.red
                                                        //       : white,
                                                        // ),
                                                        ),

                                                    // Image.asset(
                                                    //   'assets/images/love.png',
                                                    //   height: 18.h,
                                                    // ),
                                                    SizedBox(width: 25.w),
                                                    GestureDetector(
                                                        onTap: () async {
                                                          await Clipboard.setData(
                                                              ClipboardData(
                                                                  text:
                                                                      "https://dev.bossjobs.co.in/#/student/exercisesView/${FavouritedExercise[index]?["id"]}"));
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
                                                      FavouritedExercise[
                                                                      index]![
                                                                  "time"]
                                                              .toString() +
                                                          " mins",
                                                      // "20 min",
                                                      style:
                                                          GoogleFonts.gothicA1(
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
                                                      style:
                                                          GoogleFonts.gothicA1(
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
                                                      "${FavouritedExercise[index]!["exercise_questions"].length.toString()} Questions",
                                                      //    "06 Questions",
                                                      style:
                                                          GoogleFonts.gothicA1(
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
                                                      left: 14.w,
                                                      right: 14.w,
                                                      top: 6.h,
                                                      bottom: 6),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r),
                                                    color: customgrey,
                                                  ),
                                                  child: Text(
                                                    FavouritedExercise[index]
                                                            ?["skill_masters"]
                                                        [0]["title"],
                                                    maxLines: 1,
                                                    // "Product Designer",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.gothicA1(
                                                        fontSize: 11.sp,
                                                        color: darktwo,
                                                        fontWeight: kFW600),
                                                  ),
                                                ),
                                                SizedBox(width: 15.w),
                                                FavouritedExercise[index][
                                                                "skill_masters"]
                                                            .length >=
                                                        3
                                                    ? Container(
                                                        width: 120.w,
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 14.w,
                                                                right: 14.w,
                                                                top: 6.h,
                                                                bottom: 6),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.r),
                                                          color: customgrey,
                                                        ),
                                                        child: Text(
                                                          FavouritedExercise[
                                                                      index]?[
                                                                  "skill_masters"]
                                                              [1]["title"],
                                                          maxLines: 1,
                                                          // "Product Designer",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: GoogleFonts
                                                              .gothicA1(
                                                                  fontSize:
                                                                      11.sp,
                                                                  color:
                                                                      darktwo,
                                                                  fontWeight:
                                                                      kFW600),
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
                                            //             BorderRadius.circular(
                                            //                 20.r),
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
                                            //             BorderRadius.circular(
                                            //                 20.r),
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
                                                    SizedBox(width: 8.w),
                                                    Text(
                                                      FavouritedExercise[index]
                                                              ?["coach"]["user"]
                                                          ["name"],
                                                      style:
                                                          GoogleFonts.gothicA1(
                                                              fontSize: 11.sp,
                                                              color: whitetwo,
                                                              fontWeight:
                                                                  kFW600),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  '\u{20B9}${moneyFormat(FavouritedExercise[index]?["price"].toString() ?? "000")}',
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
                            )

                          // GlassmorphicContainer(
                          //     margin: EdgeInsets.only(top: 15.h),
                          //     height: 190.h,
                          //     width: 330.w,
                          //     borderRadius: 15,
                          //     blur: 15,
                          //     alignment: Alignment.center,
                          //     border: 2,
                          //     linearGradient: LinearGradient(
                          //         colors: [
                          //           white.withOpacity(0.15),
                          //           white.withOpacity(0.15)
                          //         ],
                          //         begin: Alignment.topLeft,
                          //         end: Alignment.bottomRight),
                          //     borderGradient: LinearGradient(colors: [
                          //       Colors.white.withOpacity(0.5),
                          //       Gold.withOpacity(0.01)
                          //     ]),
                          //     child: Container(
                          //       decoration: BoxDecoration(boxShadow: [
                          //         BoxShadow(
                          //           blurRadius: 20,
                          //           spreadRadius: 16,
                          //           color: Colors.black.withOpacity(0.1),
                          //         )
                          //       ]),
                          //       child: ClipRRect(
                          //         borderRadius: BorderRadius.circular(15.0),
                          //         child: BackdropFilter(
                          //           filter: ImageFilter.blur(
                          //             sigmaX: 10.0,
                          //             sigmaY: 10.0,
                          //           ),
                          //           child: Container(
                          //               width: double.infinity,
                          //               height: 190.h,
                          //               padding: EdgeInsets.all(10.r),
                          //               decoration: BoxDecoration(
                          //                   border: const GradientBoxBorder(
                          //                     gradient: LinearGradient(colors: [
                          //                       Colors.white38,
                          //                       Gold
                          //                     ]),
                          //                     width: 0.5,
                          //                   ),
                          //                   borderRadius:
                          //                       BorderRadius.circular(16.r)),
                          //               child: Column(
                          //                 mainAxisAlignment:
                          //                     MainAxisAlignment.spaceBetween,
                          //                 crossAxisAlignment:
                          //                     CrossAxisAlignment.start,
                          //                 children: [
                          //                   Row(
                          //                     mainAxisAlignment:
                          //                         MainAxisAlignment
                          //                             .spaceBetween,
                          //                     children: [
                          //                       SizedBox(
                          //                         width: 200.w,
                          //                         child: Text(
                          //                             FavouritedExercise[index]
                          //                                     ?["title"] ??
                          //                                 "Excerises",
                          //                             // myExercise[index]
                          //                             //     ["title"],
                          //                             maxLines: 1,
                          //                             style:
                          //                                 GoogleFonts.gothicA1(
                          //                                     fontSize: 15.sp,
                          //                                     color: white,
                          //                                     fontWeight:
                          //                                         kFW700)),
                          //                       ),
                          //                       GestureDetector(
                          //                         onTap: () {
                          //                           favouriteexercisewishlistHandler(
                          //                               FavouritedExercise[
                          //                                   index]["id"]);
                          //                           if (!wishlisted.contains(
                          //                               FavouritedExercise[
                          //                                   index]["id"])) {
                          //                             wishlisted.add(
                          //                                 FavouritedExercise[
                          //                                     index]["id"]);

                          //                             // Fluttertoast.showToast(
                          //                             //     msg:
                          //                             //         "Added to favourites successfully");

                          //                             //  Wishlist_jobs
                          //                             //  KWish_List));
                          //                           } else {
                          //                             wishlisted.remove(
                          //                                 FavouritedExercise[
                          //                                     index]["id"]);
                          //                             // Fluttertoast.showToast(
                          //                             //     msg:
                          //                             //         "Unfavourited successfully");
                          //                           }
                          //                           setState(() {});
                          //                         },
                          //                         child: Icon(
                          //                           wishlisted.contains(
                          //                                   FavouritedExercise[
                          //                                               index]
                          //                                           ["id"] ??
                          //                                       "")
                          //                               ? Icons.favorite_rounded
                          //                               : Icons
                          //                                   .favorite_outline_outlined,
                          //                           color: wishlisted.contains(
                          //                                   FavouritedExercise[
                          //                                       index]["id"])
                          //                               ? Colors.red
                          //                               : white,
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                   // SizedBox(
                          //                   //   height: 10.h,
                          //                   // ),
                          //                   Row(
                          //                     mainAxisAlignment:
                          //                         MainAxisAlignment
                          //                             .spaceBetween,
                          //                     children: [
                          //                       SizedBox(
                          //                         width: 200.w,
                          //                         child: Text(
                          //                             FavouritedExercise[index]
                          //                                     ?["subtitle"] ??
                          //                                 "Excerises",
                          //                             // myExercise[index]
                          //                             //     ["title"],
                          //                             maxLines: 1,
                          //                             style:
                          //                                 GoogleFonts.gothicA1(
                          //                                     fontSize: 15.sp,
                          //                                     color: white,
                          //                                     fontWeight:
                          //                                         kFW700)),
                          //                       ),
                          //                       Icon(
                          //                         Icons.share,
                          //                         color: white,
                          //                       )
                          //                     ],
                          //                   ),
                          //                   // SizedBox(
                          //                   //   height: 10.h,
                          //                   // ),
                          //                   Row(
                          //                     mainAxisAlignment:
                          //                         MainAxisAlignment
                          //                             .spaceBetween,
                          //                     crossAxisAlignment:
                          //                         CrossAxisAlignment.start,
                          //                     children: [
                          //                       // Image.asset(
                          //                       //   'assets/images/thu.png',
                          //                       //   width: 100.w,
                          //                       // ),
                          //                       Column(
                          //                         mainAxisAlignment:
                          //                             MainAxisAlignment.start,
                          //                         crossAxisAlignment:
                          //                             CrossAxisAlignment.start,
                          //                         children: [
                          //                           Text("Duration",
                          //                               maxLines: 2,
                          //                               style: GoogleFonts
                          //                                   .gothicA1(
                          //                                       fontSize:
                          //                                           kFourteenFont,
                          //                                       color: white,
                          //                                       fontWeight:
                          //                                           kFW700)),
                          //                           SizedBox(
                          //                             height: 5.h,
                          //                           ),
                          //                           Text(
                          //                               "${FavouritedExercise[index]["time"].toString()} mins",

                          //                               // myExercise[index]
                          //                               //     ["job_count"],
                          //                               maxLines: 2,
                          //                               style: GoogleFonts
                          //                                   .gothicA1(
                          //                                       fontSize:
                          //                                           kTwelveFont,
                          //                                       color: white,
                          //                                       fontWeight:
                          //                                           kFW700)),
                          //                         ],
                          //                       ),

                          //                       Column(
                          //                         mainAxisAlignment:
                          //                             MainAxisAlignment.start,
                          //                         crossAxisAlignment:
                          //                             CrossAxisAlignment.start,
                          //                         children: [
                          //                           Text("Questions",
                          //                               style: GoogleFonts
                          //                                   .gothicA1(
                          //                                       fontSize:
                          //                                           kFourteenFont,
                          //                                       color: white,
                          //                                       fontWeight:
                          //                                           kFW700)),
                          //                           SizedBox(
                          //                             height: 5.h,
                          //                           ),
                          //                           Text(
                          //                               FavouritedExercise[
                          //                                           index][
                          //                                       "exercise_questions"]
                          //                                   .length
                          //                                   .toString(),
                          //                               //"data",
                          //                               // myExercise[index]
                          //                               //     ["level"],
                          //                               style: GoogleFonts
                          //                                   .gothicA1(
                          //                                       fontSize:
                          //                                           kTwelveFont,
                          //                                       color: white,
                          //                                       fontWeight:
                          //                                           kFW700)),
                          //                         ],
                          //                       ),

                          //                       Column(
                          //                         mainAxisAlignment:
                          //                             MainAxisAlignment.start,
                          //                         crossAxisAlignment:
                          //                             CrossAxisAlignment.center,
                          //                         children: [
                          //                           Text("Authors",
                          //                               style: GoogleFonts
                          //                                   .gothicA1(
                          //                                       fontSize:
                          //                                           kFourteenFont,
                          //                                       color: white,
                          //                                       fontWeight:
                          //                                           kFW700)),
                          //                           SizedBox(
                          //                             height: 5.h,
                          //                           ),
                          //                           Text(
                          //                               FavouritedExercise[0]
                          //                                       ["coach"]
                          //                                   .length
                          //                                   .toString(),
                          //                               //"data",
                          //                               // myExercise[index]
                          //                               //     ["all_lessons"],
                          //                               style: GoogleFonts
                          //                                   .gothicA1(
                          //                                       fontSize:
                          //                                           kTwelveFont,
                          //                                       color: white,
                          //                                       fontWeight:
                          //                                           kFW700)),
                          //                         ],
                          //                       ),
                          //                     ],
                          //                   ),

                          //                   Row(
                          //                     mainAxisAlignment:
                          //                         MainAxisAlignment
                          //                             .spaceBetween,
                          //                     children: [
                          //                       Column(
                          //                         mainAxisAlignment:
                          //                             MainAxisAlignment.start,
                          //                         crossAxisAlignment:
                          //                             CrossAxisAlignment.start,
                          //                         children: [
                          //                           Text("Price",
                          //                               maxLines: 2,
                          //                               style: GoogleFonts
                          //                                   .gothicA1(
                          //                                       fontSize:
                          //                                           kFourteenFont,
                          //                                       color: white,
                          //                                       fontWeight:
                          //                                           kFW700)),
                          //                           SizedBox(
                          //                             height: 5.h,
                          //                           ),
                          //                           Text(
                          //                               "₹ ${FavouritedExercise[index]["price"].toString()}",

                          //                               // myExercise[index]
                          //                               //     ["job_count"],
                          //                               maxLines: 2,
                          //                               style: GoogleFonts
                          //                                   .gothicA1(
                          //                                       fontSize:
                          //                                           kTwelveFont,
                          //                                       color: white,
                          //                                       fontWeight:
                          //                                           kFW700)),
                          //                         ],
                          //                       ),
                          //                       // RatingBar.builder(
                          //                       //   // initialRating: myCourse[index]
                          //                       //   //         ["course_reviews"]
                          //                       //   //     ["rating"],
                          //                       //   // initialRating: myCourse[index]
                          //                       //   //     ["rating"],
                          //                       //   //         ["rating"].toString() ==
                          //                       //   //     null
                          //                       //   // ? 0.0
                          //                       //   // : double.parse(myCourse[
                          //                       //   //                 index][
                          //                       //   //             "course_reviews"]
                          //                       //   //         ["rating"].toString() ??
                          //                       //   //     0),
                          //                       //   initialRating: 2,
                          //                       //   // initialRating:dashbordData["rating"] == null ? 0.0:
                          //                       //   //     double.parse(dashbordData["rating"] ?? 0),
                          //                       //   minRating: 1,
                          //                       //   direction: Axis.horizontal,
                          //                       //   allowHalfRating: true,
                          //                       //   itemCount: 5,
                          //                       //   itemSize: 20,
                          //                       //   unratedColor: white,
                          //                       //   itemPadding:
                          //                       //       const EdgeInsets
                          //                       //               .symmetric(
                          //                       //           horizontal: 2),
                          //                       //   itemBuilder: (context, _) =>
                          //                       //       const Icon(
                          //                       //     Icons.star,
                          //                       //     color: Colors.amber,
                          //                       //     size: 10,
                          //                       //   ),
                          //                       //   onRatingUpdate: (rating) {},
                          //                       // ),
                          //                       Container(
                          //                           height: 40.h,
                          //                           width: 110.w,
                          //                           child: Ink(
                          //                             decoration:
                          //                                 const BoxDecoration(
                          //                               gradient:
                          //                                   LinearGradient(
                          //                                       colors: [
                          //                                     white,
                          //                                     grey1
                          //                                   ]),
                          //                               borderRadius:
                          //                                   BorderRadius.all(
                          //                                       Radius.circular(
                          //                                           80.0)),
                          //                             ),
                          //                             child: TextButton(
                          //                               onPressed: () {
                          //                                 Get.toNamed(
                          //                                   KExerciseDescription,
                          //                                   arguments:
                          //                                       FavouritedExercise[
                          //                                                   index]
                          //                                               ?[
                          //                                               "id"] ??
                          //                                           "",
                          //                                 );
                          //                               },
                          //                               style: ButtonStyle(
                          //                                   backgroundColor:
                          //                                       const MaterialStatePropertyAll<
                          //                                               Color>(
                          //                                           grey),
                          //                                   shape: MaterialStateProperty.all<
                          //                                           RoundedRectangleBorder>(
                          //                                       RoundedRectangleBorder(
                          //                                           borderRadius:
                          //                                               BorderRadius.circular(10
                          //                                                   .r),
                          //                                           side: const BorderSide(
                          //                                               color:
                          //                                                   grey)))),
                          //                               child: Text(
                          //                                 "View",
                          //                                 style: GoogleFonts
                          //                                     .gothicA1(
                          //                                         fontSize:
                          //                                             kFourteenFont,
                          //                                         color: white,
                          //                                         fontWeight:
                          //                                             kFW600),
                          //                               ),
                          //                             ),
                          //                           ))
                          //                     ],
                          //                   )
                          //                 ],
                          //               )),
                          //         ),
                          //       ),
                          //     ),
                          //   )

                          : const Center(
                              child: CircularProgressIndicator(
                              color: Gold,
                            ));
                    }))
                //           Text(
                //   'In Progress',
                //   style: GoogleFonts.gothicA1(
                //       fontSize: kFourteenFont, color: white, fontWeight: kFW700),
                // ),
                // Inprogress(),
                // SizedBox(
                //   height: 20.h,
                // ),
                // Text('Completed Courses',
                //     style: GoogleFonts.gothicA1(
                //         fontSize: kFourteenFont, color: white, fontWeight: kFW700)),
                // SizedBox(
                //   height: 10.h,
                // ),
                // Courses(),
                // SizedBox(
                //   height: 20.h,
                // ),
                // Text(
                //   'My Drive ',
                //   style: GoogleFonts.inter(
                //     fontSize: kFourteenFont,
                //     fontWeight: kFW700,
                //     color: white,
                //   ),
                // ),
                // SizedBox(
                //   height: 10.h,
                // ),
                // Mydrive(),
                // SizedBox(
                //   height: 30,
                // )
              ],
            ),
          )),
        ],
      ),
    );
  }
}

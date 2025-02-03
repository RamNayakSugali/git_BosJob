// ignore_for_file: camel_case_types

import 'dart:ui';

import '../../../../utils/export_file.dart';

class facouriteCoursePack extends StatefulWidget {
  const facouriteCoursePack({super.key});

  @override
  State<facouriteCoursePack> createState() => _facouriteCoursePackState();
}

class _facouriteCoursePackState extends State<facouriteCoursePack> {
  // Future favouritecoursepackswishlistHandler(int id) async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   Map data = await Services.coursespacksWhishlist(id);

  //   try {
  //     if (data["data"]["data"]["status"] == "1") {
  //       Fluttertoast.showToast(
  //         msg: data["data"]["data"]["message"],
  //       );
  //     } else {
  //       Fluttertoast.showToast(
  //         msg: data["data"]["data"]["message"],
  //       );
  //     }
  //     //  assementdetails = data["data"]["data"];
  //     // preparePayload();
  //   } catch (e) {
  //     Fluttertoast.showToast(msg: "Something Went Wrong");
  //   }

  //   //  print(data["data"][0]["data"]);
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  bool isLoading = false;
  List FavouritedCoursePacks = [];
  List originalFavouritedCoursePacks = [];

  List<int> wishlisted = <int>[];
  var profiletopacksData = Get.arguments;
  Map GetFavouratedata = {};
  Future coursepacksHandler() async {
    setState(() {
      isLoading = true;
    });
    Map payload = {
      "type": "favourate_course_pack",
      "candidate_id": UserSimplePreferences.getCandidateId(),
    };

    var value = await Services.browsePacksList(payload);

    if (value["data"] == null) {
      Fluttertoast.showToast(msg: value["message"]);
    } else {
      FavouritedCoursePacks = value["data"];
      originalFavouritedCoursePacks = value["data"];
    }
    print(value["data"]);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    coursepacksHandler();
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
        backgroundColor: darktwo,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: white),
        title: Text(
          'Favourited',
          style: GoogleFonts.gothicA1(
              fontSize: 17.sp, color: white, fontWeight: kFW700),
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
                    hintText: "Search Packs",
                  ),
                  onChanged: (value) {
                    setState(() {
                      FavouritedCoursePacks = originalFavouritedCoursePacks
                          .where((element) => element["title"].contains(value))
                          .toList();
                      debugPrint("${FavouritedCoursePacks.length}");
                    });
                  },
                ),
                // Search(),
                // SizedBox(
                //   height: 10.h,
                // ),
                // Row(
                //   children: [
                //     SizedBox(
                //       height: 20.h,
                //       child: VerticalDivider(
                //         color: Gold,
                //         width: 2.w,
                //       ),
                //     ),
                //     SizedBox(
                //       width: 8.w,
                //     ),
                //     Text(
                //       "Registered",
                //       style: GoogleFonts.gothicA1(
                //         fontSize: kSixteenFont,
                //         color: whitetwo,
                //         fontWeight: kFW700,
                //       ),
                //     ),
                //   ],
                // ),
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
                      "Course Packs",
                      style: GoogleFonts.gothicA1(
                        fontSize: kSixteenFont,
                        color: whitetwo,
                        fontWeight: kFW700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                ListView.builder(
                    itemCount: FavouritedCoursePacks.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return Wrap(
                        children: [
                          isLoading == false
                              ? GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                      KIndividualPack,
                                      arguments: FavouritedCoursePacks[index]
                                              ["id"] ??
                                          "",
                                    );
                                  },
                                  child: GlassmorphicContainer(
                                    margin: EdgeInsets.only(bottom: 10.h),
                                    //  height: 303.h,
                                    height: 240.h,
                                    width: 400.w,
                                    borderRadius: 20.r,
                                    blur: 20.r,
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
                                      margin: EdgeInsets.all(1.h),
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          blurRadius: 16,
                                          spreadRadius: 16,
                                          color: Colors.black.withOpacity(0.1),
                                        )
                                      ]),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 20.0,
                                            sigmaY: 20.0,
                                          ),
                                          child: Container(
                                              width: 400.w,
                                              padding: EdgeInsets.only(
                                                  left: 12.w,
                                                  right: 12.w,
                                                  bottom: 10.h,
                                                  top: 10.h),
                                              // width: 260.w,
                                              // padding: EdgeInsets.all(10.w),
                                              decoration: BoxDecoration(
                                                  border:
                                                      const GradientBoxBorder(
                                                    gradient: LinearGradient(
                                                        colors: [
                                                          Color.fromARGB(
                                                              97, 7, 7, 7),
                                                          darkGrey
                                                        ]),
                                                    width: 0.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.r)),
                                              child: Column(
                                                //  crossAxisAlignment: CrossAxisAlignment.stretch,
                                                children: [
                                                  // ),
                                                  Stack(
                                                    children: [
                                                      // ClipRRect(
                                                      //   borderRadius: BorderRadius.circular(
                                                      //       10.r), // Image border
                                                      //   child:
                                                      // ),
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.r),
                                                        child:
                                                            // Image.asset(
                                                            //   'assets/images/imagecourse.png',
                                                            //   height: 122.h,
                                                            // ),
                                                            SizedBox.fromSize(
                                                          // size:
                                                          //     Size.fromRadius(48), // Image radius
                                                          child: FavouritedCoursePacks[
                                                                          index][
                                                                      "course_banner"] ==
                                                                  null
                                                              ? Container(
                                                                  height: 122.h,
                                                                  width: 314,
                                                                  decoration: BoxDecoration(
                                                                      image: DecorationImage(
                                                                          image: AssetImage(
                                                                              "assets/images/default_image.png"),
                                                                          fit: BoxFit
                                                                              .fill)),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            gradient: LinearGradient(
                                                                                begin: Alignment.topCenter,
                                                                                end: Alignment.bottomCenter,
                                                                                colors: [
                                                                          Colors
                                                                              .transparent,
                                                                          darktwo
                                                                              .withOpacity(0.2),
                                                                          darktwo
                                                                              .withOpacity(0.8)
                                                                          // .withOpacity(
                                                                          //     .3),
                                                                        ])),
                                                                  ))
                                                              // SvgPicture.asset(NOIMAGES,
                                                              //     fit: BoxFit.fill,
                                                              //     height: 122.h)
                                                              // Image.asset(
                                                              //     'assets/images/logo.png',
                                                              //     height: 122.h,
                                                              //   )
                                                              : Image(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  height: 122.h,
                                                                  width: 314.w,
                                                                  image:
                                                                      NetworkImage(
                                                                    FavouritedCoursePacks[
                                                                            index]
                                                                        [
                                                                        "course_banner"],
                                                                  ),
                                                                  errorBuilder: (c,
                                                                          o,
                                                                          s) =>
                                                                      Container(
                                                                          height: 122.h,
                                                                          width: 314,
                                                                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/default_image.png"), fit: BoxFit.fill)),
                                                                          child: Container(
                                                                            decoration: BoxDecoration(
                                                                                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                                                                              Colors.transparent,
                                                                              darktwo.withOpacity(0.2),
                                                                              darktwo.withOpacity(0.8)
                                                                              // .withOpacity(
                                                                              //     .3),
                                                                            ])),
                                                                          ))
                                                                  //     DropShadowImage(
                                                                  //   //this is the package class we called

                                                                  //   //@image give Image.asset() or Image.network()
                                                                  //   image: Image.asset(
                                                                  //     fit: BoxFit.fill,
                                                                  //     'assets/images/default_image.png',
                                                                  //     height: 122.h,
                                                                  //   ),
                                                                  //   //@borderRadius if not defined default value is 0
                                                                  //   borderRadius: 20,
                                                                  //   //@blurRadius if not defined default value is
                                                                  //   blurRadius: 20,
                                                                  //   //@offset default value is Offset(8,8)
                                                                  //   offset: Offset(6, 6),
                                                                  //   //@scale if not defined default value is 1
                                                                  //   scale: 1.05,
                                                                  // ),

                                                                  // Image.asset(
                                                                  //   'assets/images/logo.png',
                                                                  //   height: 122.h,
                                                                  // )
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

                                                          //  Image.asset(
                                                          //     widget.browseCourse[index]
                                                          //         ["course_banner"],
                                                          //     // 'assets/images/imagecourse.png',
                                                          //     fit: BoxFit.cover),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        bottom: 15,
                                                        left: 12,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width: 240.w,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Image.asset(
                                                                    FavouritedCoursePacks[index]["level"] ==
                                                                            "Beginner"
                                                                        ? "assets/images/meter.png"
                                                                        : FavouritedCoursePacks[index]["level"] ==
                                                                                "Intermediate"
                                                                            ? "assets/images/intermediat_meter.png"
                                                                            : "assets/images/advanced.png",
                                                                    // FavouritedCoursePacks[index]["level"] ==
                                                                    //         "Beginner"
                                                                    //     ? 'assets/images/meter.png'
                                                                    //     : 'assets/images/advanced.png',
                                                                    height:
                                                                        24.h,
                                                                  ),
                                                                  SizedBox(
                                                                      width:
                                                                          4.w),
                                                                  Text(
                                                                    FavouritedCoursePacks[
                                                                            index]
                                                                        [
                                                                        "level"],
                                                                    //   "Beginner",
                                                                    style: GoogleFonts
                                                                        .gothicA1(
                                                                      fontSize:
                                                                          kFourteenFont,
                                                                      color: FavouritedCoursePacks[index]["level"] ==
                                                                              "Beginner"
                                                                          ? Customgreen
                                                                          : FavouritedCoursePacks[index]["level"] == "Intermediate"
                                                                              ? klightOrange
                                                                              : kdarkred,
                                                                      // color: FavouritedCoursePacks[index]["level"] ==
                                                                      //         "Beginner"
                                                                      //     ? Customgreen
                                                                      //     : kdarkred,
                                                                      fontWeight:
                                                                          kFW700,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              // onTap: () {
                                                              //   coursepackswishlistHandler(
                                                              //       FavouritedCoursePacks[
                                                              //               index]
                                                              //           [
                                                              //           "id"]);
                                                              //   if (!wishlisted
                                                              //       .contains(
                                                              //           FavouritedCoursePacks[index]
                                                              //               [
                                                              //               "id"])) {
                                                              //     wishlisted.add(
                                                              //         FavouritedCoursePacks[index]
                                                              //             [
                                                              //             "id"]);

                                                              //     // Fluttertoast.showToast(
                                                              //     //     msg:
                                                              //     //         "Added to favourites successfully");

                                                              //     //  Wishlist_jobs
                                                              //     //  KWish_List));
                                                              //   } else {
                                                              //     wishlisted.remove(
                                                              //         FavouritedCoursePacks[index]
                                                              //             [
                                                              //             "id"]);
                                                              //     // Fluttertoast.showToast(
                                                              //     //     msg:
                                                              //     //         "Unfavourited successfully");
                                                              //   }
                                                              //   setState(
                                                              //       () {});
                                                              // },
                                                              child: Icon(
                                                                FavouritedCoursePacks.where((element) =>
                                                                                element["id"] ==
                                                                                FavouritedCoursePacks[index]["id"])
                                                                            .toList()
                                                                            .length >
                                                                        0
                                                                    // wishlisted.contains(
                                                                    //         browseCoursePacks[
                                                                    //                     index]
                                                                    //                 ["id"] ??
                                                                    //             "")
                                                                    ? Icons
                                                                        .favorite_rounded
                                                                    : Icons
                                                                        .favorite_outline_outlined,
                                                                color: FavouritedCoursePacks.where((element) =>
                                                                            element["id"] ==
                                                                            FavouritedCoursePacks[index]["id"]).toList().length >
                                                                        0
                                                                    // wishlisted.contains(
                                                                    //         browseCoursePacks[
                                                                    //             index]["id"])
                                                                    ? Colors.red
                                                                    : white,
                                                              ),
                                                            ),

                                                            // Image.asset(
                                                            //   'assets/images/love.png',
                                                            //   height: 18.h,
                                                            // ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  // Stack(
                                                  //   children: [
                                                  //     ClipRRect(
                                                  //       borderRadius: BorderRadius
                                                  //           .circular(10
                                                  //               .r), // Image border
                                                  //       child:
                                                  //           SizedBox.fromSize(
                                                  //         child:
                                                  //             // size:
                                                  //             //     Size.fromRadius(48), // Image radius
                                                  //             // child: browseCoursePacks[
                                                  //             //                 index]
                                                  //             //             [
                                                  //             //             "image"] ==
                                                  //             //         null
                                                  //             //     ? Image.asset(
                                                  //             //         'assets/images/logo.png',
                                                  //             //         height:
                                                  //             //             150.h,
                                                  //             //       )
                                                  //             //     : Image(
                                                  //             //         height:
                                                  //             //             150.h,
                                                  //             //         image:
                                                  //             //             NetworkImage(
                                                  //             //           kCoursePacksimages +
                                                  //             //               browseCoursePacks[index]
                                                  //             //                   [
                                                  //             //                   "image"],
                                                  //             //         ),
                                                  //             //         errorBuilder: (c,
                                                  //             //                 o,
                                                  //             //                 s) =>
                                                  //             //             Image
                                                  //             //                 .asset(
                                                  //             //               'assets/images/logo.png',
                                                  //             //               height:
                                                  //             //                   150.h,
                                                  //             //             )
                                                  //             //         // Center(
                                                  //             //         //   child: Text(
                                                  //             //         //     "Unable to Load Image",
                                                  //             //         //     style: GoogleFonts.gothicA1(
                                                  //             //         //       fontSize: kFourteenFont,
                                                  //             //         //       color: white,
                                                  //             //         //       fontWeight: kFW700,
                                                  //             //         //     ),
                                                  //             //         //   ),
                                                  //             //         // ),
                                                  //             //         ),
                                                  //             Image.asset(
                                                  //                 'assets/images/imagecourse.png',
                                                  //                 fit: BoxFit
                                                  //                     .cover),
                                                  //       ),
                                                  //     ),
                                                  //     // Image.asset(
                                                  //     //   'assets/images/imagecourse.png',
                                                  //     // ),
                                                  //     Positioned(
                                                  //       bottom: 8,
                                                  //       left: 8,
                                                  //       child: Row(
                                                  //         mainAxisAlignment:
                                                  //             MainAxisAlignment
                                                  //                 .spaceBetween,
                                                  //         crossAxisAlignment:
                                                  //             CrossAxisAlignment
                                                  //                 .center,
                                                  //         children: [
                                                  //           SizedBox(
                                                  //             width: 205.w,
                                                  //             child: Row(
                                                  //               mainAxisAlignment:
                                                  //                   MainAxisAlignment
                                                  //                       .start,
                                                  //               crossAxisAlignment:
                                                  //                   CrossAxisAlignment
                                                  //                       .center,
                                                  //               children: [
                                                  //                 Image.asset(
                                                  //                   'assets/images/meter.png',
                                                  //                   height:
                                                  //                       24.h,
                                                  //                 ),
                                                  //                 SizedBox(
                                                  //                     width:
                                                  //                         4.w),
                                                  //                 Text(
                                                  //                   "Beginner",
                                                  //                   style: GoogleFonts
                                                  //                       .gothicA1(
                                                  //                     fontSize:
                                                  //                         kFourteenFont,
                                                  //                     color:
                                                  //                         Customgreen,
                                                  //                     fontWeight:
                                                  //                         kFW700,
                                                  //                   ),
                                                  //                 ),
                                                  //               ],
                                                  //             ),
                                                  //           ),
                                                  //           GestureDetector(
                                                  //             onTap: () {
                                                  //               coursepackswishlistHandler(
                                                  //                   browseCoursePacks[
                                                  //                           index]
                                                  //                       ["id"]);
                                                  //               if (!wishlisted.contains(
                                                  //                   browseCoursePacks[
                                                  //                           index]
                                                  //                       [
                                                  //                       "id"])) {
                                                  //                 wishlisted.add(
                                                  //                     browseCoursePacks[
                                                  //                             index]
                                                  //                         [
                                                  //                         "id"]);

                                                  //                 // Fluttertoast.showToast(
                                                  //                 //     msg:
                                                  //                 //         "Added to favourites successfully");

                                                  //                 //  Wishlist_jobs
                                                  //                 //  KWish_List));
                                                  //               } else {
                                                  //                 wishlisted.remove(
                                                  //                     browseCoursePacks[
                                                  //                             index]
                                                  //                         [
                                                  //                         "id"]);
                                                  //                 // Fluttertoast.showToast(
                                                  //                 //     msg:
                                                  //                 //         "Unfavourited successfully");
                                                  //               }
                                                  //               setState(() {});
                                                  //             },
                                                  //             child: Icon(
                                                  //               favouritedCoursePacksdata
                                                  //                           .where((element) =>
                                                  //                               element["id"] ==
                                                  //                               browseCoursePacks[index][
                                                  //                                   "id"])
                                                  //                           .toList()
                                                  //                           .length >
                                                  //                       0
                                                  //                   // wishlisted.contains(
                                                  //                   //         browseCoursePacks[
                                                  //                   //                     index]
                                                  //                   //                 ["id"] ??
                                                  //                   //             "")
                                                  //                   ? Icons
                                                  //                       .favorite_rounded
                                                  //                   : Icons
                                                  //                       .favorite_outline_outlined,
                                                  //               color: favouritedCoursePacksdata
                                                  //                           .where((element) =>
                                                  //                               element["id"] ==
                                                  //                               browseCoursePacks[index]["id"])
                                                  //                           .toList()
                                                  //                           .length >
                                                  //                       0
                                                  //                   // wishlisted.contains(
                                                  //                   //         browseCoursePacks[
                                                  //                   //             index]["id"])
                                                  //                   ? Colors.red
                                                  //                   : white,
                                                  //             ),
                                                  //           ),

                                                  //           // Image.asset(
                                                  //           //   'assets/images/love.png',
                                                  //           //   height: 18.h,
                                                  //           // ),
                                                  //         ],
                                                  //       ),
                                                  //     ),
                                                  //   ],
                                                  // ),

                                                  SizedBox(
                                                    height: 12.h,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: 130.w,
                                                        child: Text(
                                                          FavouritedCoursePacks[
                                                                      index]
                                                                  ["title"] ??
                                                              "",
                                                          maxLines: 1,
                                                          style: GoogleFonts
                                                              .gothicA1(
                                                            fontSize:
                                                                kFourteenFont,
                                                            color: whitetwo,
                                                            fontWeight: kFW600,
                                                          ),
                                                        ),
                                                      ),
                                                      FavouritedCoursePacks[
                                                                      index][
                                                                  "course_pack_exercise_tot_rating"] ==
                                                              null
                                                          ? RatingBar.builder(
                                                              ignoreGestures:
                                                                  true,
                                                              initialRating: 0,
                                                              minRating: 1,
                                                              direction: Axis
                                                                  .horizontal,
                                                              allowHalfRating:
                                                                  true,
                                                              itemCount: 5,
                                                              itemSize: 16.sp,
                                                              unratedColor:
                                                                  white,
                                                              itemPadding:
                                                                  const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          2),
                                                              itemBuilder:
                                                                  (context,
                                                                          _) =>
                                                                      const Icon(
                                                                Icons.star,
                                                                color: Colors
                                                                    .amber,
                                                                size: 10,
                                                              ),
                                                              onRatingUpdate:
                                                                  (rating) {},
                                                            )
                                                          : RatingBar.builder(
                                                              initialRating: double.parse(
                                                                  FavouritedCoursePacks[
                                                                          index]
                                                                      [
                                                                      "course_pack_exercise_tot_rating"]),
                                                              minRating: 1,
                                                              direction: Axis
                                                                  .horizontal,
                                                              allowHalfRating:
                                                                  true,
                                                              itemCount: 5,
                                                              itemSize: 16.sp,
                                                              unratedColor:
                                                                  white,
                                                              itemPadding:
                                                                  const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          2),
                                                              itemBuilder:
                                                                  (context,
                                                                          _) =>
                                                                      const Icon(
                                                                Icons.star,
                                                                color: Colors
                                                                    .amber,
                                                                size: 10,
                                                              ),
                                                              onRatingUpdate:
                                                                  (rating) {},
                                                            ),
                                                      // RatingBar.builder(
                                                      //   initialRating: 2,
                                                      //   minRating: 1,
                                                      //   direction:
                                                      //       Axis.horizontal,
                                                      //   allowHalfRating: true,
                                                      //   itemCount: 5,
                                                      //   itemSize: 16.sp,
                                                      //   unratedColor: white,
                                                      //   itemPadding:
                                                      //       const EdgeInsets
                                                      //               .symmetric(
                                                      //           horizontal: 2),
                                                      //   itemBuilder:
                                                      //       (context, _) =>
                                                      //           const Icon(
                                                      //     Icons.star,
                                                      //     color: Colors.amber,
                                                      //     size: 10,
                                                      //   ),
                                                      //   onRatingUpdate:
                                                      //       (rating) {},
                                                      // ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "₹ ${moneyFormat(FavouritedCoursePacks[index]["price"].toString())}",
                                                            style: GoogleFonts
                                                                .gothicA1(
                                                                    fontSize:
                                                                        kFourteenFont,
                                                                    color: Gold,
                                                                    fontWeight:
                                                                        kFW700),
                                                          ),
                                                          SizedBox(
                                                            width: 10.w,
                                                          ),
                                                          // Text(
                                                          //   '\u{20B9}${1699}',
                                                          //   style: GoogleFonts.gothicA1(
                                                          //       decoration:
                                                          //           TextDecoration
                                                          //               .lineThrough,
                                                          //       fontSize:
                                                          //           kTenFont,
                                                          //       color: white,
                                                          //       fontWeight:
                                                          //           kFW500),
                                                          // ),
                                                        ],
                                                      ),
                                                      Text(
                                                        FavouritedCoursePacks[
                                                                        index][
                                                                    "course_pack_exercise_tot_rating"] ==
                                                                null
                                                            ? "0/5"
                                                            : "${FavouritedCoursePacks[index]["course_pack_exercise_tot_rating"].toString()} /5",
                                                        //  "4.5/5 (200)",
                                                        style: GoogleFonts
                                                            .gothicA1(
                                                                fontSize:
                                                                    kTwelveFont,
                                                                color:
                                                                    customgrey,
                                                                fontWeight:
                                                                    kFW700),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 4.h,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            FavouritedCoursePacks[
                                                                        index][
                                                                    "course_type_master"]
                                                                ["title"],
                                                            //  "Online",
                                                            style: GoogleFonts
                                                                .gothicA1(
                                                                    fontSize:
                                                                        kTwelveFont,
                                                                    color:
                                                                        customgrey,
                                                                    fontWeight:
                                                                        kFW700),
                                                          ),
                                                          SizedBox(
                                                            width: 5.w,
                                                          ),
                                                          SizedBox(
                                                            height: 10.h,
                                                            child:
                                                                VerticalDivider(
                                                              color: customgrey,
                                                              width: 2.w,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      // Text(
                                                      //   browseCoursePacks[index]
                                                      //               [
                                                      //               "course_type_master"]
                                                      //           ["title"] ??
                                                      //       "",
                                                      //   style: GoogleFonts
                                                      //       .gothicA1(
                                                      //           fontSize:
                                                      //               kTwelveFont,
                                                      //           color:
                                                      //               customgrey,
                                                      //           fontWeight:
                                                      //               kFW700),
                                                      // ),
                                                      FavouritedCoursePacks[
                                                                          index]
                                                                      [
                                                                      "courses"]
                                                                  .length >=
                                                              1
                                                          ? Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                FavouritedCoursePacks[index]["courses"][0]["skill_masters"]
                                                                            .length >=
                                                                        3
                                                                    ? Container(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        width:
                                                                            120.w,
                                                                        padding: EdgeInsets.only(
                                                                            left:
                                                                                14.w,
                                                                            right: 14.w,
                                                                            top: 6.h,
                                                                            bottom: 6),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.r),
                                                                          color:
                                                                              customgrey,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          FavouritedCoursePacks[index]["courses"][0]["skill_masters"][1]
                                                                              [
                                                                              "title"],

                                                                          // "Visual Designer",
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: GoogleFonts.gothicA1(
                                                                              fontSize: 11.sp,
                                                                              color: darktwo,
                                                                              fontWeight: kFW600),
                                                                        ),
                                                                      )
                                                                    : SizedBox(),
                                                                SizedBox(
                                                                    width:
                                                                        10.w),
                                                                FavouritedCoursePacks[index]["courses"][0]["skill_masters"]
                                                                            .length >=
                                                                        1
                                                                    ? Container(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        width:
                                                                            110.w,
                                                                        padding: EdgeInsets.only(
                                                                            left:
                                                                                14.w,
                                                                            right: 14.w,
                                                                            top: 6.h,
                                                                            bottom: 6),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.r),
                                                                          color:
                                                                              customgrey,
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          FavouritedCoursePacks[index]["courses"][0]["skill_masters"][0]
                                                                              [
                                                                              "title"],
                                                                          // $.[]data.0.courses.0.skill_masters.0.title
                                                                          // "Product Designer",
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: GoogleFonts.gothicA1(
                                                                              fontSize: 11.sp,
                                                                              color: darktwo,
                                                                              fontWeight: kFW600),
                                                                        ),
                                                                      )
                                                                    : SizedBox(),
                                                              ],
                                                            )
                                                          : SizedBox()
                                                    ],
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Center(
                                  child: CircularProgressIndicator(
                                  color: Gold,
                                )),
                        ],
                      );
                    })),
              ],
            ),

//             Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Search(),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 ListView.builder(
//                     itemCount: FavouritedCoursePacks.length,
//                     //  itemCount: schedulelist.length,
// //physics: AlwaysScrollableScrollPhysics(),
//                     // itemCount: schedulelist.length,
//                     //  itemcount:  data.[]data.length,
//                     //  scrollDirection: Axis.horizontal,
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemBuilder: ((context, index) {
//                       return isLoading == false
//                           ? GlassmorphicContainer(
//                               margin: EdgeInsets.only(top: 15.h),
//                               height: 190.h,
//                               width: 330.w,
//                               borderRadius: 15,
//                               blur: 15,
//                               alignment: Alignment.center,
//                               border: 2,
//                               linearGradient: LinearGradient(
//                                   colors: [
//                                     white.withOpacity(0.15),
//                                     white.withOpacity(0.15)
//                                   ],
//                                   begin: Alignment.topLeft,
//                                   end: Alignment.bottomRight),
//                               borderGradient: LinearGradient(colors: [
//                                 Colors.white.withOpacity(0.5),
//                                 Gold.withOpacity(0.01)
//                               ]),
//                               child: Container(
//                                 decoration: BoxDecoration(boxShadow: [
//                                   BoxShadow(
//                                     blurRadius: 20,
//                                     spreadRadius: 16,
//                                     color: Colors.black.withOpacity(0.1),
//                                   )
//                                 ]),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(15.0),
//                                   child: BackdropFilter(
//                                     filter: ImageFilter.blur(
//                                       sigmaX: 10.0,
//                                       sigmaY: 10.0,
//                                     ),
//                                     child: Container(
//                                         width: double.infinity,
//                                         height: 190.h,
//                                         padding: EdgeInsets.all(10.r),
//                                         decoration: BoxDecoration(
//                                             border: const GradientBoxBorder(
//                                               gradient: LinearGradient(colors: [
//                                                 Colors.white38,
//                                                 Gold
//                                               ]),
//                                               width: 0.5,
//                                             ),
//                                             borderRadius:
//                                                 BorderRadius.circular(16.r)),
//                                         child: Column(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.start,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 SizedBox(
//                                                   width: 200.w,
//                                                   child: Text(
//                                                       FavouritedCoursePacks[
//                                                               index]["title"] ??
//                                                           "",
//                                                       maxLines: 1,
//                                                       style:
//                                                           GoogleFonts.gothicA1(
//                                                               fontSize: 15.sp,
//                                                               color: white,
//                                                               fontWeight:
//                                                                   kFW700)),
//                                                 ),
//                                                 GestureDetector(
//                                                   onTap: () {
//                                                     // mycoursepackswishlistHandler(
//                                                     //     browseCoursePacks[index]
//                                                     //         ["id"]);
//                                                     if (!wishlisted.contains(
//                                                         FavouritedCoursePacks[
//                                                             index]["id"])) {
//                                                       wishlisted.add(
//                                                           FavouritedCoursePacks[
//                                                               index]["id"]);

//                                                       // Fluttertoast.showToast(
//                                                       //     msg:
//                                                       //         "Added to favourites successfully");

//                                                       //  Wishlist_jobs
//                                                       //  KWish_List));
//                                                     } else {
//                                                       wishlisted.remove(
//                                                           FavouritedCoursePacks[
//                                                               index]["id"]);
//                                                       // Fluttertoast.showToast(
//                                                       //     msg:
//                                                       //         "Unfavourited successfully");
//                                                     }
//                                                     setState(() {});
//                                                   },
//                                                   child: Icon(
//                                                     wishlisted.contains(
//                                                             FavouritedCoursePacks[
//                                                                         index]
//                                                                     ["id"] ??
//                                                                 "")
//                                                         ? Icons.favorite_rounded
//                                                         : Icons
//                                                             .favorite_outline_outlined,
//                                                     color: wishlisted.contains(
//                                                             FavouritedCoursePacks[
//                                                                 index]["id"])
//                                                         ? Colors.red
//                                                         : white,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               height: 10.h,
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 // Image.asset(
//                                                 //   'assets/images/thu.png',
//                                                 //   width: 100.w,
//                                                 // ),
//                                                 Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Text("Jobs",
//                                                         maxLines: 2,
//                                                         style: GoogleFonts
//                                                             .gothicA1(
//                                                                 fontSize:
//                                                                     kFourteenFont,
//                                                                 color: white,
//                                                                 fontWeight:
//                                                                     kFW700)),
//                                                     SizedBox(
//                                                       height: 5.h,
//                                                     ),
//                                                     Text(
//                                                         FavouritedCoursePacks[
//                                                                     index]
//                                                                 ["job_count"]
//                                                             .toString(),
//                                                         maxLines: 2,
//                                                         style: GoogleFonts
//                                                             .gothicA1(
//                                                                 fontSize:
//                                                                     kTwelveFont,
//                                                                 color: white,
//                                                                 fontWeight:
//                                                                     kFW700)),
//                                                     SizedBox(
//                                                       height: 10.h,
//                                                     ),
//                                                     Text("Mode",
//                                                         style: GoogleFonts
//                                                             .gothicA1(
//                                                                 fontSize:
//                                                                     kFourteenFont,
//                                                                 color: white,
//                                                                 fontWeight:
//                                                                     kFW700)),
//                                                     SizedBox(
//                                                       height: 5.h,
//                                                     ),
//                                                     Text(
//                                                         FavouritedCoursePacks[
//                                                                         index][
//                                                                     "course_type_master"]
//                                                                 ["title"] ??
//                                                             "",
//                                                         style: GoogleFonts
//                                                             .gothicA1(
//                                                                 fontSize:
//                                                                     kTwelveFont,
//                                                                 color: white,
//                                                                 fontWeight:
//                                                                     kFW700)),
//                                                   ],
//                                                 ),

//                                                 Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Text("Level",
//                                                         style: GoogleFonts
//                                                             .gothicA1(
//                                                                 fontSize:
//                                                                     kFourteenFont,
//                                                                 color: white,
//                                                                 fontWeight:
//                                                                     kFW700)),
//                                                     SizedBox(
//                                                       height: 5.h,
//                                                     ),
//                                                     Text(
//                                                         FavouritedCoursePacks[
//                                                             index]["level"],
//                                                         style: GoogleFonts
//                                                             .gothicA1(
//                                                                 fontSize:
//                                                                     kTwelveFont,
//                                                                 color: white,
//                                                                 fontWeight:
//                                                                     kFW700)),
//                                                     SizedBox(
//                                                       height: 10.h,
//                                                     ),
//                                                     FavouritedCoursePacks[index]
//                                                                     ["hours"]
//                                                                 .toString() ==
//                                                             "0"
//                                                         ? SizedBox()
//                                                         : Text(
//                                                             "Duration",
//                                                             style: GoogleFonts
//                                                                 .gothicA1(
//                                                                     fontSize:
//                                                                         kFourteenFont,
//                                                                     color:
//                                                                         white,
//                                                                     fontWeight:
//                                                                         kFW700)),
//                                                     SizedBox(
//                                                       height: 5.h,
//                                                     ),
//                                                     FavouritedCoursePacks[index]
//                                                                     ["hours"]
//                                                                 .toString() ==
//                                                             "0"
//                                                         ? SizedBox()
//                                                         : Text(
//                                                             FavouritedCoursePacks[
//                                                                         index]
//                                                                     ["hours"]
//                                                                 .toString(),
//                                                             style: GoogleFonts
//                                                                 .gothicA1(
//                                                                     fontSize:
//                                                                         kTwelveFont,
//                                                                     color:
//                                                                         white,
//                                                                     fontWeight:
//                                                                         kFW700)),
//                                                   ],
//                                                 ),

//                                                 Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Text("Lessons",
//                                                         style: GoogleFonts
//                                                             .gothicA1(
//                                                                 fontSize:
//                                                                     kFourteenFont,
//                                                                 color: white,
//                                                                 fontWeight:
//                                                                     kFW700)),
//                                                     SizedBox(
//                                                       height: 5.h,
//                                                     ),
//                                                     Text(
//                                                         //"all_lesson",
//                                                         FavouritedCoursePacks[
//                                                             index]["lessons"],
//                                                         style: GoogleFonts
//                                                             .gothicA1(
//                                                                 fontSize:
//                                                                     kTwelveFont,
//                                                                 color: white,
//                                                                 fontWeight:
//                                                                     kFW700)),
//                                                     SizedBox(
//                                                       height: 10.h,
//                                                     ),
//                                                     Text("Price",
//                                                         textAlign:
//                                                             TextAlign.left,
//                                                         style: GoogleFonts
//                                                             .gothicA1(
//                                                                 fontSize:
//                                                                     kFourteenFont,
//                                                                 color: white,
//                                                                 fontWeight:
//                                                                     kFW700)),
//                                                     SizedBox(
//                                                       height: 5.h,
//                                                     ),
//                                                     Text(
//                                                         "₹ ${FavouritedCoursePacks[index]["price"].toString()}",
//                                                         style: GoogleFonts
//                                                             .gothicA1(
//                                                                 fontSize:
//                                                                     kTwelveFont,
//                                                                 color: white,
//                                                                 fontWeight:
//                                                                     kFW700)),
//                                                   ],
//                                                 ),
//                                                 // Column(
//                                                 //   mainAxisAlignment:
//                                                 //       MainAxisAlignment.start,
//                                                 //   crossAxisAlignment:
//                                                 //       CrossAxisAlignment.start,
//                                                 //   children: [
//                                                 //     Text(
//                                                 //         // schedulelist[index][
//                                                 //         //         "candidateinterview_schedules"]
//                                                 //         //     [0]["from_time"],
//                                                 //         // schedulelist[index][
//                                                 //         //         "candidateinterview_schedules"]
//                                                 //         //     [index]["from_time"],
//                                                 //         "from_time",
//                                                 //         //  "Thu 7:00am --- Zoom",
//                                                 //         style: GoogleFonts
//                                                 //             .gothicA1(
//                                                 //                 fontSize:
//                                                 //                     kFourteenFont,
//                                                 //                 color: white,
//                                                 //                 fontWeight:
//                                                 //                     kFW700)),
//                                                 //     SizedBox(
//                                                 //       height: 5.h,
//                                                 //     ),
//                                                 //     Container(
//                                                 //       padding: EdgeInsets.only(
//                                                 //           left: 10.w,
//                                                 //           right: 10.w),
//                                                 //       alignment:
//                                                 //           Alignment.center,
//                                                 //       height: 20.h,
//                                                 //       decoration: BoxDecoration(
//                                                 //           borderRadius:
//                                                 //               BorderRadius
//                                                 //                   .circular(
//                                                 //                       2.r),
//                                                 //           color:
//                                                 //               white.withOpacity(
//                                                 //                   0.5)),
//                                                 //       child: Text(
//                                                 //           // schedulelist[index]["title"],
//                                                 //           "Front End Dev",
//                                                 //           style: GoogleFonts
//                                                 //               .gothicA1(
//                                                 //                   fontSize:
//                                                 //                       11.sp,
//                                                 //                   color: Colors
//                                                 //                       .black,
//                                                 //                   fontWeight:
//                                                 //                       kFW700)),
//                                                 //     ),
//                                                 //   ],
//                                                 // ),
//                                               ],
//                                             ),
//                                             SizedBox(
//                                               height: 10.h,
//                                             ),

//                                             // Container(
//                                             //   padding: EdgeInsets.only(
//                                             //     left: 20.w,
//                                             //   ),
//                                             //   child: Row(
//                                             //     children: [
//                                             //       Image.asset(
//                                             //         'assets/images/React.png',
//                                             //       ),
//                                             //       SizedBox(
//                                             //         width: 20.w,
//                                             //       ),
//                                             //       SizedBox(
//                                             //         width: 200.w,
//                                             //         child: Text(
//                                             //             myCourse[index]
//                                             //                 ["title"],
//                                             //             maxLines: 2,
//                                             //             style: GoogleFonts
//                                             //                 .gothicA1(
//                                             //                     fontSize:
//                                             //                         kEighteenFont,
//                                             //                     color: white,
//                                             //                     fontWeight:
//                                             //                         kFW700)),
//                                             //       )
//                                             //     ],
//                                             //   ),
//                                             // ),
//                                             SizedBox(
//                                               height: 10.h,
//                                             ),
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 FavouritedCoursePacks[index][
//                                                             "course_pack_exercise_tot_rating"] ==
//                                                         null
//                                                     ? SizedBox()
//                                                     : RatingBar.builder(
//                                                         initialRating: double.parse(
//                                                             FavouritedCoursePacks[
//                                                                     index][
//                                                                 "course_pack_exercise_tot_rating"]),
//                                                         minRating: 1,
//                                                         direction:
//                                                             Axis.horizontal,
//                                                         allowHalfRating: true,
//                                                         itemCount: 5,
//                                                         itemSize: 20,
//                                                         unratedColor: white,
//                                                         itemPadding:
//                                                             const EdgeInsets
//                                                                     .symmetric(
//                                                                 horizontal: 2),
//                                                         itemBuilder:
//                                                             (context, _) =>
//                                                                 const Icon(
//                                                           Icons.star,
//                                                           color: Colors.amber,
//                                                           size: 10,
//                                                         ),
//                                                         onRatingUpdate:
//                                                             (rating) {},
//                                                       ),
//                                                 Container(
//                                                     height: 40.h,
//                                                     width: 110.w,
//                                                     child: Ink(
//                                                       decoration:
//                                                           const BoxDecoration(
//                                                         gradient:
//                                                             LinearGradient(
//                                                                 colors: [
//                                                               white,
//                                                               grey1
//                                                             ]),
//                                                         borderRadius:
//                                                             BorderRadius.all(
//                                                                 Radius.circular(
//                                                                     80.0)),
//                                                       ),
//                                                       child: TextButton(
//                                                         onPressed: () {
//                                                           Get.toNamed(
//                                                             KIndividualPack,
//                                                             arguments:
//                                                                 FavouritedCoursePacks[
//                                                                             index]
//                                                                         [
//                                                                         "id"] ??
//                                                                     "",
//                                                           );
//                                                         },
//                                                         // onPressed: () {

//                                                         //   //Get.toNamed(KRecipet);
//                                                         // },
//                                                         style: ButtonStyle(
//                                                             backgroundColor:
//                                                                 const MaterialStatePropertyAll<
//                                                                         Color>(
//                                                                     grey),
//                                                             shape: MaterialStateProperty.all<
//                                                                     RoundedRectangleBorder>(
//                                                                 RoundedRectangleBorder(
//                                                                     borderRadius:
//                                                                         BorderRadius.circular(10
//                                                                             .r),
//                                                                     side: const BorderSide(
//                                                                         color:
//                                                                             grey)))),
//                                                         child: Text(
//                                                           "View",
//                                                           style: GoogleFonts
//                                                               .gothicA1(
//                                                                   fontSize:
//                                                                       kFourteenFont,
//                                                                   color: white,
//                                                                   fontWeight:
//                                                                       kFW600),
//                                                         ),
//                                                       ),
//                                                     ))
//                                               ],
//                                             )
//                                           ],
//                                         )),
//                                   ),
//                                 ),
//                               ),
//                             )
//                           : const Center(child: CircularProgressIndicator());
//                     }))
//                 //           Text(
//                 //   'In Progress',
//                 //   style: GoogleFonts.gothicA1(
//                 //       fontSize: kFourteenFont, color: white, fontWeight: kFW700),
//                 // ),
//                 // Inprogress(),
//                 // SizedBox(
//                 //   height: 20.h,
//                 // ),
//                 // Text('Completed Courses',
//                 //     style: GoogleFonts.gothicA1(
//                 //         fontSize: kFourteenFont, color: white, fontWeight: kFW700)),
//                 // SizedBox(
//                 //   height: 10.h,
//                 // ),
//                 // Courses(),
//                 // SizedBox(
//                 //   height: 20.h,
//                 // ),
//                 // Text(
//                 //   'My Drive ',
//                 //   style: GoogleFonts.inter(
//                 //     fontSize: kFourteenFont,
//                 //     fontWeight: kFW700,
//                 //     color: white,
//                 //   ),
//                 // ),
//                 // SizedBox(
//                 //   height: 10.h,
//                 // ),
//                 // Mydrive(),
//                 // SizedBox(
//                 //   height: 30,
//                 // )
//               ],
//             ),
          )),
        ],
      ),
    );
  }
}

import 'dart:ui';
import 'package:bossjobs/utils/export_file.dart';
// import 'package:drop_shadow_image/drop_shadow_image.dart';
// import 'package:simple_shadow/simple_shadow.dart';
// import 'package:image_gradient/image_gradient.dart';

class Recommended extends StatefulWidget {
  List browseCourse;
  Recommended({super.key, required this.browseCourse});

  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  bool isLoading = false;

  List favouritedCourselisted = [];
  // List<int> wishlisted = <int>[];

  var profileData = Get.arguments;
  Future favcourseHandler() async {
    setState(() {
      isLoading = true;
    });
    Map payload = {
      "candidate_id": UserSimplePreferences.getCandidateId(),
      "listing_type": "favourate_courses",
    };

    var value = await Services.FavouritedCoursedatabackup(payload);

    if (value["data"] == null) {
      Fluttertoast.showToast(msg: value["message"]);
    } else {
      favouritedCourselisted = value["data"];
    }
    print(value["data"]);
    setState(() {
      isLoading = false;
    });
  }

  List<int> wishlisted = <int>[];

  Map courseswished = {};
  // bool isLoading = false;
  Future coursewishlistHandler(int id) async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.coursesWhishlist(id);

    try {
      if (data["data"]["data"]["status"] == "1") {
        Fluttertoast.showToast(
          msg: data["data"]["data"]["message"],
        );
        favcourseHandler();
      } else {
        Fluttertoast.showToast(
          msg: data["data"]["data"]["message"],
        );
        favcourseHandler();
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

  List<String> filterLevel = [];
  List<String> filterCourseType = [];
  List<String> filterCategory = [];
  List<String> filterInstitute = [];
  List<int> filterPrice = [];

  ///////////////////////////////////
  ///

  @override
  void initState() {
    getFilters();
    favcourseHandler();
    super.initState();
  }

  getFilters() {
    filterLevel.clear();
    filterCourseType.clear();
    for (int i = 0; i < widget.browseCourse.length; i++) {
      if (!filterLevel.contains(widget.browseCourse[i]["level"])) {
        filterLevel.add(widget.browseCourse[i]["level"]);
      }
    }
    for (int i = 0; i < widget.browseCourse.length; i++) {
      if (!filterCourseType
          .contains(widget.browseCourse[i]["course_type_master"]["title"])) {
        filterCourseType
            .add(widget.browseCourse[i]["course_type_master"]["title"]);
      }
    }
    for (int i = 0; i < widget.browseCourse.length; i++) {
      if (!filterPrice.contains(widget.browseCourse[i]["price"])) {
        filterPrice.add(widget.browseCourse[i]["price"]);
      }
    }
    filterPrice.sort();
    for (int i = 0; i < widget.browseCourse.length; i++) {
      if (widget.browseCourse[i]["institute"] != null) {
        if (!filterInstitute
            .contains(widget.browseCourse[i]["institute"]["name"])) {
          filterInstitute.add(widget.browseCourse[i]["institute"]["name"]);
        }
      }
    }
    for (int i = 0; i < widget.browseCourse.length; i++) {
      for (int j = 0;
          j < widget.browseCourse[i]["category_masters"].length;
          j++) {
        if (!filterCategory
            .contains(widget.browseCourse[i]["category_masters"][j]["title"])) {
          filterCategory
              .add(widget.browseCourse[i]["category_masters"][j]["title"]);
        }
      }
    }
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

  final String NOIMAGES = 'assets/images/no_image_here.svg';
  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? ListView.builder(
            itemCount: widget.browseCourse.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: ((context, index) {
              return Wrap(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        KProductionScreen,
                        arguments: widget.browseCourse[index]["id"] ?? "",
                      );
                    },
                    child: GlassmorphicContainer(
                      margin: EdgeInsets.only(top: 10.h),
                      // margin: EdgeInsets.all(5.w),
                      //  height: 303.h,
                      height: 227.h,
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
                          borderRadius: BorderRadius.circular(15.0),
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
                                decoration: BoxDecoration(
                                    border: const GradientBoxBorder(
                                      gradient: LinearGradient(colors: [
                                        Color.fromARGB(97, 7, 7, 7),
                                        darkGrey
                                      ]),
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(16.r)),
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
                                              BorderRadius.circular(10.r),
                                          child:
                                              // Image.asset(
                                              //   'assets/images/imagecourse.png',
                                              //   height: 122.h,
                                              // ),
                                              SizedBox.fromSize(
                                            // size:
                                            //     Size.fromRadius(48), // Image radius
                                            child: widget.browseCourse[index]
                                                        ["course_banner"] ==
                                                    null
                                                ? SvgPicture.asset(NOIMAGES,
                                                    fit: BoxFit.fill,
                                                    height: 122.h)
                                                // Image.asset(
                                                //     'assets/images/logo.png',
                                                //     height: 122.h,
                                                //   )
                                                : Image(
                                                    fit: BoxFit.cover,
                                                    height: 122.h,
                                                    width: 314.w,
                                                    image: NetworkImage(
                                                      widget.browseCourse[index]
                                                          ["course_banner"],
                                                    ),
                                                    errorBuilder: (c, o, s) =>
                                                        Container(
                                                            height: 122.h,
                                                            width: 314,
                                                            decoration: const BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: AssetImage(
                                                                        "assets/images/default_image.png"),
                                                                    fit: BoxFit
                                                                        .fill)),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                      gradient: LinearGradient(
                                                                          begin: Alignment
                                                                              .topCenter,
                                                                          end: Alignment
                                                                              .bottomCenter,
                                                                          colors: [
                                                                    Colors
                                                                        .transparent,
                                                                    darktwo
                                                                        .withOpacity(
                                                                            0.2),
                                                                    darktwo
                                                                        .withOpacity(
                                                                            0.8)
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
                                          bottom: 0,
                                          left: 0,
                                          right: 0,
                                          // bottom: 15,
                                          // left: 12,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin:
                                                        Alignment.bottomCenter,
                                                    end: Alignment.topCenter,
                                                    colors: [
                                                  kBackground1,
                                                  kBackground1.withOpacity(0.4),
                                                ])),
                                            padding: EdgeInsets.only(
                                                bottom: 10.h,
                                                left: 2.w,
                                                right: 2.w,
                                                top: 5.h),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 260.w,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Image.asset(
                                                        widget.browseCourse[
                                                                        index]
                                                                    ["level"] ==
                                                                "Beginner"
                                                            ? "assets/images/meter.png"
                                                            : widget.browseCourse[
                                                                            index]
                                                                        [
                                                                        "level"] ==
                                                                    "Intermediate"
                                                                ? "assets/images/intermediat_meter.png"
                                                                : "assets/images/advanced.png",
                                                        // widget.browseCourse[index]
                                                        //             ["level"] ==
                                                        //         "Beginner"
                                                        //     ? 'assets/images/meter.png'
                                                        //     : 'assets/images/advanced.png',
                                                        height: 24.h,
                                                      ),
                                                      SizedBox(width: 4.w),
                                                      Text(
                                                        widget.browseCourse[
                                                            index]["level"],
                                                        //   "Beginner",
                                                        style: GoogleFonts
                                                            .gothicA1(
                                                          fontSize:
                                                              kFourteenFont,
                                                          color: widget.browseCourse[
                                                                          index]
                                                                      [
                                                                      "level"] ==
                                                                  "Beginner"
                                                              ? Customgreen
                                                              : widget.browseCourse[
                                                                              index]
                                                                          [
                                                                          "level"] ==
                                                                      "Intermediate"
                                                                  ? klightOrange
                                                                  : kdarkred,
                                                          // color: widget.browseCourse[
                                                          //                 index]
                                                          //             ["level"] ==
                                                          //         "Beginner"
                                                          //     ? Customgreen
                                                          //     : kdarkred,
                                                          fontWeight: kFW700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    coursewishlistHandler(widget
                                                            .browseCourse[index]
                                                        ["id"]);
                                                    // if (!wishlisted.contains(
                                                    //     widget.browseCourse[index]["id"])) {
                                                    //   wishlisted.add(
                                                    //       widget.browseCourse[index]["id"]);

                                                    //   // Fluttertoast.showToast(
                                                    //   //     msg:
                                                    //   //         "Added to favourites successfully");

                                                    //   //  Wishlist_jobs
                                                    //   //  KWish_List));
                                                    // } else {
                                                    //   wishlisted.remove(
                                                    //       widget.browseCourse[index]["id"]);
                                                    //   // Fluttertoast.showToast(
                                                    //   //     msg: "Unfavourited successfully");
                                                    // }
                                                    setState(() {});
                                                  },
                                                  child: Icon(
                                                    favouritedCourselisted
                                                                .where((element) =>
                                                                    element[
                                                                        "id"] ==
                                                                    widget.browseCourse[
                                                                            index]
                                                                        ["id"])
                                                                .toList()
                                                                .length >
                                                            0
                                                        // wishlisted.contains(widget
                                                        //             .browseCourse[index]["id"] ??
                                                        //         "")
                                                        ? Icons.favorite_rounded
                                                        : Icons
                                                            .favorite_outline_outlined,
                                                    color:
                                                        // favouritedCourselisted.contains(
                                                        //         widget.browseCourse[index]
                                                        //                 ["id"] ??
                                                        //             "")
                                                        favouritedCourselisted
                                                                    .where((element) =>
                                                                        element[
                                                                            "id"] ==
                                                                        widget.browseCourse[index]
                                                                            [
                                                                            "id"])
                                                                    .toList()
                                                                    .length >
                                                                0
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
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 100.w,
                                          child: Text(
                                            widget.browseCourse[index]["title"],
                                            maxLines: 1,
                                            style: GoogleFonts.gothicA1(
                                              fontSize: kFourteenFont,
                                              color: whitetwo,
                                              fontWeight: kFW600,
                                            ),
                                          ),
                                        ),
                                        widget
                                                    .browseCourse[index]
                                                        ["course_reviews"]
                                                    .length ==
                                                0
                                            ? RatingBar.builder(
                                                tapOnlyMode: false,
                                                ignoreGestures: true,
                                                initialRating: 0,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 16.sp,
                                                unratedColor: white,
                                                itemPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 2),
                                                itemBuilder: (context, _) =>
                                                    const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 10,
                                                ),
                                                onRatingUpdate: (rating) {},
                                              )
                                            //SizedBox()
                                            : RatingBar.builder(
                                                initialRating: double.parse(
                                                    widget.browseCourse[index]
                                                            ["course_reviews"]
                                                        [0]["rating"]),
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemSize: 16.sp,
                                                unratedColor: white,
                                                itemPadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 2),
                                                itemBuilder: (context, _) =>
                                                    const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 10,
                                                ),
                                                onRatingUpdate: (rating) {},
                                              ),
                                        // RatingBar.builder(
                                        //   initialRating: 2,
                                        //   minRating: 1,
                                        //   direction: Axis.horizontal,
                                        //   allowHalfRating: true,
                                        //   itemCount: 5,
                                        //   itemSize: 16.sp,
                                        //   unratedColor: white,
                                        //   itemPadding:
                                        //       const EdgeInsets.symmetric(
                                        //           horizontal: 2),
                                        //   itemBuilder: (context, _) =>
                                        //       const Icon(
                                        //     Icons.star,
                                        //     color: Colors.amber,
                                        //     size: 10,
                                        //   ),
                                        //   onRatingUpdate: (rating) {},
                                        // ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              // '\u{20B9}${moneyFormat(
                                              //   widget.searchExerciseData[index]!["price"]!.toString()
                                              //   )}',
                                              "₹ ${moneyFormat(widget.browseCourse[index]["price"].toString())}",
                                              //  '\u{20B9}${699}',
                                              style: GoogleFonts.gothicA1(
                                                  fontSize: kFourteenFont,
                                                  color: Gold,
                                                  fontWeight: kFW700),
                                            ),
                                            // SizedBox(
                                            //   width: 10.w,
                                            // ),
                                            // Text(
                                            //   '\u{20B9}${1699}',
                                            //   style: GoogleFonts.gothicA1(
                                            //       decoration: TextDecoration
                                            //           .lineThrough,
                                            //       fontSize: kTenFont,
                                            //       color: white,
                                            //       fontWeight: kFW500),
                                            // ),
                                          ],
                                        ),
                                        Text(
                                          widget
                                                      .browseCourse[index]
                                                          ["course_reviews"]
                                                      .length ==
                                                  0
                                              ? "0/5"
                                              : "${widget.browseCourse[index]["course_reviews"][0]["rating"].toString()} /5",

                                          ///   "4.5/5 (200)",
                                          style: GoogleFonts.gothicA1(
                                              fontSize: kTwelveFont,
                                              color: customgrey,
                                              fontWeight: kFW700),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Row(
                                        //   children: [
                                        //     Text(
                                        //       widget.browseCourse[index]
                                        //               ["course_type_master"]
                                        //           ["title"],
                                        //       //  "Online",
                                        //       style: GoogleFonts.gothicA1(
                                        //           fontSize: kTwelveFont,
                                        //           color: customgrey,
                                        //           fontWeight: kFW700),
                                        //     ),
                                        //     SizedBox(
                                        //       width: 5.w,
                                        //     ),
                                        //     SizedBox(
                                        //       height: 10.h,
                                        //       child: VerticalDivider(
                                        //         color: Gold,
                                        //         width: 2.w,
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                        widget
                                                    .browseCourse[index]
                                                        ["skill_masters"]
                                                    .length >=
                                                3
                                            ? Container(
                                                width: 110.w,
                                                alignment: Alignment.center,
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
                                                  widget.browseCourse[index]
                                                          ["skill_masters"][1]
                                                      ["title"],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  //  "Visual Designer",
                                                  style: GoogleFonts.gothicA1(
                                                      fontSize: 11.sp,
                                                      color: darktwo,
                                                      fontWeight: kFW600),
                                                ),
                                              )
                                            : SizedBox(),
                                        // Container(
                                        //   width: 50.w,
                                        //   alignment: Alignment.center,
                                        //   padding: EdgeInsets.only(
                                        //       left: 14.w,
                                        //       right: 14.w,
                                        //       top: 6.h,
                                        //       bottom: 6),
                                        //   decoration: BoxDecoration(
                                        //     borderRadius:
                                        //         BorderRadius.circular(20.r),
                                        //     color: customgrey,
                                        //   ),
                                        //   child: Text(
                                        //     widget.browseCourse[index]
                                        //         ["skill_masters"][0]["title"],
                                        //     //      "Product Designer",
                                        //     overflow: TextOverflow.ellipsis,
                                        //     style: GoogleFonts.gothicA1(
                                        //         fontSize: 11.sp,
                                        //         color: darktwo,
                                        //         fontWeight: kFW600),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: 10.h,
                                    // ),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [

                                    //   ],
                                    // ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }))

        // SizedBox(
        //     height: 230.h,
        //     width: 300,
        //     child: ListView.builder(
        //         scrollDirection: Axis.horizontal,
        //         itemCount: widget.browseCourse.length,
        //         physics: NeverScrollableScrollPhysics(),
        //         shrinkWrap: true,
        //         itemBuilder: ((context, index) {
        //           return GlassmorphicContainer(
        //             margin: EdgeInsets.only(bottom: 15.h, top: 10),
        //             // height: 210.h,
        //             height: 200.h,
        //             width: double.infinity,
        //             borderRadius: 10.r,
        //             blur: 15,
        //             alignment: Alignment.center,
        //             border: 2,
        //             linearGradient: LinearGradient(
        //               colors: [
        //                 white.withOpacity(0.15),

        //                 white.withOpacity(0.15),

        //                 // kBackground.withOpacity(0.7),
        //                 // kBackground.withOpacity(0.7)
        //                 // white.withOpacity(0.15),
        //                 // white.withOpacity(0.15)
        //               ],
        //               // begin: Alignment.topLeft,
        //               // end: Alignment.bottomRight,
        //             ),
        //             borderGradient: LinearGradient(
        //               colors: [
        //                 kBackground,
        //                 //  white.withOpacity(0.5),
        //                 Gold.withOpacity(0.01)
        //               ],
        //             ),
        //             child: Container(
        //               decoration: BoxDecoration(
        //                 boxShadow: [
        //                   BoxShadow(
        //                     blurRadius: 20,
        //                     spreadRadius: 10.r,
        //                     color: Colors.black.withOpacity(0.1),
        //                   )
        //                 ],
        //               ),
        //               child: ClipRRect(
        //                 borderRadius: BorderRadius.circular(10.r),
        //                 child: BackdropFilter(
        //                   filter: ImageFilter.blur(
        //                     sigmaX: 10.0,
        //                     sigmaY: 10.0,
        //                   ),
        //                   child: Container(
        //                       width: double.infinity,
        //                       padding: EdgeInsets.all(15.r),
        //                       decoration: BoxDecoration(
        //                         border: const GradientBoxBorder(
        //                           gradient: LinearGradient(
        //                               begin: Alignment.topLeft,
        //                               end: Alignment.bottomRight,
        //                               colors: [
        //                                 kBackground,
        //                                 kBackground,
        //                                 kBackground,
        //                                 Gold
        //                               ]),
        //                           width: 0.5,
        //                         ),
        //                         borderRadius: BorderRadius.circular(10.r),
        //                       ),
        //                       child: Column(
        //                         mainAxisAlignment: MainAxisAlignment.start,
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           Row(
        //                             mainAxisAlignment:
        //                                 MainAxisAlignment.spaceBetween,
        //                             children: [
        //                               SizedBox(
        //                                 width: 200.w,
        //                                 child: Text(
        //                                     widget.browseCourse[index]["title"],
        //                                     maxLines: 2,
        //                                     style: GoogleFonts.gothicA1(
        //                                         fontSize: 15.sp,
        //                                         color: white,
        //                                         fontWeight: kFW700)),
        //                               ),
        //                               GestureDetector(
        //                                 onTap: () {
        //                                   coursewishlistHandler(
        //                                       widget.browseCourse[index]["id"]);
        //                                   // if (!wishlisted.contains(
        //                                   //     widget.browseCourse[index]["id"])) {
        //                                   //   wishlisted.add(
        //                                   //       widget.browseCourse[index]["id"]);

        //                                   //   // Fluttertoast.showToast(
        //                                   //   //     msg:
        //                                   //   //         "Added to favourites successfully");

        //                                   //   //  Wishlist_jobs
        //                                   //   //  KWish_List));
        //                                   // } else {
        //                                   //   wishlisted.remove(
        //                                   //       widget.browseCourse[index]["id"]);
        //                                   //   // Fluttertoast.showToast(
        //                                   //   //     msg: "Unfavourited successfully");
        //                                   // }
        //                                   setState(() {});
        //                                 },
        //                                 child: Icon(
        //                                   favouritedCourselisted
        //                                               .where((element) =>
        //                                                   element["id"] ==
        //                                                   widget.browseCourse[
        //                                                       index]["id"])
        //                                               .toList()
        //                                               .length >
        //                                           0
        //                                       // wishlisted.contains(widget
        //                                       //             .browseCourse[index]["id"] ??
        //                                       //         "")
        //                                       ? Icons.favorite_rounded
        //                                       : Icons.favorite_outline_outlined,
        //                                   color:
        //                                       // favouritedCourselisted.contains(
        //                                       //         widget.browseCourse[index]
        //                                       //                 ["id"] ??
        //                                       //             "")
        //                                       favouritedCourselisted
        //                                                   .where((element) =>
        //                                                       element["id"] ==
        //                                                       widget.browseCourse[
        //                                                           index]["id"])
        //                                                   .toList()
        //                                                   .length >
        //                                               0
        //                                           ? Colors.red
        //                                           : white,
        //                                 ),
        //                               ),
        //                             ],
        //                           ),
        //                           SizedBox(
        //                             height: 10.h,
        //                           ),
        //                           Row(
        //                             mainAxisAlignment:
        //                                 MainAxisAlignment.spaceBetween,
        //                             crossAxisAlignment:
        //                                 CrossAxisAlignment.start,
        //                             children: [
        //                               // Image.asset(
        //                               //   'assets/images/thu.png',
        //                               //   width: 100.w,
        //                               // ),
        //                               Column(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.start,
        //                                 crossAxisAlignment:
        //                                     CrossAxisAlignment.start,
        //                                 children: [
        //                                   Text("Jobs",
        //                                       maxLines: 2,
        //                                       style: GoogleFonts.gothicA1(
        //                                           fontSize: kFourteenFont,
        //                                           color: white,
        //                                           fontWeight: kFW700)),
        //                                   // SizedBox(
        //                                   //   height: 5.h,
        //                                   // ),
        //                                   Text(
        //                                       widget.browseCourse[index]
        //                                           ["job_count"],
        //                                       maxLines: 2,
        //                                       style: GoogleFonts.gothicA1(
        //                                           fontSize: kTwelveFont,
        //                                           color: white,
        //                                           fontWeight: kFW700)),
        //                                   SizedBox(height: 10.h),
        //                                   Text("Price",
        //                                       textAlign: TextAlign.left,
        //                                       style: GoogleFonts.gothicA1(
        //                                           fontSize: kFourteenFont,
        //                                           color: white,
        //                                           fontWeight: kFW700)),
        //                                   Text(
        //                                       "₹ ${widget.browseCourse[index]["price"].toString()}",
        //                                       style: GoogleFonts.gothicA1(
        //                                           fontSize: kTwelveFont,
        //                                           color: white,
        //                                           fontWeight: kFW700)),
        //                                 ],
        //                               ),

        //                               Column(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.start,
        //                                 crossAxisAlignment:
        //                                     CrossAxisAlignment.start,
        //                                 children: [
        //                                   Text("Level",
        //                                       style: GoogleFonts.gothicA1(
        //                                           fontSize: kFourteenFont,
        //                                           color: white,
        //                                           fontWeight: kFW700)),
        //                                   // SizedBox(
        //                                   //   height: 5.h,
        //                                   // ),
        //                                   Text(
        //                                       widget.browseCourse[index]
        //                                           ["level"],
        //                                       style: GoogleFonts.gothicA1(
        //                                           fontSize: kTwelveFont,
        //                                           color: white,
        //                                           fontWeight: kFW700)),
        //                                   SizedBox(height: 10.h),
        //                                   Text("Mode",
        //                                       style: GoogleFonts.gothicA1(
        //                                           fontSize: kFourteenFont,
        //                                           color: white,
        //                                           fontWeight: kFW700)),
        //                                   Text(
        //                                       widget.browseCourse[index]
        //                                               ["course_type_master"]
        //                                           ["title"],
        //                                       style: GoogleFonts.gothicA1(
        //                                           fontSize: kTwelveFont,
        //                                           color: white,
        //                                           fontWeight: kFW700)),
        //                                 ],
        //                               ),

        //                               Column(
        //                                 mainAxisAlignment:
        //                                     MainAxisAlignment.start,
        //                                 crossAxisAlignment:
        //                                     CrossAxisAlignment.start,
        //                                 children: [
        //                                   Text("Lessons",
        //                                       style: GoogleFonts.gothicA1(
        //                                           fontSize: kFourteenFont,
        //                                           color: white,
        //                                           fontWeight: kFW700)),
        //                                   // SizedBox(
        //                                   //   height: 5.h,
        //                                   // ),
        //                                   Text(
        //                                       widget.browseCourse[index]
        //                                           ["all_lessons"],
        //                                       style: GoogleFonts.gothicA1(
        //                                           fontSize: kTwelveFont,
        //                                           color: white,
        //                                           fontWeight: kFW700)),
        //                                 ],
        //                               ),
        //                             ],
        //                           ),
        //                           SizedBox(
        //                             height: 10.h,
        //                           ),
        //                           Row(
        //                             mainAxisAlignment:
        //                                 MainAxisAlignment.spaceBetween,
        //                             children: [
        //                               // ignore: unnecessary_null_comparison, unnecessary_null_comparison

        //                               widget
        //                                           .browseCourse[index]
        //                                               ["course_reviews"]
        //                                           .length ==
        //                                       0
        //                                   ? SizedBox()
        //                                   : RatingBar.builder(
        //                                       initialRating: double.parse(
        //                                           widget.browseCourse[index]
        //                                                   ["course_reviews"][0]
        //                                               ["rating"]),
        //                                       minRating: 1,
        //                                       direction: Axis.horizontal,
        //                                       allowHalfRating: true,
        //                                       itemCount: 5,
        //                                       itemSize: 20,
        //                                       unratedColor: white,
        //                                       itemPadding:
        //                                           const EdgeInsets.symmetric(
        //                                               horizontal: 2),
        //                                       itemBuilder: (context, _) =>
        //                                           const Icon(
        //                                         Icons.star,
        //                                         color: Colors.amber,
        //                                         size: 10,
        //                                       ),
        //                                       onRatingUpdate: (rating) {},
        //                                     ),
        //                               // RatingBar.builder(
        //                               //   // initialRating: myCourse[index]
        //                               //   //         ["course_reviews"]
        //                               //   //     ["rating"],
        //                               //   // initialRating: myCourse[index]
        //                               //   //     ["rating"],
        //                               //   //         ["rating"].toString() ==
        //                               //   //     null
        //                               //   // ? 0.0
        //                               //   // : double.parse(myCourse[
        //                               //   //                 index][
        //                               //   //             "course_reviews"]
        //                               //   //         ["rating"].toString() ??
        //                               //   //     0),
        //                               //   initialRating: 2,
        //                               //   // initialRating:dashbordData["rating"] == null ? 0.0:
        //                               //   //     double.parse(dashbordData["rating"] ?? 0),
        //                               //   minRating: 1,
        //                               //   direction: Axis.horizontal,
        //                               //   allowHalfRating: true,
        //                               //   itemCount: 5,
        //                               //   itemSize: 20,
        //                               //   unratedColor: white,
        //                               //   itemPadding: const EdgeInsets.symmetric(
        //                               //       horizontal: 2),
        //                               //   itemBuilder: (context, _) => const Icon(
        //                               //     Icons.star,
        //                               //     color: Colors.amber,
        //                               //     size: 10,
        //                               //   ),
        //                               //   onRatingUpdate: (rating) {},
        //                               // ),
        //                               Container(
        //                                   height: 40.h,
        //                                   width: 110.w,
        //                                   decoration: BoxDecoration(
        //                                     borderRadius:
        //                                         BorderRadius.circular(10.r),
        //                                     boxShadow: [
        //                                       BoxShadow(
        //                                           blurRadius: 20,
        //                                           spreadRadius: 5,
        //                                           color: Color.fromARGB(
        //                                                   255, 11, 2, 2)
        //                                               .withOpacity(0.4)),
        //                                     ],
        //                                     gradient: LinearGradient(
        //                                       begin: Alignment.topLeft,
        //                                       end: Alignment.bottomRight,
        //                                       colors: [
        //                                         grey.withOpacity(0.5),
        //                                         grey1.withOpacity(0.5),
        //                                         const Color.fromARGB(
        //                                                 255, 58, 55, 55)
        //                                             .withOpacity(0.1),
        //                                       ],
        //                                     ),
        //                                   ),
        //                                   child: TextButton(
        //                                     onPressed: () {
        //                                       Get.toNamed(
        //                                         KProductionScreen,
        //                                         // KAuthorProfile,
        //                                         arguments:
        //                                             widget.browseCourse[index]
        //                                                     ["id"] ??
        //                                                 "",
        //                                       );
        //                                     },
        //                                     // onPressed: () {

        //                                     //   //Get.toNamed(KRecipet);
        //                                     // },
        //                                     // style: ButtonStyle(
        //                                     //     backgroundColor:
        //                                     //         const MaterialStatePropertyAll<
        //                                     //             Color>(grey),
        //                                     //     shape: MaterialStateProperty.all<
        //                                     //             RoundedRectangleBorder>(
        //                                     //         RoundedRectangleBorder(
        //                                     //             borderRadius:
        //                                     //                 BorderRadius.circular(
        //                                     //                     10.r),
        //                                     //             side: const BorderSide(
        //                                     //                 color: grey)))),
        //                                     child: Text(
        //                                       "View",
        //                                       style: GoogleFonts.gothicA1(
        //                                           fontSize: kFourteenFont,
        //                                           color: white,
        //                                           fontWeight: kFW600),
        //                                     ),
        //                                   ))
        //                             ],
        //                           )
        //                         ],
        //                       )),
        //                 ),
        //               ),
        //             ),
        //           );
        //         })),
        //   )

        : const Center(
            child: CircularProgressIndicator(
            color: Gold,
          ));
  }
}

class RecommendedAssessed extends StatefulWidget {
  List browseCourse;
  RecommendedAssessed({super.key, required this.browseCourse});

  @override
  State<RecommendedAssessed> createState() => _RecommendedAssessedState();
}

class _RecommendedAssessedState extends State<RecommendedAssessed> {
  bool isLoading = false;

  List favouritedCourselisted = [];

  var profileData = Get.arguments;
  Future favcourseHandler() async {
    setState(() {
      isLoading = true;
    });
    Map payload = {
      "candidate_id": UserSimplePreferences.getCandidateId(),
      "listing_type": "favourate_courses",
    };

    var value = await Services.FavouritedCoursedatabackup(payload);

    if (value["data"] == null) {
      Fluttertoast.showToast(msg: value["message"]);
    } else {
      favouritedCourselisted = value["data"];
    }
    print(value["data"]);
    setState(() {
      isLoading = false;
    });
  }

  List<int> wishlisted = <int>[];

  Map courseswished = {};
  Future coursewishlistHandler(int id) async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.coursesWhishlist(id);

    try {
      if (data["data"]["data"]["status"] == "1") {
        Fluttertoast.showToast(
          msg: data["data"]["data"]["message"],
        );
        favcourseHandler();
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
      isLoading = false;
    });
  }

  List<String> filterLevel = [];
  List<String> filterCourseType = [];
  List<String> filterCategory = [];
  List<String> filterInstitute = [];
  List<int> filterPrice = [];

  @override
  void initState() {
    favcourseHandler();
    super.initState();
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

  final String NOIMAGES = 'assets/images/no_image_here.svg';
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.browseCourse.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: ((context, index) {
          return SizedBox(
            height: 210.h,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      KProductionScreen,
                      arguments:
                          widget.browseCourse[index]["course"]["id"] ?? "",
                    );
                  },
                  child: GlassmorphicContainer(
                    margin: EdgeInsets.only(top: 10.h),
                    // margin: EdgeInsets.all(5.w),
                    //  height: 303.h,
                    height: 200.h,
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
                        borderRadius: BorderRadius.circular(15.0),
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
                              decoration: BoxDecoration(
                                  border: const GradientBoxBorder(
                                    gradient: LinearGradient(colors: [
                                      Color.fromARGB(97, 7, 7, 7),
                                      darkGrey
                                    ]),
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(16.r)),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        child: SizedBox.fromSize(
                                          child: widget.browseCourse[index]
                                                          ["course"]
                                                      ["course_banner"] ==
                                                  null
                                              ? SvgPicture.asset(NOIMAGES,
                                                  fit: BoxFit.fill,
                                                  height: 110.h)
                                              : Image(
                                                  fit: BoxFit.cover,
                                                  height: 110.h,
                                                  width: 314.w,
                                                  image: NetworkImage(
                                                    widget.browseCourse[index]
                                                            ["course"]
                                                        ["course_banner"],
                                                  ),
                                                  errorBuilder: (c, o, s) =>
                                                      Container(
                                                          height: 110.h,
                                                          width: 314,
                                                          decoration: const BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "assets/images/default_image.png"),
                                                                  fit: BoxFit
                                                                      .fill)),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                                    gradient: LinearGradient(
                                                                        begin: Alignment
                                                                            .topCenter,
                                                                        end: Alignment
                                                                            .bottomCenter,
                                                                        colors: [
                                                                  Colors
                                                                      .transparent,
                                                                  darktwo
                                                                      .withOpacity(
                                                                          0.2),
                                                                  darktwo
                                                                      .withOpacity(
                                                                          0.8)
                                                                  // .withOpacity(
                                                                  //     .3),
                                                                ])),
                                                          ))),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 15,
                                        left: 12,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 260.w,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Image.asset(
                                                    widget.browseCourse[index]
                                                                    ["course"]
                                                                ["level"] ==
                                                            "Beginner"
                                                        ? "assets/images/meter.png"
                                                        : widget.browseCourse[
                                                                            index]
                                                                        [
                                                                        "course"]
                                                                    ["level"] ==
                                                                "Intermediate"
                                                            ? "assets/images/intermediat_meter.png"
                                                            : "assets/images/advanced.png",
                                                    // widget.browseCourse[index]
                                                    //             ["level"] ==
                                                    //         "Beginner"
                                                    //     ? 'assets/images/meter.png'
                                                    //     : 'assets/images/advanced.png',
                                                    height: 24.h,
                                                  ),
                                                  SizedBox(width: 4.w),
                                                  Text(
                                                    widget.browseCourse[index]
                                                        ["course"]["level"],
                                                    //   "Beginner",
                                                    style: GoogleFonts.gothicA1(
                                                      fontSize: kFourteenFont,
                                                      color: widget.browseCourse[
                                                                          index]
                                                                      ["course"]
                                                                  ["level"] ==
                                                              "Beginner"
                                                          ? Customgreen
                                                          : widget.browseCourse[
                                                                              index]
                                                                          [
                                                                          "course"]
                                                                      [
                                                                      "level"] ==
                                                                  "Intermediate"
                                                              ? klightOrange
                                                              : kdarkred,
                                                      // color: widget.browseCourse[
                                                      //                 index]
                                                      //             ["level"] ==
                                                      //         "Beginner"
                                                      //     ? Customgreen
                                                      //     : kdarkred,
                                                      fontWeight: kFW700,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                coursewishlistHandler(
                                                    widget.browseCourse[index]
                                                        ["course"]["id"]);
                                                // if (!wishlisted.contains(
                                                //     widget.browseCourse[index]["id"])) {
                                                //   wishlisted.add(
                                                //       widget.browseCourse[index]["id"]);

                                                //   // Fluttertoast.showToast(
                                                //   //     msg:
                                                //   //         "Added to favourites successfully");

                                                //   //  Wishlist_jobs
                                                //   //  KWish_List));
                                                // } else {
                                                //   wishlisted.remove(
                                                //       widget.browseCourse[index]["id"]);
                                                //   // Fluttertoast.showToast(
                                                //   //     msg: "Unfavourited successfully");
                                                // }
                                                setState(() {});
                                              },
                                              child: Icon(
                                                favouritedCourselisted
                                                            .where((element) =>
                                                                element["id"] ==
                                                                widget.browseCourse[
                                                                            index]
                                                                        [
                                                                        "course"]
                                                                    ["id"])
                                                            .toList()
                                                            .length >
                                                        0
                                                    // wishlisted.contains(widget
                                                    //             .browseCourse[index]["id"] ??
                                                    //         "")
                                                    ? Icons.favorite_rounded
                                                    : Icons
                                                        .favorite_outline_outlined,
                                                color:
                                                    // favouritedCourselisted.contains(
                                                    //         widget.browseCourse[index]
                                                    //                 ["id"] ??
                                                    //             "")
                                                    favouritedCourselisted
                                                                .where((element) =>
                                                                    element[
                                                                        "id"] ==
                                                                    widget.browseCourse[
                                                                            index]
                                                                        [
                                                                        "course"]["id"])
                                                                .toList()
                                                                .length >
                                                            0
                                                        ? Colors.red
                                                        : white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          widget.browseCourse[index]["course"]
                                              ["title"],
                                          maxLines: 1,
                                          style: GoogleFonts.gothicA1(
                                            fontSize: kFourteenFont,
                                            color: whitetwo,
                                            fontWeight: kFW600,
                                          ),
                                        ),
                                      ),
                                      widget
                                                  .browseCourse[index]["course"]
                                                      ["course_reviews"]
                                                  .length ==
                                              0
                                          ? RatingBar.builder(
                                              tapOnlyMode: false,
                                              ignoreGestures: true,
                                              initialRating: 0,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: false,
                                              itemCount: 5,
                                              itemSize: 16.sp,
                                              unratedColor: white,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 2),
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 10,
                                              ),
                                              onRatingUpdate: (rating) {},
                                            )
                                          //SizedBox()
                                          : RatingBar.builder(
                                              initialRating:
                                                  double.parse(
                                                      widget.browseCourse[index]
                                                                  ["course"]
                                                              ["course_reviews"]
                                                          [0]["rating"]),
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 16.sp,
                                              unratedColor: white,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 2),
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 10,
                                              ),
                                              onRatingUpdate: (rating) {},
                                            ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            // '\u{20B9}${moneyFormat(
                                            //   widget.searchExerciseData[index]!["price"]!.toString()
                                            //   )}',
                                            "₹ ${moneyFormat(widget.browseCourse[index]["course"]["price"].toString())}",
                                            //  '\u{20B9}${699}',
                                            style: GoogleFonts.gothicA1(
                                                fontSize: kFourteenFont,
                                                color: Gold,
                                                fontWeight: kFW700),
                                          ),
                                          // SizedBox(
                                          //   width: 10.w,
                                          // ),
                                          // Text(
                                          //   '\u{20B9}${1699}',
                                          //   style: GoogleFonts.gothicA1(
                                          //       decoration: TextDecoration
                                          //           .lineThrough,
                                          //       fontSize: kTenFont,
                                          //       color: white,
                                          //       fontWeight: kFW500),
                                          // ),
                                        ],
                                      ),
                                      Text(
                                        widget
                                                    .browseCourse[index]
                                                        ["course"]
                                                        ["course_reviews"]
                                                    .length ==
                                                0
                                            ? "0/5"
                                            : "${widget.browseCourse[index]["course"]["course_reviews"][0]["rating"].toString()} /5",

                                        ///   "4.5/5 (200)",
                                        style: GoogleFonts.gothicA1(
                                            fontSize: kTwelveFont,
                                            color: customgrey,
                                            fontWeight: kFW700),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            widget.browseCourse[index]["course"]
                                                ["course_type_master"]["title"],
                                            //  "Online",
                                            style: GoogleFonts.gothicA1(
                                                fontSize: kTwelveFont,
                                                color: customgrey,
                                                fontWeight: kFW700),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                            child: VerticalDivider(
                                              color: Gold,
                                              width: 2.w,
                                            ),
                                          ),
                                        ],
                                      ),
                                      widget
                                                  .browseCourse[index]["course"]
                                                      ["skill_masters"]
                                                  .length >=
                                              3
                                          ? Container(
                                              width: 110.w,
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.only(
                                                  left: 14.w,
                                                  right: 14.w,
                                                  top: 6.h,
                                                  bottom: 6),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.r),
                                                color: customgrey,
                                              ),
                                              child: Text(
                                                widget.browseCourse[index]
                                                            ["course"]
                                                        ["skill_masters"][1]
                                                    ["title"],
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                //  "Visual Designer",
                                                style: GoogleFonts.gothicA1(
                                                    fontSize: 11.sp,
                                                    color: darktwo,
                                                    fontWeight: kFW600),
                                              ),
                                            )
                                          : SizedBox(),
                                      Container(
                                        width: 110.w,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            left: 14.w,
                                            right: 14.w,
                                            top: 6.h,
                                            bottom: 6),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.r),
                                          color: customgrey,
                                        ),
                                        child: Text(
                                          widget.browseCourse[index]["course"]
                                              ["skill_masters"][0]["title"],
                                          //      "Product Designer",
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.gothicA1(
                                              fontSize: 11.sp,
                                              color: darktwo,
                                              fontWeight: kFW600),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}

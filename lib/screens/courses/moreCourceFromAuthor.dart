import 'dart:ui';

import '../../utils/export_file.dart';

class MoreCourseDetails extends StatefulWidget {
  Map? moreData;
  MoreCourseDetails({super.key, this.moreData});

  @override
  State<MoreCourseDetails> createState() => _MoreCourseDetailsState();
}

class _MoreCourseDetailsState extends State<MoreCourseDetails> {
  List favouritedCourselisted = [];
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
    setState(() {
      isLoading = false;
    });
  }

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
      } else {
        Fluttertoast.showToast(
          msg: data["data"]["data"]["message"],
        );
      }
      favcourseHandler();
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
  @override
  void initState() {
    favcourseHandler();
    super.initState();
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
            'Course',
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
            ),
          ],
        ),
        body: Stack(
          children: [
            Background(),
            SingleChildScrollView(
                child: Container(
              margin: EdgeInsets.all(15.w),
              child: isLoading == false
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 180,
                          width: double.infinity,
                          child: widget.moreData!["course_banner"] == null
                              ? Image.asset(
                                  'assets/images/default_image.png',
                                  fit: BoxFit.fill,
                                )
                              // Image.asset(
                              //     'assets/images/no image.jpg',
                              //   )
                              : Image(
                                  image: NetworkImage(kCourseURL +
                                      widget.moreData!["course_banner"]),
                                  errorBuilder: (c, o, s) => Center(
                                      child: Image.asset(
                                    'assets/images/default_image.png',
                                    fit: BoxFit.fill,
                                    height: 180.h,
                                  )
                                      // Text(
                                      //   "Unable to Load Image",
                                      //   style: GoogleFonts.gothicA1(
                                      //     fontSize: kFourteenFont,
                                      //     color: white,
                                      //     fontWeight: kFW700,
                                      //   ),
                                      // ),
                                      ),
                                ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 200.w,
                              child: Text(
                                widget.moreData!["title"] ?? "",
                                maxLines: 2,
                                style: GoogleFonts.gothicA1(
                                  fontSize: kEighteenFont,
                                  color: white,
                                  fontWeight: kFW700,
                                ),
                              ),
                            ),
                            // RatingBar.builder(
                            //   initialRating: 3,
                            //   minRating: 1,
                            //   direction: Axis.horizontal,
                            //   allowHalfRating: true,
                            //   itemCount: 5,
                            //   itemSize: 18.h,
                            //   unratedColor: white,
                            //   itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
                            //   itemBuilder: (context, _) => const Icon(
                            //     Icons.star,
                            //     color: Gold,
                            //   ),
                            //   onRatingUpdate: (rating) {},
                            // ),
                            widget.moreData!["course_reviews"].length == 0
                                ? SizedBox()
                                : RatingBar.builder(
                                    //initialRating: 4,

                                    initialRating: double.parse(
                                        widget.moreData!["course_reviews"][0]
                                            ["rating"]),
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 20,
                                    unratedColor: white,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 10,
                                    ),
                                    onRatingUpdate: (rating) {},
                                  ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          '\u{20B9}${widget.moreData!["price"].toString()}',
                          style: GoogleFonts.gothicA1(
                            fontSize: kEighteenFont,
                            color: Gold,
                            fontWeight: kFW700,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          widget.moreData!["sub_title"] ?? "",
                          style: GoogleFonts.gothicA1(
                            fontSize: kSixteenFont,
                            color: white,
                            fontWeight: kFW600,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Introduction",
                          style: GoogleFonts.gothicA1(
                            fontSize: kSixteenFont,
                            color: white,
                            fontWeight: kFW700,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          parse(widget.moreData!["description"] ?? "")
                              .body!
                              .text,
                          // ,
                          style: GoogleFonts.gothicA1(
                            fontSize: 11.sp,
                            color: white,
                            fontWeight: kFW400,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          "More Information",
                          style: GoogleFonts.gothicA1(
                            fontSize: kSixteenFont,
                            color: white,
                            fontWeight: kFW700,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          parse(widget.moreData!["more_inforamtion"] ?? "")
                              .body!
                              .text,
                          // widget.moreData!["more_inforamtion"] ??
                          //     "",
                          style: GoogleFonts.gothicA1(
                            fontSize: 11.sp,
                            color: white,
                            fontWeight: kFW400,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          "You will learn",
                          style: GoogleFonts.gothicA1(
                            fontSize: kSixteenFont,
                            color: white,
                            fontWeight: kFW700,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          "Course Content",
                          style: GoogleFonts.gothicA1(
                            fontSize: kSixteenFont,
                            color: white,
                            fontWeight: kFW700,
                          ),
                        ),
                        ListView.builder(
                          // itemCount: 1,
                          itemCount:
                              widget.moreData!["course_modules"].length ?? 0,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return isLoading == false
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Text(
                                        "${index + 1}${" "}${widget.moreData!["course_modules"][index]["title"] ?? ""}",
                                        style: GoogleFonts.gothicA1(
                                          fontSize: kSixteenFont,
                                          color: white,
                                          fontWeight: kFW700,
                                        ),
                                      ),
                                      ListView.builder(
                                        itemCount:
                                            widget.moreData!["course_modules"]
                                                        ?[index]["lessons"] !=
                                                    null
                                                ? widget
                                                    .moreData!["course_modules"]
                                                        [index]["lessons"]
                                                    .length
                                                : 0,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: ((context, i) {
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 10.h),
                                              Text(
                                                widget.moreData![
                                                                "course_modules"]
                                                            [index]["lessons"]
                                                        [i]["title"] ??
                                                    "",
                                                style: GoogleFonts.gothicA1(
                                                  fontSize: 15.sp,
                                                  color: white,
                                                  fontWeight: kFW600,
                                                ),
                                              ),
                                              SizedBox(height: 5.h),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${widget.moreData!["course_modules"][index]["lessons"][i]["lesson_assignments"].length.toString()} Assignments",
                                                    style: GoogleFonts.gothicA1(
                                                      fontSize: 11.sp,
                                                      color: white,
                                                      fontWeight: kFW400,
                                                    ),
                                                  ),
                                                  widget.moreData!["course_modules"]
                                                                      [index]
                                                                  ["lessons"][i]
                                                              [
                                                              "course_exercise"] !=
                                                          null
                                                      ? Text(
                                                          "  ${widget.moreData!["course_modules"][index]["lessons"][i]["course_exercise"].length.toString()} Exercises",
                                                          style: GoogleFonts
                                                              .gothicA1(
                                                            fontSize: 11.sp,
                                                            color: white,
                                                            fontWeight: kFW400,
                                                          ),
                                                        )
                                                      : SizedBox(),
                                                ],
                                              ),
                                            ],
                                          );
                                        }),
                                      ),
                                    ],
                                  )
                                : const Center(
                                    child: CircularProgressIndicator(
                                    color: Gold,
                                  ));
                          }),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                favouritedCourselisted
                                        .where((element) =>
                                            element["id"] ==
                                            widget.moreData!["id"])
                                        .toList()
                                        .isEmpty
                                    ? coursewishlistHandler(
                                        widget.moreData!["id"])
                                    : null;
                              },
                              child: GlassmorphicContainer(
                                height: 42.h,
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
                                  end: Alignment.bottomRight,
                                ),
                                borderGradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    white.withOpacity(0.5),
                                    white.withOpacity(0.5),
                                    Gold.withOpacity(0.5)
                                  ],
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 16,
                                        spreadRadius: 16,
                                        color: Colors.black.withOpacity(0.1),
                                      )
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 20.0,
                                        sigmaY: 20.0,
                                      ),
                                      child: Text(
                                        favouritedCourselisted
                                                .where((element) =>
                                                    element["id"] ==
                                                    widget.moreData!["id"])
                                                .toList()
                                                .isEmpty
                                            ? "Add to Wishlist"
                                            : "Added to Wishlist",
                                        style: GoogleFonts.gothicA1(
                                          fontSize: kFourteenFont,
                                          color: white,
                                          fontWeight: kFW500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        /////////////////////////////////////////////////
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Gold,
                      ),
                    ),
            )),
          ],
        ));
  }
}

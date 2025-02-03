import 'dart:ui';

import '../../utils/export_file.dart';

class MyExercises extends StatefulWidget {
  const MyExercises({super.key});

  @override
  State<MyExercises> createState() => _MyExercisesState();
}

class _MyExercisesState extends State<MyExercises> {
  bool isLoading = false;
  List myfavouritedExercisedata = [];
  List<int> wishlisted = <int>[];
  // List<int> wishlistedexercise = <int>[];
  var profiletoexerciseData = Get.arguments;
  Future myfavouratedexerciseHandler() async {
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
      myfavouritedExercisedata = value["data"];
    }
    print(value["data"]);
    setState(() {
      isLoading = false;
    });
  }

  /////////////
  Future myexercisewishlistHandler(int id) async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.WhishlistedExercises(id);

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

  //bool isLoading = false;
  List myExercise = [];
  List originalmyExercise = [];
  // List<int> wishlisted = <int>[];
  List<int> wishlistedexercise = <int>[];
  //var profiletoexerciseData = Get.arguments;
  Future exerciseHandler() async {
    setState(() {
      isLoading = true;
    });
    Map payload = {
      "type": "purchased",
      "candidate_id": profiletoexerciseData["candidates"]["CandidateDetails"]
              ["id"]
          .toString(),
      //  "candidate_id": "502",

      //"type": "purchased",
    };

    var value = await Services.getsearchexerciseList(payload);

    if (value["data"] == null) {
      Fluttertoast.showToast(msg: value["message"]);
    } else {
      myExercise = value["data"];
      originalmyExercise = value["data"];
    }
    print(value["data"]);
    setState(() {
      isLoading = false;
    });
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
  void initState() {
    super.initState();
    exerciseHandler();
    myfavouratedexerciseHandler();
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
          'My Exercises',
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
                    hintText: "Search Exercise",
                  ),
                  onChanged: (value) {
                    setState(() {
                      myExercise = originalmyExercise
                          .where((element) => element["title"].contains(value))
                          .toList();
                      debugPrint("${myExercise.length}");
                    });
                  },
                ),
                //     Search(),
                SizedBox(
                  height: 10.h,
                ),
                myExercise.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: myExercise.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                KExerciseDescription,
                                arguments: myExercise[index]?["id"] ?? "",
                              );
                              // Get.toNamed(
                              //   // KProductionScreen,
                              //   // arguments: myCourse[
                              //   //             index]
                              //   //         ["id"] ??
                              //   //     "",
                              // );
                            },
                            // onTap: () {
                            //   Get.toNamed(
                            //     KExerciseDescription,
                            //     arguments: widget.searchExerciseData[index]?["id"] ?? "",
                            //   );
                            // },
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                myExercise[index]?["title"] ??
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
                                                      myexercisewishlistHandler(
                                                          myExercise[index]
                                                              ["id"]);
                                                      if (!wishlisted.contains(
                                                          myExercise[index]
                                                              ["id"])) {
                                                        wishlisted.add(
                                                            myExercise[index]
                                                                ["id"]);

                                                        // Fluttertoast.showToast(
                                                        //     msg:
                                                        //         "Added to favourites successfully");

                                                        //  Wishlist_jobs
                                                        //  KWish_List));
                                                      } else {
                                                        wishlisted.remove(
                                                            myExercise[index]
                                                                ["id"]);
                                                        // Fluttertoast.showToast(
                                                        //     msg:
                                                        //         "Unfavourited successfully");
                                                      }
                                                      setState(() {});
                                                    },
                                                    child: Icon(
                                                      myfavouritedExercisedata
                                                                  .where((element) =>
                                                                      element[
                                                                          "id"] ==
                                                                      myExercise[
                                                                              index]
                                                                          [
                                                                          "id"])
                                                                  .toList()
                                                                  .length >
                                                              0
                                                          // wishlisted.contains(
                                                          //         myExercise[index]
                                                          //                 ["id"] ??
                                                          //             "")
                                                          ? Icons
                                                              .favorite_rounded
                                                          : Icons
                                                              .favorite_outline_outlined,
                                                      color: myfavouritedExercisedata
                                                                  .where((element) =>
                                                                      element[
                                                                          "id"] ==
                                                                      myExercise[
                                                                              index]
                                                                          [
                                                                          "id"])
                                                                  .toList()
                                                                  .length >
                                                              0
                                                          // wishlisted.contains(
                                                          //         myExercise[index]
                                                          //             ["id"])
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
                                                        await Clipboard.setData(
                                                            ClipboardData(
                                                                text:
                                                                    "https://dev.bossjobs.co.in/#/student/exercisesView/${myExercise[index]?["id"]}"));
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
                                                    "${myExercise[index]["time"].toString()} mins",
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
                                                    "06",
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
                                                    "${myExercise[index]["exercise_questions"].length.toString()} Questions",
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
                                                  myExercise[index]
                                                          ?["skill_masters"][0]
                                                      ["title"],
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
                                              myExercise[index]["skill_masters"]
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
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.r),
                                                        color: customgrey,
                                                      ),
                                                      child: Text(
                                                        myExercise[index]?[
                                                                "skill_masters"]
                                                            [1]["title"],
                                                        maxLines: 1,
                                                        // "Product Designer",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts
                                                            .gothicA1(
                                                                fontSize: 11.sp,
                                                                color: darktwo,
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
                                          //             BorderRadius.circular(20.r),
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
                                          //             BorderRadius.circular(20.r),
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
                                                MainAxisAlignment.spaceBetween,
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
                                                    myExercise[index]?["coach"]
                                                        ["user"]["name"],
                                                    style: GoogleFonts.gothicA1(
                                                        fontSize: 11.sp,
                                                        color: whitetwo,
                                                        fontWeight: kFW600),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "₹ ${moneyFormat(myExercise[index]["price"].toString())}",
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
                      )
                    : Center(
                        child: Text("NO DATA",
                            style: GoogleFonts.gothicA1(
                              letterSpacing: 1,
                              fontSize: 12.sp,
                              color: white,
                              fontWeight: kFW400,
                            )),
                      )

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
}           //           Text(
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
     
 

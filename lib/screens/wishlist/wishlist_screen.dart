import 'package:dio/dio.dart' as dio;

import '../../models/job_model.dart';
import '../../utils/export_file.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  var exerciseid = Get.arguments;
  bool isLoading = false;
  List favouratedExercise = [];
  List<int> wishlistedexercise = <int>[];
  Future exerciseHandler() async {
    setState(() {
      isLoading = true;
    });
    Map payload = {
      "type": "search_exercise",
    };

    var value = await Services.getsearchexerciseList(payload);

    if (value["data"] == null) {
      Fluttertoast.showToast(msg: value["message"]);
    } else {
      favouratedExercise = value["data"];
    }
    print(value["data"]);
    setState(() {
      isLoading = false;
    });
  }

  var ids = Get.arguments;
  // bool isLoading = false;
  bool pressGeoON = false;
  bool cmbscritta = false;
  // bool isLoading = false;
  bool is_applied = false;
  var name = "Apply";

  List favourited = [];

  Future browsedHandler() async {
    setState(() {
      isLoading = true;
    });
    Map payload = {
      "search_type": "all",
      //"search_type": "favourated",
    };

    var value = await Services.getsearchtypeapply(payload);

    if (value["data"] == null) {
      Fluttertoast.showToast(msg: value["message"]);
    } else {
      favourited = value["data"];
    }
    print(value["data"]);
    await favoriteJobListHandler();
    setState(() {
      isLoading = false;
    });
  }

  List<JobModel> favouriteJobs = [];
  List<JobModel> allFavouriteJobs = [];

  Future favoriteJobListHandler() async {
    favouriteJobs.clear();

    dio.Response response = await Services.getFavoriteJobList();

    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        response.data['data'].forEach((v) {
          if (v['is_favourated'] == "1") {
            favouriteJobs.add(JobModel.fromJson(v));
            allFavouriteJobs.add(JobModel.fromJson(v));
          }
        });
      }
    }
  }

  // List applied = [];

  // Future appliedHandler() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   Map payload = {
  //     "search_type": "all",
  //   };
  //   print(payload);

  //   var value = await Services.getsearchtype(payload);
  //   print(value);
  //   if (value["data"] == null) {
  //     Fluttertoast.showToast(msg: value["message"]);
  //   } else {
  //     applied = value["data"];
  //   }

  //   print(value["data"]);
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   appliedHandler();
  // }
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    //ids;
    browsedHandler();
    exerciseHandler();
    // Future.delayed(const Duration(milliseconds: 3000), () {
    //   setState(() {
    //     isLoaded = true;
    //     is_applied = false;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        
        automaticallyImplyLeading: false,
        backgroundColor: darktwo,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Wishlist',
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
          )
        ],
      ),
      body: Stack(
        children: [
          Background(),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(15.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.h),

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
                      hintText: "Job Title",
                    ),
                    onChanged: (value) {
                      setState(() {
                        favouriteJobs = allFavouriteJobs
                            .where((element) => element.title!
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
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
                        "Jobs",
                        style: GoogleFonts.gothicA1(
                          fontSize: kSixteenFont,
                          color: whitetwo,
                          fontWeight: kFW700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  // Text("Jobs"),
                  isLoading == false
                      ? FavoriteJobList(
                          favouriteJobs: favouriteJobs,
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            color: Gold,
                          ),
                        ),
                  // Text("exercises"),
                  // isLoading == false
                  //     ? SingleChildScrollView(
                  //         child: ListView.builder(
                  //             shrinkWrap: true,
                  //             physics: const NeverScrollableScrollPhysics(),
                  //             itemCount: exerciseid.length,
                  //             itemBuilder: ((context, index) {
                  //               return favouratedExercise[index]["id"] == exerciseid[index]
                  //                   ? GlassmorphicContainer(
                  //                       margin: EdgeInsets.only(bottom: 15.w),
                  //                       height: 170.h,
                  //                       width: double.infinity,
                  //                       borderRadius: 15,
                  //                       blur: 15,
                  //                       alignment: Alignment.center,
                  //                       border: 2,
                  //                       linearGradient: LinearGradient(
                  //                           colors: [white.withOpacity(0.15), white.withOpacity(0.15)],
                  //                           begin: Alignment.topLeft,
                  //                           end: Alignment.bottomRight),
                  //                       borderGradient:
                  //                           LinearGradient(colors: [white.withOpacity(0.5), Gold.withOpacity(0.01)]),
                  //                       child: Container(
                  //                         decoration: BoxDecoration(boxShadow: [
                  //                           BoxShadow(
                  //                             blurRadius: 20,
                  //                             spreadRadius: 16,
                  //                             color: Colors.black.withOpacity(0.1),
                  //                           )
                  //                         ]),
                  //                         child: ClipRRect(
                  //                           borderRadius: BorderRadius.circular(15.0),
                  //                           child: BackdropFilter(
                  //                             filter: ImageFilter.blur(
                  //                               sigmaX: 10.0,
                  //                               sigmaY: 10.0,
                  //                             ),
                  //                             child: Container(
                  //                                 width: double.infinity,
                  //                                 height: 190.h,
                  //                                 padding: EdgeInsets.all(10.r),
                  //                                 decoration: BoxDecoration(
                  //                                     border: const GradientBoxBorder(
                  //                                       gradient: LinearGradient(colors: [Colors.white38, Gold]),
                  //                                       width: 0.5,
                  //                                     ),
                  //                                     borderRadius: BorderRadius.circular(16.r)),
                  //                                 child: Column(
                  //                                   mainAxisAlignment: MainAxisAlignment.start,
                  //                                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                                   children: [
                  //                                     // SizedBox(
                  //                                     //   height: 8.h,
                  //                                     // ),
                  //                                     Row(
                  //                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                                       children: [
                  //                                         Container(
                  //                                           width: 230.w,
                  //                                           child: Text(
                  //                                               favouratedExercise[index]?["title"] ?? "Excerises",
                  //                                               maxLines: 2,
                  //                                               // "Assessment 101",
                  //                                               style: GoogleFonts.gothicA1(
                  //                                                   fontSize: kEighteenFont,
                  //                                                   color: white,
                  //                                                   fontWeight: kFW700)),
                  //                                         ),
                  //
                  //                                         // SizedBox(
                  //                                         //   width: 50.w,
                  //                                         //   height: 22.w,
                  //                                         //   child: Image.asset(
                  //                                         //     'assets/images/love.png',
                  //                                         //   ),
                  //                                         // ),
                  //                                       ],
                  //                                     ),
                  //                                     SizedBox(
                  //                                       height: 8.h,
                  //                                     ),
                  //                                     RichText(
                  //                                       text: TextSpan(
                  //                                         text: 'Duration ',
                  //                                         style: GoogleFonts.gothicA1(
                  //                                             fontSize: 11.sp, color: white, fontWeight: kFW500),
                  //                                         children: [
                  //                                           TextSpan(
                  //                                             text: favouratedExercise[index]?["time"].toString(),
                  //                                             style: GoogleFonts.gothicA1(
                  //                                                 fontSize: 11.sp, color: Gold, fontWeight: kFW500),
                  //                                           ),
                  //                                         ],
                  //                                       ),
                  //                                     ),
                  //
                  //                                     SizedBox(
                  //                                       height: 4.h,
                  //                                     ), //exercise_questions.length
                  //                                     Text(
                  //                                         "Questions  ${favouratedExercise[index]!["exercise_questions"].length.toString()} ",
                  //                                         style: GoogleFonts.gothicA1(
                  //                                             fontSize: 11.sp, color: white, fontWeight: kFW500)),
                  //                                     SizedBox(
                  //                                       height: 15.h,
                  //                                     ),
                  //                                     Wrap(
                  //                                       children: [
                  //                                         Padding(
                  //                                           padding: EdgeInsets.only(right: 10.w),
                  //                                           child: Text(
                  //                                               favouratedExercise[index]?["category_master"]
                  //                                                       ?["title"] ??
                  //                                                   "New Skills",
                  //                                               maxLines: 1,
                  //                                               style: GoogleFonts.gothicA1(
                  //                                                   fontSize: 11.sp, color: white, fontWeight: kFW500)),
                  //                                         ),
                  //                                       ],
                  //                                     ),
                  //
                  //                                     SizedBox(
                  //                                       height: 15.h,
                  //                                     ),
                  //                                     Text('\u{20B9}${favouratedExercise[index]?["price"] ?? "000"}',
                  //                                         style: GoogleFonts.gothicA1(
                  //                                             fontSize: kSixteenFont, color: Gold, fontWeight: kFW600))
                  //                                   ],
                  //                                 )),
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     )
                  //                   : SizedBox();
                  //             })),
                  //       )
                  //     : const Center(child: CircularProgressIndicator()),

                  SizedBox(height: 10.h),
                  // WishListCategories(),
                  // SizedBox(height: 15.h),
                  // Text(
                  //   "Courses",
                  //   style: GoogleFonts.inter(
                  //     color: white,
                  //     fontSize: kSixteenFont,
                  //     fontWeight: kFW700,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10.h,
                  // ),
                  // Wishlist_grid(),
                  // SizedBox(height: 15.h),
                  // Most_popular(),
                  // SizedBox(height: 15.h),
                  // Text(
                  //   "Courses",
                  //   style: GoogleFonts.inter(
                  //     color: white,
                  //     fontSize: kSixteenFont,
                  //     fontWeight: kFW700,
                  //   ),
                  // ),
                  // SizedBox(height: 10.h),
                  // const Wishlist_jobs()
                ],
              ),
            ),
          ),
        ],
      ),
    );

    // Scaffold(
    //   backgroundColor: kBackground,
    //   appBar: AppBar(
    //     backgroundColor: Colors.transparent,
    //     elevation: 0,
    //     centerTitle: true,
    //     title: Text(
    //       'WishList',
    //       style: GoogleFonts.gothicA1(
    //           fontSize: kEighteenFont, color: white, fontWeight: kFW700),
    //     ),
    //     actions: [
    //       Center(
    //         child: GestureDetector(
    //           onTap: () {
    //             Get.toNamed(KNotification);
    //           },
    //           child: Stack(
    //             children: [
    //               Image.asset(
    //                 'assets/images/bell.png',
    //                 width: 22.w,
    //               ),
    //               Positioned(
    //                   left: 13.r,
    //                   //top: .h,
    //                   child: const CircleAvatar(
    //                     radius: 5,
    //                     backgroundColor: Colors.green,
    //                   ))
    //             ],
    //           ),
    //         ),
    //       ),
    //       SizedBox(
    //         width: 13.w,
    //       )
    //     ],
    //   ),
    //   body: Stack(
    //     children: [
    //       const Background(),
    //       SingleChildScrollView(
    //         child: Container(
    //           margin: EdgeInsets.all(15.w),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               SizedBox(height: 15.h),

    //               TextFormField(
    //                 maxLength: 8,
    //                 decoration: InputDecoration(
    //                   prefixIcon: const Icon(Icons.search, color: Gold),
    //                   filled: true,
    //                   fillColor: white,
    //                   contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
    //                   enabledBorder: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(10.r),
    //                     borderSide: const BorderSide(
    //                       color: white,
    //                     ),
    //                   ),
    //                   focusedBorder: OutlineInputBorder(
    //                     borderRadius: BorderRadius.circular(10.r),
    //                     borderSide: const BorderSide(
    //                       color: white,
    //                     ),
    //                   ),
    //                   hintText: "Search",
    //                 ),
    //                 onChanged: (value) {
    //                   setState(() {
    //                     favouriteJobs = allFavouriteJobs.where((element) => element.title!.toLowerCase().contains(value.toLowerCase())).toList();
    //                   });
    //                 },
    //               ),

    //               SizedBox(height: 10.h),
    //               // Text("Jobs"),
    //               isLoading == false
    //                   ? FavoriteJobList(
    //                       favouriteJobs: favouriteJobs,
    //                     )
    //                   : const Center(
    //                       child: CircularProgressIndicator(),
    //                     ),
    //               // Text("exercises"),
    //               // isLoading == false
    //               //     ? SingleChildScrollView(
    //               //         child: ListView.builder(
    //               //             shrinkWrap: true,
    //               //             physics: const NeverScrollableScrollPhysics(),
    //               //             itemCount: exerciseid.length,
    //               //             itemBuilder: ((context, index) {
    //               //               return favouratedExercise[index]["id"] == exerciseid[index]
    //               //                   ? GlassmorphicContainer(
    //               //                       margin: EdgeInsets.only(bottom: 15.w),
    //               //                       height: 170.h,
    //               //                       width: double.infinity,
    //               //                       borderRadius: 15,
    //               //                       blur: 15,
    //               //                       alignment: Alignment.center,
    //               //                       border: 2,
    //               //                       linearGradient: LinearGradient(
    //               //                           colors: [white.withOpacity(0.15), white.withOpacity(0.15)],
    //               //                           begin: Alignment.topLeft,
    //               //                           end: Alignment.bottomRight),
    //               //                       borderGradient:
    //               //                           LinearGradient(colors: [white.withOpacity(0.5), Gold.withOpacity(0.01)]),
    //               //                       child: Container(
    //               //                         decoration: BoxDecoration(boxShadow: [
    //               //                           BoxShadow(
    //               //                             blurRadius: 20,
    //               //                             spreadRadius: 16,
    //               //                             color: Colors.black.withOpacity(0.1),
    //               //                           )
    //               //                         ]),
    //               //                         child: ClipRRect(
    //               //                           borderRadius: BorderRadius.circular(15.0),
    //               //                           child: BackdropFilter(
    //               //                             filter: ImageFilter.blur(
    //               //                               sigmaX: 10.0,
    //               //                               sigmaY: 10.0,
    //               //                             ),
    //               //                             child: Container(
    //               //                                 width: double.infinity,
    //               //                                 height: 190.h,
    //               //                                 padding: EdgeInsets.all(10.r),
    //               //                                 decoration: BoxDecoration(
    //               //                                     border: const GradientBoxBorder(
    //               //                                       gradient: LinearGradient(colors: [Colors.white38, Gold]),
    //               //                                       width: 0.5,
    //               //                                     ),
    //               //                                     borderRadius: BorderRadius.circular(16.r)),
    //               //                                 child: Column(
    //               //                                   mainAxisAlignment: MainAxisAlignment.start,
    //               //                                   crossAxisAlignment: CrossAxisAlignment.start,
    //               //                                   children: [
    //               //                                     // SizedBox(
    //               //                                     //   height: 8.h,
    //               //                                     // ),
    //               //                                     Row(
    //               //                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               //                                       children: [
    //               //                                         Container(
    //               //                                           width: 230.w,
    //               //                                           child: Text(
    //               //                                               favouratedExercise[index]?["title"] ?? "Excerises",
    //               //                                               maxLines: 2,
    //               //                                               // "Assessment 101",
    //               //                                               style: GoogleFonts.gothicA1(
    //               //                                                   fontSize: kEighteenFont,
    //               //                                                   color: white,
    //               //                                                   fontWeight: kFW700)),
    //               //                                         ),
    //               //
    //               //                                         // SizedBox(
    //               //                                         //   width: 50.w,
    //               //                                         //   height: 22.w,
    //               //                                         //   child: Image.asset(
    //               //                                         //     'assets/images/love.png',
    //               //                                         //   ),
    //               //                                         // ),
    //               //                                       ],
    //               //                                     ),
    //               //                                     SizedBox(
    //               //                                       height: 8.h,
    //               //                                     ),
    //               //                                     RichText(
    //               //                                       text: TextSpan(
    //               //                                         text: 'Duration ',
    //               //                                         style: GoogleFonts.gothicA1(
    //               //                                             fontSize: 11.sp, color: white, fontWeight: kFW500),
    //               //                                         children: [
    //               //                                           TextSpan(
    //               //                                             text: favouratedExercise[index]?["time"].toString(),
    //               //                                             style: GoogleFonts.gothicA1(
    //               //                                                 fontSize: 11.sp, color: Gold, fontWeight: kFW500),
    //               //                                           ),
    //               //                                         ],
    //               //                                       ),
    //               //                                     ),
    //               //
    //               //                                     SizedBox(
    //               //                                       height: 4.h,
    //               //                                     ), //exercise_questions.length
    //               //                                     Text(
    //               //                                         "Questions  ${favouratedExercise[index]!["exercise_questions"].length.toString()} ",
    //               //                                         style: GoogleFonts.gothicA1(
    //               //                                             fontSize: 11.sp, color: white, fontWeight: kFW500)),
    //               //                                     SizedBox(
    //               //                                       height: 15.h,
    //               //                                     ),
    //               //                                     Wrap(
    //               //                                       children: [
    //               //                                         Padding(
    //               //                                           padding: EdgeInsets.only(right: 10.w),
    //               //                                           child: Text(
    //               //                                               favouratedExercise[index]?["category_master"]
    //               //                                                       ?["title"] ??
    //               //                                                   "New Skills",
    //               //                                               maxLines: 1,
    //               //                                               style: GoogleFonts.gothicA1(
    //               //                                                   fontSize: 11.sp, color: white, fontWeight: kFW500)),
    //               //                                         ),
    //               //                                       ],
    //               //                                     ),
    //               //
    //               //                                     SizedBox(
    //               //                                       height: 15.h,
    //               //                                     ),
    //               //                                     Text('\u{20B9}${favouratedExercise[index]?["price"] ?? "000"}',
    //               //                                         style: GoogleFonts.gothicA1(
    //               //                                             fontSize: kSixteenFont, color: Gold, fontWeight: kFW600))
    //               //                                   ],
    //               //                                 )),
    //               //                           ),
    //               //                         ),
    //               //                       ),
    //               //                     )
    //               //                   : SizedBox();
    //               //             })),
    //               //       )
    //               //     : const Center(child: CircularProgressIndicator()),

    //               SizedBox(height: 10.h),
    //               // WishListCategories(),
    //               // SizedBox(height: 15.h),
    //               // Text(
    //               //   "Courses",
    //               //   style: GoogleFonts.inter(
    //               //     color: white,
    //               //     fontSize: kSixteenFont,
    //               //     fontWeight: kFW700,
    //               //   ),
    //               // ),
    //               // SizedBox(
    //               //   height: 10.h,
    //               // ),
    //               // Wishlist_grid(),
    //               // SizedBox(height: 15.h),
    //               // Most_popular(),
    //               // SizedBox(height: 15.h),
    //               // Text(
    //               //   "Courses",
    //               //   style: GoogleFonts.inter(
    //               //     color: white,
    //               //     fontSize: kSixteenFont,
    //               //     fontWeight: kFW700,
    //               //   ),
    //               // ),
    //               // SizedBox(height: 10.h),
    //               // const Wishlist_jobs()
    //             ],
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// import 'dart:ui';

// import '../../utils/export_file.dart';

// class Wishlist extends StatefulWidget {
//   const Wishlist({super.key});

//   @override
//   State<Wishlist> createState() => _WishlistState();
// }

// class _WishlistState extends State<Wishlist> {
//   var ids = Get.arguments;
//   bool isLoading = false;
//   bool pressGeoON = false;
//   bool cmbscritta = false;
//   // bool isLoading = false;
//   bool is_applied = false;
//   var name = "Apply";

//   List favourited = [];

//   Future browsedHandler() async {
//     setState(() {
//       isLoading = true;
//     });
//     Map payload = {
//       "search_type": "all",
//       //"search_type": "favourated",
//     };

//     var value = await Services.getsearchtypeapply(payload);

//     if (value["data"] == null) {
//       Fluttertoast.showToast(msg: value["message"]);
//     } else {
//       favourited = value["data"];
//     }
//     print(value["data"]);
//     setState(() {
//       isLoading = false;
//     });
//   }
//   // List applied = [];

//   // Future appliedHandler() async {
//   //   setState(() {
//   //     isLoading = true;
//   //   });
//   //   Map payload = {
//   //     "search_type": "all",
//   //   };
//   //   print(payload);

//   //   var value = await Services.getsearchtype(payload);
//   //   print(value);
//   //   if (value["data"] == null) {
//   //     Fluttertoast.showToast(msg: value["message"]);
//   //   } else {
//   //     applied = value["data"];
//   //   }

//   //   print(value["data"]);
//   //   setState(() {
//   //     isLoading = false;
//   //   });
//   // }

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   appliedHandler();
//   // }
//   bool isLoaded = false;

//   @override
//   void initState() {
//     super.initState();
//     //ids;
//     browsedHandler();
//     Future.delayed(const Duration(milliseconds: 3000), () {
//       setState(() {
//         isLoaded = true;
//         is_applied = false;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kBackground,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           'WishList',
//           style: GoogleFonts.gothicA1(
//               fontSize: kEighteenFont, color: white, fontWeight: kFW700),
//         ),
//         actions: [
//           Center(
//             child: GestureDetector(
//               onTap: () {
//                 Get.toNamed(KNotification);
//               },
//               child: Stack(
//                 children: [
//                   Image.asset(
//                     'assets/images/bell.png',
//                     width: 22.w,
//                   ),
//                   Positioned(
//                       left: 13.r,
//                       //top: .h,
//                       child: const CircleAvatar(
//                         radius: 5,
//                         backgroundColor: Colors.green,
//                       ))
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 13.w,
//           )
//         ],
//       ),
//       body: Stack(
//         children: [
//           const Background(),
//           SingleChildScrollView(
//             child: Container(
//               margin: EdgeInsets.all(15.w),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 15.h),
//                   Search(),
//                   SizedBox(height: 10.h),
//                   isLoading == false
//                       ? ListView.builder(
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemCount: ids.length,
//                           itemBuilder: ((context, index) {
//                             //favourited[index]["id"] == ids[index]
//                             for (int index = 0;
//                                 favourited[index]["id"] == ids[index];
//                                 index++)
//                               // favourited[index]["id"] == ids[index]
//                               GlassmorphicContainer(
//                                 margin: EdgeInsets.only(bottom: 15.h),
//                                 height: 210.h,
//                                 width: double.infinity,
//                                 borderRadius: 15,
//                                 blur: 15,
//                                 alignment: Alignment.center,
//                                 border: 2,
//                                 linearGradient: LinearGradient(
//                                     colors: [
//                                       white.withOpacity(0.15),
//                                       white.withOpacity(0.15)
//                                     ],
//                                     begin: Alignment.topLeft,
//                                     end: Alignment.bottomRight),
//                                 borderGradient: LinearGradient(colors: [
//                                   white.withOpacity(0.5),
//                                   Gold.withOpacity(0.01)
//                                 ]),
//                                 child: Container(
//                                   decoration: BoxDecoration(boxShadow: [
//                                     BoxShadow(
//                                       blurRadius: 20,
//                                       spreadRadius: 16,
//                                       color: Colors.black.withOpacity(0.1),
//                                     )
//                                   ]),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(15.0),
//                                     child: BackdropFilter(
//                                       filter: ImageFilter.blur(
//                                         sigmaX: 10.0,
//                                         sigmaY: 10.0,
//                                       ),
//                                       child: Container(
//                                           width: double.infinity,
//                                           //height: 190.h,
//                                           padding: EdgeInsets.all(10.r),
//                                           decoration: BoxDecoration(
//                                               border: const GradientBoxBorder(
//                                                 gradient: LinearGradient(
//                                                     colors: [
//                                                       Colors.white38,
//                                                       Gold
//                                                     ]),
//                                                 width: 0.5,
//                                               ),
//                                               borderRadius:
//                                                   BorderRadius.circular(16.r)),
//                                           child: Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.start,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                       favourited[index]
//                                                               ["title"] ??
//                                                           "",
//                                                       maxLines: 1,
//                                                       style:
//                                                           GoogleFonts.gothicA1(
//                                                               fontSize:
//                                                                   kSixteenFont,
//                                                               color: white,
//                                                               fontWeight:
//                                                                   kFW700)),
//                                                   SizedBox(
//                                                     height: 5.h,
//                                                   ),
//                                                   Row(
//                                                     children: [
//                                                       // Column(
//                                                       //   children: [
//                                                       //     Icon(
//                                                       //       Icons
//                                                       //           .remove_red_eye_rounded,
//                                                       //       size: 22.w,
//                                                       //       color: white,
//                                                       //     ),
//                                                       //     Text("101",
//                                                       //         style:
//                                                       //             GoogleFonts.gothicA1(
//                                                       //                 fontSize: 8.sp,
//                                                       //                 color: white,
//                                                       //                 fontWeight:
//                                                       //                     kFW700)),
//                                                       //   ],
//                                                       // ),
//                                                       /////////////////////////////////////////////////////////////////////
//                                                       // IconButton(

//                                                       //     icon: Icon(

//                                                       //       Icons.favorite,
//                                                       //       color: _selectedIndex !=
//                                                       //                   null &&
//                                                       //               _selectedIndex ==
//                                                       //                   index
//                                                       //           ? Colors.redAccent
//                                                       //           : Colors.grey,
//                                                       //     ),
//                                                       //     onPressed: () {
//                                                       //       _onSelected(index);
//                                                       //     }),
//                                                       ////////////////////////////////////////
//                                                       //                                          FavoriteButton(
//                                                       //   valueChanged: (_isFavorite) {
//                                                       //     print('Is Favorite $_isFavorite)');
//                                                       //   },
//                                                       // )
//                                                       // Icon(
//                                                       //   Icons.favorite_outline_outlined,
//                                                       //   color: selectedIndexList
//                                                       //           .contains(index)
//                                                       //       ? white
//                                                       //       : grey1,
//                                                       // )
//                                                       // GestureDetector(
//                                                       //   onTap: () {
//                                                       //     jobsaddtowishlist(
//                                                       //         browse[index]["id"] ?? "",
//                                                       //         // fovouritesjob[index]
//                                                       //         //     ["id"],
//                                                       //         index);
//                                                       //   },
//                                                       //   //                  addToWhishList(
//                                                       //   // widget.properties[index]["id"], index);
//                                                       //   child: SizedBox(
//                                                       //       child: currentindex == index
//                                                       //           ? const CircularProgressIndicator()
//                                                       //           : Icon(
//                                                       //               Icons.favorite,
//                                                       //               size: 26.w,
//                                                       //               color: browse[index]
//                                                       //                           [
//                                                       //                           "is_favourated"] ||
//                                                       //                       browse.contains(
//                                                       //                           index)
//                                                       //                   // fovouritesjob[
//                                                       //                   //                 index]
//                                                       //                   //             [
//                                                       //                   //             "is_wishlist"] ||
//                                                       //                   //         fovouritesjob
//                                                       //                   //             .contains(
//                                                       //                   //                 index)
//                                                       //                   ? white
//                                                       //                   : kgreen,
//                                                       //             )),
//                                                       // ),
//                                                       //                 GestureDetector(
//                                                       //   onTap: () {
//                                                       //     addToWhishList(
//                                                       //         widget.properties[index]["id"], index);
//                                                       //   },
//                                                       //   child:currentindex == index
//                                                       //         ? const CircularProgressIndicator()
//                                                       //         : Image.asset(
//                                                       //           widget.properties[index]
//                                                       //                       ["is_wishlist"] ||
//                                                       //                   whishListItems.contains(index)
//                                                       //               ? 'assets/images/red_love.png'
//                                                       //               : 'assets/images/love.png',
//                                                       //           width: 17.w,
//                                                       //         ),
//                                                       // ),
//                                                     ],
//                                                   ),
//                                                 ],
//                                               ),
//                                               SizedBox(
//                                                 height: 8.h,
//                                               ),
//                                               Text(
//                                                   favourited[index]["company"]
//                                                       ["title"],
//                                                   style: GoogleFonts.gothicA1(
//                                                       fontSize: 11.sp,
//                                                       color: white,
//                                                       fontWeight: kFW700)),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                       '${favourited[index]["min_exp"]}'
//                                                               ' - '
//                                                               '${favourited[index]["max_exp"]}Years' ??
//                                                           "",
//                                                       style:
//                                                           GoogleFonts.gothicA1(
//                                                               fontSize: 11.sp,
//                                                               color: white,
//                                                               fontWeight:
//                                                                   kFW700)),
//                                                   Row(
//                                                     children: [
//                                                       Image.asset(
//                                                         'assets/images/link.png',
//                                                         width: 20.w,
//                                                       ),
//                                                       Text(
//                                                           favourited[index][
//                                                                       "company"]
//                                                                   ["address"] ??
//                                                               "",
//                                                           style: GoogleFonts
//                                                               .gothicA1(
//                                                                   fontSize:
//                                                                       11.sp,
//                                                                   color: white,
//                                                                   fontWeight:
//                                                                       kFW700)),
//                                                     ],
//                                                   )
//                                                 ],
//                                               ),
//                                               SizedBox(
//                                                 height: 15.h,
//                                               ),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Container(
//                                                     padding:
//                                                         EdgeInsets.all(5.r),
//                                                     color:
//                                                         white.withOpacity(0.5),
//                                                     child: Text(
//                                                         favourited[index]
//                                                                     ["job_type"]
//                                                                 ["title"] ??
//                                                             "",
//                                                         style: GoogleFonts
//                                                             .gothicA1(
//                                                                 fontSize: 11.sp,
//                                                                 color: white,
//                                                                 fontWeight:
//                                                                     kFW700)),
//                                                   ),
//                                                   Column(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment.end,
//                                                     children: [
//                                                       Text("Full Time",
//                                                           style: GoogleFonts
//                                                               .gothicA1(
//                                                                   fontSize:
//                                                                       11.sp,
//                                                                   color: white,
//                                                                   fontWeight:
//                                                                       kFW700)),
//                                                       Text(
//                                                           '${favourited[index]["min_sal"]}' ??
//                                                               ""
//                                                                   ' - '
//                                                                   '${favourited[index]["max_sal"]}' ??
//                                                               "",
//                                                           style: GoogleFonts
//                                                               .gothicA1(
//                                                                   fontSize:
//                                                                       kFourteenFont,
//                                                                   color: Gold,
//                                                                   fontWeight:
//                                                                       kFW700)),
//                                                     ],
//                                                   )
//                                                 ],
//                                               ),
//                                               Container(
//                                                 padding: EdgeInsets.all(3.r),
//                                                 child: Text(
//                                                     'Type: ${favourited[index]["job_type"]["type"]}' ??
//                                                         "",
//                                                     style: GoogleFonts.gothicA1(
//                                                         fontSize: 11.sp,
//                                                         color: white,
//                                                         fontWeight: kFW700)),
//                                               ),
//                                               SizedBox(
//                                                 height: 10.h,
//                                               ),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   CircleAvatar(
//                                                     backgroundColor:
//                                                         kBackground,
//                                                     radius: 20.r,
//                                                     child: Image.asset(
//                                                       'assets/images/man.png',
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                       '${favourited[index]["industry"]["title"]}' ??
//                                                           "",
//                                                       maxLines: 1,
//                                                       style:
//                                                           GoogleFonts.gothicA1(
//                                                               fontSize: 11.sp,
//                                                               color: white,
//                                                               fontWeight:
//                                                                   kFW700)),
//                                                   SizedBox(
//                                                     width: 10.w,
//                                                   ),
//                                                   SizedBox(
//                                                     // margin: EdgeInsets.only(right: 10.w),
//                                                     height: 40.h,
//                                                     width: 110.w,
//                                                     child: TextButton(
//                                                       onPressed: () {
//                                                         // Get.toNamed(
//                                                         //   Applyjob() as String,
//                                                         //   //  Applyjobs_list(),
//                                                         //   arguments:
//                                                         //       browse[index]["id"] ?? "",
//                                                         // );
//                                                         setState(() {
//                                                           name = "Applied";
//                                                         });

//                                                         // setState(() =>
//                                                         //     pressGeoON = !pressGeoON);
//                                                         // setState(() =>
//                                                         //     cmbscritta = !cmbscritta);
//                                                       },
//                                                       // onPressed: () {
//                                                       //   setState(() {
//                                                       //     is_applied == true;
//                                                       //   });

//                                                       //   // browse[index]["job_type"]
//                                                       //   //     ["is_applied"] = 1;
//                                                       //   //Get.toNamed(KApply_jobs);
//                                                       // },
//                                                       style: ButtonStyle(
//                                                           backgroundColor:
//                                                               const MaterialStatePropertyAll<
//                                                                   Color>(grey),
//                                                           shape: MaterialStateProperty.all<
//                                                                   RoundedRectangleBorder>(
//                                                               RoundedRectangleBorder(
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(10
//                                                                               .r),
//                                                                   side: const BorderSide(
//                                                                       color:
//                                                                           grey)))),
//                                                       child:
//                                                           // cmbscritta
//                                                           //     ? Text("Apply")
//                                                           //     : Text("Applied"),
//                                                           Text(
//                                                         name,
//                                                         // browse[index]["job_type"]
//                                                         //             ["is_applied"] ??
//                                                         //         "" == 1
//                                                         // is_applied == false
//                                                         //     ? "Apply"
//                                                         //     : "Applied",
//                                                         //  "Apply",
//                                                         style: GoogleFonts
//                                                             .gothicA1(
//                                                                 fontSize:
//                                                                     kTwelveFont,
//                                                                 color: white,
//                                                                 fontWeight:
//                                                                     kFW600),
//                                                       ),
//                                                     ),
//                                                   )
//                                                   // GestureDetector(
//                                                   //   onTap: () {
//                                                   //     jobsaddtowishlist(
//                                                   //         browse[index]["id"] ?? "",
//                                                   //         // fovouritesjob[index]
//                                                   //         //     ["id"],
//                                                   //         index);
//                                                   //   },
//                                                   //   //                  addToWhishList(
//                                                   //   // widget.properties[index]["id"], index);
//                                                   //   child: SizedBox(
//                                                   //       child: currentindex == index
//                                                   //           ? const CircularProgressIndicator()
//                                                   //           : Icon(
//                                                   //               Icons.favorite,
//                                                   //               size: 26.w,
//                                                   //               color: browse[index]
//                                                   //                           [
//                                                   //                           "is_favourated"] ||
//                                                   //                       browse.contains(
//                                                   //                           index)
//                                                   //                   // fovouritesjob[
//                                                   //                   //                 index]
//                                                   //                   //             [
//                                                   //                   //             "is_wishlist"] ||
//                                                   //                   //         fovouritesjob
//                                                   //                   //             .contains(
//                                                   //                   //                 index)
//                                                   //                   ? white
//                                                   //                   : kgreen,
//                                                   //             )),
//                                                   // ),
//                                                 ],
//                                               )
//                                             ],
//                                           )),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                           }))
//                       : const Center(child: CircularProgressIndicator()),
//                   //  favouritedlist(),
//                   SizedBox(height: 10.h),
//                   WishListCategories(),
//                   SizedBox(height: 15.h),
//                   Text(
//                     "Courses",
//                     style: GoogleFonts.inter(
//                       color: white,
//                       fontSize: kSixteenFont,
//                       fontWeight: kFW700,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   Wishlist_grid(),
//                   SizedBox(height: 15.h),
//                   Most_popular(),
//                   SizedBox(height: 15.h),
//                   Text(
//                     "Courses",
//                     style: GoogleFonts.inter(
//                       color: white,
//                       fontSize: kSixteenFont,
//                       fontWeight: kFW700,
//                     ),
//                   ),
//                   SizedBox(height: 10.h),
//                   const Wishlist_jobs()
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

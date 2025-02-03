// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:ui';

import '../../utils/export_file.dart';

class Exercisedetails extends StatefulWidget {
  const Exercisedetails({super.key});

  @override
  State<Exercisedetails> createState() => _ExercisedetailsState();
}

class _ExercisedetailsState extends State<Exercisedetails> {
  // var id = Get.arguments;
  // Map individualjob = {};
  // bool isLoading = false;
  // Future jobHandler() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   Map data = await Services.getindividualjob(id);
  //   if (data["message"] != null) {
  //     Fluttertoast.showToast(
  //       msg: data["message"],
  //     );
  //   } else {
  //     individualjob = data["data"]["data"];
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   jobHandler();
  // }

  @override
  Widget build(BuildContext context) {
    return Text(
      "data",
      style: TextStyle(color: white),
    );
    //isLoading == false
    //     Column(
    //   mainAxisAlignment: MainAxisAlignment.start,
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Column(
    //       children: [
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text(
    //               "flutter",

    //               //   individualjob["job_details"]!["title"].toString(),

    //               style: GoogleFonts.gothicA1(
    //                   fontSize: kEighteenFont,
    //                   color: white,
    //                   fontWeight: kFW700),
    //             ),
    //             // Column(
    //             //   children: [
    //             //     // Icon(Icons.remove_red_eye_outlined),
    //             //     Icon(Icons.remove_red_eye_sharp,
    //             //         color: white, size: 20.sp),
    //             //     Text(
    //             //       "101",
    //             //       style: GoogleFonts.gothicA1(
    //             //           fontSize: 8.sp, color: white, fontWeight: kFW500),
    //             //     ),
    //             //   ],
    //             // ),
    //           ],
    //         ),
    //         SizedBox(height: 20.h),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text(
    //               "data",
    //               // individualjob["job_details"]!["almamater_masters"][0]
    //               //         ["type"] ??
    //               //     "",
    //               style: GoogleFonts.gothicA1(
    //                   fontSize: 11.sp, color: white, fontWeight: kFW500),
    //             ),
    //             // SizedBox(width: 30.w),
    //             Text(
    //               "data",
    //               // '${individualjob["job_details"]?["min_exp"]}'
    //               //         ' - '
    //               //         '${individualjob["job_details"]?["max_exp"]}Years' ??
    //               //     "",
    //               style: GoogleFonts.gothicA1(
    //                   fontSize: 11.sp, color: white, fontWeight: kFW500),
    //             ),
    //             // SizedBox(width: 30.w),
    //             Text(
    //               "data",
    //               // individualjob["job_details"]!["job_type"]!["title"]
    //               //     .toString(),

    //               style: GoogleFonts.gothicA1(
    //                   fontSize: 11.sp, color: white, fontWeight: kFW500),
    //             ),
    //           ],
    //         ),
    //         SizedBox(height: 20.h),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Row(
    //               children: [
    //                 const Icon(Icons.location_on_outlined, color: Gold),
    //                 SizedBox(width: 5.h),
    //                 Container(
    //                   width: 180.w,
    //                   child: Text(
    //                     "Hyderabad",
    //                     // individualjob["individual_jobs"]!["company"]![
    //                     //         "address"]
    //                     //     .toString(),

    //                     style: GoogleFonts.gothicA1(
    //                         fontSize: kTwelveFont,
    //                         color: white,
    //                         fontWeight: kFW700),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             Text(
    //               "data",
    //               // '${individualjob["job_details"]?["min_sal"]}'
    //               //         ' - '
    //               //         '${individualjob["job_details"]?["max_sal"]}' ??
    //               //     "",
    //               style: GoogleFonts.gothicA1(
    //                   fontSize: 15.sp, color: Gold, fontWeight: kFW900),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //     SizedBox(
    //       height: 40.h,
    //     ),
    //     Text("Job Description",
    //         style: GoogleFonts.gothicA1(
    //             fontSize: kSixteenFont, color: white, fontWeight: kFW700)),
    //     SizedBox(
    //       height: 10.h,
    //     ),
    //     GridView.builder(
    //         shrinkWrap: true,
    //         physics: const NeverScrollableScrollPhysics(),
    //         itemCount: 4,
    //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //             crossAxisCount: 2,
    //             mainAxisSpacing: 2,
    //             //childAspectRatio: (0.31 / 0.57)),
    //             childAspectRatio: (1 / 0.25)),
    //         itemBuilder: ((context, index) {
    //           return Container(
    //               margin: EdgeInsets.only(bottom: 5.h, right: 5.w),
    //               width: double.infinity,
    //               alignment: Alignment.center,
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(20.r),
    //                 boxShadow: [
    //                   BoxShadow(
    //                     blurRadius: 20,
    //                     spreadRadius: 5,
    //                     color: const Color.fromARGB(255, 13, 12, 12)
    //                         .withOpacity(0.1),
    //                   )
    //                 ],
    //                 color: white,
    //                 //  gradient:LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors:[grey.withOpacity(0.5),grey1.withOpacity(0.5),Color.fromARGB(255, 58, 55, 55).withOpacity(0.1),
    //                 //  ])
    //               ),
    //               child: Text(
    //                 "data",
    //                 // individualjob["job_details"]!["job_type"]!["type"]
    //                 //     .toString(),
    //                 style: GoogleFonts.gothicA1(
    //                     fontSize: 11.sp, color: darkGrey, fontWeight: kFW600),
    //               ));
    //         })),
    //     SizedBox(height: 10.h),
    //     Text(
    //       "data",
    //       //   individualjob["job_details"]!["summary"].toString(),

    //       style: GoogleFonts.gothicA1(
    //           fontSize: kFourteenFont, color: white, fontWeight: kFW400),
    //     ),
    //     SizedBox(height: 10.h),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         GlassmorphicContainer(
    //           height: 41.h,
    //           width: 160.w,
    //           borderRadius: 13.r,
    //           blur: 15,
    //           alignment: Alignment.center,
    //           border: 0.5,
    //           linearGradient: LinearGradient(colors: [
    //             Colors.black.withOpacity(0.1),
    //             Colors.black.withOpacity(0.01)
    //           ], begin: Alignment.topLeft, end: Alignment.bottomRight),
    //           borderGradient: LinearGradient(
    //               begin: Alignment.centerLeft,
    //               end: Alignment.bottomRight,
    //               colors: [
    //                 white.withOpacity(0.5),
    //                 white.withOpacity(0.5),
    //                 Gold.withOpacity(0.5)
    //               ]),
    //           child: Container(
    //             decoration: BoxDecoration(boxShadow: [
    //               BoxShadow(
    //                 blurRadius: 16,
    //                 spreadRadius: 16,
    //                 color: Colors.black.withOpacity(0.1),
    //               )
    //             ]),
    //             child: ClipRRect(
    //               borderRadius: BorderRadius.circular(15.0),
    //               child: BackdropFilter(
    //                 filter: ImageFilter.blur(
    //                   sigmaX: 20.0,
    //                   sigmaY: 20.0,
    //                 ),
    //                 child: Text("Add to Wishlist",
    //                     //maxLines: 2,
    //                     style: GoogleFonts.gothicA1(
    //                         fontSize: kFourteenFont,
    //                         color: white,
    //                         fontWeight: kFW500)),
    //               ),
    //             ),
    //           ),
    //         ),
    //         GlassmorphicContainer(
    //           height: 41.h,
    //           width: 160.w,
    //           borderRadius: 13.r,
    //           blur: 15,
    //           alignment: Alignment.center,
    //           border: 0.5,
    //           linearGradient: LinearGradient(
    //               colors: [white.withOpacity(0.1), white.withOpacity(0.01)],
    //               begin: Alignment.topLeft,
    //               end: Alignment.bottomRight),
    //           borderGradient: LinearGradient(
    //               begin: Alignment.centerLeft,
    //               end: Alignment.bottomRight,
    //               colors: [
    //                 white.withOpacity(0.5),
    //                 white.withOpacity(0.5),
    //                 Gold.withOpacity(0.5)
    //               ]),
    //           child: Container(
    //             decoration: BoxDecoration(boxShadow: [
    //               BoxShadow(
    //                 blurRadius: 16,
    //                 spreadRadius: 15,
    //                 color: Colors.black.withOpacity(0.1),
    //               )
    //             ]),
    //             child: ClipRRect(
    //               borderRadius: BorderRadius.circular(15.0),
    //               child: BackdropFilter(
    //                 filter: ImageFilter.blur(
    //                   sigmaX: 20.0,
    //                   sigmaY: 20.0,
    //                 ),
    //                 child: Text("Apply",
    //                     //maxLines: 2,
    //                     style: GoogleFonts.gothicA1(
    //                         fontSize: kSixteenFont,
    //                         color: white,
    //                         fontWeight: kFW700)),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ],
    // );
    // : const Center(child: CircularProgressIndicator());
  }
}

// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:bossjobs/utils/export_file.dart';

class Most_popular extends StatefulWidget {
  const Most_popular({super.key});

  @override
  State<Most_popular> createState() => _MostpopularState();
}

class _MostpopularState extends State<Most_popular> {
  // bool isLoading = false;
  // List popularcourse = [];

  // Future courseHandler() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   Map payload = {
  //     "type": "all_course_pack",
  //     "category_id[]": 1,
  //     //  "listing_type": "all_courses",
  //     // "listing_type": "all_courses",
  //     //  "type": "my_courses",
  //     //  "type": "all_courses",
  //   };

  //   var value = await Services.CoursePacks(payload);

  //   if (value["data"] == null) {
  //     Fluttertoast.showToast(msg: value["message"]);
  //   } else {
  //     popularcourse = value["data"];
  //   }
  //   print(value["data"]);
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   courseHandler();
  // }
  // bool isLoading = false;
  // Map workerDetails = {};
  // Future getWorkerDetails(type) async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   var data = await Services.CoursePacks(type);
  //   Map response = json.decode(data);

  //   if (response["error"] != null) {
  //     Fluttertoast.showToast(
  //       msg: response["error"],
  //     );
  //   } else {
  //     setState(() {
  //       workerDetails = {
  //         ...response["data"],
  //       };
  //     });
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getWorkerDetails(1);
  // }

  // @override
  //bool isLoading =
  //   false; ////////////////////////////////////////////last commented
  // List popularcourse = [];

  // Future courseHandler() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   Map payload = {
  //     "type": "all_course_pack",
  //     //"category_id[]": 1,

  //     // "listing_type": "all_course_pack",
  //   };

  //   var data = await Services.CoursePacks(payload);

  //   if (data["data"] == null) {
  //     Fluttertoast.showToast(msg: data["message"]);
  //   } else {
  //     popularcourse = data["data"]["data"]["course"]["all"];
  //   }
  //   print(data["data"]);
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   courseHandler();
  // }
  ///////////////////////below code is to be removed
  List dashboard = [];

  bool isLoading = false;
  Future dashboardListHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.getdashboard();
    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      print("new");
      print(data["data"]["data"]["course"]["all"]);
      dashboard = data["data"]["data"]["course"]["all"];
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    dashboardListHandler();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? Container(
            margin: EdgeInsets.all(5.r),
            height: 220.h,
            child: ListView.builder(
                itemCount: dashboard.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: EdgeInsets.all(5.r),
                    width: 330.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        dashboard[index]?["course_banner"] == null
                            ? Image.asset('assets/images/banner2.png')
                            : SizedBox(
                                height: 160.h,
                                child: Image(
                                  image: NetworkImage(
                                    kCourseURL +
                                        dashboard[index]?["course_banner"],
                                  ),
                                  errorBuilder: (c, o, s) => Center(
                                    child: Text(
                                      "Unable to Load Image",
                                      style: GoogleFonts.gothicA1(
                                        fontSize: kFourteenFont,
                                        color: white,
                                        fontWeight: kFW700,
                                      ),
                                    ),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 250.w,
                              child: Text(
                                dashboard[index]["title"],
                                // popularcourse[index]?["title"],
                                maxLines: 2,
                                style: GoogleFonts.gothicA1(
                                    fontSize: kSixteenFont,
                                    color: white,
                                    fontWeight: kFW700),
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
                            //   itemPadding:
                            //       const EdgeInsets.symmetric(horizontal: 0.5),
                            //   itemBuilder: (context, _) => const Icon(
                            //     Icons.star,
                            //     color: Gold,
                            //   ),
                            //   onRatingUpdate: (rating) {},
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        // Row(
                        //   children: [
                        //     Text(
                        //       '\u{20B9}${699}',
                        //       style: GoogleFonts.gothicA1(
                        //           fontSize: kFourteenFont,
                        //           color: Gold,
                        //           fontWeight: kFW700),
                        //     ),
                        //     SizedBox(
                        //       width: 10.w,
                        //     ),
                        //     Text(
                        //       '\u{20B9}${1699}',
                        //       style: GoogleFonts.gothicA1(
                        //           decoration: TextDecoration.lineThrough,
                        //           fontSize: kTwelveFont,
                        //           color: white,
                        //           fontWeight: kFW700),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  );
                })),
          )
        : const Center(
            child: CircularProgressIndicator(
            color: Gold,
          ));
  }
}

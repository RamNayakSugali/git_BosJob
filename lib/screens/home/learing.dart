// ignore_for_file: camel_case_types

import 'dart:ui';

import 'package:bossjobs/utils/export_file.dart';

class learing_bossjobs extends StatefulWidget {
  const learing_bossjobs({super.key});

  @override
  State<learing_bossjobs> createState() => _learingbossjobsState();
}

class _learingbossjobsState extends State<learing_bossjobs> {
  // var Coursefilter;
  bool isLoading = false;
  List Coursefilter = [];

  Future CoursefilterListHandler() async {
    setState(() {
      isLoading = true;
    });
    Map payload = {
      "listing_type": "my_courses",
    };

    var value = await Services.getCourseFilter(payload);

    if (value["data"] == null) {
      Fluttertoast.showToast(msg: value["message"]);
    } else {
      Coursefilter = value["data"]["data"]["coursetype"];
      print(value["data"]["data"]);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    CoursefilterListHandler();
  }
  //   var Coursefilter;
  // bool isLoading = false;
  // Future CoursefilterListHandler() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   Map data = await Services.getCourseFilter();
  //   if (data["message"] != null) {
  //     Fluttertoast.showToast(
  //       msg: data["message"],
  //     );
  //   } else {
  //     Coursefilter = data["data"]["data"];
  //   }
  //   print(data["data"]["data"]);
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();

  //   CoursefilterListHandler();
  // }
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Why Learning in BossJobs",
            style: GoogleFonts.gothicA1(
                fontSize: kSixteenFont, color: white, fontWeight: kFW700),
          ),
          SizedBox(height: 10.h),
          isLoading == false
              ? Wrap(
                  children: [
                    for (int i = 0; i < Coursefilter.length; i++)
                      GlassmorphicContainer(
                        margin: EdgeInsets.only(bottom: 10.h),
                        height: 50.h,
                        width: double.infinity,
                        borderRadius: 13.r,
                        blur: 15,
                        alignment: Alignment.center,
                        border: 2,
                        linearGradient: LinearGradient(
                            colors: [
                              white.withOpacity(0.1),
                              white.withOpacity(0.01)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderGradient: LinearGradient(
                            colors: [white.withOpacity(0.5), Gold]),
                        child: Container(
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
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: const GradientBoxBorder(
                                        gradient: LinearGradient(
                                            colors: [Colors.white38, Gold]),
                                        width: 0.5,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(16.r)),
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset(
                                          "assets/images/man1.png",
                                          width: 30.w,
                                        ),
                                        SizedBox(
                                          width: 40.w,
                                        ),
                                        Text(Coursefilter[i]["title"],
                                            // "ram",
                                            //  Coursefilter["coursetype"]
                                            //            ?["title"]??"",
                                            // categories[i]["name"],
                                            maxLines: 2,
                                            style: GoogleFonts.gothicA1(
                                                fontSize: kFourteenFont,
                                                color: white,
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(
                  color: Gold,
                )),
        ]);
  }
}

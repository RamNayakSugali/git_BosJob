import 'dart:ui';

import 'package:bossjobs/utils/export_file.dart';

class CoachLiveCourses extends StatefulWidget {
  const CoachLiveCourses({super.key});

  @override
  State<CoachLiveCourses> createState() => _CoachLiveCoursesState();
}

class _CoachLiveCoursesState extends State<CoachLiveCourses> {
  Map LiveCourseData = {};

  bool isLoading = false;
  Future CoachDashboardHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.getcoachdashboard();

    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      LiveCourseData = data["data"]["data"];
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    CoachDashboardHandler();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? Center(
            child: CircularProgressIndicator(
            color: Gold,
          ))
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text("Live Courses",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.gothicA1(
                      fontSize: kSixteenFont,
                      color: white,
                      fontWeight: kFW800)),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      width: 150.w,
                      decoration: BoxDecoration(
                          border: const GradientBoxBorder(
                            gradient:
                                LinearGradient(colors: [Colors.white38, Gold]),
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(16.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(LiveCourseData["totalcandidtes"].toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kSixteenFont,
                                  color: white,
                                  fontWeight: kFW800)),
                          Text("Total Students",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kTwelveFont,
                                  color: white,
                                  fontWeight: FontWeight.w500)),
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      width: 150.w,
                      decoration: BoxDecoration(
                          border: const GradientBoxBorder(
                            gradient:
                                LinearGradient(colors: [Colors.white38, Gold]),
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(16.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(LiveCourseData["courses"].length.toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kSixteenFont,
                                  color: white,
                                  fontWeight: kFW800)),
                          Text("Total Courses",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kTwelveFont,
                                  color: white,
                                  fontWeight: FontWeight.w500)),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      // height: 60.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          border: const GradientBoxBorder(
                            gradient:
                                LinearGradient(colors: [Colors.white38, Gold]),
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(16.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              //  $.[]exercise_all_count.length
                              LiveCourseData["exercise_all_count"]
                                  .length
                                  .toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kSixteenFont,
                                  color: white,
                                  fontWeight: kFW800)),
                          Text("Total Exercises",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kTwelveFont,
                                  color: white,
                                  fontWeight: FontWeight.w500)),
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      // height: 60.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          border: const GradientBoxBorder(
                            gradient:
                                LinearGradient(colors: [Colors.white38, Gold]),
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(16.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              LiveCourseData["allcourse_packs"]
                                  .length
                                  .toString(),
                              // $.[]allcourse_packs.length
                              //LiveCourseData["courses"].length.toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kSixteenFont,
                                  color: white,
                                  fontWeight: kFW800)),
                          Text("Total Course Packs",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kTwelveFont,
                                  color: white,
                                  fontWeight: FontWeight.w500)),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      // height: 60.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          border: const GradientBoxBorder(
                            gradient:
                                LinearGradient(colors: [Colors.white38, Gold]),
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(16.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              //$.[]all_cources.[]courses_live.length
                              LiveCourseData["all_cources"]["courses_live"]
                                  .length
                                  .toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kSixteenFont,
                                  color: white,
                                  fontWeight: kFW800)),
                          Text("Live Courses",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kTwelveFont,
                                  color: white,
                                  fontWeight: FontWeight.w500)),
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      // height: 60.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          border: const GradientBoxBorder(
                            gradient:
                                LinearGradient(colors: [Colors.white38, Gold]),
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(16.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              LiveCourseData["exercise_live_count"]
                                  .length
                                  .toString(),
                              //$.[]exercise_live_count.length
                              textAlign: TextAlign.center,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kSixteenFont,
                                  color: white,
                                  fontWeight: kFW800)),
                          Text("Live Exercises",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kTwelveFont,
                                  color: white,
                                  fontWeight: FontWeight.w500)),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      // height: 60.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          border: const GradientBoxBorder(
                            gradient:
                                LinearGradient(colors: [Colors.white38, Gold]),
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(16.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              //$.[]course_pack_list_live.length
                              LiveCourseData["course_pack_list_live"]
                                  .length
                                  .toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kSixteenFont,
                                  color: white,
                                  fontWeight: kFW800)),
                          Text("Live Courses packs",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kTwelveFont,
                                  color: white,
                                  fontWeight: FontWeight.w500)),
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      // height: 60.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          border: const GradientBoxBorder(
                            gradient:
                                LinearGradient(colors: [Colors.white38, Gold]),
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(16.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(LiveCourseData["you_share"].toString(),
                              //  $.[]you_share
                              // $.[]allcourse_packs.length
                              //LiveCourseData["courses"].length.toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kSixteenFont,
                                  color: white,
                                  fontWeight: kFW800)),
                          Text("Your Share",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kTwelveFont,
                                  color: white,
                                  fontWeight: FontWeight.w500)),
                        ],
                      )),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                    // height: 60.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient:
                              LinearGradient(colors: [Colors.white38, Gold]),
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                            //$.[]course_pack_list_live.length
                            LiveCourseData["totalpayments"].toString(),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.gothicA1(
                                fontSize: kSixteenFont,
                                color: white,
                                fontWeight: kFW800)),
                        Text("Total Earnings",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.gothicA1(
                                fontSize: kTwelveFont,
                                color: white,
                                fontWeight: FontWeight.w500)),
                      ],
                    )),
              ),
            ],
          );

    // GridView.builder(
    //     shrinkWrap: true,
    //     //scrollDirection: Axis.vertical,
    //     physics: NeverScrollableScrollPhysics(),
    //     //  itemCount: PropertyCategorylist.length,
    //     itemCount: 9,
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2,
    //         crossAxisSpacing: 0,
    //         mainAxisSpacing: 0,
    //         childAspectRatio: (0.93 / 0.3)),
    //     itemBuilder: (BuildContext context, int index) {
    //       return GlassmorphicContainer(
    //         height: 60.h,
    //         width: 150.w,
    //         borderRadius: 13.r,
    //         margin: EdgeInsets.only(right: 5.w, bottom: 5.h),
    //         blur: 15,
    //         alignment: Alignment.center,
    //         border: 2,
    //         linearGradient: LinearGradient(
    //             colors: [white.withOpacity(0.1), white.withOpacity(0.01)],
    //             begin: Alignment.topLeft,
    //             end: Alignment.bottomRight),
    //         borderGradient:
    //             LinearGradient(colors: [white.withOpacity(0.5), Gold]),
    //         child: Container(
    //           decoration: BoxDecoration(boxShadow: [
    //             BoxShadow(
    //               blurRadius: 16,
    //               spreadRadius: 16,
    //               color: Colors.black.withOpacity(0.1),
    //             )
    //           ]),
    //           child: ClipRRect(
    //             borderRadius: BorderRadius.circular(15.0),
    //             child: BackdropFilter(
    //               filter: ImageFilter.blur(
    //                 sigmaX: 20.0,
    //                 sigmaY: 20.0,
    //               ),
    //               child: Container(
    //                   height: 60.h,
    //                   width: double.infinity,
    //                   decoration: BoxDecoration(
    //                       border: const GradientBoxBorder(
    //                         gradient:
    //                             LinearGradient(colors: [Colors.white38, Gold]),
    //                         width: 0.5,
    //                       ),
    //                       borderRadius: BorderRadius.circular(16.r)),
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     children: [
    //                       Text("12",
    //                           textAlign: TextAlign.center,
    //                           style: GoogleFonts.gothicA1(
    //                               fontSize: kSixteenFont,
    //                               color: white,
    //                               fontWeight: kFW800)),
    //                       Text("  categories[index]",
    //                           textAlign: TextAlign.center,
    //                           style: GoogleFonts.gothicA1(
    //                               fontSize: kTwelveFont,
    //                               color: white,
    //                               fontWeight: FontWeight.w500)),
    //                     ],
    //                   )),
    //             ),
    //           ),
    //         ),
    //       );
    //     });
    /////////////////////
  }
}

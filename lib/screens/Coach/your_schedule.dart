import 'dart:ui';

import 'package:bossjobs/utils/export_file.dart';

class CoachSchedule extends StatefulWidget {
  const CoachSchedule({super.key});

  @override
  State<CoachSchedule> createState() => _CoachScheduleState();
}

class _CoachScheduleState extends State<CoachSchedule> {
  Map coachHomeData = {};

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
      coachHomeData = data["data"]["data"];
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
              Text("Your Schedule",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.gothicA1(
                      fontSize: kSixteenFont,
                      color: white,
                      fontWeight: kFW800)),
              SizedBox(
                height: 20.h,
              ),
              isLoading == true
                  ? Center(
                      child: CircularProgressIndicator(
                      color: Gold,
                    ))
                  : SizedBox(
                      height: 190.h,
                      child: ListView.builder(
                          itemCount: coachHomeData["course_schedule"].length,
                          scrollDirection: Axis.horizontal,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemBuilder: ((context, index) {
                            return isLoading == false
                                ? GlassmorphicContainer(
                                    //  margin: EdgeInsets.all(10.r),
                                    margin: EdgeInsets.only(right: 15.w),
                                    height: 190.h,
                                    width: 330.w,
                                    borderRadius: 15,
                                    blur: 15,
                                    alignment: Alignment.center,
                                    border: 2,
                                    linearGradient: LinearGradient(
                                        colors: [
                                          white.withOpacity(0.15),
                                          white.withOpacity(0.15)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight),
                                    borderGradient: LinearGradient(colors: [
                                      Colors.white.withOpacity(0.5),
                                      Gold.withOpacity(0.01)
                                    ]),
                                    child: Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(
                                          blurRadius: 20,
                                          spreadRadius: 16,
                                          color: Colors.black.withOpacity(0.1),
                                        )
                                      ]),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 10.0,
                                            sigmaY: 10.0,
                                          ),
                                          child: Container(
                                              width: double.infinity,
                                              height: 190.h,
                                              padding: EdgeInsets.all(10.r),
                                              decoration: BoxDecoration(
                                                  border:
                                                      const GradientBoxBorder(
                                                    gradient: LinearGradient(
                                                        colors: [
                                                          Colors.white38,
                                                          Gold
                                                        ]),
                                                    width: 0.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.r)),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  // SizedBox(
                                                  //   height: 10.h,
                                                  // ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.notifications,
                                                        color: white,
                                                        size: kTwentyFont,
                                                      ),
                                                      SizedBox(width: 20.w),
                                                      Text(
                                                          coachHomeData[
                                                                  "course_schedule"]
                                                              [index]["title"],
                                                          style: GoogleFonts
                                                              .gothicA1(
                                                                  fontSize:
                                                                      15.sp,
                                                                  color: white,
                                                                  fontWeight:
                                                                      kFW700)),
                                                    ],
                                                  ),
                                                  // SizedBox(
                                                  //   height: 25.h,
                                                  // ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.people,
                                                        color: white,
                                                        size: kTwentyFont,
                                                      ),
                                                      SizedBox(width: 20.w),
                                                      Text(
                                                          coachHomeData["course_schedule"]
                                                                      [index]
                                                                  ["schedules"]
                                                              [0]["batch"],
                                                          style: GoogleFonts
                                                              .gothicA1(
                                                                  fontSize:
                                                                      15.sp,
                                                                  color: white,
                                                                  fontWeight:
                                                                      kFW700)),
                                                    ],
                                                  ),
                                                  // SizedBox(
                                                  //   height: 15.h,
                                                  // ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text("Start Date",
                                                              style: GoogleFonts
                                                                  .gothicA1(
                                                                      fontSize:
                                                                          15.sp,
                                                                      color:
                                                                          white,
                                                                      fontWeight:
                                                                          kFW700)),
                                                          SizedBox(
                                                            height: 10.h,
                                                          ),
                                                          Text(
                                                              coachHomeData["course_schedule"]
                                                                          [
                                                                          index]
                                                                      [
                                                                      "schedules"][0]
                                                                  [
                                                                  "start_date"],
                                                              style: GoogleFonts
                                                                  .gothicA1(
                                                                      fontSize:
                                                                          kTwelveFont,
                                                                      color:
                                                                          white,
                                                                      fontWeight:
                                                                          kFW700)),
                                                        ],
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text("End Date",
                                                              style: GoogleFonts
                                                                  .gothicA1(
                                                                      fontSize:
                                                                          15.sp,
                                                                      color:
                                                                          white,
                                                                      fontWeight:
                                                                          kFW700)),
                                                          SizedBox(
                                                            height: 10.h,
                                                          ),
                                                          Text(
                                                              coachHomeData["course_schedule"]
                                                                          [index]
                                                                      [
                                                                      "schedules"][0]
                                                                  ["end_date"],
                                                              style: GoogleFonts
                                                                  .gothicA1(
                                                                      fontSize:
                                                                          kTwelveFont,
                                                                      color:
                                                                          white,
                                                                      fontWeight:
                                                                          kFW700)),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ),
                                    ),
                                  )
                                : const Center(
                                    child: CircularProgressIndicator(
                                    color: Gold,
                                  ));
                          })),
                    ),
            ],
          );
  }
}

import 'dart:ui';
import 'package:bossjobs/models/job_interview_schedule_list_model.dart';
import '../utils/export_file.dart';
import 'package:dio/dio.dart' as dio;

class JobInterviewScheduleList extends StatefulWidget {
  const JobInterviewScheduleList({super.key});

  @override
  State<JobInterviewScheduleList> createState() => _JobInterviewScheduleList();
}

class _JobInterviewScheduleList extends State<JobInterviewScheduleList> {
  bool status = false;
  bool isLoading = false;
  JobInterviewScheduleListModel? jobInterviewScheduleListModel;
  Future candidateJobInterviewScheduleListHandler() async {
    setState(() {
      isLoading = true;
    });

    dio.Response response = await Services.getCandidateJobInterviewSchedules();

    if (response.statusCode == 200) {
      if (response.data != null) {
        jobInterviewScheduleListModel =
            JobInterviewScheduleListModel.fromJson(response.data['data']);
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    candidateJobInterviewScheduleListHandler();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? jobInterviewScheduleListModel != null &&
                jobInterviewScheduleListModel!
                    .interviewSchedules!.data!.isNotEmpty
            ? SizedBox(
                height: 190.h,
                child: jobInterviewScheduleListModel!
                                .interviewSchedules!.data !=
                            null &&
                        jobInterviewScheduleListModel!
                                .interviewSchedules!.data!.length >
                            0
                    ? ListView.builder(
                        itemCount: jobInterviewScheduleListModel!
                            .interviewSchedules!.data!.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return GlassmorphicContainer(
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
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 20,
                                    spreadRadius: 16,
                                    color: Colors.black.withOpacity(0.1),
                                  )
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
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
                                        border: const GradientBoxBorder(
                                          gradient: LinearGradient(
                                              colors: [Colors.white38, Gold]),
                                          width: 0.5,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                      ),
                                      child: Column(
                                        children: [
                                          // Row(
                                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //   children: [
                                          //     // Image.asset(
                                          //     //   'assets/images/thu.png',
                                          //     //   width: 100.w,
                                          //     // ),
                                          //     SizedBox(
                                          //       width: 100.w,
                                          //       child: Text(
                                          //           //"Data",
                                          //           jobInterviewScheduleListModel!.interviewSchedules!.data![index],
                                          //           maxLines: 2,
                                          //           style: GoogleFonts.gothicA1(
                                          //               fontSize: kFourteenFont, color: white, fontWeight: kFW700)),
                                          //     ),
                                          //
                                          //     Column(
                                          //       mainAxisAlignment: MainAxisAlignment.start,
                                          //       crossAxisAlignment: CrossAxisAlignment.start,
                                          //       children: [
                                          //         Text(jobInterviewScheduleListModel!.interviewSchedules!.data![index],
                                          //             //  from_time
                                          //             //  "Thu 7:00am --- Zoom",
                                          //             style: GoogleFonts.gothicA1(
                                          //                 fontSize: kFourteenFont, color: white, fontWeight: kFW700)),
                                          //         SizedBox(
                                          //           height: 5.h,
                                          //         ),
                                          //         Container(
                                          //           padding: EdgeInsets.only(left: 10.w, right: 10.w),
                                          //           alignment: Alignment.center,
                                          //           height: 20.h,
                                          //           decoration: BoxDecoration(
                                          //               borderRadius: BorderRadius.circular(2.r),
                                          //               color: white.withOpacity(0.5)),
                                          //           child: Text(interviewScheduleList[index]["title"],
                                          //               // "Front End Dev",
                                          //               style: GoogleFonts.gothicA1(
                                          //                   fontSize: 11.sp, color: Colors.black, fontWeight: kFW700)),
                                          //         ),
                                          //       ],
                                          //     ),
                                          //     Image.asset('assets/images/delete.png'),
                                          //     SizedBox(
                                          //       width: 2.w,
                                          //     )
                                          //   ],
                                          // ),
                                          // Container(
                                          //   padding: EdgeInsets.only(
                                          //     left: 20.w,
                                          //   ),
                                          //   child: Row(
                                          //     children: [
                                          //       Image.asset(
                                          //         'assets/images/React.png',
                                          //       ),
                                          //       SizedBox(
                                          //         width: 20.w,
                                          //       ),
                                          //       Text(
                                          //           //title
                                          //           //  candidateinterview_schedules
                                          //           // "React Java Script",
                                          //           interviewScheduleList[index]["candidateinterview_schedules"][index]
                                          //               ["title"],
                                          //           style: GoogleFonts.gothicA1(
                                          //               fontSize: kEighteenFont, color: white, fontWeight: kFW700))
                                          //     ],
                                          //   ),
                                          // ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                              left: 20.w,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CircleAvatar(
                                                  radius: 25.r,
                                                  backgroundColor: white,
                                                  child: Image.asset(
                                                    'assets/images/man.png',
                                                    width: 45.w,
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      const EdgeInsets.all(5),
                                                  // color: Colors.black,
                                                  child: Card(
                                                    elevation: 20,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                    ),
                                                    child: FlutterSwitch(
                                                      width: 50.w,
                                                      height: 20.h,
                                                      valueFontSize: 0.0,
                                                      toggleSize: 25.0,
                                                      value: status,
                                                      borderRadius: 30.0,
                                                      //padding: 1.0,
                                                      inactiveColor: Colors
                                                          .black
                                                          .withOpacity(0.6),
                                                      activeColor: Colors.black
                                                          .withOpacity(0.6),
                                                      activeToggleColor: Gold,
                                                      toggleColor: Gold,
                                                      showOnOff: true,
                                                      onToggle: (val) {
                                                        setState(() {
                                                          status = val;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                // Container(
                                                //     margin: EdgeInsets.only(right: 10.w),
                                                //     height: 40.h,
                                                //     width: 110.w,
                                                //     child: Ink(
                                                //       decoration: const BoxDecoration(
                                                //         gradient: LinearGradient(
                                                //             colors: [white, grey1]),
                                                //         borderRadius: BorderRadius.all(
                                                //             Radius.circular(80.0)),
                                                //       ),
                                                //       child: TextButton(
                                                //         onPressed: () {
                                                //           //Get.toNamed(KRecipet);
                                                //         },
                                                //         style: ButtonStyle(
                                                //             backgroundColor:
                                                //                 const MaterialStatePropertyAll<
                                                //                     Color>(grey),
                                                //             shape: MaterialStateProperty.all<
                                                //                     RoundedRectangleBorder>(
                                                //                 RoundedRectangleBorder(
                                                //                     borderRadius:
                                                //                         BorderRadius.circular(
                                                //                             10.r),
                                                //                     side: const BorderSide(
                                                //                         color: grey)))),
                                                //         child: Text(
                                                //           "Join Class",
                                                //           style: GoogleFonts.gothicA1(
                                                //               fontSize: kTwelveFont,
                                                //               color: white,
                                                //               fontWeight: kFW600),
                                                //         ),
                                                //       ),
                                                //     ))
                                              ],
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                              ),
                            ),
                          );
                        }),
                      )
                    : Center(
                        child: Text(
                          "currently there is no job interview scheduled for you",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.gothicA1(
                            fontSize: kFourteenFont,
                            color: white,
                            fontWeight: kFW700,
                          ),
                        ),
                      ),
              )
            : SizedBox()
        : const Center(
            child: CircularProgressIndicator(
              color: Gold,
            ),
          );
  }
}

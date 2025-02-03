import 'dart:ui';

import 'package:timer_count_down/timer_controller.dart';

import '../../utils/export_file.dart';

class AccessedTakeAssesment extends StatefulWidget {
  const AccessedTakeAssesment({super.key});

  @override
  State<AccessedTakeAssesment> createState() => _AccessedTakeAssesmentState();
}

class _AccessedTakeAssesmentState extends State<AccessedTakeAssesment>
    with TickerProviderStateMixin {
  List<Map<String, dynamic>> userChecked = [];
  final CountdownController _controller =
      new CountdownController(autoStart: true);
  List<Map> answers = [];
  double valid = 0.0;
  Map assignmetData = Get.arguments;
  Map takeExercises = {};
  bool isLoading = false;
  bool isSubmit = false;
  // Future jobHandler() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   Map data = await Services.gettakeexercise(id);
  //   if (data["message"] != null) {
  //     Fluttertoast.showToast(
  //       msg: data["message"],
  //     );
  //   } else {
  //     takeExercises = data["data"]["data"];
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  // @override
  // void initState() {
  //   // jobHandler();
  //   super.initState();
  // }
  String? gender;

  late AnimationController controller;
  var _selectedAnswers;
  String selectedlevel = "";
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomSheet: Container(
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.only(
        //     topRight: Radius.circular(50.r),
        //     topLeft: Radius.circular(50.r),
        //   )),
        //   height: 100.h,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       selectedlevel == "time"
        //           ? GestureDetector(
        //               onTap: () {
        //                 setState(() {
        //                   selectedlevel = "time";
        //                 });
        //               },
        //               child: GlassmorphicContainer(
        //                 // height: 210.h,
        //                 height: 39.h,
        //                 width: 96.w,
        //                 borderRadius: 10.r,
        //                 blur: 15,
        //                 alignment: Alignment.center,
        //                 border: 2,
        //                 linearGradient: LinearGradient(
        //                   colors: [
        //                     white.withOpacity(0.15),
        //                     white.withOpacity(0.15),
        //                   ],
        //                 ),
        //                 borderGradient: LinearGradient(
        //                   colors: [
        //                     kBackground,
        //                     //  white.withOpacity(0.5),
        //                     Gold.withOpacity(0.01)
        //                   ],
        //                 ),
        //                 child: Container(
        //                   decoration: BoxDecoration(
        //                     boxShadow: [
        //                       BoxShadow(
        //                         blurRadius: 20,
        //                         spreadRadius: 10.r,
        //                         color: Colors.black.withOpacity(0.1),
        //                       )
        //                     ],
        //                   ),
        //                   child: ClipRRect(
        //                     borderRadius: BorderRadius.circular(10.r),
        //                     child: BackdropFilter(
        //                       filter: ImageFilter.blur(
        //                         sigmaX: 10.0,
        //                         sigmaY: 10.0,
        //                       ),
        //                       child: Container(
        //                         width: double.infinity,
        //                         padding:
        //                             EdgeInsets.only(left: 15.w, right: 15.w),
        //                         //  padding: EdgeInsets.all(15.r),
        //                         decoration: BoxDecoration(
        //                           border: const GradientBoxBorder(
        //                             gradient: LinearGradient(
        //                                 begin: Alignment.topLeft,
        //                                 end: Alignment.bottomRight,
        //                                 colors: [
        //                                   kBackground,
        //                                   kBackground,
        //                                   kBackground,
        //                                   Gold
        //                                 ]),
        //                             width: 0.5,
        //                           ),
        //                           borderRadius: BorderRadius.circular(10.r),
        //                         ),
        //                         child: Column(
        //                           crossAxisAlignment: CrossAxisAlignment.center,
        //                           mainAxisAlignment: MainAxisAlignment.center,
        //                           children: [
        //                             Text(
        //                               "09:32",
        //                               style: GoogleFonts.gothicA1(
        //                                 fontSize: kFourteenFont,
        //                                 color: Gold,
        //                                 fontWeight: kFW700,
        //                               ),
        //                             ),
        //                             // SizedBox(
        //                             //   height: 15.h,
        //                             // ),

        //                             // SizedBox(
        //                             //   height: 15.h,
        //                             // ),

        //                             // SizedBox(height: 15.h),
        //                           ],
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             )
        //           : GestureDetector(
        //               onTap: () {
        //                 setState(() {
        //                   selectedlevel = "time";
        //                 });
        //               },
        //               child: Container(
        //                 alignment: Alignment.center,
        //                 height: 39.h,
        //                 width: 96.w,
        //                 child: Text(
        //                   "09:32",
        //                   style: GoogleFonts.gothicA1(
        //                     fontSize: 11.sp,
        //                     color: whitetwo,
        //                     fontWeight: kFW500,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //       SizedBox(width: 20.w),
        //       selectedlevel == "Play"
        //           ? GestureDetector(
        //               onTap: () {
        //                 setState(() {
        //                   selectedlevel = "Play";
        //                 });
        //               },
        //               child: GlassmorphicContainer(
        //                 // height: 210.h,
        //                 height: 39.h,
        //                 width: 96.w,
        //                 borderRadius: 10.r,
        //                 blur: 15,
        //                 alignment: Alignment.center,
        //                 border: 2,
        //                 linearGradient: LinearGradient(
        //                   colors: [
        //                     white.withOpacity(0.15),
        //                     white.withOpacity(0.15),
        //                   ],
        //                 ),
        //                 borderGradient: LinearGradient(
        //                   colors: [
        //                     kBackground,
        //                     //  white.withOpacity(0.5),
        //                     Gold.withOpacity(0.01)
        //                   ],
        //                 ),
        //                 child: Container(
        //                   decoration: BoxDecoration(
        //                     boxShadow: [
        //                       BoxShadow(
        //                         blurRadius: 20,
        //                         spreadRadius: 10.r,
        //                         color: Colors.black.withOpacity(0.1),
        //                       )
        //                     ],
        //                   ),
        //                   child: ClipRRect(
        //                     borderRadius: BorderRadius.circular(10.r),
        //                     child: BackdropFilter(
        //                       filter: ImageFilter.blur(
        //                         sigmaX: 10.0,
        //                         sigmaY: 10.0,
        //                       ),
        //                       child: Container(
        //                         width: double.infinity,
        //                         padding:
        //                             EdgeInsets.only(left: 15.w, right: 15.w),
        //                         //  padding: EdgeInsets.all(15.r),
        //                         decoration: BoxDecoration(
        //                           border: const GradientBoxBorder(
        //                             gradient: LinearGradient(
        //                                 begin: Alignment.topLeft,
        //                                 end: Alignment.bottomRight,
        //                                 colors: [
        //                                   kBackground,
        //                                   kBackground,
        //                                   kBackground,
        //                                   Gold
        //                                 ]),
        //                             width: 0.5,
        //                           ),
        //                           borderRadius: BorderRadius.circular(10.r),
        //                         ),
        //                         child: Column(
        //                           mainAxisAlignment: MainAxisAlignment.center,
        //                           crossAxisAlignment: CrossAxisAlignment.center,
        //                           children: [
        //                             Row(
        //                               children: [
        //                                 Icon(Icons.play_arrow,
        //                                     color: Gold, size: 20.sp),
        //                                 Text(
        //                                   "Play",
        //                                   style: GoogleFonts.gothicA1(
        //                                     fontSize: kFourteenFont,
        //                                     color: Gold,
        //                                     fontWeight: kFW700,
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                             // SizedBox(
        //                             //   height: 15.h,
        //                             // ),

        //                             // SizedBox(
        //                             //   height: 15.h,
        //                             // ),

        //                             // SizedBox(height: 15.h),
        //                           ],
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             )
        //           : GestureDetector(
        //               onTap: () {
        //                 setState(() {
        //                   selectedlevel = "Play";
        //                 });
        //               },
        //               child: Container(
        //                 alignment: Alignment.center,
        //                 height: 39.h,
        //                 width: 96.w,
        //                 child: Row(
        //                   children: [
        //                     Icon(Icons.play_arrow, color: white, size: 20.sp),
        //                     Text(
        //                       "Play",
        //                       style: GoogleFonts.gothicA1(
        //                         fontSize: 11.sp,
        //                         color: whitetwo,
        //                         fontWeight: kFW500,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //       SizedBox(width: 20.w),
        //       selectedlevel == "Stop"
        //           ? GestureDetector(
        //               onTap: () {
        //                 setState(() {
        //                   selectedlevel = "Stop";
        //                 });
        //               },
        //               child: GlassmorphicContainer(
        //                 // height: 210.h,
        //                 height: 39.h,
        //                 width: 96.w,
        //                 borderRadius: 10.r,
        //                 blur: 15,
        //                 alignment: Alignment.center,
        //                 border: 2,
        //                 linearGradient: LinearGradient(
        //                   colors: [
        //                     white.withOpacity(0.15),
        //                     white.withOpacity(0.15),
        //                   ],
        //                 ),
        //                 borderGradient: LinearGradient(
        //                   colors: [
        //                     kBackground,
        //                     //  white.withOpacity(0.5),
        //                     Gold.withOpacity(0.01)
        //                   ],
        //                 ),
        //                 child: Container(
        //                   decoration: BoxDecoration(
        //                     boxShadow: [
        //                       BoxShadow(
        //                         blurRadius: 20,
        //                         spreadRadius: 10.r,
        //                         color: Colors.black.withOpacity(0.1),
        //                       )
        //                     ],
        //                   ),
        //                   child: ClipRRect(
        //                     borderRadius: BorderRadius.circular(10.r),
        //                     child: BackdropFilter(
        //                       filter: ImageFilter.blur(
        //                         sigmaX: 10.0,
        //                         sigmaY: 10.0,
        //                       ),
        //                       child: Container(
        //                         width: double.infinity,
        //                         padding:
        //                             EdgeInsets.only(left: 15.w, right: 15.w),
        //                         //  padding: EdgeInsets.all(15.r),
        //                         decoration: BoxDecoration(
        //                           border: const GradientBoxBorder(
        //                             gradient: LinearGradient(
        //                                 begin: Alignment.topLeft,
        //                                 end: Alignment.bottomRight,
        //                                 colors: [
        //                                   kBackground,
        //                                   kBackground,
        //                                   kBackground,
        //                                   Gold
        //                                 ]),
        //                             width: 0.5,
        //                           ),
        //                           borderRadius: BorderRadius.circular(10.r),
        //                         ),
        //                         child: Column(
        //                           mainAxisAlignment: MainAxisAlignment.center,
        //                           crossAxisAlignment: CrossAxisAlignment.center,
        //                           children: [
        //                             Row(
        //                               children: [
        //                                 Icon(Icons.stop,
        //                                     color: Gold, size: 20.sp),
        //                                 Text(
        //                                   "Stop",
        //                                   style: GoogleFonts.gothicA1(
        //                                     fontSize: kFourteenFont,
        //                                     color: Gold,
        //                                     fontWeight: kFW700,
        //                                   ),
        //                                 ),
        //                               ],
        //                             ),
        //                             // SizedBox(
        //                             //   height: 15.h,
        //                             // ),

        //                             // SizedBox(
        //                             //   height: 15.h,
        //                             // ),

        //                             // SizedBox(height: 15.h),
        //                           ],
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             )
        //           : GestureDetector(
        //               onTap: () {
        //                 setState(() {
        //                   selectedlevel = "Stop";
        //                 });
        //               },
        //               child: Container(
        //                 alignment: Alignment.center,
        //                 height: 39.h,
        //                 width: 96.w,
        //                 child: Row(
        //                   children: [
        //                     Icon(Icons.stop, color: white, size: 20.sp),
        //                     Text(
        //                       "Stop",
        //                       style: GoogleFonts.gothicA1(
        //                         fontSize: 11.sp,
        //                         color: whitetwo,
        //                         fontWeight: kFW500,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //     ],
        //   ),
        // ),
        backgroundColor: kBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: AppBar(
            iconTheme: const IconThemeData(color: white),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Exercise',
              style: GoogleFonts.gothicA1(
                  letterSpacing: 1,
                  fontSize: kEighteenFont,
                  color: white,
                  fontWeight: kFW700),
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
            flexibleSpace: Container(
              // color: whitetwo,
              height: 40.h,
              width: double.infinity,
              margin: EdgeInsets.only(top: 120.0, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedProgressBar(
                      height: 5.h,
                      width: 220.w,
                      value: 40 / 100,
                      duration: Duration(seconds: 1),
                      gradient: const LinearGradient(
                        colors: [Gold, white],
                      ),
                      backgroundColor: white),
                  Row(
                    children: [
                      Text("2/",
                          style: GoogleFonts.inter(
                              color: white,
                              fontSize: kFourteenFont,
                              fontWeight: kFW800)),
                      Text("4 Qn",
                          style: GoogleFonts.inter(
                              color: white,
                              fontSize: kTwelveFont,
                              fontWeight: kFW600)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   centerTitle: true,
        //   title: Text(
        //     'Add Skill',
        //     style: GoogleFonts.gothicA1(
        //         letterSpacing: 1,
        //         fontSize: kEighteenFont,
        //         color: white,
        //         fontWeight: kFW700),
        //   ),
        //   actions: [
        //     Center(
        //       child: GestureDetector(
        //         onTap: () {
        //           Get.toNamed(KNotification);
        //         },
        //         child: Stack(
        //           children: [
        //             Image.asset(
        //               'assets/images/bell.png',
        //               width: 22.w,
        //             ),
        //             Positioned(
        //                 left: 13.r,
        //                 //top: .h,
        //                 child: const CircleAvatar(
        //                   radius: 5,
        //                   backgroundColor: Colors.green,
        //                 ))
        //           ],
        //         ),
        //       ),
        //     ),
        //     SizedBox(
        //       width: 13.w,
        //     )
        //   ],
        // ),
        body: Stack(
          children: [
            const Background(),
            SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.all(15.w),
                  child: isLoading == false
                      ? Column(
                          children: [
                            // Text(
                            //   assementdetails["skilinfo"]["title"],
                            //   //$.[]data.question_master.length
                            //   style: GoogleFonts.gothicA1(
                            //       letterSpacing: 1,
                            //       fontSize: kEighteenFont,
                            //       color: white,
                            //       fontWeight: kFW700),
                            // ),
                            // SizedBox(
                            //   height: 10.h,
                            // ),
                            // isLoading == false
                            assignmetData.isEmpty
                                ? Center(
                                    child: Text(
                                      " No skill questions updated. Please visit after some time",
                                      style: GoogleFonts.gothicA1(
                                          fontSize: kSixteenFont,
                                          color: white,
                                          fontWeight: kFW700),
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: assignmetData.isNotEmpty
                                        ? assignmetData["question_master"]
                                            .length
                                        : 0,
                                    // itemCount: 3,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: ((context, index) {
                                      return GlassmorphicContainer(
                                        margin: EdgeInsets.only(bottom: 15.h),
                                        // height: 230.h,
                                        height: 270.h,
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
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                              )
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                sigmaX: 10.0,
                                                sigmaY: 10.0,
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                padding: EdgeInsets.all(16.w),
                                                decoration: BoxDecoration(
                                                  border:
                                                      const GradientBoxBorder(
                                                    gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topLeft,
                                                        end: Alignment
                                                            .bottomRight,
                                                        colors: [
                                                          kBackground,
                                                          kBackground,
                                                          kBackground,
                                                          Gold
                                                        ]),
                                                    width: 0.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                ),
                                                child: Theme(
                                                  data: ThemeData(
                                                      unselectedWidgetColor:
                                                          whitetwo),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        assignmetData[
                                                                "question_master"]
                                                            [index]["title"],
                                                        maxLines: 2,
                                                        style: GoogleFonts
                                                            .gothicA1(
                                                                height: 1.5,
                                                                fontSize: 13.sp,
                                                                color: whitetwo,
                                                                fontWeight:
                                                                    kFW900),
                                                      ),
                                                      Expanded(
                                                        // height: 210.h,
                                                        child: ListView.builder(
                                                            itemCount: assignmetData[
                                                                            "question_master"]
                                                                        [index][
                                                                    "question_options"]
                                                                .length,
                                                            physics:
                                                                const NeverScrollableScrollPhysics(),
                                                            itemBuilder:
                                                                ((context, i) {
                                                              return RadioListTile(
                                                                title: Text(
                                                                  assignmetData["question_master"]
                                                                              [
                                                                              index]
                                                                          [
                                                                          "question_options"][i]
                                                                      [
                                                                      "option"],
                                                                  style: GoogleFonts.gothicA1(
                                                                      height:
                                                                          1.5,
                                                                      fontSize:
                                                                          13.sp,
                                                                      color:
                                                                          white,
                                                                      fontWeight:
                                                                          kFW700),
                                                                ),
                                                                value: userChecked
                                                                        .where((element) =>
                                                                            element["index"] ==
                                                                            index)
                                                                        .toList()
                                                                        .isNotEmpty
                                                                    ? true
                                                                    : false,
                                                                groupValue:
                                                                    true,
                                                                activeColor:
                                                                    korange,
                                                                onChanged:
                                                                    (value) {
                                                                  setState(() {
                                                                    _onSelected(
                                                                        assignmetData["question_master"][index]["question_options"][i]
                                                                            [
                                                                            "option"],
                                                                        i);
                                                                  });
                                                                },

                                                                //     Checkbox(
                                                                //   //  fillColor: Colors.blue,
                                                                //   fillColor: MaterialStateProperty
                                                                //       .resolveWith(
                                                                //           getColor),
                                                                //   checkColor: isSubmit ==
                                                                //           true
                                                                //       ? grey
                                                                //       : white,
                                                                //   activeColor: isSubmit ==
                                                                //           true
                                                                //       ? grey
                                                                //       : white,
                                                                // value: userChecked.contains(assignmetData["question_master"][index]
                                                                //         [
                                                                //         "question_options"][i]
                                                                //     [
                                                                //     "option"]),
                                                                //   onChanged:
                                                                //       (val) {
                                                                //     if (!isSubmit) {
                                                                // _onSelected(
                                                                //     val!,
                                                                //     assignmetData["question_master"][index]["question_options"][i]["option"]);
                                                                //       if (val ==
                                                                //           true) {
                                                                //         assignmetData["question_master"][index]["question_options"][i]["answer"] == "false"
                                                                //             ? _howmanyCorrect(false, assignmetData["question_master"].length)
                                                                //             : _howmanyCorrect(true, assignmetData["question_master"].length);
                                                                //       } else {
                                                                //         _howmanyCorrect(
                                                                //             false,
                                                                //             assignmetData["question_master"].length);
                                                                //       }
                                                                //     }
                                                                //   },
                                                                // )
                                                                //you can use checkboxlistTile too
                                                              );
                                                            })),
                                                      ),

                                                      // RadioListTile(
                                                      //   visualDensity: const VisualDensity(
                                                      //       horizontal:
                                                      //           VisualDensity
                                                      //               .minimumDensity,
                                                      //       vertical:
                                                      //           VisualDensity
                                                      //               .minimumDensity),
                                                      //   materialTapTargetSize:
                                                      //       MaterialTapTargetSize
                                                      //           .shrinkWrap,
                                                      //   contentPadding:
                                                      //       EdgeInsets.all(0),
                                                      //   dense: true,
                                                      //   activeColor: Gold,
                                                      //   title: Text(
                                                      //     "This is Wrong Answer",
                                                      //     style: GoogleFonts.gothicA1(
                                                      //         fontSize:
                                                      //             gender ==
                                                      //                     "1"
                                                      //                 ? 15.sp
                                                      //                 : 13.sp,
                                                      //         color: gender ==
                                                      //                 "1"
                                                      //             ? Gold
                                                      //             : whitetwo,
                                                      //         fontWeight:
                                                      //             kFW700),
                                                      //   ),
                                                      //   value: "1",
                                                      //   groupValue: gender,
                                                      //   onChanged: (value) {
                                                      //     setState(() {
                                                      //       gender = value
                                                      //           .toString();
                                                      //     });
                                                      //   },
                                                      // ),
                                                      // RadioListTile(
                                                      //   contentPadding:
                                                      //       EdgeInsets.all(0),
                                                      //   // Visual Density passed here
                                                      //   visualDensity: const VisualDensity(
                                                      //       horizontal:
                                                      //           VisualDensity
                                                      //               .minimumDensity,
                                                      //       vertical:
                                                      //           VisualDensity
                                                      //               .minimumDensity),
                                                      //   materialTapTargetSize:
                                                      //       MaterialTapTargetSize
                                                      //           .shrinkWrap,
                                                      //   dense: true,
                                                      //   activeColor: Gold,
                                                      //   title: Text(
                                                      //     "This is Wrong Answer",
                                                      //     style: GoogleFonts.gothicA1(
                                                      //         fontSize:
                                                      //             gender ==
                                                      //                     "2"
                                                      //                 ? 15.sp
                                                      //                 : 13.sp,
                                                      //         color: gender ==
                                                      //                 "2"
                                                      //             ? Gold
                                                      //             : whitetwo,
                                                      //         fontWeight:
                                                      //             kFW700),
                                                      //   ),
                                                      //   value: "2",
                                                      //   groupValue: gender,
                                                      //   onChanged: (value) {
                                                      //     setState(() {
                                                      //       gender = value
                                                      //           .toString();
                                                      //     });
                                                      //   },
                                                      // ),
                                                      // RadioListTile(
                                                      //   contentPadding:
                                                      //       EdgeInsets.all(0),
                                                      //   visualDensity: const VisualDensity(
                                                      //       horizontal:
                                                      //           VisualDensity
                                                      //               .minimumDensity,
                                                      //       vertical:
                                                      //           VisualDensity
                                                      //               .minimumDensity),
                                                      //   materialTapTargetSize:
                                                      //       MaterialTapTargetSize
                                                      //           .shrinkWrap,
                                                      //   dense: true,
                                                      //   activeColor: Gold,
                                                      //   title: Text(
                                                      //     "This is Wrong Answer",
                                                      //     style: GoogleFonts.gothicA1(
                                                      //         fontSize:
                                                      //             gender ==
                                                      //                     "3"
                                                      //                 ? 15.sp
                                                      //                 : 13.sp,
                                                      //         color: gender ==
                                                      //                 "3"
                                                      //             ? Gold
                                                      //             : whitetwo,
                                                      //         fontWeight:
                                                      //             kFW700),
                                                      //   ),
                                                      //   value: "3",
                                                      //   groupValue: gender,
                                                      //   onChanged: (value) {
                                                      //     setState(() {
                                                      //       gender = value
                                                      //           .toString();
                                                      //     });
                                                      //   },
                                                      // ),
                                                      // RadioListTile(
                                                      //   toggleable: true,
                                                      //   contentPadding:
                                                      //       EdgeInsets.all(0),
                                                      //   visualDensity: const VisualDensity(
                                                      //       horizontal:
                                                      //           VisualDensity
                                                      //               .minimumDensity,
                                                      //       vertical:
                                                      //           VisualDensity
                                                      //               .minimumDensity),
                                                      //   materialTapTargetSize:
                                                      //       MaterialTapTargetSize
                                                      //           .shrinkWrap,
                                                      //   dense: true,
                                                      //   activeColor: Gold,
                                                      //   title: Text(
                                                      //     "This is Wrong Answer",
                                                      //     style: GoogleFonts.gothicA1(
                                                      //         fontSize:
                                                      //             gender ==
                                                      //                     "4"
                                                      //                 ? 15.sp
                                                      //                 : 13.sp,
                                                      //         color: gender ==
                                                      //                 "4"
                                                      //             ? Gold
                                                      //             : whitetwo,
                                                      //         fontWeight:
                                                      //             kFW700),
                                                      //   ),
                                                      //   value: "4",
                                                      //   groupValue: gender,
                                                      //   onChanged: (value) {
                                                      //     setState(() {
                                                      //       gender = value
                                                      //           .toString();
                                                      //     });
                                                      //   },
                                                      // )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    })),
                            // : Center(
                            //     child: Text(
                            //       " No skill questions updated. Please visit after some time",
                            //       style: GoogleFonts.gothicA1(
                            //           fontSize: kSixteenFont,
                            //           color: white,
                            //           fontWeight: kFW700),
                            //     ),
                            //   ),

                            ///////////////////////////////////////////////////////////////////////////////////////////////////
                            SizedBox(height: 30.h),
                            CustomButton(
                              label: 'Submit',
                              isLoading: true,
                              onTap: () {
                                Get.toNamed(KExerciseScore,
                                    arguments: [valid, assignmetData]);
                                // Get.back();
                                // Get.toNamed(KAssesment,
                                //     arguments: takeExercise["exercise_details"][0]
                                //         ["exercise_lessons"][0]

                                // takeExercise["exercise_details"]
                                //         [0]["exercise_lessons"]
                                //     [index]["id"],
                                //$.[]data.[]exercise_details.0.exercise_lessons.0.id
                              },
                            ),

                            // Center(
                            //   child: GlassmorphicContainer(
                            //     height: 41.h,
                            //     width: 160.w,
                            //     borderRadius: 13.r,
                            //     blur: 15,
                            //     alignment: Alignment.center,
                            //     border: 0.5,
                            //     linearGradient: LinearGradient(
                            //         colors: [
                            //           white.withOpacity(0.1),
                            //           white.withOpacity(0.01)
                            //         ],
                            //         begin: Alignment.topLeft,
                            //         end: Alignment.bottomRight),
                            //     borderGradient: LinearGradient(
                            //         begin: Alignment.centerLeft,
                            //         end: Alignment.bottomRight,
                            //         colors: [
                            //           white.withOpacity(0.5),
                            //           white.withOpacity(0.5),
                            //           Gold.withOpacity(0.5)
                            //         ]),
                            //     child: Container(
                            //       decoration: BoxDecoration(boxShadow: [
                            //         BoxShadow(
                            //           blurRadius: 16,
                            //           spreadRadius: 15,
                            //           color: Colors.black.withOpacity(0.1),
                            //         )
                            //       ]),
                            //       child: GestureDetector(
                            //         onTap: () {
                            //           setState(() {
                            //             isSubmit = true;
                            //           });
                            //         },
                            //         child: ClipRRect(
                            //           borderRadius: BorderRadius.circular(15.0),
                            //           child: BackdropFilter(
                            //             filter: ImageFilter.blur(
                            //               sigmaX: 20.0,
                            //               sigmaY: 20.0,
                            //             ),
                            //             child: Text("Submit",
                            //                 //maxLines: 2,
                            //                 style: GoogleFonts.gothicA1(
                            //                     fontSize: kSixteenFont,
                            //                     color: white,
                            //                     fontWeight: kFW700)),
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 40.h,
                            // ),
                            // isSubmit == true
                            //     ? Center(
                            //         child: CircularPercentIndicator(
                            //           radius: 60.0,
                            //           lineWidth: 5.0,
                            //           percent: valid,
                            //           center: Text(
                            //               "${(valid * 100).toStringAsFixed(2)}%",
                            //               //maxLines: 2,
                            //               style: GoogleFonts.gothicA1(
                            //                   fontSize: kSixteenFont,
                            //                   color: white,
                            //                   fontWeight: kFW700)),
                            //           progressColor: Gold,
                            //         ),
                            //       )
                            //     : const SizedBox(),

                            SizedBox(height: 120.h),
                            /////////////////////////////////////////////////////////////////////////////////////////////////
                            // SizedBox(height: 20.h),
                            // assementdetails["question_master"].isNotEmpty
                            //     ? GestureDetector(
                            //         onTap: () {
                            //           Get.offAllNamed(KSkillScoreView, arguments: {
                            //             "id": Get.arguments["id"],
                            //             "payload": payloadData
                            //           });
                            //         },
                            //         child: Center(
                            //           child: GlassmorphicContainer(
                            //             height: 41.h,
                            //             width: 160.w,
                            //             borderRadius: 13.r,
                            //             blur: 15,
                            //             alignment: Alignment.center,
                            //             border: 0.5,
                            //             linearGradient: LinearGradient(
                            //                 colors: [
                            //                   white.withOpacity(0.1),
                            //                   white.withOpacity(0.01)
                            //                 ],
                            //                 begin: Alignment.topLeft,
                            //                 end: Alignment.bottomRight),
                            //             borderGradient: LinearGradient(
                            //                 begin: Alignment.centerLeft,
                            //                 end: Alignment.bottomRight,
                            //                 colors: [
                            //                   white.withOpacity(0.5),
                            //                   white.withOpacity(0.5),
                            //                   Gold.withOpacity(0.5)
                            //                 ]),
                            //             child: Container(
                            //               decoration: BoxDecoration(boxShadow: [
                            //                 BoxShadow(
                            //                   blurRadius: 16,
                            //                   spreadRadius: 15,
                            //                   color: Colors.black.withOpacity(0.1),
                            //                 )
                            //               ]),
                            //               child: ClipRRect(
                            //                 borderRadius:
                            //                     BorderRadius.circular(15.0),
                            //                 child: BackdropFilter(
                            //                   filter: ImageFilter.blur(
                            //                     sigmaX: 20.0,
                            //                     sigmaY: 20.0,
                            //                   ),
                            //                   child: Text("Submit",
                            //                       //maxLines: 2,
                            //                       style: GoogleFonts.gothicA1(
                            //                           fontSize: kSixteenFont,
                            //                           color: white,
                            //                           fontWeight: kFW700)),
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       )
                            //     : SizedBox(),
                          ],
                        )
                      : Center(
                          child: CircularPercentIndicator(radius: 5),
                        )),
            ),
          ],
        ));

    // below code old code with dynamic data
    // Scaffold(
    //     backgroundColor: kBackground,
    //     appBar: AppBar(
    //       backgroundColor: darktwo,
    //       elevation: 0,
    //       centerTitle: true,
    //       title: Text(
    //         'Take Assesment',
    //         style: GoogleFonts.gothicA1(
    //             letterSpacing: 1,
    //             fontSize: kEighteenFont,
    //             color: white,
    //             fontWeight: kFW700),
    //       ),
    //       actions: [
    //         Center(
    //           child: GestureDetector(
    //             onTap: () {
    //               Get.toNamed(KNotification);
    //             },
    //             child: Stack(
    //               children: [
    //                 Image.asset(
    //                   'assets/images/bell.png',
    //                   width: 22.w,
    //                 ),
    //                 Positioned(
    //                     left: 13.r,
    //                     //top: .h,
    //                     child: const CircleAvatar(
    //                       radius: 5,
    //                       backgroundColor: Colors.green,
    //                     ))
    //               ],
    //             ),
    //           ),
    //         ),
    //         SizedBox(
    //           width: 13.w,
    //         )
    //       ],
    //     ),
    //     body: Stack(
    //       children: [
    //         Background(),
    //         Container(
    //             margin: EdgeInsets.all(15.w),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Text(
    //                     //"Test Course_101",
    //                     //maxLines: 2,
    //                     assignmetData["lesson_name"],
    //                     style: GoogleFonts.gothicA1(
    //                         fontSize: 17.sp,
    //                         color: white,
    //                         fontWeight: kFW700)),
    //                 SizedBox(
    //                   height: 15.h,
    //                 ),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     SizedBox(
    //                       width: 200.w,
    //                       child: LinearProgressIndicator(
    //                         backgroundColor: kBackground,
    //                         color: Gold,
    //                         value: controller.value,
    //                         semanticsLabel: 'Linear progress indicator',
    //                       ),
    //                     ),
    //                     Countdown(
    //                       controller: _controller,
    //                       seconds: 20,
    //                       build: (BuildContext context, double time) =>
    //                           Text(time.toString(),
    //                               style: GoogleFonts.gothicA1(
    //                                   fontSize: kFourteenFont,
    //                                   color: Gold,
    //                                   fontWeight: kFW700)),
    //                       interval: Duration(milliseconds: 100),
    //                       onFinished: () {
    //                         print('Timer is done!');
    //                       },
    //                     ),
    //                     GestureDetector(
    //                       onTap: () {
    //                         _controller.pause();
    //                       },
    //                       child: CircleAvatar(
    //                           backgroundColor: Gold,
    //                           radius: 15.r,
    //                           child: Icon(
    //                             Icons.pause,
    //                             color: white,
    //                           )),
    //                     ),
    //                     GestureDetector(
    //                       onTap: () {
    //                         _controller.restart();
    //                       },
    //                       child: CircleAvatar(
    //                           backgroundColor: Gold,
    //                           radius: 15.r,
    //                           child: Icon(
    //                             Icons.stop,
    //                             color: white,
    //                           )),
    //                     ),
    //                   ],
    //                 ),
    //                 SizedBox(
    //                   height: 15.h,
    //                 ),
    //                 assignmetData.isEmpty
    //                     ? const SizedBox()
    //                     : SizedBox(
    //                         //  height: 270.h,
    //                         height: 290.h,
    //                         child: ListView.builder(
    //                             itemCount: assignmetData.isNotEmpty
    //                                 ? assignmetData["exercise_questions"]
    //                                     .length
    //                                 : 0,
    //                             scrollDirection: Axis.horizontal,
    //                             shrinkWrap: true,
    //                             itemBuilder: ((context, index) {
    //                               return Container(
    //                                 height: 250.h,
    //                                 width: 330.w,
    //                                 child: Column(
    //                                   mainAxisAlignment:
    //                                       MainAxisAlignment.start,
    //                                   crossAxisAlignment:
    //                                       CrossAxisAlignment.start,
    //                                   children: [
    //                                     Align(
    //                                       alignment: Alignment.centerRight,
    //                                       child: index ==
    //                                               assignmetData[
    //                                                           "exercise_questions"]
    //                                                       .length -
    //                                                   1
    //                                           ? Text("",
    //                                               style:
    //                                                   GoogleFonts.gothicA1(
    //                                                       fontSize:
    //                                                           kFourteenFont,
    //                                                       color: white,
    //                                                       fontWeight:
    //                                                           kFW700))
    //                                           : Text("Swipe for Next  >",
    //                                               style:
    //                                                   GoogleFonts.gothicA1(
    //                                                       fontSize:
    //                                                           kFourteenFont,
    //                                                       color: white,
    //                                                       fontWeight:
    //                                                           kFW700)),
    //                                     ),
    //                                     SizedBox(height: 10.h),
    //                                     Text(
    //                                         // $.[]data.[]exercise_details.[]exercise_lessons.[]exercise_questions.[]title
    //                                         assignmetData[
    //                                                 "exercise_questions"]
    //                                             [index]["title"],
    //                                         style: GoogleFonts.gothicA1(
    //                                             fontSize: kFourteenFont,
    //                                             color: Gold,
    //                                             fontWeight: kFW700)),
    //                                     SizedBox(
    //                                       height: 10.h,
    //                                     ),
    //                                     SizedBox(
    //                                       height: 200.h,
    //                                       child: ListView.builder(
    //                                           // itemCount: assignmetData[index]
    //                                           //             ["exercise_questions"]
    //                                           //         ["exercise_question_options"]
    //                                           //     .length,
    //                                           itemCount: assignmetData[
    //                                                           "exercise_questions"]
    //                                                       [index][
    //                                                   "exercise_question_options"]
    //                                               .length,
    //                                           physics:
    //                                               AlwaysScrollableScrollPhysics(),
    //                                           itemBuilder: ((context, i) {
    //                                             return ListTile(
    //                                                 contentPadding:
    //                                                     EdgeInsets.all(0),
    //                                                 horizontalTitleGap: 0,
    //                                                 title: Text(
    //                                                     // assignmetData["exercise_questions"]
    //                                                     //  "Test Course_101",
    //                                                     assignmetData["exercise_questions"]
    //                                                                 [index]
    //                                                             [
    //                                                             "exercise_question_options"]
    //                                                         [i]["title"],
    //                                                     //maxLines: 2,
    //                                                     style: GoogleFonts
    //                                                         .gothicA1(
    //                                                             fontSize:
    //                                                                 kSixteenFont,
    //                                                             color:
    //                                                                 white,
    //                                                             fontWeight:
    //                                                                 kFW500)),
    //                                                 leading: Checkbox(
    //                                                   //  fillColor: Colors.blue,
    //                                                   fillColor:
    //                                                       MaterialStateProperty
    //                                                           .resolveWith(
    //                                                               getColor),
    //                                                   checkColor:
    //                                                       isSubmit == true
    //                                                           ? grey
    //                                                           : white,
    //                                                   activeColor:
    //                                                       isSubmit == true
    //                                                           ? grey
    //                                                           : white,
    //                                                   value: userChecked.contains(
    //                                                       assignmetData["exercise_questions"]
    //                                                                   [
    //                                                                   index]
    //                                                               [
    //                                                               "exercise_question_options"]
    //                                                           [i]["title"]),
    //                                                   onChanged: (val) {
    //                                                     if (!isSubmit) {
    //                                                       _onSelected(
    //                                                           val!,
    //                                                           assignmetData["exercise_questions"]
    //                                                                       [
    //                                                                       index]
    //                                                                   [
    //                                                                   "exercise_question_options"][i]
    //                                                               [
    //                                                               "title"]);
    //                                                       if (val == true) {
    //                                                         assignmetData["exercise_questions"][index]["exercise_question_options"][i]
    //                                                                     [
    //                                                                     "is_answer"] ==
    //                                                                 "false"
    //                                                             ? _howmanyCorrect(
    //                                                                 false,
    //                                                                 assignmetData["exercise_questions"]
    //                                                                     .length)
    //                                                             : _howmanyCorrect(
    //                                                                 true,
    //                                                                 assignmetData["exercise_questions"]
    //                                                                     .length);
    //                                                       } else {
    //                                                         _howmanyCorrect(
    //                                                             false,
    //                                                             assignmetData[
    //                                                                     "exercise_questions"]
    //                                                                 .length);
    //                                                       }
    //                                                     }
    //                                                   },
    //                                                 )
    //                                                 //you can use checkboxlistTile too
    //                                                 );
    //                                           })),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               );
    //                             })),
    //                       ),
    //                 SizedBox(
    //                   height: 10.h,
    //                 ),
    //                 Center(
    //                   child: GlassmorphicContainer(
    //                     height: 41.h,
    //                     width: 160.w,
    //                     borderRadius: 13.r,
    //                     blur: 15,
    //                     alignment: Alignment.center,
    //                     border: 0.5,
    //                     linearGradient: LinearGradient(
    //                         colors: [
    //                           white.withOpacity(0.1),
    //                           white.withOpacity(0.01)
    //                         ],
    //                         begin: Alignment.topLeft,
    //                         end: Alignment.bottomRight),
    //                     borderGradient: LinearGradient(
    //                         begin: Alignment.centerLeft,
    //                         end: Alignment.bottomRight,
    //                         colors: [
    //                           white.withOpacity(0.5),
    //                           white.withOpacity(0.5),
    //                           Gold.withOpacity(0.5)
    //                         ]),
    //                     child: Container(
    //                       decoration: BoxDecoration(boxShadow: [
    //                         BoxShadow(
    //                           blurRadius: 16,
    //                           spreadRadius: 15,
    //                           color: Colors.black.withOpacity(0.1),
    //                         )
    //                       ]),
    //                       child: GestureDetector(
    //                         onTap: () {
    //                           setState(() {
    //                             isSubmit = true;
    //                           });
    //                         },
    //                         child: ClipRRect(
    //                           borderRadius: BorderRadius.circular(15.0),
    //                           child: BackdropFilter(
    //                             filter: ImageFilter.blur(
    //                               sigmaX: 20.0,
    //                               sigmaY: 20.0,
    //                             ),
    //                             child: Text("Submit",
    //                                 //maxLines: 2,
    //                                 style: GoogleFonts.gothicA1(
    //                                     fontSize: kSixteenFont,
    //                                     color: white,
    //                                     fontWeight: kFW700)),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: 40.h,
    //                 ),
    //                 isSubmit == true
    //                     ? Center(
    //                         child: CircularPercentIndicator(
    //                           radius: 60.0,
    //                           lineWidth: 5.0,
    //                           percent: valid,
    //                           center: Text(
    //                               "${(valid * 100).toStringAsFixed(2)}%",
    //                               //maxLines: 2,
    //                               style: GoogleFonts.gothicA1(
    //                                   fontSize: kSixteenFont,
    //                                   color: white,
    //                                   fontWeight: kFW700)),
    //                           progressColor: Gold,
    //                         ),
    //                       )
    //                     : const SizedBox()
    //               ],
    //             )),
    //       ],
    //     ));
  }

  void _onSelected(String dataName, int index) {
    setState(() {
      if (userChecked
          .where((element) => element["index"] == index)
          .toList()
          .isEmpty) {
        userChecked.add({"index": index, "option": dataName});
      } else {
        // userChecked.remove({"index": index, "option": dataName});
        userChecked.removeWhere((element) => element["index"] == index);
      }
    });
  }

  void _howmanyCorrect(bool selected, int totalQuestions) {
    if (selected == true) {
      setState(() {
        valid = valid + 1 / totalQuestions;
      });
    } else {
      setState(() {
        if (valid != 0.0) {
          valid = valid - 1 / totalQuestions;
        }
      });
    }
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.selected,
      MaterialState.focused,
      MaterialState.pressed,
    };
    if (states.any(interactiveStates.contains)) {
      return Gold;
    }
    return Colors.white;
  }
}

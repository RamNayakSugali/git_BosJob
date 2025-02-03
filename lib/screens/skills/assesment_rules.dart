import 'dart:ui';

import '../../utils/export_file.dart';

class assesment_rules extends StatefulWidget {
  const assesment_rules({super.key});

  @override
  State<assesment_rules> createState() => _assesment_rulesState();
}

class _assesment_rulesState extends State<assesment_rules> {
  // List<dynamic> assementdetails = [];
  Map assementdetails = {};
  bool isLoading = false;
  Future assignmentsHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.accessedskilltest(Get.arguments["id"]);

    if (data["data"]["message"] != null) {
      Fluttertoast.showToast(
        msg: data["data"]["message"],
      );
    } else {
      assementdetails = data["data"]["data"];
      preparePayload();
    }
    //  print(data["data"][0]["data"]);
    setState(() {
      isLoading = false;
    });
  }

  List<Map> payloadData = [];
  preparePayload() {
    payloadData.clear();
    for (int i = 0; i < assementdetails["question_master"].length; i++) {
      payloadData.add({"qid": assementdetails["question_master"][i]["id"]});
    }
  }

  @override
  void initState() {
    super.initState();
    assignmentsHandler();
  }

  var _selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: AppBar(
            iconTheme: const IconThemeData(color: white),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Add Skill',
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
            Background(),
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
                            isLoading == false
                                ? assementdetails["question_master"].isNotEmpty
                                    ? ListView.builder(
                                        itemCount: assementdetails[
                                                    "question_master"]
                                                .isNotEmpty
                                            ? assementdetails["question_master"]
                                                .length
                                            : 0,
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: ((context, index) {
                                          return
                                              //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                              GlassmorphicContainer(
                                            margin:
                                                EdgeInsets.only(bottom: 15.h),
                                            height: 230.h,
                                            // height: 180.h,
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
                                                    padding:
                                                        EdgeInsets.all(16.w),
                                                    decoration: BoxDecoration(
                                                      border:
                                                          const GradientBoxBorder(
                                                        gradient: LinearGradient(
                                                            begin: Alignment
                                                                .topLeft,
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
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              "${(index + 1).toString()}. ",

                                                              style: GoogleFonts
                                                                  .gothicA1(
                                                                      fontSize:
                                                                          13.sp,
                                                                      color:
                                                                          whitetwo,
                                                                      fontWeight:
                                                                          kFW700),
                                                              // style: GoogleFonts.gothicA1(
                                                              //     fontSize: kFourteenFont,
                                                              //     color: Gold,
                                                              //     fontWeight: kFW700)
                                                            ),
                                                            SizedBox(
                                                              width: 280.w,
                                                              child: Text(
                                                                assementdetails[
                                                                            "question_master"]
                                                                        [index]
                                                                    ["title"],
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: GoogleFonts.gothicA1(
                                                                    fontSize:
                                                                        13.sp,
                                                                    color:
                                                                        whitetwo,
                                                                    fontWeight:
                                                                        kFW700),
                                                                // style: GoogleFonts.gothicA1(
                                                                //     fontSize: kFourteenFont,
                                                                //     color: Gold,
                                                                //     fontWeight: kFW700)
                                                              ),
                                                            ),
                                                          ],
                                                        ),

                                                        ListView.builder(
                                                            itemCount: assementdetails[
                                                                            "question_master"]
                                                                        [index][
                                                                    "question_options"]
                                                                .length,
                                                            shrinkWrap: true,
                                                            physics:
                                                                NeverScrollableScrollPhysics(),
                                                            itemBuilder:
                                                                ((context, i) {
                                                              return
                                                                  /////////////////////////////////////////////
                                                                  Theme(
                                                                data: ThemeData(
                                                                    unselectedWidgetColor:
                                                                        whitetwo),
                                                                child:
                                                                    RadioListTile(
                                                                  visualDensity: const VisualDensity(
                                                                      horizontal:
                                                                          VisualDensity
                                                                              .minimumDensity,
                                                                      vertical:
                                                                          VisualDensity
                                                                              .minimumDensity),
                                                                  materialTapTargetSize:
                                                                      MaterialTapTargetSize
                                                                          .shrinkWrap,
                                                                  contentPadding:
                                                                      EdgeInsets.only(
                                                                          top: 12
                                                                              .h),
                                                                  dense: true,
                                                                  activeColor:
                                                                      Gold,
                                                                  title: Text(
                                                                    assementdetails["question_master"][index]
                                                                            [
                                                                            "question_options"][i]
                                                                        [
                                                                        "option"],
                                                                    // "This is Wrong Answer",
                                                                    style: GoogleFonts.gothicA1(
                                                                        fontSize: 13
                                                                            .sp,
                                                                        color:
                                                                        
                                                                            whitetwo,
                                                                        fontWeight:
                                                                            kFW700),
                                                                  ),
                                                                  value: assementdetails["question_master"]
                                                                              [
                                                                              index]
                                                                          [
                                                                          "question_options"][i]
                                                                      [
                                                                      "option"],

                                                                  // "1",
                                                                  groupValue: payloadData[
                                                                              index]
                                                                          [
                                                                          "displayanswer"] ??
                                                                      _selectedAnswer,
                                                                  // _selectedGender,
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      _selectedAnswer =
                                                                          value;
                                                                      for (int j =
                                                                              0;
                                                                          j < assementdetails["question_master"].length;
                                                                          j++) {
                                                                        //  try{
                                                                        if (payloadData[j]["qid"] ==
                                                                            assementdetails["question_master"][index]["id"]) {
                                                                          payloadData[j]["displayanswer"] =
                                                                              value;
                                                                          payloadData[j]
                                                                              [
                                                                              "answer"] = assementdetails["question_master"][index]["question_options"]
                                                                                  [i]
                                                                              [
                                                                              "id"];
                                                                        }
                                                                        //  }catch(e){
                                                                        //   debugPrint("$e");
                                                                        //  }
                                                                      }
                                                                    });
                                                                  },
                                                                  // (value) {
                                                                  //   setState(() {
                                                                  //     gender = value.toString();
                                                                  //   });
                                                                  // },
                                                                ),
                                                              );
                                                            })),

                                                        // SizedBox(height: 10.h,)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }))
                                    : Center(
                                        child: Text(
                                          " No skill questions updated. Please visit after some time",
                                          style: GoogleFonts.gothicA1(
                                              fontSize: kSixteenFont,
                                              color: white,
                                              fontWeight: kFW700),
                                        ),
                                      )
                                : Center(
                                    child: CircularProgressIndicator(
                                      color: Gold,
                                    ),
                                  ),
                            ///////////////////////////////////////////////////////////////////////////////////////////////////
                            SizedBox(height: 30.h),
                            assementdetails["question_master"].isNotEmpty
                                ? CustomDarkButton(
                                    label: 'Submit',
                                    isLoading: true,
                                    onTap: () {
                                      Get.offAllNamed(KSkillScoreView,
                                          arguments: {
                                            "id": Get.arguments["id"],
                                            "payload": payloadData
                                          });
                                    },
                                  )
                                : SizedBox(),
                            SizedBox(height: 30.h),
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
                          child: CircularProgressIndicator(
                            color: Gold,
                          ),
                        )),
            ),
          ],
        ));
  }
}

// // ignore_for_file: camel_case_types

// import 'dart:ui';

// import '../../utils/export_file.dart';

// class Skills_list extends StatefulWidget {
//   const Skills_list({super.key});

//   @override
//   State<Skills_list> createState() => _SkillslistState();
// }

// class _SkillslistState extends State<Skills_list> {
//   var _chosenValue;
//   var dropdownvalue;
//   var statedropdownvalue;
//   final _formKey = GlobalKey<FormState>();

//   bool isLoading = false;
//   List<dynamic> accessedList = [];

//   Future accessedskillsListHandler() async {
//     setState(() {
//       isLoading = true;
//     });
//     Map data = await Services.getaccessedskills();
//     if (data["message"] != null) {
//       Fluttertoast.showToast(
//         msg: data["message"],
//       );
//     } else {
//       accessedList = data["data"]["data"];
//     }
//     print(data["data"]["data"]);
//     setState(() {
//       isLoading = false;
//     });
//   }

//   //////////////////////////////////////////
//   List<dynamic> UnaccessedList = [];

//   Future CategoriesListHandler() async {
//     setState(() {
//       isLoading = true;
//     });
//     Map data = await Services.getUnaccessedskills();
//     if (data["message"] != null) {
//       Fluttertoast.showToast(
//         msg: data["message"],
//       );
//     } else {
//       UnaccessedList = data["data"]["data"];
//     }
//     print(data["data"]["data"]);
//     setState(() {
//       isLoading = false;
//     });
//   }
//   // List UnaccessedList = [];

//   // Future UnaccessedskillHandler() async {
//   //   setState(() {
//   //     isLoading = true;
//   //   });

//   //   var value = await Services.getUnaccessedskills();

//   //   if (value["data"] == null) {
//   //     Fluttertoast.showToast(msg: value["message"]);
//   //   } else {
//   //     UnaccessedList = value["data"];
//   //   }
//   //   print(value["data"]);
//   //   setState(() {
//   //     isLoading = false;
//   //   });
//   // }

//   // List SkillsList = [];

//   // Future skillHandler() async {
//   //   setState(() {
//   //     isLoading = true;
//   //   });

//   //   var value = await Services.SkillsList();

//   //   if (value["data"] == null) {
//   //     Fluttertoast.showToast(msg: value["message"]);
//   //   } else {
//   //     SkillsList = value["data"];
//   //   }
//   //   print(value["data"]);
//   //   setState(() {
//   //     isLoading = false;
//   //   });
//   // }

//   // List<dynamic> categorieslist = [];
//   // // bool isLoading = false;
//   // Future CategorieskillsHandler() async {
//   //   setState(() {
//   //     isLoading = true;
//   //   });
//   //   Map data = await Services.getcategories();
//   //   if (data["message"] != null) {
//   //     Fluttertoast.showToast(
//   //       msg: data["message"],
//   //     );
//   //   } else {
//   //     categorieslist = data["data"]["data"];
//   //   }
//   //   print(data["data"]["data"]);
//   //   setState(() {
//   //     isLoading = false;
//   //   });
//   // }

//   void _showDialog(BuildContext context) {
//     var dropdownvalue;
//     var statedropdownvalue;
//   }

//   @override
//   void initState() {
//     super.initState();
//     accessedskillsListHandler();
//     CategoriesListHandler();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           height: 20.h,
//         ),
//         Text("Accessed Skills",
//             style: GoogleFonts.inter(
//                 color: white, fontSize: kEighteenFont, fontWeight: kFW600)),
//         SizedBox(
//           height: 20.h,
//         ),
//         isLoading == false
//             ? ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: accessedList.length,
//                 // itemCount: candidateskills.length,
//                 itemBuilder: ((context, index) {
//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(
//                           top: 5.h,
//                         ),
//                         width: 190.w,
//                         child: Text(
//                             accessedList[index]["skill_master"]["title"] ?? "",
//                             // candidateskills["candidates"]["CandidateSkills"]
//                             //     [index]["skill_name"],

//                             //candidateskills[index]?["title"] ?? "Skill",
//                             //"Cash Flow Management",
//                             maxLines: 2,
//                             style: GoogleFonts.inter(
//                                 color: white,
//                                 fontSize: kFourteenFont,
//                                 fontWeight: kFW500)),
//                       ),
//                       Row(
//                         children: [
//                           const Icon(
//                             Icons.verified_sharp,
//                             size: 23,
//                             color: Colors.green,
//                           ),
//                           // Image.asset(
//                           //   'assets/images/verified 3 (1).png',
//                           //   width: 25.w,
//                           // ),
//                           SizedBox(width: 5.w),
//                           //  Container(
//                           //  // padding: EdgeInsets.only(top: 10.h),
//                           //   child: Icon(Icons.cancel_outlined,color: Colors.red,)),
//                           Text("08/10",
//                               style: GoogleFonts.inter(
//                                   color: white,
//                                   fontSize: kFourteenFont,
//                                   fontWeight: kFW500)),
//                         ],
//                       ),
//                     ],
//                   );
//                 }))
//             : const Center(child: CircularProgressIndicator()),
//         SizedBox(
//           height: 10.h,
//         ),
//         // Row(
//         //   children: [
//         //     Image.asset(
//         //       'assets/images/verified.png',
//         //       width: 25.w,
//         //     ),
//         //     SizedBox(width: 5.w),
//         //     Text("Get Verified",
//         //         style: GoogleFonts.inter(
//         //             color: Gold, fontSize: kFourteenFont, fontWeight: kFW600)),
//         //   ],
//         // ),
//         SizedBox(
//           height: 30.h,
//         ),
//         Text("Unaccessed Skills",
//             style: GoogleFonts.inter(
//                 color: white, fontSize: kEighteenFont, fontWeight: kFW600)),
//         // GlassmorphicContainer(
//         //   margin: EdgeInsets.only(top: 20.h, bottom: 10.h),
//         //   height: 42.h,
//         //   width: 337.w,
//         //   // borderRadius: 10.r,
//         //   borderRadius: 13.r,
//         //   blur: 15,
//         //   // alignment: Alignment.center,
//         //   border: 2,
//         //   linearGradient: LinearGradient(
//         //       colors: [white.withOpacity(0.1), white.withOpacity(0.01)],
//         //       begin: Alignment.topLeft,
//         //       end: Alignment.bottomRight),
//         //   borderGradient: LinearGradient(
//         //       colors: [white.withOpacity(0.5), white.withOpacity(0.3)]),
//         //   child: Container(
//         //     decoration: BoxDecoration(boxShadow: [
//         //       BoxShadow(
//         //         blurRadius: 13,
//         //         spreadRadius: 10,
//         //         color: Colors.black.withOpacity(0.1),
//         //       )
//         //     ]),
//         //     child: ClipRRect(
//         //       borderRadius: BorderRadius.circular(10.0),
//         //       child: BackdropFilter(
//         //         filter: ImageFilter.blur(
//         //           sigmaX: 20.0,
//         //           sigmaY: 20.0,
//         //         ),
//         //         child: Container(
//         //             width: double.infinity,
//         //             decoration: BoxDecoration(
//         //                 border: const GradientBoxBorder(
//         //                   gradient:
//         //                       LinearGradient(colors: [Colors.white38, Gold]),
//         //                   width: 0.5,
//         //                 ),
//         //                 borderRadius: BorderRadius.circular(13.r)),
//         //             child: SizedBox(
//         //               // alignment: Alignment.center,
//         //               height: 42.h,
//         //               // padding: EdgeInsets.only(left: 10.w),
//         //               child: SizedBox(
//         //                   height: 42.h,
//         //                   width: double.infinity,
//         //                   child: CustomDropdownButton2(
//         //                     icon: const Icon(
//         //                       Icons.expand_more,
//         //                       color: Gold,
//         //                       size: 25,
//         //                     ),
//         //                     hint: "Select State",
//         //                     dropdownItems: items,
//         //                     dropdownWidth: 340.w,
//         //                     value: selectedValue,
//         //                     onChanged: (value) {
//         //                       setState(() {
//         //                         selectedValue = value;
//         //                       });
//         //                       // onStateSelection(value);
//         //                     },
//         //                   )),
//         //             )),
//         //       ),
//         //     ),
//         //   ),
//         // ),
//         SizedBox(
//           height: 10.h,
//         ),

//         isLoading == false
//             ? ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: UnaccessedList.length,
//                 itemBuilder: ((context, index) {
//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(
//                           top: 5.h,
//                         ),
//                         width: 190.w,
//                         child: Text(

//                             //  []skill_master.[]title
//                             UnaccessedList[index]["skill_master"]["title"],
//                             //"Cash Flow Management",
//                             maxLines: 2,
//                             style: GoogleFonts.inter(
//                                 color: white,
//                                 fontSize: kFourteenFont,
//                                 fontWeight: kFW500)),
//                       ),
//                       Row(
//                         children: [
//                           const Icon(
//                             Icons.cancel_outlined,
//                             size: 23,
//                             color: Colors.red,
//                           ),
//                           // Image.asset(
//                           //   'assets/images/verified 3 (1).png',
//                           //   width: 25.w,
//                           // ),
//                           SizedBox(width: 5.w),
//                           //  Container(
//                           //  // padding: EdgeInsets.only(top: 10.h),
//                           //   child: Icon(Icons.cancel_outlined,color: Colors.red,)),
//                           Text("00/10",
//                               style: GoogleFonts.inter(
//                                   color: white,
//                                   fontSize: kFourteenFont,
//                                   fontWeight: kFW500)),
//                         ],
//                       ),
//                     ],
//                   );
//                 }))
//             : const Center(child: CircularProgressIndicator()),
//         // ListView.builder(
//         //     itemCount: 4,
//         //     shrinkWrap: true,
//         //     physics: const NeverScrollableScrollPhysics(),
//         //     itemBuilder: ((context, index) {
//         //       return Row(
//         //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //         children: [
//         //           Text("Cash Flow Management",
//         //               style: GoogleFonts.inter(
//         //                   color: white,
//         //                   fontSize: kFourteenFont,
//         //                   fontWeight: kFW500)),
//         //           Row(
//         //             children: [
//         //               Image.asset(
//         //                 'assets/images/verified.png',
//         //                 width: 25.w,
//         //               ),
//         //               SizedBox(width: 5.w),
//         //               //  Container(
//         //               //  // padding: EdgeInsets.only(top: 10.h),
//         //               //   child: Icon(Icons.cancel_outlined,color: Colors.red,)),
//         //               Text("08/10",
//         //                   style: GoogleFonts.inter(
//         //                       color: white,
//         //                       fontSize: kFourteenFont,
//         //                       fontWeight: kFW500)),
//         //             ],
//         //           ),
//         //         ],
//         //       );
//         //     })),
//         SizedBox(height: 20.w),
//         CustomDarkButton(
//             label: 'Add+',
//             isLoading: true,
//             onTap: () {
//               Get.toNamed(KAddSkills);
//               // _showDialog(context);
//             }
//             // onTap: () {
//             //   if (_formKey.currentState!.validate()) {}
//             //   ;
//             //   // Get.toNamed(KAchievedDetails);
//             // },
//             ),
//         SizedBox(height: 15.w),
//         CustomProfileButton(
//           label: 'Save',
//           isLoading: true,
//           onTap: () {
//             if (_formKey.currentState!.validate()) {}
//             ;
//             // Get.toNamed(KAchievedDetails);
//           },
//         ),
//         SizedBox(height: 30.w),
//       ],
//     );
//   }

//   String? selectedValue;
//   List<String> items = [
//     'Item1',
//     'Item2',
//     'Item3',
//   ];
// }
import 'dart:ui';
import '../../utils/export_file.dart';
// import 'package:expansion_widget/expansion_widget.dart';

class Skills_list extends StatefulWidget {
  const Skills_list({super.key});
  @override
  State<Skills_list> createState() => _SkillslistState();
}

class _SkillslistState extends State<Skills_list> {
  var _chosenValue;
  var dropdownvalue;
  var statedropdownvalue;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  List<dynamic> accessedList = [];
  Future accessedskillsListHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.getaccessedskills();
    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      accessedList = data["data"]["data"];
    }
    print(data["data"]["data"]);
    setState(() {
      isLoading = false;
    });
  }

  Future deleteskill(int id) async {
    setState(() {
      isLoading = true;
    });
    Map payload = {"candidate_skill_id": id};
    Map data = await Services.deleteSkill(payload);
    if (data["data"]["message"] != null) {
      Fluttertoast.showToast(
        msg: data["data"]["message"],
      );
    } else {
      accessedList = data["data"]["data"];
    }
    print(data["data"]["data"]);
    setState(() {
      isLoading = false;
      accessedskillsListHandler();
      CategoriesListHandler();
    });
  }

  //////////////////////////////////////////
  List<dynamic> UnaccessedList = [];
  Future CategoriesListHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.getUnaccessedskills();
    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      UnaccessedList = data["data"]["data"];
    }
    print(data["data"]["data"]);
    setState(() {
      isLoading = false;
    });
  }

  // List UnaccessedList = [];
  // Future UnaccessedskillHandler() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   var value = await Services.getUnaccessedskills();
  //   if (value["data"] == null) {
  //     Fluttertoast.showToast(msg: value["message"]);
  //   } else {
  //     UnaccessedList = value["data"];
  //   }
  //   print(value["data"]);
  //   setState(() {
  //     isLoading = false;
  //   });
  // }
  // List SkillsList = [];
  // Future skillHandler() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   var value = await Services.SkillsList();
  //   if (value["data"] == null) {
  //     Fluttertoast.showToast(msg: value["message"]);
  //   } else {
  //     SkillsList = value["data"];
  //   }
  //   print(value["data"]);
  //   setState(() {
  //     isLoading = false;
  //   });
  // }
  // List<dynamic> categorieslist = [];
  // // bool isLoading = false;
  // Future CategorieskillsHandler() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   Map data = await Services.getcategories();
  //   if (data["message"] != null) {
  //     Fluttertoast.showToast(
  //       msg: data["message"],
  //     );
  //   } else {
  //     categorieslist = data["data"]["data"];
  //   }
  //   print(data["data"]["data"]);
  //   setState(() {
  //     isLoading = false;
  //   });
  // }
  void _showDialog(BuildContext context) {
    var dropdownvalue;
    var statedropdownvalue;
  }

  double sliderValue = 0.3;
  @override
  void initState() {
    super.initState();
    accessedskillsListHandler();
    CategoriesListHandler();
  }

  pullrefresh() {
    accessedskillsListHandler();
    CategoriesListHandler();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () {
          debugPrint("Hi");
          return pullrefresh();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text("Accessed Skills",
                style: GoogleFonts.inter(
                    color: white, fontSize: kEighteenFont, fontWeight: kFW600)),
            SizedBox(
              height: 20.h,
            ),
            isLoading == false
                ? accessedList.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: accessedList.length,
                        itemBuilder: ((context, index) {
                          return GlassmorphicContainer(
                            height: 40.h,
                            margin: EdgeInsets.only(top: 10.h),
                            width: double.infinity,
                            borderRadius: 13.r,
                            blur: 15,
                            alignment: Alignment.center,
                            border: 0.5,
                            linearGradient: LinearGradient(
                                colors: [
                                  white.withOpacity(0.1),
                                  white.withOpacity(0.01)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            borderGradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  white.withOpacity(0.5),
                                  white.withOpacity(0.5),
                                  Gold.withOpacity(0.5)
                                ]),
                            child: Container(
                              // padding:
                              //     EdgeInsets.only(bottom: 5.h, right: 5.w),
                              width: double.infinity,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  blurRadius: 16,
                                  spreadRadius: 15,
                                  color: Colors.black.withOpacity(0.1),
                                )
                              ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 200.w,
                                        child: Text(
                                            accessedList[index]["skill_master"]
                                                    ["title"] ??
                                                "",
                                            maxLines: 2,
                                            style: GoogleFonts.inter(
                                                color: white,
                                                fontSize: kFourteenFont,
                                                fontWeight: kFW500)),
                                      ),
                                      SizedBox(
                                        child: Text(
                                            //  double.parse((12.3412).toStringAsFixed(2))
                                            ////////////////////////////////

                                            double.parse(
                                                    "${double.parse(accessedList[index]["score"]) / 10}")
                                                .toStringAsFixed(2),
                                            // "${accessedList[index]["score"]}/100",
                                            style: GoogleFonts.inter(
                                                color: white,
                                                fontSize: kFourteenFont,
                                                fontWeight: kFW500)),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(KSkillrules);
                                    },
                                    child: Icon(
                                      // Icons.add_chart,
                                      Icons.add_chart_rounded,
                                      size: 23,
                                      color: Gold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Container(
                          //       margin: EdgeInsets.only(
                          //         top: 5.h,
                          //       ),
                          //       width: 190.w,
                          //       child: Text(
                          //           accessedList[index]["skill_master"]["title"] ?? "",
                          //           // candidateskills["candidates"]["CandidateSkills"]
                          //           //     [index]["skill_name"],

                          //           //candidateskills[index]?["title"] ?? "Skill",
                          //           //"Cash Flow Management",
                          //           maxLines: 2,
                          //           style: GoogleFonts.inter(
                          //               color: white,
                          //               fontSize: kFourteenFont,
                          //               fontWeight: kFW500)),
                          //     ),
                          //     Row(
                          //       children: [
                          //         const Icon(
                          //           Icons.verified_sharp,
                          //           size: 23,
                          //           color: Colors.green,
                          //         ),
                          //         // Image.asset(
                          //         //   'assets/images/verified 3 (1).png',
                          //         //   width: 25.w,
                          //         // ),
                          //         SizedBox(width: 5.w),
                          //         //  Container(
                          //         //  // padding: EdgeInsets.only(top: 10.h),
                          //         //   child: Icon(Icons.cancel_outlined,color: Colors.red,)),
                          //         Text("${accessedList[index]["score"]}/100",
                          //             style: GoogleFonts.inter(
                          //                 color: white,
                          //                 fontSize: kFourteenFont,
                          //                 fontWeight: kFW500)),
                          //       ],
                          //     ),
                          //   ],
                          // );
                        }))
                    : Center(
                        child: Text("No Skills Found",
                            style: GoogleFonts.gothicA1(
                                fontSize: kSixteenFont,
                                color: white,
                                fontWeight: kFW500)),
                      )
                : const Center(
                    child: CircularProgressIndicator(
                    color: Gold,
                  )),
            SizedBox(
              height: 10.h,
            ),
            // Row(
            //   children: [
            //     Image.asset(
            //       'assets/images/verified.png',
            //       width: 25.w,
            //     ),
            //     SizedBox(width: 5.w),
            //     Text("Get Verified",
            //         style: GoogleFonts.inter(
            //             color: Gold, fontSize: kFourteenFont, fontWeight: kFW600)),
            //   ],
            // ),
            SizedBox(
              height: 30.h,
            ),
            Text("Unaccessed Skills",
                style: GoogleFonts.inter(
                    color: white, fontSize: kEighteenFont, fontWeight: kFW600)),
            // GlassmorphicContainer(
            //   margin: EdgeInsets.only(top: 20.h, bottom: 10.h),
            //   height: 42.h,
            //   width: 337.w,
            //   // borderRadius: 10.r,
            //   borderRadius: 13.r,
            //   blur: 15,
            //   // alignment: Alignment.center,
            //   border: 2,
            //   linearGradient: LinearGradient(
            //       colors: [white.withOpacity(0.1), white.withOpacity(0.01)],
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight),
            //   borderGradient: LinearGradient(
            //       colors: [white.withOpacity(0.5), white.withOpacity(0.3)]),
            //   child: Container(
            //     decoration: BoxDecoration(boxShadow: [
            //       BoxShadow(
            //         blurRadius: 13,
            //         spreadRadius: 10,
            //         color: Colors.black.withOpacity(0.1),
            //       )
            //     ]),
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(10.0),
            //       child: BackdropFilter(
            //         filter: ImageFilter.blur(
            //           sigmaX: 20.0,
            //           sigmaY: 20.0,
            //         ),
            //         child: Container(
            //             width: double.infinity,
            //             decoration: BoxDecoration(
            //                 border: const GradientBoxBorder(
            //                   gradient:
            //                       LinearGradient(colors: [Colors.white38, Gold]),
            //                   width: 0.5,
            //                 ),
            //                 borderRadius: BorderRadius.circular(13.r)),
            //             child: SizedBox(
            //               // alignment: Alignment.center,
            //               height: 42.h,
            //               // padding: EdgeInsets.only(left: 10.w),
            //               child: SizedBox(
            //                   height: 42.h,
            //                   width: double.infinity,
            //                   child: CustomDropdownButton2(
            //                     icon: const Icon(
            //                       Icons.expand_more,
            //                       color: Gold,
            //                       size: 25,
            //                     ),
            //                     hint: "Select State",
            //                     dropdownItems: items,
            //                     dropdownWidth: 340.w,
            //                     value: selectedValue,
            //                     onChanged: (value) {
            //                       setState(() {
            //                         selectedValue = value;
            //                       });
            //                       // onStateSelection(value);
            //                     },
            //                   )),
            //             )),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10.h,
            ),
            isLoading == false
                ? UnaccessedList.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: UnaccessedList.length,
                        itemBuilder: ((context, index) {
                          return Column(
                            children: [
                              GlassmorphicContainer(
                                height: 40.h,
                                margin: EdgeInsets.only(top: 10.h),
                                width: double.infinity,
                                borderRadius: 13.r,
                                blur: 15,
                                alignment: Alignment.center,
                                border: 0.5,
                                linearGradient: LinearGradient(
                                    colors: [
                                      white.withOpacity(0.1),
                                      white.withOpacity(0.01)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                borderGradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      white.withOpacity(0.5),
                                      white.withOpacity(0.5),
                                      Gold.withOpacity(0.5)
                                    ]),
                                child: Container(
                                  // padding:
                                  //     EdgeInsets.only(bottom: 5.h, right: 5.w),
                                  width: double.infinity,
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      blurRadius: 16,
                                      spreadRadius: 15,
                                      color: Colors.black.withOpacity(0.1),
                                    )
                                  ]),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 200.w,
                                            child: Text(
                                                UnaccessedList[index]
                                                    ["skill_master"]["title"],
                                                maxLines: 2,
                                                style: GoogleFonts.inter(
                                                    color: white,
                                                    fontSize: kFourteenFont,
                                                    fontWeight: kFW500)),
                                          ),
                                          Text(
                                              "${UnaccessedList[index]["score"]}/10",
                                              style: GoogleFonts.inter(
                                                  color: white,
                                                  fontSize: kFourteenFont,
                                                  fontWeight: kFW500)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.edit,
                                            size: 23,
                                            color: Gold,
                                          ),
                                          SizedBox(width: 5.w),
                                          GestureDetector(
                                              onTap: () async {
                                                deleteskill(
                                                    UnaccessedList[index]
                                                        ["id"]);
                                              },
                                              child: const Icon(
                                                Icons.delete,
                                                size: 23,
                                                color: Colors.red,
                                              )),
                                          GestureDetector(
                                            onTap: () {
                                              Get.toNamed(KSkillrules,
                                                  arguments: {
                                                    "id": UnaccessedList[index]
                                                        ["skill_master_id"]
                                                  });
                                            },
                                            child: const Icon(
                                              // Icons.add_chart,
                                              Icons.add_chart_rounded,
                                              size: 23,
                                              color: Gold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  //  Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Row(
                                  //       children: [
                                  //         Icon(Icons.check_box, color: white),
                                  //         SizedBox(
                                  //           width: 5.w,
                                  //         ),
                                  //         Text(
                                  //             takeExercise["exercise_details"]
                                  //                     [0]["exercise_lessons"]
                                  //                 [index]["lesson_name"],
                                  //             //"Test Course_101",
                                  //             //maxLines: 2,
                                  //             style: GoogleFonts.gothicA1(
                                  //                 fontSize: kSixteenFont,
                                  //                 color: white,
                                  //                 fontWeight: kFW500)),
                                  //       ],
                                  //     ),
                                  //     Text(
                                  //         "${takeExercise["exercise_details"][0]["exercise_lessons"][index]["exercise_questions"].length.toString()} Questions",
                                  //         //"Test Course_101",
                                  //         //maxLines: 2,
                                  // style: GoogleFonts.gothicA1(
                                  //     fontSize: kSixteenFont,
                                  //     color: white,
                                  //     fontWeight: kFW500)),
                                  //   ],
                                  // )
                                ),
                              ),
                            ],
                          );
                        }))
                    : Center(
                        child: Text("No Skills Found",
                            style: GoogleFonts.gothicA1(
                                fontSize: kSixteenFont,
                                color: white,
                                fontWeight: kFW500)),
                      )
                : const Center(
                    child: CircularProgressIndicator(
                    color: Gold,
                  )),

            SizedBox(height: 20.h),

            // GlassmorphicContainer(
            //     // margin: EdgeInsets.only(bottom: 15.h),
            //     // height: 210.h,
            //     height: 90.h,
            //     width: double.infinity,
            //     borderRadius: 10.r,
            //     blur: 15,
            //     alignment: Alignment.center,
            //     border: 2,
            //     linearGradient: LinearGradient(
            //       colors: [
            //         white.withOpacity(0.15),

            //         white.withOpacity(0.15),

            //         // kBackground.withOpacity(0.7),
            //         // kBackground.withOpacity(0.7)
            //         // white.withOpacity(0.15),
            //         // white.withOpacity(0.15)
            //       ],
            //       // begin: Alignment.topLeft,
            //       // end: Alignment.bottomRight,
            //     ),
            //     borderGradient: LinearGradient(
            //       colors: [
            //         kBackground,
            //         // white.withOpacity(0.5),
            //         Gold.withOpacity(0.1)
            //       ],
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomRight,
            //     ),
            //     child: ExpansionTile(
            //         title: const Row(
            //           children: [
            //             Text("Accounting Skills",
            //                 style: TextStyle(
            //                     color: Colors.white,
            //                     fontSize: 18,
            //                     fontWeight: kFW600)),
            //             SizedBox(
            //               width: 5,
            //             ),
            //             Image(image: AssetImage("assets/images/verified.png"))
            //           ],
            //         ),
            //         iconColor: Colors.orange,
            //         children: [
            //           // FlutterSlider(
            //           //     values: Float32List(0),
            //           //     trackBar: FlutterSliderTrackBar(
            //           //       inactiveTrackBar: BoxDecoration(
            //           //         borderRadius:
            //           //             BorderRadius.circular(20),
            //           //         color: Colors.black12,
            //           //         border: Border.all(
            //           //             width: 3, color: Colors.blue),
            //           //       ),
            //           //       activeTrackBar: BoxDecoration(
            //           //           borderRadius:
            //           //               BorderRadius.circular(4),
            //           //           color:
            //           //               Colors.blue.withOpacity(0.5)),
            //           //     ))
            //           SliderTheme(
            //             data: const SliderThemeData(
            //               thumbShape: RoundSliderThumbShape(
            //                 enabledThumbRadius: 16.0,
            //                 pressedElevation: 8.0,
            //               ),
            //               // thumbShape: RoundSliderThumbShape(
            //               //   enabledThumbRadius: 15,
            //               //   disabledThumbRadius: 5,
            //               // ),

            //               thumbColor: Colors.orangeAccent,
            //               trackHeight: 20,
            //               inactiveTrackColor: Colors.white,
            //               activeTrackColor: Colors.orange,
            //               trackShape: RoundedRectSliderTrackShape(),
            //             ),
            //             child: Slider(
            //               // activeColor: Colors.orange,
            //               value: sliderValue,
            //               onChanged: (v) {
            //                 setState(() {
            //                   sliderValue = v;
            //                 });
            //               },
            //             ),
            //           ),
            //         ])),
            SizedBox(height: 20.h),
            CustomDarkButton(
                label: 'Add+',
                isLoading: true,
                onTap: () {
                  Get.toNamed(KAddSkills);
                  // _showDialog(context);
                }
                // onTap: () {
                //   if (_formKey.currentState!.validate()) {}
                //   ;
                //   // Get.toNamed(KAchievedDetails);
                // },
                ),
            SizedBox(height: 15.w),
            CustomProfileButton(
              label: 'Save',
              isLoading: true,
              onTap: () {
                if (_formKey.currentState!.validate()) {}
                ;
                // Get.toNamed(KAchievedDetails);
              },
            ),
            SizedBox(height: 30.w),
          ],
        ));
  }

  String? selectedValue;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
  ];
}

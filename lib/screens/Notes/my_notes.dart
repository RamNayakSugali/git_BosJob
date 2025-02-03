import 'package:readmore/readmore.dart';

import '../../utils/export_file.dart';

class mynotes extends StatefulWidget {
  const mynotes({super.key});

  @override
  State<mynotes> createState() => _mynotesState();
}

class _mynotesState extends State<mynotes> {
  bool isLoading = false;
  Map myNotes = {};
  // List<int> wishlisted = <int>[];
  var profiletopacksDataid = Get.arguments;
  Future coursepacksHandler() async {
    setState(() {
      isLoading = true;
    });
    Map payload = {
      // "getlivepackList": "live",
      // "coach_selid": "",
      // "search_test": ""
      "type": "course",
      // "category": "1",
      // "category_id[]": "1",
      "candidate_id": profiletopacksDataid["candidates"]["CandidateDetails"]
              ["id"]
          .toString(),
      // "category_id[]": "1",
      //  "listing_type": "mc_packs",
      // "candidate_id": "502",
    };

    var value = await Services.getmyNotes(payload);

    if (value["data"] == null) {
      Fluttertoast.showToast(msg: value["message"]);
    } else {
      myNotes = value["data"];
    }
    print(value["data"]);
    setState(() {
      isLoading = false;
    });
  }

  final List<String> items = [
    'Courses',
    'Course Packs',
    // 'Item3',
    // 'Item4',
  ];

  List<String> interests = [
    'Product Designer',
    'Visual Designer',
    'COD',
    'CID',
    'Software',
    'Full Stack Development',
    'Python',
  ];

  String? selectedValue;
  @override
  void initState() {
    super.initState();
    coursepacksHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackground,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: white),
          backgroundColor: darktwo,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'My Notes',
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
        ),
        body: Stack(
          children: [
            const Background(),
            SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.all(15.w),
                  child: Column(
                    children: [
                      Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 5.w, right: 5.w),
                          decoration: BoxDecoration(
                              color: white,
                              // border: GradientBoxBorder(
                              //   gradient: LinearGradient(
                              //       colors: [Colors.white38, Gold]),
                              //   width: 0.5,
                              // ),
                              borderRadius: BorderRadius.circular(13.r)),
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                hint: Text(
                                  'Select Item',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                items: items
                                    .map((String item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                value: selectedValue,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedValue = value;
                                  });
                                },
                                //  buttonStyleData: const ButtonStyleData(
                                //    padding: EdgeInsets.symmetric(horizontal: 16),
                                //    height: 40,
                                //    width: 140,
                                //  ),
                                //  menuItemStyleData: const MenuItemStyleData(
                                //    height: 40,
                                //  ),
                              ),
                            ),

                            // DropdownButton2(
                            //   dropdownDecoration: BoxDecoration(color: white),
                            //   dropdownPadding:
                            //       EdgeInsets.only(top: 50.h, bottom: 50.h),
                            //   dropdownMaxHeight: 400.h,
                            //   icon: Icon(Icons.keyboard_arrow_down_outlined,
                            //       color: Gold),
                            //   iconSize: 24.sp,
                            //   isExpanded: true,
                            //   //dropdownColor: kBackground,
                            //   // padding: EdgeInsets.only(top: 20),
                            //   style: GoogleFonts.gothicA1(
                            //       fontSize: kFourteenFont,
                            //       color: Colors.black,
                            //       fontWeight: kFW700),
                            //   value: _chosenValue,
                            //   hint: Text(
                            //     "Select Categories",
                            //     style: GoogleFonts.gothicA1(
                            //         fontSize: kFourteenFont,
                            //         color: Colors.black,
                            //         fontWeight: kFW700),
                            //   ),
                            //   underline: Container(),
                            //   items:  ((item) {
                            //     return DropdownMenuItem<String>(
                            //       value: 1,
                            //       child: SizedBox(
                            //         width: 190.w,
                            //         child: Text(
                            //           //  item['id'].toString() +
                            //          " item['title']",
                            //           maxLines: 3,
                            //           style: TextStyle(
                            //               fontWeight: FontWeight.w500,
                            //               color: Colors.black),
                            //         ),
                            //       ),
                            //     );
                            //   }
                            //   ).toList(),
                            //   onChanged: (value) {

                            //   },

                            //   //                              menuItemStyleData:   MenuItemStyleData(
                            //   //   height: 40,
                            //   // ),
                            // ),
                          )),
                      SizedBox(
                        height: 20.h,
                      ),
                      isLoading == false
                          ? myNotes["note_details"].length > 0
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: myNotes["note_details"].length,
                                  //$.[]data.[]note_details.length
                                  itemBuilder: ((context, index) {
                                    return Container(
                                      padding: EdgeInsets.all(10.r),
                                      margin: EdgeInsets.only(bottom: 10.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/notes_course_image.png',
                                            width: 78.w,
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 220.w,
                                                child: Text(
                                                  myNotes["note_details"][index]
                                                          ["lesson"]["title"] ??
                                                      "",
                                                  // myNotes["note_details"][index]
                                                  //         ["course"]["title"] ??
                                                  //     "",
                                                  //  "React Native",
                                                  maxLines: 1,
                                                  style: GoogleFonts.gothicA1(
                                                    fontSize: kSixteenFont,
                                                    color: Gold,
                                                    fontWeight: kFW700,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10.h),
                                              SizedBox(
                                                width: 220.w,
                                                // $.[]data.[]note_details.[]lesson.title
                                                child: Text(
                                                  myNotes["note_details"][index]
                                                              ["course"] ==
                                                          null
                                                      ? " "
                                                      : myNotes["note_details"]
                                                              [index]["course"]
                                                          ["title"],
                                                  //  "Testing Lesson 1",
                                                  maxLines: 1,
                                                  style: GoogleFonts.gothicA1(
                                                    fontSize: kTwelveFont,
                                                    color: whitetwo,
                                                    fontWeight: kFW800,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 15.h),

                                              Row(
                                                children: [
                                                  Text(
                                                    "Tags - ",
                                                    style: GoogleFonts.gothicA1(
                                                      fontSize: kTwelveFont,
                                                      color: customgrey,
                                                      fontWeight: kFW700,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 180.w,
                                                    child: Wrap(
                                                      children: [
                                                        for (int j = 0;

                                                            //$.[]data.[]note_details.[]candidate_note_tags.length
                                                            j <
                                                                myNotes["note_details"]
                                                                            [
                                                                            index]
                                                                        [
                                                                        "candidate_note_tags"]
                                                                    .length;
                                                            // takecourses['qanswers']
                                                            //             [i][
                                                            //         'candidate_course_lessonqand_replays']
                                                            //     .length;
                                                            j++) ...[
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 5.w),
                                                            child: Text(
                                                              myNotes["note_details"]
                                                                          [
                                                                          index]
                                                                      [
                                                                      "candidate_note_tags"]
                                                                  [j]["tag"],
                                                              //"Course",
                                                              //maxLines: 2,
                                                              style: GoogleFonts
                                                                  .gothicA1(
                                                                fontSize:
                                                                    kTwelveFont,
                                                                color:
                                                                    customgrey,
                                                                fontWeight:
                                                                    kFW700,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                        // for (int i = 0;
                                                        //     i < interests.length;
                                                        //     i++)
                                                        //   Text(
                                                        //     interests[i],
                                                        //     style: GoogleFonts.gothicA1(
                                                        //       fontSize: kTwelveFont,
                                                        //       color: customgrey,
                                                        //       fontWeight: kFW700,
                                                        //     ),
                                                        //   ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // SizedBox(
                                              //   width: 200.w,
                                              //   child: Text(
                                              //     "Tags - Vishnu Priya",
                                              //     maxLines: 2,
                                              //     style: GoogleFonts.gothicA1(
                                              //       fontSize: kTwelveFont,
                                              //       color: customgrey,
                                              //       fontWeight: kFW700,
                                              //     ),
                                              //   ),
                                              // ),
                                              SizedBox(height: 10.h),
                                              Container(
                                                width: 220.w,
                                                child: ReadMoreText(
                                                  myNotes["note_details"][index]
                                                          ["note"] ??
                                                      "",
                                                  //  'Flutter is Google mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                                                  trimLines: 2,
                                                  colorClickableText:
                                                      Colors.pink,
                                                  trimMode: TrimMode.Line,
                                                  trimCollapsedText:
                                                      'Show more',
                                                  trimExpandedText: 'Show less',
                                                  style: GoogleFonts.gothicA1(
                                                    fontSize: kTwelveFont,
                                                    color: whitetwo,
                                                    fontWeight: kFW600,
                                                  ),
                                                  lessStyle:
                                                      GoogleFonts.gothicA1(
                                                    fontSize: kTwelveFont,
                                                    color: whitetwo,
                                                    fontWeight: kFW600,
                                                  ),
                                                  moreStyle:
                                                      GoogleFonts.gothicA1(
                                                    fontSize: kTwelveFont,
                                                    color: whitetwo,
                                                    fontWeight: kFW600,
                                                  ),
                                                ),
                                              )
                                              // SizedBox(
                                              //   width: 300.w,
                                              //   child: Text(
                                              //     "Hi Ram You r taking notes daily on React Native.",
                                              //     maxLines: 2,
                                              //     style: GoogleFonts.gothicA1(
                                              //       fontSize: kTwelveFont,
                                              //       color: whitetwo,
                                              //       fontWeight: kFW600,
                                              //     ),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );

                                    // Column(
                                    //   mainAxisAlignment: MainAxisAlignment.start,
                                    //   crossAxisAlignment: CrossAxisAlignment.start,
                                    //   children: [
                                    //     Text(myNotes["note_details"][index]["note"] ?? "",
                                    //         style: GoogleFonts.gothicA1(
                                    //             fontSize: kSixteenFont,
                                    //             color: Gold,
                                    //             fontWeight: kFW700)),
                                    //     SizedBox(
                                    //       height: 10.h,
                                    //     ),
                                    //     Row(
                                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //       crossAxisAlignment: CrossAxisAlignment.start,
                                    //       children: [
                                    //         Column(
                                    //           children: [
                                    //             Text("Tags",
                                    //                 //maxLines: 2,
                                    //                 style: GoogleFonts.gothicA1(
                                    //                     fontSize: kSixteenFont,
                                    //                     color: Colors.blue,
                                    //                     fontWeight: kFW700)),
                                    //             SizedBox(
                                    //               height: 10.h,
                                    //             ),
                                    //             for (int j = 0;
                                    //                 //$.[]data.[]note_details.[]candidate_note_tags.length
                                    //                 j <
                                    //                     myNotes["note_details"][index]
                                    //                             ["candidate_note_tags"]
                                    //                         .length;
                                    //                 // takecourses['qanswers']
                                    //                 //             [i][
                                    //                 //         'candidate_course_lessonqand_replays']
                                    //                 //     .length;
                                    //                 j++) ...[
                                    //               Text(
                                    //                   myNotes["note_details"][index]
                                    //                       ["candidate_note_tags"][j]["tag"],
                                    //                   //"Course",
                                    //                   //maxLines: 2,
                                    //                   style: GoogleFonts.gothicA1(
                                    //                       fontSize: kFourteenFont,
                                    //                       color: white,
                                    //                       fontWeight: kFW500)),
                                    //             ]
                                    //             // Text("No data",
                                    //             //     //maxLines: 2,
                                    //             //     style: GoogleFonts.gothicA1(
                                    //             //         fontSize: kSixteenFont,
                                    //             //         color: white,
                                    //             //         fontWeight: kFW700)),
                                    //           ],
                                    //         ),
                                    //         Column(
                                    //           children: [
                                    //             Text("Course",
                                    //                 //maxLines: 2,
                                    //                 style: GoogleFonts.gothicA1(
                                    //                     fontSize: kSixteenFont,
                                    //                     color: Colors.blue,
                                    //                     fontWeight: kFW700)),
                                    //             SizedBox(
                                    //               height: 10.h,
                                    //             ),
                                    //             SizedBox(
                                    //               width: 100.w,
                                    //               child: Text(
                                    //                   myNotes["note_details"][index]
                                    //                               ["course"] !=
                                    //                           null
                                    //                       ? myNotes["note_details"][index]
                                    //                           ["course"]["title"]
                                    //                       : "-",
                                    //                   style: GoogleFonts.gothicA1(
                                    //                       fontSize: kFourteenFont,
                                    //                       color: white,
                                    //                       fontWeight: kFW500)),
                                    //             ),
                                    //           ],
                                    //         ),
                                    //         Column(
                                    //           children: [
                                    //             Text("Lesson",
                                    //                 //maxLines: 2,
                                    //                 style: GoogleFonts.gothicA1(
                                    //                     fontSize: kSixteenFont,
                                    //                     color: Colors.blue,
                                    //                     fontWeight: kFW700)),
                                    //             SizedBox(
                                    //               height: 10.h,
                                    //             ),
                                    //             SizedBox(
                                    //               width: 100.w,
                                    //               child: Text(
                                    //                   myNotes["note_details"][index]["lesson"]
                                    //                       ["title"],
                                    //                   //"No data",
                                    //                   //maxLines: 2,
                                    //                   style: GoogleFonts.gothicA1(
                                    //                       fontSize: kFourteenFont,
                                    //                       color: white,
                                    //                       fontWeight: kFW500)),
                                    //             ),
                                    //           ],
                                    //         ),
                                    //       ],
                                    //     ),
                                    //     SizedBox(
                                    //       height: 20.h,
                                    //     ),
                                    //   ],
                                    // );
                                  }))
                              : Center(
                                  child: Text("NO DATA",
                                      style: GoogleFonts.gothicA1(
                                        letterSpacing: 1,
                                        fontSize: 12.sp,
                                        color: white,
                                        fontWeight: kFW400,
                                      )),
                                )
                          : const Center(
                              child: CircularProgressIndicator(
                              color: Gold,
                            )),
                    ],
                  )),
            ),
          ],
        ));
  }
}

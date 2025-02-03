// ignore_for_file: camel_case_types, sized_box_for_whitespace

import 'dart:ui';

import 'package:another_xlider/models/fixed_value.dart';

import '../../utils/export_file.dart';

class Browse_jobs extends StatefulWidget {
  const Browse_jobs({super.key});

  @override
  State<Browse_jobs> createState() => _BrowsejobsState();
}

class _BrowsejobsState extends State<Browse_jobs> {
  // @override
  // void initState() {
  //   super.initState();
  //   favouritejobHandler();
  // }
  List<int> selectedIndexList = <int>[];
  int _selectedIndex = 0;

  _onSelected(int index) {
    //https://inducesmile.com/google-flutter/how-to-change-the-background-color-of-selected-listview-in-flutter/
    setState(() {
      _selectedIndex = index;
    });
  }

  List<int> selectedIndexListtwo = <int>[];
  int _selectedIndextwo = 0;

  _onSelectedtwo(int index) {
    //https://inducesmile.com/google-flutter/how-to-change-the-background-color-of-selected-listview-in-flutter/
    setState(() {
      _selectedIndextwo = index;
    });
  }

  bool pressGeoON = false;
  bool cmbscritta = false;
  bool isLoading = false;
  bool is_applied = false;
  var name = "Apply";
  List browsed = [];
  List browse = [];

  Future browseHandler() async {
    setState(() {
      isLoading = true;
    });
    Map payload = {
      "search_type": "all",
    };

    var value = await Services.getsearchtype(payload);
    // var value = await Services.getSkillsCourse();
    if (value["data"] == null) {
      Fluttertoast.showToast(msg: value["message"]);
    } else {
      browse = value["data"];
    }
    print(value["data"]);
    setState(() {
      isLoading = false;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   browseHandler();
  //    jobsaddtowishlist(id , index);e
  // }

  String? selectedValue;
  List<String> items = [
    'NEllore ',
    'HYD',
    'DEHLI',
  ];
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    browseHandler();
    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        isLoaded = true;
        is_applied = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          const Search(),
          GestureDetector(
            onTap: () {
              openDialog();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Sort",
                    style: GoogleFonts.gothicA1(
                        fontSize: 13.sp, color: white, fontWeight: kFW600)),
                const Icon(
                  Icons.arrow_drop_down,
                  color: white,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          isLoading == false
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: browse.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        // if (!selectedIndexList.contains(index)) {
                        //   selectedIndexList.add(index);
                        // } else {
                        //   selectedIndexList.remove(index);
                        // }
                        // setState(() {});
                        Get.toNamed(
                          KJob_Description,
                          arguments: browse[index]["id"] ?? "",
                        );
                      },
                      child: GlassmorphicContainer(
                        margin: EdgeInsets.only(bottom: 15.h),
                        height: 210.h,
                        width: double.infinity,
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
                          white.withOpacity(0.5),
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
                            borderRadius: BorderRadius.circular(15.0),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 10.0,
                                sigmaY: 10.0,
                              ),
                              child: Container(
                                  width: double.infinity,
                                  //height: 190.h,
                                  padding: EdgeInsets.all(10.r),
                                  decoration: BoxDecoration(
                                      border: const GradientBoxBorder(
                                        gradient: LinearGradient(
                                            colors: [Colors.white38, Gold]),
                                        width: 0.5,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(16.r)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(browse[index]["title"] ?? "",
                                              maxLines: 1,
                                              style: GoogleFonts.gothicA1(
                                                  fontSize: kSixteenFont,
                                                  color: white,
                                                  fontWeight: kFW700)),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Row(
                                            children: [
                                              // Column(
                                              //   children: [
                                              //     Icon(
                                              //       Icons
                                              //           .remove_red_eye_rounded,
                                              //       size: 22.w,
                                              //       color: white,
                                              //     ),
                                              //     Text("101",
                                              //         style:
                                              //             GoogleFonts.gothicA1(
                                              //                 fontSize: 8.sp,
                                              //                 color: white,
                                              //                 fontWeight:
                                              //                     kFW700)),
                                              //   ],
                                              // ),
                                              /////////////////////////////////////////////////////////////////////
                                              // IconButton(

                                              //     icon: Icon(

                                              //       Icons.favorite,
                                              //       color: _selectedIndex !=
                                              //                   null &&
                                              //               _selectedIndex ==
                                              //                   index
                                              //           ? Colors.redAccent
                                              //           : Colors.grey,
                                              //     ),
                                              //     onPressed: () {
                                              //       _onSelected(index);
                                              //     }),
                                              ////////////////////////////////////////
                                              //                                          FavoriteButton(
                                              //   valueChanged: (_isFavorite) {
                                              //     print('Is Favorite $_isFavorite)');
                                              //   },
                                              // )
                                              GestureDetector(
                                                onTap: () {
                                                  if (!selectedIndexList
                                                      .contains(index)) {
                                                    selectedIndexList
                                                        .add(index);

                                                    // Get.toNamed(
                                                    //     Applyjob() as String);

                                                    // Get.toNamed(
                                                    //   KWish_List,
                                                    //   arguments: browse[index]
                                                    //           ["id"] ??
                                                    //       "",
                                                    // );
                                                    //                                   Navigator.push(
                                                    // context,
                                                    // MaterialPageRoute(
                                                    //     builder: (context) =>
                                                    //         Applyjobs_list(argument:   browse[index]["company"]["id"],)));
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            "Added to favourites successfully");
                                                  } else {
                                                    selectedIndexList
                                                        .remove(index);
                                                    Fluttertoast.showToast(
                                                        msg:
                                                            "Unfavourited successfully");
                                                  }
                                                  setState(() {
                                                    browsed.add(
                                                      browse[index]["id"] ?? "",
                                                    );
                                                  });
                                                  //  Navigator.push(
                                                  //       context,
                                                  //       MaterialPageRoute(
                                                  //           builder:
                                                  //               (selectedIndexList) =>
                                                  //                   Applyjob()));
                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  selectedIndexList
                                                          .contains(index)
                                                      ? Icons.favorite_rounded
                                                      : Icons
                                                          .favorite_outline_outlined,
                                                  color: selectedIndexList
                                                          .contains(index)
                                                      ? Colors.red
                                                      : white,
                                                ),
                                              ),

                                              //  selectedIndexList.contains(index)
                                              //  ?
                                              // GestureDetector(
                                              //   onTap: () {
                                              //     jobsaddtowishlist(
                                              //         browse[index]["id"] ?? "",
                                              //         // fovouritesjob[index]
                                              //         //     ["id"],
                                              //         index);
                                              //   },
                                              //   //                  addToWhishList(
                                              //   // widget.properties[index]["id"], index);
                                              //   child: SizedBox(
                                              //       child: currentindex == index
                                              //           ? const CircularProgressIndicator()
                                              //           : Icon(
                                              //               Icons.favorite,
                                              //               size: 26.w,
                                              //               color: browse[index]
                                              //                           [
                                              //                           "is_favourated"] ||
                                              //                       browse.contains(
                                              //                           index)
                                              //                   // fovouritesjob[
                                              //                   //                 index]
                                              //                   //             [
                                              //                   //             "is_wishlist"] ||
                                              //                   //         fovouritesjob
                                              //                   //             .contains(
                                              //                   //                 index)
                                              //                   ? white
                                              //                   : kgreen,
                                              //             )),
                                              // ),
                                              //                 GestureDetector(
                                              //   onTap: () {
                                              //     addToWhishList(
                                              //         widget.properties[index]["id"], index);
                                              //   },
                                              //   child:currentindex == index
                                              //         ? const CircularProgressIndicator()
                                              //         : Image.asset(
                                              //           widget.properties[index]
                                              //                       ["is_wishlist"] ||
                                              //                   whishListItems.contains(index)
                                              //               ? 'assets/images/red_love.png'
                                              //               : 'assets/images/love.png',
                                              //           width: 17.w,
                                              //         ),
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Text(browse[index]["company"]["title"],
                                          style: GoogleFonts.gothicA1(
                                              fontSize: 11.sp,
                                              color: white,
                                              fontWeight: kFW700)),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              '${browse[index]["min_exp"]}'
                                                      ' - '
                                                      '${browse[index]["max_exp"]}Years' ??
                                                  "",
                                              style: GoogleFonts.gothicA1(
                                                  fontSize: 11.sp,
                                                  color: white,
                                                  fontWeight: kFW700)),
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/images/link.png',
                                                width: 20.w,
                                              ),
                                              Text(
                                                  browse[index]["company"]
                                                          ["address"] ??
                                                      "",
                                                  style: GoogleFonts.gothicA1(
                                                      fontSize: 11.sp,
                                                      color: white,
                                                      fontWeight: kFW700)),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5.r),
                                            color: white.withOpacity(0.5),
                                            child: Text(
                                                browse[index]["job_type"]
                                                        ["title"] ??
                                                    "",
                                                style: GoogleFonts.gothicA1(
                                                    fontSize: 11.sp,
                                                    color: white,
                                                    fontWeight: kFW700)),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text("Full Time",
                                                  style: GoogleFonts.gothicA1(
                                                      fontSize: 11.sp,
                                                      color: white,
                                                      fontWeight: kFW700)),
                                              Text(
                                                  '${browse[index]["min_sal"]}' ??
                                                      ""
                                                          ' - '
                                                          '${browse[index]["max_sal"]}' ??
                                                      "",
                                                  style: GoogleFonts.gothicA1(
                                                      fontSize: kFourteenFont,
                                                      color: Gold,
                                                      fontWeight: kFW700)),
                                            ],
                                          )
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(3.r),
                                        child: Text(
                                            'Type: ${browse[index]["job_type"]["type"]}' ??
                                                "",
                                            style: GoogleFonts.gothicA1(
                                                fontSize: 11.sp,
                                                color: white,
                                                fontWeight: kFW700)),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: kBackground,
                                            radius: 20.r,
                                            child: Image.asset(
                                              'assets/images/man.png',
                                            ),
                                          ),
                                          Text(
                                              '${browse[index]["industry"]["title"]}' ??
                                                  "",
                                              maxLines: 1,
                                              style: GoogleFonts.gothicA1(
                                                  fontSize: 11.sp,
                                                  color: white,
                                                  fontWeight: kFW700)),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              if (!selectedIndexListtwo
                                                  .contains(index)) {
                                                selectedIndexListtwo.add(index);
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "Applied successfully");
                                              } else {
                                                selectedIndexListtwo
                                                    .remove(index);
                                              }
                                              setState(() {});
                                            },
                                            child: Container(
                                              width: 90.w,
                                              height: 40.h,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 20,
                                                      spreadRadius: 5,
                                                      color: Color.fromARGB(
                                                              255, 13, 12, 12)
                                                          .withOpacity(0.1),
                                                    )
                                                  ],
                                                  gradient: LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                      colors: [
                                                        grey.withOpacity(0.5),
                                                        grey1.withOpacity(0.5),
                                                        Color.fromARGB(
                                                                255, 58, 55, 55)
                                                            .withOpacity(0.1),
                                                      ])),
                                              child: Text(
                                                selectedIndexListtwo
                                                        .contains(index)
                                                    ? "Applied"
                                                    : "Apply",
                                                // name,
                                                // browse[index]["job_type"]
                                                //             ["is_applied"] ??
                                                //         "" == 1
                                                // is_applied == false
                                                //     ? "Apply"
                                                //     : "Applied",
                                                //  "Apply",
                                                style: GoogleFonts.gothicA1(
                                                    fontSize: kTwelveFont,
                                                    color: white,
                                                    fontWeight: kFW600),
                                              ),
                                            ),
                                          ),
                                          // Text(
                                          //   selectedIndexList.contains(index)
                                          //       ? "Applied"
                                          //       : "Apply",
                                          //   // name,
                                          //   // browse[index]["job_type"]
                                          //   //             ["is_applied"] ??
                                          //   //         "" == 1
                                          //   // is_applied == false
                                          //   //     ? "Apply"
                                          //   //     : "Applied",
                                          //   //  "Apply",
                                          //   style: GoogleFonts.gothicA1(
                                          //       fontSize: kTwelveFont,
                                          //       color: white,
                                          //       fontWeight: kFW600),
                                          // ),
                                          // SizedBox(
                                          //   // margin: EdgeInsets.only(right: 10.w),
                                          //   height: 40.h,
                                          //   width: 110.w,
                                          //   child: TextButton(
                                          //     // onPressed: () {
                                          //     //   // Get.toNamed(
                                          //     //   //   Applyjob() as String,
                                          //     //   //   //  Applyjobs_list(),
                                          //     //   //   arguments:
                                          //     //   //       browse[index]["id"] ?? "",
                                          //     //   // );
                                          //     //   setState(() {
                                          //     //     name = "Applied";
                                          //     //   });

                                          //     //   // setState(() =>
                                          //     //   //     pressGeoON = !pressGeoON);
                                          //     //   // setState(() =>
                                          //     //   //     cmbscritta = !cmbscritta);
                                          //     // },
                                          //     // onPressed: () {
                                          //     //   setState(() {
                                          //     //     is_applied == true;
                                          //     //   });

                                          //     //   // browse[index]["job_type"]
                                          //     //   //     ["is_applied"] = 1;
                                          //     //   //Get.toNamed(KApply_jobs);
                                          //     // },
                                          //     style: ButtonStyle(
                                          //         backgroundColor:
                                          //             const MaterialStatePropertyAll<
                                          //                 Color>(grey),
                                          //         shape: MaterialStateProperty.all<
                                          //                 RoundedRectangleBorder>(
                                          //             RoundedRectangleBorder(
                                          //                 borderRadius:
                                          //                     BorderRadius
                                          //                         .circular(
                                          //                             10.r),
                                          //                 side:
                                          //                     const BorderSide(
                                          //                         color:
                                          //                             grey)))),
                                          //     child:
                                          //         // cmbscritta
                                          //         //     ? Text("Apply")
                                          //         //     : Text("Applied"),
                                          //         Text(
                                          //       selectedIndexList
                                          //               .contains(index)
                                          //           ? "Apply"
                                          //           : "Applied",
                                          //       // name,
                                          //       // browse[index]["job_type"]
                                          //       //             ["is_applied"] ??
                                          //       //         "" == 1
                                          //       // is_applied == false
                                          //       //     ? "Apply"
                                          //       //     : "Applied",
                                          //       //  "Apply",
                                          //       style: GoogleFonts.gothicA1(
                                          //           fontSize: kTwelveFont,
                                          //           color: white,
                                          //           fontWeight: kFW600),
                                          //     ),
                                          //   ),
                                          // )
                                          // GestureDetector(
                                          //   onTap: () {
                                          //     jobsaddtowishlist(
                                          //         browse[index]["id"] ?? "",
                                          //         // fovouritesjob[index]
                                          //         //     ["id"],
                                          //         index);
                                          //   },
                                          //   //                  addToWhishList(
                                          //   // widget.properties[index]["id"], index);
                                          //   child: SizedBox(
                                          //       child: currentindex == index
                                          //           ? const CircularProgressIndicator()
                                          //           : Icon(
                                          //               Icons.favorite,
                                          //               size: 26.w,
                                          //               color: browse[index]
                                          //                           [
                                          //                           "is_favourated"] ||
                                          //                       browse.contains(
                                          //                           index)
                                          //                   // fovouritesjob[
                                          //                   //                 index]
                                          //                   //             [
                                          //                   //             "is_wishlist"] ||
                                          //                   //         fovouritesjob
                                          //                   //             .contains(
                                          //                   //                 index)
                                          //                   ? white
                                          //                   : kgreen,
                                          //             )),
                                          // ),
                                        ],
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ),
                    );
                  }))
              : Center(
                  child: CircularProgressIndicator(
                    color: Gold,
                  ),
                ),
          SizedBox(
            height: 80.h,
          )
        ],
      ),
    );
  }

  // void changeName() {
  //   setState(() {
  //     name = "Sahil";
  //   });
  // }

  Future openDialog() => showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            backgroundColor: kBackground.withOpacity(0.9),
            content: Container(
                height: 337.h,
                width: 300.w,
                child: Column(
                  children: [
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 2,
                                childAspectRatio: (0.98 / 0.45)),
                        itemBuilder: ((context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Row(
                                      children: [
                                        ShaderMask(
                                            blendMode: BlendMode.srcATop,
                                            shaderCallback: (Rect bounds) =>
                                                const LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: [
                                                      white,
                                                      Gold
                                                    ]).createShader(bounds),
                                            child: const Icon(Icons
                                                .check_box_outline_blank_outlined)),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          'Latest Jobs',
                                          style: GoogleFonts.gothicA1(
                                              fontSize: kTwelveFont,
                                              color: Gold,
                                              fontWeight: kFW700),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        })),
                    SizedBox(
                      height: 80,
                      width: 250,
                      child: FlutterSlider(
                        // visibleTouchArea: true,
                        jump: true,
                        values: const [10],
                        min: 0,
                        max: 200,
                        fixedValues: [
                          FlutterSliderFixedValue(percent: 0, value: ''),
                          FlutterSliderFixedValue(percent: 10, value: ''),
                          FlutterSliderFixedValue(percent: 20, value: ''),
                          FlutterSliderFixedValue(percent: 30, value: ''),
                          FlutterSliderFixedValue(percent: 40, value: ''),
                          FlutterSliderFixedValue(percent: 50, value: ''),
                          FlutterSliderFixedValue(percent: 60, value: ''),
                          FlutterSliderFixedValue(percent: 70, value: ''),
                          FlutterSliderFixedValue(percent: 80, value: ''),
                          FlutterSliderFixedValue(percent: 90, value: ''),
                          FlutterSliderFixedValue(percent: 100, value: ''),
                        ],
                        onDragging: (handlerIndex, lowerValue, upperValue) {
                          if (lowerValue is String) {
                            //  _lowerValue = double.parse(lowerValue);
                          } else {
                            // _lowerValue = lowerValue;
                          }
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(height: 5.h),
                    // Container(
                    //     height: 36.h,
                    //     width: double.infinity,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(13.r),
                    //       color: Colors.grey,
                    //     ),
                    //     child: CustomDropdownButton2(
                    //       icon: const Icon(
                    //         Icons.expand_more,
                    //         size: 25,
                    //       ),
                    //       hint: "Select State",
                    //       dropdownItems: items,
                    //       dropdownWidth: 250.w,
                    //       value: selectedValue,
                    //       onChanged: (value) {
                    //         setState(() {
                    //           selectedValue = value;
                    //         });
                    //         // onStateSelection(value);
                    //       },
                    //     )),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        GlassmorphicContainer(
                          margin: EdgeInsets.only(
                              top: 10.h, left: 10.w, right: 10.w),
                          height: 41.h,
                          width: 100.w,
                          borderRadius: 13.r,
                          blur: 15,
                          alignment: Alignment.center,
                          border: 0.5,
                          linearGradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.1),
                                Colors.black.withOpacity(0.01)
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
                                child: Text("Reset",
                                    //maxLines: 2,
                                    style: GoogleFonts.gothicA1(
                                        fontSize: kFourteenFont,
                                        color: white,
                                        fontWeight: kFW500)),
                              ),
                            ),
                          ),
                        ),
                        GlassmorphicContainer(
                          margin: EdgeInsets.only(
                              top: 10.h, left: 2.w, right: 10.w),
                          height: 41.h,
                          width: 100.w,
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
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                blurRadius: 16,
                                spreadRadius: 15,
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
                                child: Text("Apply",
                                    //maxLines: 2,
                                    style: GoogleFonts.gothicA1(
                                        fontSize: 15.sp,
                                        color: white,
                                        fontWeight: kFW700)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          )));
}

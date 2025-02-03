import '../../utils/export_file.dart';

class Addskills extends StatefulWidget {
  const Addskills({super.key});

  @override
  State<Addskills> createState() => _AddskillsState();
}

class _AddskillsState extends State<Addskills> {
  String? selectedValue;

  String identity = "";
  List filteredSkillsForAPI = [];
  // String? selectedValue;
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  List<String> _values = [];
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();

  _onDelete(index) {
    setState(() {
      _values.removeAt(index);
    });
  }

  /// This is just an example for using `TextEditingController` to manipulate
  /// the the `TextField` just like a normal `TextField`.
  _onPressedModifyTextField() {
    final text = 'Test';
    _textEditingController.text = text;
    _textEditingController.value = _textEditingController.value.copyWith(
      text: text,
      selection: TextSelection(
        baseOffset: text.length,
        extentOffset: text.length,
      ),
    );
  }

  // final _formKey = GlobalKey<FormState>();
  //  File? _image;
  String base64 = "";
  // bool isLoading = false;
  incidentDatas data = incidentDatas();
  Future reportIncident() async {
    // if (base64 == "") {
    //   Fluttertoast.showToast(msg: "please select image");
    // }
    setState(() {
      isLoading = true;
    });

    Map payload = {
      "title": data.title,
      "description": data.description,
      "company": data.company,
      "from_year": data.from_year,
      "to_year": data.to_year,
      "industry_id": data.industry_id

      // "description": data.description,
// description
// title
// year
      // "image": base64
    };
    Map value = await Services.addmultipleskills(payload);
    print(value);
    ;
    if (value["message"] != null) {
      Fluttertoast.showToast(msg: value["message"]);
    } else {
      Get.back();
    }
    setState(() {
      isLoading = false;
    });
  }

  ////////////////////////////////////
  var _chosenValue;
  var dropdownvalue;

  var selectedid;
//  final _formKey = GlobalKey<FormState>();
  List<int> selectedIndexList = <int>[];
  List<Map> selectedIndexRangeList = [];

  int _selectedIndex = 0;

  _onSelected(int index) {
    //https://inducesmile.com/google-flutter/how-to-change-the-background-color-of-selected-listview-in-flutter/
    setState(() {
      _selectedIndex = index;
    });
  }

  // bool isLoading = false;
  List AddSkillsList = [];
  dynamic selectedlevel = 2.0;
  dynamic afterselectedlevel = 2.0;
  // double _sliderValue = 0.0;
  late dynamic _sliderValue;
bool isSkillLoading = false;
  Future skillHandler(int id) async {
    setState(() {
      isSkillLoading = true;
    });

    var value = await Services.SkillsList(id);

    if (value["data"] == null) {
      Fluttertoast.showToast(msg: value["message"]);
    } else {
      AddSkillsList = value["data"];
    }
    print(value["data"]);
    setState(() {
      isSkillLoading = false;
    });
  }

  List<dynamic> categorieslist = [];
  // bool isLoading = false;
  Future CategorieskillsHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.getcategories();
    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      categorieslist = data["data"]["data"];
    }
    debugPrint("datat is ------------------");
    setState(() {
      isLoading = false;
    });
  }

  Future addmultipleskillsHandler() async {
    setState(() {
      isLoading = true;
    });
    List masterID = [];
    List levels = [];
    for (int i = 0; i < filteredSkillsForAPI.length; i++) {
      masterID.add(filteredSkillsForAPI[i]["id"].toString());
      levels.add(filteredSkillsForAPI[i]["range"].toString());
    }
    Map payload = {"skill_master_id": masterID, "level": levels};
    Map value = await Services.addmultipleSKill(payload);
    if (value["data"]["status"] == 1) {
      Fluttertoast.showToast(
        msg: value["data"]["message"],
      );
    } else {
      Fluttertoast.showToast(
        msg: value["data"]["message"],
      );
    }

    setState(() {
      isLoading = false;
    });
  }
///////////////////////////////

  @override
  void initState() {
    super.initState();
    _sliderValue = 0.0;

    CategorieskillsHandler();
  }

  void _setValue(dynamic value) {
    setState(() {
      _sliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackground,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: white),
          backgroundColor: darktwo,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Add Skills',
            style: GoogleFonts.gothicA1(
                fontSize: 16.sp, color: white, fontWeight: kFW700),
          ),
          actions: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/bell.png',
                        width: 22.w,
                      ),
                      Positioned(
                          left: 13.r,
                          child: const CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.green,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  width: 13.w,
                ),
              ],
            )
          ],
        ),
        body: Stack(
          children: [
            Background(),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Course List",
                        style: GoogleFonts.inter(
                            color: white,
                            fontSize: kEighteenFont,
                            fontWeight: kFW700)),
                    SizedBox(
                      height: 15.h,
                    ),
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
                          child: DropdownButton2(
                            // dropdownDecoration: BoxDecoration(color: white),
                            // dropdownPadding:
                            //     EdgeInsets.only(top: 50.h, bottom: 50.h),
                            // dropdownMaxHeight: 400.h,
                            // icon: Icon(Icons.keyboard_arrow_down_outlined,
                            //     color: Gold),
                            // iconSize: 24.sp,
                            isExpanded: true,
                            //dropdownColor: kBackground,
                            // padding: EdgeInsets.only(top: 20),
                            style: GoogleFonts.gothicA1(
                                fontSize: kFourteenFont,
                                color: Colors.black,
                                fontWeight: kFW700),
                            value: _chosenValue,
                            hint: Text(
                              "Select Categories",
                              style: GoogleFonts.gothicA1(
                                  fontSize: kFourteenFont,
                                  color: Colors.black,
                                  fontWeight: kFW700),
                            ),
                            underline: Container(),
                            items: categorieslist.map((item) {
                              return DropdownMenuItem<String>(
                                value: item['id'].toString(),
                                child: SizedBox(
                                  width: 190.w,
                                  child: Text(
                                    item['title'],
                                    maxLines: 3,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _chosenValue = value.toString();
                                selectedid = value.toString();
                                skillHandler(int.parse(selectedid));
                                debugPrint("selected value is $selectedid");
                              });
                            },
                          ),
                        )),
                    SizedBox(
                      height: 15.h,
                    ),
                    isSkillLoading == false
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: AddSkillsList.length,
                            itemBuilder: ((context, index) {
                              return  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GlassmorphicContainer(
                                          height: 90.h,
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
                                            padding: EdgeInsets.all(15.w),
                                            width: double.infinity,
                                            decoration:
                                                BoxDecoration(boxShadow: [
                                              BoxShadow(
                                                blurRadius: 16,
                                                spreadRadius: 15,
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                              )
                                            ]),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  
                                                  child: Text(
                                                      AddSkillsList[index]
                                                              ?["title"] ??
                                                          "Skills",
                                                      //"Cash Flow Management",
                                                      maxLines: 2,
                                                      style: GoogleFonts.inter(
                                                          color: white,
                                                          fontSize:
                                                              13.sp,
                                                          fontWeight: kFW500)),
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 250.w,
                                                      child: GradientSlider(
                                                        thumbAsset:
                                                            'assets/images/gold button.png',
                                                        trackHeight: 15.h,
                                                        trackBorderColor:
                                                            Colors.transparent,
                                                        thumbHeight: 32,
                                                        thumbWidth: 10,

                                                        // trackBorder: 1,
                                                        // trackBorderColor: Colors.black,
                                                        activeTrackGradient:
                                                            const LinearGradient(
                                                                colors: [
                                                              Gold,
                                                              white,
                                                            ]),
                                                        inactiveTrackGradient:
                                                            const LinearGradient(
                                                                colors: [
                                                              white,
                                                              white
                                                            ]),
                                                        slider: Slider(
                                                          value: AddSkillsList[
                                                                          index]
                                                                      [
                                                                      "range"] ==
                                                                  null
                                                              ? selectedlevel
                                                              : AddSkillsList[
                                                                      index]
                                                                  ["range"],
                                                          //  onChanged: _setValue,
                                                          onChanged:
                                                              (value) async {
                                                            setState(() {
                                                              afterselectedlevel =
                                                                  value;
                                                              AddSkillsList[
                                                                          index]
                                                                      [
                                                                      "range"] =
                                                                  value;
                                                            });
                                                          },
                                                          min: 0.0,
                                                          max: 10.0,
                                                          divisions: 10,
                                                        ),
                                                        //  Slider(value: 0.5, onChanged: (value) {}
                                                        // ),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                            afterselectedlevel
                                                                .toString(),
                                                            //"10",
                                                            // double.parse(
                                                            //         "${double.parse(accessedList[index]["score"]) / 10}")
                                                            //     .toStringAsFixed(2),
                                                            // "${accessedList[index]["score"]}/100",
                                                            style: GoogleFonts.inter(
                                                                color: white,
                                                                fontSize:
                                                                    kFourteenFont,
                                                                fontWeight:
                                                                    kFW800)),
                                                        Text("/10",
                                                            // "${accessedList[index]["score"]}/100",
                                                            style: GoogleFonts.inter(
                                                                color: white,
                                                                fontSize:
                                                                    kTwelveFont,
                                                                fontWeight:
                                                                    kFW600)),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                // Row(
                                                //   mainAxisAlignment:
                                                //       MainAxisAlignment
                                                //           .spaceBetween,
                                                //   children: [
                                                //     GradientSlider(
                                                //       thumbAsset:
                                                //           'assets/images/gold button.png',

                                                //       trackHeight: 15.h,
                                                //       trackBorderColor:
                                                //           Colors.transparent,
                                                //       thumbHeight: 32,
                                                //       thumbWidth: 10,

                                                //       // trackBorder: 1,
                                                //       // trackBorderColor: Colors.black,
                                                //       activeTrackGradient:
                                                //           LinearGradient(colors: [
                                                //         Gold,
                                                //         Gold,
                                                //         white,
                                                //       ]),
                                                //       inactiveTrackGradient:
                                                //           LinearGradient(colors: [
                                                //         white,
                                                //         white
                                                //       ]),
                                                //       slider: Slider(
                                                //         value: AddSkillsList[index]
                                                //                     ["range"] ==
                                                //                 null
                                                //             ? selectedlevel
                                                //             : AddSkillsList[index]
                                                //                 ["range"],
                                                //         //  onChanged: _setValue,
                                                //         onChanged: (value) async {
                                                //           setState(() {
                                                //             afterselectedlevel =
                                                //                 value;
                                                //             AddSkillsList[index]
                                                //                 ["range"] = value;
                                                //           });
                                                //         },
                                                //         min: 0.0,
                                                //         max: 10.0,
                                                //         divisions: 10,
                                                //       ),
                                                //       //  Slider(value: 0.5, onChanged: (value) {}
                                                //       // ),
                                                //     ),

                                                //     // Row(
                                                //     //   children: [
                                                //     //     Text(
                                                //     //         double.parse(
                                                //     //                 "${double.parse(UnaccessedList[index]["score"])}")
                                                //     //             .toStringAsFixed(2),
                                                //     //         // "${accessedList[index]["score"]}/100",
                                                //     //         style: GoogleFonts.inter(
                                                //     //             color: white,
                                                //     //             fontSize: kFourteenFont,
                                                //     //             fontWeight: kFW800)),
                                                //     //     Text("/10",
                                                //     //         // "${accessedList[index]["score"]}/100",
                                                //     //         style: GoogleFonts.inter(
                                                //     //             color: white,
                                                //     //             fontSize: kTwelveFont,
                                                //     //             fontWeight: kFW600)),
                                                //     //   ],
                                                //     // ),
                                                //   ],
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Container(
                                        //   margin: EdgeInsets.only(top: 10.h),
                                        //   decoration: BoxDecoration(
                                        //     color: Colors.grey.withOpacity(0.1),
                                        //     boxShadow: [
                                        //       BoxShadow(
                                        //         blurRadius: 2.r,
                                        //         spreadRadius: 2.r,
                                        //         color:
                                        //             Colors.black.withOpacity(0.1),
                                        //       )
                                        //     ],
                                        //     border: const GradientBoxBorder(
                                        //       gradient: LinearGradient(
                                        //           begin: Alignment.topLeft,
                                        //           end: Alignment.bottomRight,
                                        //           colors: [
                                        //             kBackground,
                                        //             kBackground,
                                        //             kBackground,
                                        //             Gold
                                        //           ]),
                                        //       width: 0.5,
                                        //     ),
                                        //     borderRadius:
                                        //         BorderRadius.circular(10.r),
                                        //   ),
                                        //   child: Theme(
                                        //     data: Theme.of(context).copyWith(
                                        //       unselectedWidgetColor:
                                        //           Gold, // here for close state
                                        //       colorScheme: ColorScheme.light(
                                        //         primary: Colors.white,
                                        //       ), // here for open state in replacement of deprecated accentColor
                                        //       dividerColor: Colors
                                        //           .transparent, // if you want to remove the border
                                        //     ),
                                        //     child: ExpansionTile(
                                        //       iconColor: Gold,
                                        //       title: Row(
                                        //         children: [
                                        //           Container(
                                        //             // margin: EdgeInsets.only(
                                        //             //   top: 10.h,
                                        //             // ),
                                        //             width: 190.w,
                                        //             child: Text(
                                        //                 AddSkillsList[index]
                                        //                         ?["title"] ??
                                        //                     "Skills",
                                        //                 //"Cash Flow Management",
                                        //                 maxLines: 2,
                                        //                 style: GoogleFonts.inter(
                                        //                     color: white,
                                        //                     fontSize: kFourteenFont,
                                        //                     fontWeight: kFW500)),
                                        //           ),
                                        //           Image.asset(
                                        //             'assets/images/verified.png',
                                        //             width: 25.w,
                                        //           ),
                                        //         ],
                                        //       ),
                                        //       children: <Widget>[
                                        //         ListTile(
                                        //             title: GradientSlider(
                                        //           thumbAsset:
                                        //               'assets/images/gold button.png',

                                        //           trackHeight: 15.h,
                                        //           trackBorderColor:
                                        //               Colors.transparent,
                                        //           thumbHeight: 32,
                                        //           thumbWidth: 10,

                                        //           // trackBorder: 1,
                                        //           // trackBorderColor: Colors.black,
                                        //           activeTrackGradient:
                                        //               LinearGradient(colors: [
                                        //             Gold,
                                        //             white,
                                        //           ]),
                                        //           inactiveTrackGradient:
                                        //               LinearGradient(
                                        //                   colors: [white, white]),
                                        //           slider: Slider(
                                        //             value: AddSkillsList[index]
                                        //                         ["range"] ==
                                        //                     null
                                        //                 ? selectedlevel
                                        //                 : AddSkillsList[index]
                                        //                     ["range"],
                                        //             //  onChanged: _setValue,
                                        //             onChanged: (value) async {
                                        //               setState(() {
                                        //                 afterselectedlevel = value;
                                        //                 AddSkillsList[index]
                                        //                     ["range"] = value;
                                        //               });
                                        //             },
                                        //             min: 0.0,
                                        //             max: 10.0,
                                        //             divisions: 10,
                                        //           ),
                                        //           //  Slider(value: 0.5, onChanged: (value) {}
                                        //           // ),
                                        //         )
                                        //             // SliderTheme(

                                        //             //   data: SliderTheme.of(context)
                                        //             //       .copyWith(
                                        //             //     thumbColor: Gold,

                                        //             //     // trackShape:
                                        //             //     //     RectangularSliderTrackShape(),
                                        //             //     trackHeight: 20.h,
                                        //             //       trackShape: GradientRectSliderTrackShape(gradient: gradient, darkenInactive: false),
                                        //             //     // trackShape:
                                        //             //     //     RoundedRectSliderTrackShape(),

                                        //             //     thumbShape:
                                        //             //         RoundSliderThumbShape(
                                        //             //             enabledThumbRadius:
                                        //             //                 15.r),
                                        //             //     // thumbShape:
                                        //             //     //     RectSliderThumbShape(
                                        //             //     //   enabledThumbRadius: 15.r,
                                        //             //     // ),  //pac
                                        //             //     activeTrackColor:
                                        //             //         Gold.withOpacity(0.5),
                                        //             //     inactiveTrackColor: white,
                                        //             //     overlayColor:
                                        //             //         Colors.transparent,
                                        //             //   ),
                                        //             //   child: Slider(
                                        //             //     value: AddSkillsList[index]
                                        //             //                 ["range"] ==
                                        //             //             null
                                        //             //         ? selectedlevel
                                        //             //         : AddSkillsList[index]
                                        //             //             ["range"],
                                        //             //     //  onChanged: _setValue,
                                        //             //     onChanged: (value) async {
                                        //             //       setState(() {
                                        //             //         afterselectedlevel =
                                        //             //             value;
                                        //             //         AddSkillsList[index]
                                        //             //             ["range"] = value;
                                        //             //       });
                                        //             //     },
                                        //             //     min: 0.0,
                                        //             //     max: 10.0,
                                        //             //     divisions: 10,
                                        //             //   ),
                                        //             // ),
                                        //             )
                                        //       ],
                                        //     ),
                                        //   ),
                                        // ),
                                        // Container(
                                        //   margin: EdgeInsets.only(
                                        //     top: 10.h,
                                        //   ),
                                        //   width: 190.w,
                                        //   child: Text(
                                        //       AddSkillsList[index]?["title"] ??
                                        //           "Skills",
                                        //       //"Cash Flow Management",
                                        //       maxLines: 2,
                                        //       style: GoogleFonts.inter(
                                        //           color: white,
                                        //           fontSize: kFourteenFont,
                                        //           fontWeight: kFW500)),
                                        // ),
                                        // SliderTheme(
                                        //   data: SliderTheme.of(context).copyWith(
                                        //       thumbColor: Colors.white,
                                        //       thumbShape: RoundSliderThumbShape(
                                        //           enabledThumbRadius: 10.0),
                                        //       activeTrackColor: Color(0xff3ADEA7),
                                        //       inactiveTrackColor: Colors.grey,
                                        //       overlayColor: Colors.transparent,
                                        //       trackHeight: 1.0),
                                        //   child: Slider(
                                        //     value: AddSkillsList[index]["range"] ==
                                        //             null
                                        //         ? selectedlevel
                                        //         : AddSkillsList[index]["range"],
                                        //     //  onChanged: _setValue,
                                        //     onChanged: (value) async {
                                        //       setState(() {
                                        //         afterselectedlevel = value;
                                        //         AddSkillsList[index]["range"] =
                                        //             value;
                                        //       });
                                        //     },
                                        //     min: 0.0,
                                        //     max: 10.0,
                                        //     divisions: 10,
                                        //   ),
                                        // ),
                                      ],
                                    );
                            }))
                        : const Center(
                            child: CircularProgressIndicator(
                            color: Gold,
                          )),
                    SizedBox(height: 30.h),
                    CustomDarkButton(
                        label: 'Save Skill',
                        isLoading: true,
                        onTap: () {
                          debugPrint("Adding Skills");
                          filteredSkillsForAPI = AddSkillsList.where(
                              (element) => element["range"] != null).toList();
                          addmultipleskillsHandler();
                          //  Get.toNamed(KAddSkills);
                          // _showDialog(context);
                        }
                        // onTap: () {
                        //   if (_formKey.currentState!.validate()) {}
                        //   ;
                        //   // Get.toNamed(KAchievedDetails);
                        // },
                        ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

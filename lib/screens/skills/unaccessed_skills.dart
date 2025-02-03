// ignore_for_file: prefer_typing_uninitialized_variables, unused_field, unused_import

import 'dart:ui';

import '../../utils/export_file.dart';

class UnaccessedSkills extends StatefulWidget {
  const UnaccessedSkills({super.key});

  @override
  State<UnaccessedSkills> createState() => _UnaccessedSkillsState();
}

class _UnaccessedSkillsState extends State<UnaccessedSkills> {
  var _chosenValue;
  var dropdownvalue;
  var statedropdownvalue;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  List<dynamic> accessedList = [];

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
      // accessedskillsListHandler();
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

  void _showDialog(BuildContext context) {
    var dropdownvalue;
    var statedropdownvalue;
  }

  double sliderValue = 0.3;

  int _selectedIndex = -1;
  dynamic selectedlevel = 2.0;
  dynamic afterselectedlevel = 2.0;
  /////////////////////////////////////////////
  ///
  // double _sliderValue = 0.0;
  late dynamic _sliderValue;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  bool updateLoading = false;
  Future editUnaccessedSkill(id, score) async {
    // if (base64 == "") {
    //   Fluttertoast.showToast(msg: "please select image");
    // }
    setState(() {
      updateLoading = true;
    });

    Map payload = {
      "candidate_skill_id": id,
      "score": afterselectedlevel

      // "score": 10
      // "title": data.title,
      // "description": data.description,
      // "year": data.year,
    };
    Map value = await Services.updateSkills(payload);
    print(value);
    ;
    if (value["data"]["message"] != null) {
      Fluttertoast.showToast(msg: value["data"]["message"]);
      CategoriesListHandler();
      _onSelected(-1);

      // Get.toNamed(Kprofile);
    } else {
      Get.back();
    }
    setState(() {
      updateLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    CategoriesListHandler();
  }

  pullrefresh() {
    CategoriesListHandler();
  }

  final String GRAPH = 'assets/images/graph.svg';
  final String EDIT = 'assets/images/edit_skill.svg';
  final String DELETE = 'assets/images/delete_skill.svg';
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () {
          debugPrint("Hi");
          return pullrefresh();
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text("Categories",
                  style: GoogleFonts.inter(
                      color: white,
                      fontSize: kEighteenFont,
                      fontWeight: kFW700)),
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
                            return GlassmorphicContainer(
                              height: _selectedIndex == index ? 120.h : 100.h,
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
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    blurRadius: 16,
                                    spreadRadius: 15,
                                    color: Colors.black.withOpacity(0.1),
                                  )
                                ]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 120.w,
                                              child: Text(
                                                  UnaccessedList[index]
                                                      ["skill_master"]["title"],
                                                  maxLines: 2,
                                                  style: GoogleFonts.inter(
                                                      color: white,
                                                      fontSize: kFourteenFont,
                                                      fontWeight: kFW600)),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                _onSelected(index);
                                              },
                                              child: SvgPicture.asset(
                                                EDIT,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                deleteskill(
                                                    UnaccessedList[index]
                                                        ["id"]);
                                              },
                                              child: SvgPicture.asset(
                                                DELETE,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                Get.toNamed(KskillGraph,
                                                    arguments: {
                                                      "skillId": UnaccessedList[
                                                              index]
                                                          ["skill_master_id"]
                                                    });
                                              },
                                              child: SvgPicture.asset(
                                                GRAPH,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    _selectedIndex == index
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                width: 200.w,
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
                                                    value: afterselectedlevel,
                                                    //selectedlevel,
                                                    // AddSkillsList[
                                                    //                 index]
                                                    //             [
                                                    //             "range"] ==
                                                    //         null
                                                    //     ? selectedlevel
                                                    //     :
                                                    //     AddSkillsList[index]["range"],

                                                    //  onChanged: _setValue,
                                                    onChanged: (value) async {
                                                      setState(() {
                                                        afterselectedlevel =
                                                            value;
                                                        // AddSkillsList[
                                                        //             index]
                                                        //         [
                                                        //         "range"] =
                                                        //     value;
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
                                                          fontWeight: kFW800)),
                                                  Text("/10",
                                                      // "${accessedList[index]["score"]}/100",
                                                      style: GoogleFonts.inter(
                                                          color: white,
                                                          fontSize: kTwelveFont,
                                                          fontWeight: kFW600)),
                                                ],
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  editUnaccessedSkill(
                                                      UnaccessedList[index]
                                                          ["id"],
                                                      // UnaccessedList[index]
                                                      //     ["skill_master_id"],
                                                      afterselectedlevel);
                                                },
                                                child: SvgPicture.asset(
                                                  EDIT,
                                                  color: Customgreen,
                                                ),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              AnimatedProgressBar(
                                                  height: 25.h,
                                                  width: 220.w,
                                                  value: double.parse(
                                                          UnaccessedList[index]
                                                              ["score"]) /
                                                      10,
                                                  duration:
                                                      Duration(seconds: 1),
                                                  gradient:
                                                      const LinearGradient(
                                                    colors: [
                                                      white,
                                                      klightOrange,
                                                      Gold
                                                    ],
                                                  ),
                                                  backgroundColor: white),
                                              Row(
                                                children: [
                                                  Text(
                                                      double.parse(
                                                              "${double.parse(UnaccessedList[index]["score"])}")
                                                          .toStringAsFixed(2),
                                                      // "${accessedList[index]["score"]}/100",
                                                      style: GoogleFonts.inter(
                                                          color: white,
                                                          fontSize:
                                                              kFourteenFont,
                                                          fontWeight: kFW800)),
                                                  Text("/10",
                                                      // "${accessedList[index]["score"]}/100",
                                                      style: GoogleFonts.inter(
                                                          color: white,
                                                          fontSize: kTwelveFont,
                                                          fontWeight: kFW600)),
                                                ],
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              ),
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
              SizedBox(height: 60.h),
            ],
          ),
        ));
  }
}

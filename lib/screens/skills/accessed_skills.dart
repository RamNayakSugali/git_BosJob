import '../../utils/export_file.dart';

class accessedSkills extends StatefulWidget {
  const accessedSkills({super.key});

  @override
  State<accessedSkills> createState() => _accessedSkillsState();
}

class _accessedSkillsState extends State<accessedSkills> {
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
      // CategoriesListHandler();
    });
  }

  void _showDialog(BuildContext context) {
    var dropdownvalue;
    var statedropdownvalue;
  }

  double sliderValue = 0.3;
  @override
  void initState() {
    super.initState();
    accessedskillsListHandler();
    // CategoriesListHandler();
  }

  pullrefresh() {
    accessedskillsListHandler();
    // CategoriesListHandler();
  }

  final String RECOMMEND = 'assets/images/recommend.svg';
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
                      fontSize: 17.sp,
                      fontWeight: kFW700)),
              SizedBox(
                height: 10.h,
              ),
              isLoading == false
                  ? accessedList.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: accessedList.length,
                          itemBuilder: ((context, index) {
                            return GlassmorphicContainer(
                              height: 100.h,
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
                                        Container(
                                          // margin: EdgeInsets.only(
                                          //   top: 10.h,
                                          // ),
                                          width: 190.w,
                                          child: Text(
                                              accessedList[index]
                                                          ["skill_master"]
                                                      ["title"] ??
                                                  "",
                                              maxLines: 2,
                                              style: GoogleFonts.inter(
                                                  color: white,
                                                  fontSize: kFourteenFont,
                                                  fontWeight: kFW600)),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed(KskillGraphAccessed,
                                                arguments: {
                                                  "skillId": accessedList[index]
                                                      ["skill_master_id"]
                                                });
                                          },
                                          child: SvgPicture.asset(
                                            RECOMMEND,
                                            // width: 5.w,
                                            //  width: _pageIndex == 0 ? 16.w : 14.w,
                                            // color: _pageIndex == 0 ? KOrange : Klightgray
                                          ),
                                        ),
                                        // Image.asset(
                                        //   'assets/images/recommend.png',
                                        //   width: 25.w,
                                        // ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AnimatedProgressBar(
                                            height: 25.h,
                                            width: 220.w,
                                            value: double.parse(
                                                    accessedList[index]
                                                        ["score"]) /
                                                100,
                                            duration: Duration(seconds: 1),
                                            gradient: const LinearGradient(
                                              colors: [white,klightOrange,Gold],
                                            ),
                                            backgroundColor: white),
                                        Row(
                                          children: [
                                            Text(
                                                double.parse(
                                                        "${double.parse(accessedList[index]["score"]) / 10}")
                                                    .toStringAsFixed(2),
                                                // "${accessedList[index]["score"]}/100",
                                                style: GoogleFonts.inter(
                                                    color: white,
                                                    fontSize: kFourteenFont,
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
                            //   Container(
                            //     margin: EdgeInsets.only(top: 10.h),
                            //     decoration: BoxDecoration(
                            //       color: Colors.grey.withOpacity(0.1),
                            //       boxShadow: [
                            //         BoxShadow(
                            //           blurRadius: 2.r,
                            //           spreadRadius: 2.r,
                            //           color: Colors.black.withOpacity(0.1),
                            //         )
                            //       ],
                            //       border: const GradientBoxBorder(
                            //         gradient: LinearGradient(
                            //             begin: Alignment.topLeft,
                            //             end: Alignment.bottomRight,
                            //             colors: [
                            //               kBackground,
                            //               kBackground,
                            //               kBackground,
                            //               Gold
                            //             ]),
                            //         width: 0.5,
                            //       ),
                            //       borderRadius: BorderRadius.circular(10.r),
                            //     ),
                            //     child: Theme(
                            //       data: Theme.of(context).copyWith(
                            //         unselectedWidgetColor:
                            //             Gold, // here for close state
                            //         colorScheme: ColorScheme.light(
                            //           primary: Colors.white,
                            //         ), // here for open state in replacement of deprecated accentColor
                            //         dividerColor: Colors
                            //             .transparent, // if you want to remove the border
                            //       ),
                            //       child: ExpansionTile(
                            //         iconColor: Gold,
                            //         title: Row(
                            //           children: [
                            //             Container(
                            //               // margin: EdgeInsets.only(
                            //               //   top: 10.h,
                            //               // ),
                            //               width: 190.w,
                            //               child: Text(
                            //                   accessedList[index]["skill_master"]
                            //                           ["title"] ??
                            //                       "",
                            //                   maxLines: 2,
                            //                   style: GoogleFonts.inter(
                            //                       color: white,
                            //                       fontSize: kFourteenFont,
                            //                       fontWeight: kFW600)),
                            //             ),
                            //             SvgPicture.asset(
                            //               RECOMMEND,
                            //               // width: 5.w,
                            //               //  width: _pageIndex == 0 ? 16.w : 14.w,
                            //               // color: _pageIndex == 0 ? KOrange : Klightgray
                            //             ),
                            //             // Image.asset(
                            //             //   'assets/images/recommend.png',
                            //             //   width: 25.w,
                            //             // ),
                            //           ],
                            //         ),
                            //         children: <Widget>[
                            //           ListTile(
                            //             title: Row(
                            //               mainAxisAlignment:
                            //                   MainAxisAlignment.spaceBetween,
                            //               children: [
                            //                 AnimatedProgressBar(
                            //                     height: 25.h,
                            //                     width: 220.w,
                            //                     value: double.parse(
                            //                             accessedList[index]
                            //                                 ["score"]) /
                            //                         100,
                            //                     duration: Duration(seconds: 1),
                            //                     gradient: const LinearGradient(
                            //                       colors: [Gold, white],
                            //                     ),
                            //                     backgroundColor: white),
                            //                 Row(
                            //                   children: [
                            //                     Text(
                            //                         double.parse(
                            //                                 "${double.parse(accessedList[index]["score"]) / 10}")
                            //                             .toStringAsFixed(2),
                            //                         // "${accessedList[index]["score"]}/100",
                            //                         style: GoogleFonts.inter(
                            //                             color: white,
                            //                             fontSize: kFourteenFont,
                            //                             fontWeight: kFW800)),
                            //                     Text("/10",
                            //                         // "${accessedList[index]["score"]}/100",
                            //                         style: GoogleFonts.inter(
                            //                             color: white,
                            //                             fontSize: kTwelveFont,
                            //                             fontWeight: kFW600)),
                            //                   ],
                            //                 ),
                            //               ],
                            //             ),
                            //           )
                            //         ],
                            //       ),
                            //     ),
                            //   );
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
                height: 60.h,
              ),
            ],
          ),
        ));
    ;
  }
}

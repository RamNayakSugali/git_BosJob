// ignore_for_file: camel_case_types

import 'dart:ui';

import 'package:bossjobs/utils/export_file.dart';

class coures extends StatefulWidget {
  bool? isHome;
  coures({super.key, this.isHome});

  @override
  State<coures> createState() => _couresState();
}

class _couresState extends State<coures> {
  @override
  void initState() {
    profileHandler();
    super.initState();
  }

  Map profiledata = {};
  List browseCourse = [];
  List originalBrowseCourse = [];
  Future crousecourseHandler() async {
    Map payload = {
      "listing_type": "all_courses",
      "candidate_id":
          profiledata["candidates"]["CandidateDetails"]["id"].toString(),
    };

    var value = await Services.searchCourse(payload);

    if (value["data"] == null) {
      Fluttertoast.showToast(msg: value["message"]);
    } else {
      browseCourse = value["data"];
      originalBrowseCourse = value["data"];
      getFilters();
    }
  }

  bool isLoading = false;
  Future profileHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.getprofiledatajob();

    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      profiledata = data["data"];
    }
    await crousecourseHandler();
    setState(() {
      isLoading = false;
    });
  }

  List<int> wishlisted = <int>[];
  List<String> filterLevel = [];
  List<String> filterCourseType = [];
  List<String> filterCategory = [];
  List<String> filterInstitute = [];
  List<int> filterPrice = [];
  List<String> filterPriceSatic = [
    "Free",
    "Under Rs.500",
    "Rs.500 - Rs.1000",
    "Rs.1000 - Rs.3000",
    "Rs.3000+ More"
  ];
  Map selectedFilter = {
    "Category": [],
    "Level": [],
    "Course Type": [],
    "Institute": [],
    "Price": []
  };
  List<int> selectedPriceRange = [];
  // getPriceFilerAPIData(List<int> values) async {
  //   var value = await Services.filterAPI(values);

  //   if (value["data"] == null) {
  //     Fluttertoast.showToast(msg: value["message"]);
  //   } else {
  //     setState(() {
  //       browseCourse = value["data"];
  //     });
  //   }
  // }

  getFilters() {
    filterLevel.clear();
    filterCourseType.clear();
    for (int i = 0; i < browseCourse.length; i++) {
      if (!filterLevel.contains(browseCourse[i]["level"])) {
        setState(() {
          filterLevel.add(browseCourse[i]["level"]);
        });
      }
    }
    for (int i = 0; i < browseCourse.length; i++) {
      if (!filterCourseType
          .contains(browseCourse[i]["course_type_master"]["title"])) {
        setState(() {
          filterCourseType.add(browseCourse[i]["course_type_master"]["title"]);
        });
      }
    }
    for (int i = 0; i < browseCourse.length; i++) {
      if (!filterPrice.contains(browseCourse[i]["price"])) {
        setState(() {
          filterPrice.add(browseCourse[i]["price"]);
        });
      }
    }
    filterPrice.sort();
    for (int i = 0; i < browseCourse.length; i++) {
      if (browseCourse[i]["institute"] != null) {
        if (!filterInstitute.contains(browseCourse[i]["institute"]["name"])) {
          setState(() {
            filterInstitute.add(browseCourse[i]["institute"]["name"]);
          });
        }
      }
    }

    for (int i = 0; i < browseCourse.length; i++) {
      for (int j = 0; j < browseCourse[i]["category_masters"].length; j++) {
        if (!filterCategory
            .contains(browseCourse[i]["category_masters"][j]["title"])) {
          setState(() {
            filterCategory.add(browseCourse[i]["category_masters"][j]["title"]);
          });
        }
      }
    }
  }

  Future openDialog() => showDialog(
      context: context,
      builder: ((context) => StatefulBuilder(
              builder: (BuildContext context, StateSetter setStates) {
            return AlertDialog(
              backgroundColor: kBackground.withOpacity(0.7),
              content: Container(
                  height: 337.h,
                  width: 300.w,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Category",
                            style: GoogleFonts.gothicA1(
                                //decoration: TextDecoration.lineThrough,
                                fontSize: kTwelveFont,
                                color: white,
                                fontWeight: kFW700),
                          ),
                        ),
                        GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: filterCategory.length,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Row(
                                          children: [
                                            //                 Container(height: 19,
                                            //   width: 19,
                                            //   decoration: BoxDecoration(
                                            //       gradient: LinearGradient(
                                            //         begin: Alignment.topLeft,
                                            //         end: Alignment(10, 3),
                                            //         colors: <Color>[
                                            //           white,
                                            //           Gold,
                                            //   ],
                                            // )
                                            // ),
                                            //   child: Checkbox(value: false, onChanged: (bool? value) {  },),
                                            // ),
                                            GestureDetector(
                                              onTap: () {
                                                setStates(() {
                                                  debugPrint(
                                                      filterCategory[index]);
                                                  if (!selectedFilter[
                                                          "Category"]
                                                      .contains(filterCategory[
                                                          index])) {
                                                    selectedFilter["Category"]
                                                        .add(filterCategory[
                                                            index]);
                                                  } else {
                                                    selectedFilter["Category"]
                                                        .remove(filterCategory[
                                                            index]);
                                                  }
                                                });
                                              },
                                              child: ShaderMask(
                                                  blendMode: BlendMode.srcATop,
                                                  shaderCallback:
                                                      (Rect bounds) =>
                                                          const LinearGradient(
                                                              begin: Alignment
                                                                  .topLeft,
                                                              end: Alignment
                                                                  .bottomRight,
                                                              colors: [
                                                                white,
                                                                Gold
                                                              ]).createShader(
                                                              bounds),
                                                  child: selectedFilter["Category"]
                                                          .contains(
                                                              filterCategory[index])
                                                      ? const Icon(Icons.check_box)
                                                      : const Icon(Icons.check_box_outline_blank_outlined)),
                                            ),
                                            // Text(
                                            //   '\u{20B9}${699}',
                                            //   style: GoogleFonts.gothicA1(
                                            //       fontSize: kFourteenFont,
                                            //       color: Gold,
                                            //       fontWeight: kFW700),
                                            // ),
                                            // SizedBox(
                                            //   width: 10.w,
                                            // ),
                                            Text(
                                              filterCategory[index].length > 10
                                                  ? "${filterCategory[index].toString().substring(0, 9)}.."
                                                  : filterCategory[index],
                                              style: GoogleFonts.gothicA1(
                                                  //decoration: TextDecoration.lineThrough,
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Level",
                            style: GoogleFonts.gothicA1(
                                //decoration: TextDecoration.lineThrough,
                                fontSize: kTwelveFont,
                                color: white,
                                fontWeight: kFW700),
                          ),
                        ),
                        GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: filterLevel.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 2,
                                    childAspectRatio: (0.98 / 0.45)),
                            itemBuilder: ((context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // Container(
                                  //     height: 170.h,
                                  //     margin: EdgeInsets.all(7.r),
                                  //     decoration: BoxDecoration(
                                  //         border: const GradientBoxBorder(
                                  //           gradient: LinearGradient(colors: [grey, Gold]),
                                  //           width: 1,
                                  //         ),
                                  //         borderRadius: BorderRadius.circular(15.r)),
                                  //     child: Image.asset(
                                  //       'assets/images/calender.png',
                                  //       fit: BoxFit.fill,
                                  //     )),
                                  Container(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Row(
                                          children: [
                                            //                 Container(height: 19,
                                            //   width: 19,
                                            //   decoration: BoxDecoration(
                                            //       gradient: LinearGradient(
                                            //         begin: Alignment.topLeft,
                                            //         end: Alignment(10, 3),
                                            //         colors: <Color>[
                                            //           white,
                                            //           Gold,
                                            //   ],
                                            // )
                                            // ),
                                            //   child: Checkbox(value: false, onChanged: (bool? value) {  },),
                                            // ),
                                            GestureDetector(
                                              onTap: () {
                                                setStates(() {
                                                  debugPrint(
                                                      filterLevel[index]);
                                                  if (!selectedFilter["Level"]
                                                      .contains(
                                                          filterLevel[index])) {
                                                    selectedFilter["Level"].add(
                                                        filterLevel[index]);
                                                  } else {
                                                    selectedFilter["Level"]
                                                        .remove(
                                                            filterLevel[index]);
                                                  }
                                                });
                                              },
                                              child: ShaderMask(
                                                  blendMode: BlendMode.srcATop,
                                                  shaderCallback:
                                                      (Rect bounds) =>
                                                          const LinearGradient(
                                                              begin: Alignment
                                                                  .topLeft,
                                                              end: Alignment
                                                                  .bottomRight,
                                                              colors: [
                                                                white,
                                                                Gold
                                                              ]).createShader(
                                                              bounds),
                                                  child: selectedFilter["Level"]
                                                          .contains(
                                                              filterLevel[index])
                                                      ? const Icon(Icons.check_box)
                                                      : const Icon(Icons.check_box_outline_blank_outlined)),
                                            ),
                                            // Text(
                                            //   '\u{20B9}${699}',
                                            //   style: GoogleFonts.gothicA1(
                                            //       fontSize: kFourteenFont,
                                            //       color: Gold,
                                            //       fontWeight: kFW700),
                                            // ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Text(
                                              filterLevel[index].length > 10
                                                  ? "${filterLevel[index].toString().substring(0, 9)}.."
                                                  : filterLevel[index],
                                              style: GoogleFonts.gothicA1(
                                                  //decoration: TextDecoration.lineThrough,
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Course Type",
                            style: GoogleFonts.gothicA1(
                                //decoration: TextDecoration.lineThrough,
                                fontSize: kTwelveFont,
                                color: white,
                                fontWeight: kFW700),
                          ),
                        ),
                        GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: filterCourseType.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 2,
                                    childAspectRatio: (0.98 / 0.45)),
                            itemBuilder: ((context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // Container(
                                  //     height: 170.h,
                                  //     margin: EdgeInsets.all(7.r),
                                  //     decoration: BoxDecoration(
                                  //         border: const GradientBoxBorder(
                                  //           gradient: LinearGradient(colors: [grey, Gold]),
                                  //           width: 1,
                                  //         ),
                                  //         borderRadius: BorderRadius.circular(15.r)),
                                  //     child: Image.asset(
                                  //       'assets/images/calender.png',
                                  //       fit: BoxFit.fill,
                                  //     )),
                                  Container(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Row(
                                          children: [
                                            //                 Container(height: 19,
                                            //   width: 19,
                                            //   decoration: BoxDecoration(
                                            //       gradient: LinearGradient(
                                            //         begin: Alignment.topLeft,
                                            //         end: Alignment(10, 3),
                                            //         colors: <Color>[
                                            //           white,
                                            //           Gold,
                                            //   ],
                                            // )
                                            // ),
                                            //   child: Checkbox(value: false, onChanged: (bool? value) {  },),
                                            // ),
                                            GestureDetector(
                                              onTap: () {
                                                setStates(() {
                                                  debugPrint(
                                                      filterCourseType[index]);
                                                  if (!selectedFilter[
                                                          "Course Type"]
                                                      .contains(
                                                          filterCourseType[
                                                              index])) {
                                                    selectedFilter[
                                                            "Course Type"]
                                                        .add(filterCourseType[
                                                            index]);
                                                  } else {
                                                    selectedFilter[
                                                            "Course Type"]
                                                        .remove(
                                                            filterCourseType[
                                                                index]);
                                                  }
                                                });
                                              },
                                              child: ShaderMask(
                                                  blendMode: BlendMode.srcATop,
                                                  shaderCallback: (Rect bounds) =>
                                                      const LinearGradient(
                                                              begin: Alignment
                                                                  .topLeft,
                                                              end: Alignment
                                                                  .bottomRight,
                                                              colors: [white, Gold])
                                                          .createShader(bounds),
                                                  child: selectedFilter[
                                                              "Course Type"]
                                                          .contains(
                                                              filterCourseType[index])
                                                      ? const Icon(Icons.check_box)
                                                      : const Icon(Icons.check_box_outline_blank_outlined)),
                                            ),

                                            // Text(
                                            //   '\u{20B9}${699}',
                                            //   style: GoogleFonts.gothicA1(
                                            //       fontSize: kFourteenFont,
                                            //       color: Gold,
                                            //       fontWeight: kFW700),
                                            // ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Text(
                                              filterCourseType[index].length >
                                                      10
                                                  ? "${filterCourseType[index].toString().substring(0, 9)}.."
                                                  : filterCourseType[index],
                                              style: GoogleFonts.gothicA1(
                                                  //decoration: TextDecoration.lineThrough,
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Institute",
                            style: GoogleFonts.gothicA1(
                                //decoration: TextDecoration.lineThrough,
                                fontSize: kTwelveFont,
                                color: white,
                                fontWeight: kFW700),
                          ),
                        ),
                        GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: filterInstitute.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 2,
                                    childAspectRatio: (0.98 / 0.45)),
                            itemBuilder: ((context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // Container(
                                  //     height: 170.h,
                                  //     margin: EdgeInsets.all(7.r),
                                  //     decoration: BoxDecoration(
                                  //         border: const GradientBoxBorder(
                                  //           gradient: LinearGradient(colors: [grey, Gold]),
                                  //           width: 1,
                                  //         ),
                                  //         borderRadius: BorderRadius.circular(15.r)),
                                  //     child: Image.asset(
                                  //       'assets/images/calender.png',
                                  //       fit: BoxFit.fill,
                                  //     )),
                                  Container(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Row(
                                          children: [
                                            //                 Container(height: 19,
                                            //   width: 19,
                                            //   decoration: BoxDecoration(
                                            //       gradient: LinearGradient(
                                            //         begin: Alignment.topLeft,
                                            //         end: Alignment(10, 3),
                                            //         colors: <Color>[
                                            //           white,
                                            //           Gold,
                                            //   ],
                                            // )
                                            // ),
                                            //   child: Checkbox(value: false, onChanged: (bool? value) {  },),
                                            // ),
                                            GestureDetector(
                                              onTap: () {
                                                setStates(() {
                                                  debugPrint(
                                                      filterInstitute[index]);
                                                  if (!selectedFilter[
                                                          "Institute"]
                                                      .contains(filterInstitute[
                                                          index])) {
                                                    selectedFilter["Institute"]
                                                        .add(filterInstitute[
                                                            index]);
                                                  } else {
                                                    selectedFilter["Institute"]
                                                        .remove(filterInstitute[
                                                            index]);
                                                  }
                                                });
                                              },
                                              child: ShaderMask(
                                                  blendMode: BlendMode.srcATop,
                                                  shaderCallback:
                                                      (Rect bounds) =>
                                                          const LinearGradient(
                                                              begin: Alignment
                                                                  .topLeft,
                                                              end: Alignment
                                                                  .bottomRight,
                                                              colors: [
                                                                white,
                                                                Gold
                                                              ]).createShader(
                                                              bounds),
                                                  child: selectedFilter["Institute"]
                                                          .contains(
                                                              filterInstitute[index])
                                                      ? const Icon(Icons.check_box)
                                                      : const Icon(Icons.check_box_outline_blank_outlined)),
                                            ),
                                            // Text(
                                            //   '\u{20B9}${699}',
                                            //   style: GoogleFonts.gothicA1(
                                            //       fontSize: kFourteenFont,
                                            //       color: Gold,
                                            //       fontWeight: kFW700),
                                            // ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Text(
                                              filterInstitute[index].length > 10
                                                  ? "${filterInstitute[index].toString().substring(0, 9)}.."
                                                  : filterInstitute[index],
                                              style: GoogleFonts.gothicA1(
                                                  //decoration: TextDecoration.lineThrough,
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Price",
                            style: GoogleFonts.gothicA1(
                                //decoration: TextDecoration.lineThrough,
                                fontSize: kTwelveFont,
                                color: white,
                                fontWeight: kFW700),
                          ),
                        ),
                        Container(
                          height: 150.h,
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: filterPriceSatic.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    // Container(
                                    //     height: 170.h,
                                    //     margin: EdgeInsets.all(7.r),
                                    //     decoration: BoxDecoration(
                                    //         border: const GradientBoxBorder(
                                    //           gradient: LinearGradient(colors: [grey, Gold]),
                                    //           width: 1,
                                    //         ),
                                    //         borderRadius: BorderRadius.circular(15.r)),
                                    //     child: Image.asset(
                                    //       'assets/images/calender.png',
                                    //       fit: BoxFit.fill,
                                    //     )),
                                    Container(
                                      padding: EdgeInsets.only(left: 10.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  setStates(() {
                                                    if (!selectedPriceRange
                                                        .contains(index + 1)) {
                                                      selectedPriceRange
                                                          .add(index + 1);
                                                    } else {
                                                      selectedPriceRange
                                                          .remove(index + 1);
                                                    }
                                                  });
                                                },
                                                child: ShaderMask(
                                                    blendMode: BlendMode
                                                        .srcATop,
                                                    shaderCallback:
                                                        (Rect bounds) =>
                                                            const LinearGradient(
                                                                begin: Alignment
                                                                    .topLeft,
                                                                end: Alignment
                                                                    .bottomRight,
                                                                colors: [
                                                                  white,
                                                                  Gold
                                                                ]).createShader(
                                                                bounds),
                                                    child: selectedPriceRange
                                                            .contains(index + 1)
                                                        ? const Icon(Icons.check_box)
                                                        : const Icon(Icons.check_box_outline_blank_outlined)),
                                              ),
                                              // Text(
                                              //   '\u{20B9}${699}',
                                              //   style: GoogleFonts.gothicA1(
                                              //       fontSize: kFourteenFont,
                                              //       color: Gold,
                                              //       fontWeight: kFW700),
                                              // ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Text(
                                                filterPriceSatic[index],
                                                style: GoogleFonts.gothicA1(
                                                    //decoration: TextDecoration.lineThrough,
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
                              }),
                        ),
                        SizedBox(height: 5.h),
                        // Container(
                        //   width: 357.w,
                        //   height: 41.h,
                        //   margin: EdgeInsets.only(top: 20, left: 10.w, right: 10.w),
                        //   padding:
                        //       EdgeInsets.only(top: 4.h, left: 10.w, right: 10.w),
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10.r),
                        //       boxShadow: [
                        //         BoxShadow(
                        //           blurRadius: 20,
                        //           spreadRadius: 5,
                        //           color: Color.fromARGB(255, 13, 12, 12)
                        //               .withOpacity(0.1),
                        //         )
                        //       ],
                        //       gradient: LinearGradient(
                        //           begin: Alignment.topLeft,
                        //           end: Alignment.bottomRight,
                        //           colors: [
                        //             grey.withOpacity(0.5),
                        //             grey1.withOpacity(0.5),
                        //             Color.fromARGB(255, 58, 55, 55)
                        //                 .withOpacity(0.1),
                        //           ])),
                        //   child: Container(
                        //     width: 357.w,
                        //     height: 41.h,
                        //     margin:
                        //         EdgeInsets.only(top: 20, left: 10.w, right: 10.w),
                        //     padding:
                        //         EdgeInsets.only(top: 4.h, left: 10.w, right: 10.w),
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(10.r),
                        //         boxShadow: [
                        //           BoxShadow(
                        //             blurRadius: 20,
                        //             spreadRadius: 5,
                        //             color: Color.fromARGB(255, 13, 12, 12)
                        //                 .withOpacity(0.1),
                        //           )
                        //         ],
                        //         gradient: LinearGradient(
                        //             begin: Alignment.topLeft,
                        //             end: Alignment.bottomRight,
                        //             colors: [
                        //               grey.withOpacity(0.5),
                        //               grey1.withOpacity(0.5),
                        //               Color.fromARGB(255, 58, 55, 55)
                        //                   .withOpacity(0.1),
                        //             ])),
                        //     child: Text("data"),
                        //     //                   Container(
                        //     // height: 36.h,
                        //     // width: double.infinity,
                        //     // child: CustomDropdownButton2(
                        //     //   icon: const Icon(
                        //     //     Icons.expand_more,
                        //     //     size: 25,
                        //     //   ),
                        //     //   hint: "Select State",
                        //     //   dropdownItems:items,
                        //     //   dropdownWidth: 340.w,
                        //     //   value: selectedValue,
                        //     //   onChanged: (value) {
                        //     //     setState(() {
                        //     //       selectedValue = value;
                        //     //     });
                        //     //    // onStateSelection(value);
                        //     //   },
                        //     // )
                        //     // ),
                        //   ),
                        // ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() => selectedFilter = {
                                      "Category": [],
                                      "Level": [],
                                      "Course Type": [],
                                      "Institute": [],
                                      "Price": []
                                    });
                                setStates(() {
                                  selectedFilter = {
                                    "Category": [],
                                    "Level": [],
                                    "Course Type": [],
                                    "Institute": [],
                                    "Price": []
                                  };
                                  browseCourse = originalBrowseCourse;
                                });
                              },
                              child: GlassmorphicContainer(
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
                            ),
                            GestureDetector(
                              onTap: () {
                                // if (selectedPriceRange.isNotEmpty) {
                                //   getPriceFilerAPIData(selectedPriceRange);
                                // } else {
                                //   setState(() => isLoading = true);
                                //   //filtering courses based on catergory

                                //   //filtering with insitute

                                //   //filtering with CourseType

                                //   //calling price range API

                                //   setState(() {
                                //     browseCourse = originalBrowseCourse
                                //         .where((element) => selectedFilter[
                                //                 "Course Type"]
                                //             .contains(
                                //                 element["course_type_master"]
                                //                     ["title"]))
                                //         .toList();
                                //   });
                                //   debugPrint("${browseCourse.length}");
                                //   setState(() => isLoading = false);
                                // }
                                Get.back();
                              },
                              child: GlassmorphicContainer(
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
                                              fontSize: kSixteenFont,
                                              color: white,
                                              fontWeight: kFW700)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            );
          })));
  TextEditingController Applyjobs = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackground,
        appBar: widget.isHome == true
            ? AppBar(
                automaticallyImplyLeading: false,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                backgroundColor: darktwo,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  'Courses',
                  style: GoogleFonts.gothicA1(
                      fontSize: kEighteenFont,
                      color: white,
                      fontWeight: kFW700),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(KWish_List_Course);
                    },
                    child: Image.asset(
                      'assets/images/love.png',
                      width: 18.w,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
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
              )
            : AppBar(
                automaticallyImplyLeading: false,
                // leading: Icon(Icons.face_2),
                backgroundColor: darktwo,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  'Courses',
                  style: GoogleFonts.gothicA1(
                      fontSize: kEighteenFont,
                      color: white,
                      fontWeight: kFW700),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(KWish_List_Course
                          //   KFavouratedCourses
                          );
                    },
                    child: Image.asset(
                      'assets/images/love.png',
                      width: 18.w,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
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
            Background(),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(15.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.w,
                    ),
                    TextFormField(
                      maxLength: 8,
                      decoration: InputDecoration(
                        counter: Offstage(),
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 15, 10, 15),
                        prefixIcon: const Icon(Icons.search, color: Gold),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            openDialog();
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Image.asset(
                              'assets/images/threewired.png',
                              width: 1.w,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(
                            color: white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(
                            color: white,
                          ),
                        ),
                        hintText: "Courses",
                      ),
                      onChanged: (value) {
                        debugPrint("$value");
                        setState(() {
                          browseCourse = originalBrowseCourse
                              .where((element) => element["title"]
                                  .toString()
                                  .toLowerCase()
                                  .startsWith(value.toLowerCase()))
                              .toList();
                        });
                      },
                      onTap: () {
                        //Get.toNamed(KSearch);
                      },
                    ),
                    // const Search(),
                    SizedBox(
                      height: 10.h,
                    ),
                    // Text(
                    //   ' Most Popular',
                    //   style: GoogleFonts.gothicA1(
                    //       fontSize: kFourteenFont,
                    //       color: white,
                    //       fontWeight: kFW700),
                    // ),
                    //  // const Most_popular(),
                    //   SizedBox(
                    //     height: 10.h,
                    //   ),
                    // Text(
                    //   'In Progress',
                    //   style: GoogleFonts.gothicA1(
                    //       fontSize: kFourteenFont,
                    //       color: white,
                    //       fontWeight: kFW700),
                    // ),
                    // InprogressList(),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Browse Courses",
                          style: GoogleFonts.gothicA1(
                              fontSize: kSixteenFont,
                              color: white,
                              fontWeight: kFW700),
                        ),
                        Text(
                          "result(${browseCourse.length})",
                          style: GoogleFonts.gothicA1(
                              fontSize: kSixteenFont,
                              color: white,
                              fontWeight: kFW700),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    isLoading == false
                        ? browseCourse.isNotEmpty
                            ? StatefulBuilder(builder: (context, setState) {
                                return Recommended(browseCourse: browseCourse);
                              })
                            : Center(
                                child: Text(
                                  "No Data Found",
                                  style: GoogleFonts.gothicA1(
                                      fontSize: kSixteenFont,
                                      color: white,
                                      fontWeight: kFW700),
                                ),
                              )
                        : const Center(
                            child: CircularProgressIndicator(
                            color: Gold,
                          )),
                    SizedBox(
                      height: 70.h,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

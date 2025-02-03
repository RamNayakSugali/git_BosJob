import 'dart:ui';

import 'package:bossjobs/models/course_model.dart';
import 'package:bossjobs/models/job_model.dart';
import 'package:bossjobs/utils/export_file.dart';
import 'package:dio/dio.dart' as dio;

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchTypeController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  List<String> searchType = ['Job', 'Course'];
  String selectedSearchType = 'Job';

  bool isLoading = false;
  List<JobModel> allJobs = [];
  List<CourseModel> allCourses = [];

  Future searchJobsByKeywordHandler(String keyword) async {
    setState(() {
      isLoading = true;
    });

    allJobs.clear();

    dio.Response response = await Services.searchJobsByKeyword(keyword);
    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        response.data['data'].forEach((v) => allJobs.add(JobModel.fromJson(v)));
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  Future searchCoursesByKeywordHandler(String keyword) async {
    setState(() {
      isLoading = true;
    });

    allCourses.clear();

    dio.Response response = await Services.searchCourseByKeyword(keyword);
    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        response.data['data']
            .forEach((v) => allCourses.add(CourseModel.fromJson(v)));
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  Future addJobToWishList(int id, String keyword) async {
    dio.Response response = await Services.addOrRemoveJobFromWishlist(id);

    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        Fluttertoast.showToast(msg: response.data['data']['message']);
      }
      searchJobsByKeywordHandler(keyword);
    }
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
          'Search',
          style: GoogleFonts.gothicA1(
            fontSize: kEighteenFont,
            color: white,
            fontWeight: kFW700,
          ),
        ),
      ),
      body: Stack(
        children: [
          Background(),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(15.w),
              child: Column(
                children: [
                  DropdownMenu(
                    textStyle: GoogleFonts.inter(
                      color: white,
                      fontSize: kFourteenFont,
                      fontWeight: kFW500,
                    ),
                    inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    initialSelection: searchType[0],
                    controller: searchTypeController,
                    width: MediaQuery.of(context).size.width - 30,
                    dropdownMenuEntries: searchType.map((searchType) {
                      return DropdownMenuEntry(
                        value: searchType,
                        label: searchType,
                      );
                    }).toList(),
                    onSelected: (value) {
                      setState(() {
                        debugPrint(value.toString());
                        selectedSearchType = value.toString();
                        FocusManager.instance.primaryFocus?.unfocus();
                      });
                    },
                  ),
                  SizedBox(height: 5.h),
                  TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Gold),
                      filled: true,
                      fillColor: white,
                      contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
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
                      hintText: selectedSearchType == 'Job'
                          ? 'Search Jobs'
                          : 'Search Courses',
                    ),
                    onEditingComplete: selectedSearchType == 'Job'
                        ? () {
                            searchJobsByKeywordHandler(searchController.text);
                          }
                        : () {
                            searchCoursesByKeywordHandler(
                                searchController.text);
                          },
                  ),
                  SizedBox(height: 5.h),
                  isLoading == false
                      ? selectedSearchType == 'Job'
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: allJobs.length,
                              itemBuilder: ((context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                      KJob_Description,
                                      arguments: allJobs[index].id ?? "",
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
                                      end: Alignment.bottomRight,
                                    ),
                                    borderGradient: LinearGradient(
                                      colors: [
                                        white.withOpacity(0.5),
                                        Gold.withOpacity(0.01)
                                      ],
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 20,
                                            spreadRadius: 16,
                                            color:
                                                Colors.black.withOpacity(0.1),
                                          )
                                        ],
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 10.0,
                                            sigmaY: 10.0,
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.all(10.r),
                                            decoration: BoxDecoration(
                                              border: const GradientBoxBorder(
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Colors.white38,
                                                      Gold
                                                    ]),
                                                width: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      allJobs[index].title ??
                                                          "",
                                                      maxLines: 1,
                                                      style:
                                                          GoogleFonts.gothicA1(
                                                        fontSize: kSixteenFont,
                                                        color: white,
                                                        fontWeight: kFW700,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        addJobToWishList(
                                                            allJobs[index].id!,
                                                            searchController
                                                                .text);
                                                        setState(() {});
                                                      },
                                                      icon: Icon(
                                                        allJobs[index]
                                                                    .isFavourite ==
                                                                1
                                                            ? Icons
                                                                .favorite_rounded
                                                            : Icons
                                                                .favorite_outline_rounded,
                                                        color: allJobs[index]
                                                                    .isFavourite ==
                                                                1
                                                            ? Colors.red
                                                            : white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 8.h,
                                                ),
                                                Text(
                                                  allJobs[index]
                                                      .company!
                                                      .title!,
                                                  style: GoogleFonts.gothicA1(
                                                    fontSize: 11.sp,
                                                    color: white,
                                                    fontWeight: kFW700,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '${allJobs[index].minExp} - ${allJobs[index].maxExp} Years',
                                                      style:
                                                          GoogleFonts.gothicA1(
                                                        fontSize: 11.sp,
                                                        color: white,
                                                        fontWeight: kFW700,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          'assets/images/link.png',
                                                          width: 20.w,
                                                        ),
                                                        Text(
                                                          allJobs[index]
                                                                  .company!
                                                                  .address ??
                                                              "",
                                                          style: GoogleFonts
                                                              .gothicA1(
                                                            fontSize: 11.sp,
                                                            color: white,
                                                            fontWeight: kFW700,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 15.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(5.r),
                                                      color: white
                                                          .withOpacity(0.5),
                                                      child: Text(
                                                        allJobs[index]
                                                                .jobType!
                                                                .title ??
                                                            "",
                                                        style: GoogleFonts
                                                            .gothicA1(
                                                          fontSize: 11.sp,
                                                          color: white,
                                                          fontWeight: kFW700,
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          "Salary",
                                                          style: GoogleFonts
                                                              .gothicA1(
                                                            fontSize: 11.sp,
                                                            color: white,
                                                            fontWeight: kFW700,
                                                          ),
                                                        ),
                                                        Text(
                                                          '${allJobs[index].minSal} - ${allJobs[index].maxSal} LPA',
                                                          style: GoogleFonts
                                                              .gothicA1(
                                                            fontSize:
                                                                kFourteenFont,
                                                            color: Gold,
                                                            fontWeight: kFW700,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '${allJobs[index].industry!.title}',
                                                      maxLines: 1,
                                                      style:
                                                          GoogleFonts.gothicA1(
                                                        fontSize: 11.sp,
                                                        color: white,
                                                        fontWeight: kFW700,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    GestureDetector(
                                                      onTap: allJobs[index]
                                                                  .isApplied ==
                                                              1
                                                          ? () {}
                                                          : () {
                                                              // applyForJobHandler(
                                                              //     allJobs[index]
                                                              //         .id!);
                                                            },
                                                      child: Container(
                                                        width: 90.w,
                                                        height: 40.h,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 20,
                                                              spreadRadius: 5,
                                                              color: const Color
                                                                          .fromARGB(
                                                                      255,
                                                                      13,
                                                                      12,
                                                                      12)
                                                                  .withOpacity(
                                                                      0.1),
                                                            ),
                                                          ],
                                                          gradient:
                                                              LinearGradient(
                                                            begin: Alignment
                                                                .topLeft,
                                                            end: Alignment
                                                                .bottomRight,
                                                            colors: [
                                                              grey.withOpacity(
                                                                  0.5),
                                                              grey1.withOpacity(
                                                                  0.5),
                                                              const Color.fromARGB(
                                                                      255,
                                                                      58,
                                                                      55,
                                                                      55)
                                                                  .withOpacity(
                                                                      0.1),
                                                            ],
                                                          ),
                                                        ),
                                                        child: Text(
                                                          allJobs[index]
                                                                      .isApplied ==
                                                                  1
                                                              ? "Applied"
                                                              : "Apply",
                                                          style: GoogleFonts
                                                              .gothicA1(
                                                            fontSize:
                                                                kTwelveFont,
                                                            color: white,
                                                            fontWeight: kFW600,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: allCourses.length,
                              itemBuilder: ((context, index) {
                                return GlassmorphicContainer(
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
                                    end: Alignment.bottomRight,
                                  ),
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
                                          padding: EdgeInsets.all(15.w),
                                          decoration: BoxDecoration(
                                            border: const GradientBoxBorder(
                                              gradient: LinearGradient(colors: [
                                                Colors.white38,
                                                Gold
                                              ]),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: 200.w,
                                                    child: Text(
                                                      allCourses[index].title!,
                                                      maxLines: 2,
                                                      style:
                                                          GoogleFonts.gothicA1(
                                                        fontSize: 15.sp,
                                                        color: white,
                                                        fontWeight: kFW700,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Jobs",
                                                        maxLines: 2,
                                                        style: GoogleFonts
                                                            .gothicA1(
                                                          fontSize:
                                                              kFourteenFont,
                                                          color: white,
                                                          fontWeight: kFW700,
                                                        ),
                                                      ),
                                                      Text(
                                                        allCourses[index]
                                                            .jobCount
                                                            .toString(),
                                                        maxLines: 2,
                                                        style: GoogleFonts
                                                            .gothicA1(
                                                          fontSize: kTwelveFont,
                                                          color: white,
                                                          fontWeight: kFW700,
                                                        ),
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      Text(
                                                        "Price",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: GoogleFonts
                                                            .gothicA1(
                                                          fontSize:
                                                              kFourteenFont,
                                                          color: white,
                                                          fontWeight: kFW700,
                                                        ),
                                                      ),
                                                      Text(
                                                        "₹ ${allCourses[index].price.toString()}",
                                                        style: GoogleFonts
                                                            .gothicA1(
                                                          fontSize: kTwelveFont,
                                                          color: white,
                                                          fontWeight: kFW700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Level",
                                                        style: GoogleFonts
                                                            .gothicA1(
                                                          fontSize:
                                                              kFourteenFont,
                                                          color: white,
                                                          fontWeight: kFW700,
                                                        ),
                                                      ),
                                                      Text(
                                                        allCourses[index]
                                                            .level!,
                                                        style: GoogleFonts
                                                            .gothicA1(
                                                          fontSize: kTwelveFont,
                                                          color: white,
                                                          fontWeight: kFW700,
                                                        ),
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      Text(
                                                        "Mode",
                                                        style: GoogleFonts
                                                            .gothicA1(
                                                          fontSize:
                                                              kFourteenFont,
                                                          color: white,
                                                          fontWeight: kFW700,
                                                        ),
                                                      ),
                                                      Text(
                                                        allCourses[index]
                                                            .courseTypeMaster!
                                                            .title!,
                                                        style: GoogleFonts
                                                            .gothicA1(
                                                          fontSize: kTwelveFont,
                                                          color: white,
                                                          fontWeight: kFW700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Lessons",
                                                        style: GoogleFonts
                                                            .gothicA1(
                                                          fontSize:
                                                              kFourteenFont,
                                                          color: white,
                                                          fontWeight: kFW700,
                                                        ),
                                                      ),
                                                      Text(
                                                        allCourses[index]
                                                            .allLessons
                                                            .toString(),
                                                        style: GoogleFonts
                                                            .gothicA1(
                                                          fontSize: kTwelveFont,
                                                          color: white,
                                                          fontWeight: kFW700,
                                                        ),
                                                      ),
                                                      SizedBox(height: 10.h),
                                                      allCourses[index]
                                                                  .duration !=
                                                              0
                                                          ? Text(
                                                              "Duration",
                                                              style: GoogleFonts
                                                                  .gothicA1(
                                                                fontSize:
                                                                    kFourteenFont,
                                                                color: white,
                                                                fontWeight:
                                                                    kFW700,
                                                              ),
                                                            )
                                                          : const SizedBox(),
                                                      allCourses[index]
                                                                  .duration !=
                                                              0
                                                          ? Text(
                                                              allCourses[index]
                                                                  .duration
                                                                  .toString(),
                                                              style: GoogleFonts
                                                                  .gothicA1(
                                                                fontSize:
                                                                    kTwelveFont,
                                                                color: white,
                                                                fontWeight:
                                                                    kFW700,
                                                              ),
                                                            )
                                                          : const SizedBox(),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              SizedBox(
                                                height: 10.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  allCourses[index]
                                                          .courseReviews!
                                                          .isEmpty
                                                      ? const SizedBox()
                                                      : RatingBar.builder(
                                                          initialRating: double
                                                              .parse(allCourses[
                                                                      index]
                                                                  .courseReviews![
                                                                      0]
                                                                  .rating!),
                                                          minRating: 1,
                                                          direction:
                                                              Axis.horizontal,
                                                          allowHalfRating: true,
                                                          itemCount: 5,
                                                          itemSize: 20,
                                                          unratedColor: white,
                                                          itemPadding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      2),
                                                          itemBuilder:
                                                              (context, _) =>
                                                                  const Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                            size: 10,
                                                          ),
                                                          onRatingUpdate:
                                                              (rating) {},
                                                        ),
                                                  SizedBox(
                                                    height: 40.h,
                                                    width: 110.w,
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Get.toNamed(
                                                          KProductionScreen,
                                                          arguments:
                                                              allCourses[index]
                                                                      .id ??
                                                                  "",
                                                        );
                                                      },
                                                      style:
                                                          TextButton.styleFrom(
                                                        backgroundColor: grey,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.r),
                                                          side:
                                                              const BorderSide(
                                                                  color: grey),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        "View",
                                                        style: GoogleFonts
                                                            .gothicA1(
                                                          fontSize:
                                                              kFourteenFont,
                                                          color: white,
                                                          fontWeight: kFW600,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            )
                      : const Center(
                          child: CircularProgressIndicator(
                            color: Gold,
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

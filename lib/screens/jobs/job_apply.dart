import 'dart:ui';

import 'package:bossjobs/models/job_model.dart';
import 'package:dio/dio.dart' as dio;

import '../../utils/export_file.dart';

class JobApply extends StatefulWidget {
  const JobApply({super.key});

  @override
  State<JobApply> createState() => _JobApplyState();
}

class _JobApplyState extends State<JobApply> {
  bool isLoading = false;
  List<JobModel> allJobs = [];
  List<JobModel> appliedJobs = [];

  Future browseJobHandler() async {
    setState(() {
      isLoading = true;
    });

    allJobs.clear();

    dio.Response response = await Services.getAllJobs();
    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        response.data['data'].forEach((v) => allJobs.add(JobModel.fromJson(v)));
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  Future appliedJobHandler() async {
    setState(() {
      isLoading = true;
    });

    appliedJobs.clear();

    dio.Response response = await Services.getAppliedJobs();
    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        response.data['data']
            .forEach((v) => appliedJobs.add(JobModel.fromJson(v)));
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  Future addJobToWishList(int id) async {
    dio.Response response = await Services.addOrRemoveJobFromWishlist(id);

    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        Fluttertoast.showToast(msg: response.data['data']['message']);
      }
      browseJobHandler();
      appliedJobHandler();
    }
  }

  Future applyForJobHandler(int id) async {
    dio.Response response = await Services.applyForJob(id);

    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        Fluttertoast.showToast(msg: response.data['data']['message']);
      }
      browseJobHandler();
      appliedJobHandler();
    }
  }

  @override
  void initState() {
    super.initState();
    browseJobHandler();
    appliedJobHandler();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: kBackground,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: darktwo,
          iconTheme: const IconThemeData(color: white),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Applied Jobs',
            style: GoogleFonts.gothicA1(
              letterSpacing: 1,
              fontSize: kEighteenFont,
              color: white,
              fontWeight: kFW700,
            ),
          ),
          actions: [
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 12.w),
            //   child: GestureDetector(
            //     onTap: () {
            //       Get.toNamed(KWish_List);
            //     },
            //     child: Image.asset(
            //       'assets/images/love.png',
            //       width: 18.w,
            //     ),
            //   ),
            // ),
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
                      child: const CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 13.w,
            )
          ],
          // flexibleSpace: Image.asset(
          //   'assets/images/background.gif',
          //   height: double.infinity,
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Container(
              // color: white.withOpacity(0.5),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 30.h,
              //padding: EdgeInsets.only(left: 5.w, right: 5.w),
              margin: EdgeInsets.only(left: 10.w, right: 10.w),
              child: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: grey,

                  // boxShadow: [
                  //   BoxShadow(
                  //       blurRadius: 10.r,
                  //       spreadRadius: 5,
                  //       color: Color.fromARGB(255, 11, 2, 2).withOpacity(0.4)),
                  // ],
                  // gradient: LinearGradient(
                  //   begin: Alignment.topLeft,
                  //   end: Alignment.bottomRight,
                  //   colors: [
                  //     grey.withOpacity(0.5),
                  //     grey1.withOpacity(0.5),
                  //     const Color.fromARGB(255, 58, 55, 55).withOpacity(0.1),
                  //   ],
                  // ),
                ),
                labelColor: Gold,
                labelStyle: GoogleFonts.gothicA1(
                  color: whitetwo,
                  fontWeight: kFW700,
                  fontSize: kTwelveFont,
                ),
                unselectedLabelColor: white,
                tabs: const [
                  Tab(
                    child: Text("Applied Jobs"),
                  ),
                  Tab(
                    child: Text("Invited"),
                  ),
                  Tab(
                    child: Text("Shared"),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            const Background(),
            Container(
              margin: EdgeInsets.all(15.w),
              child: TabBarView(
                children: [
                  appliedJobs.isNotEmpty
                      ? SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              isLoading == false
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: appliedJobs.length,
                                      itemBuilder: ((context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                              KJob_Description,
                                              arguments:
                                                  appliedJobs[index].id ?? "",
                                            );
                                          },
                                          child: GlassmorphicContainer(
                                            margin:
                                                EdgeInsets.only(bottom: 15.h),
                                            height: 100.h,
                                            width: double.infinity,
                                            borderRadius: 10.r,
                                            blur: 15,
                                            alignment: Alignment.center,
                                            border: 2,
                                            linearGradient: LinearGradient(
                                              colors: [
                                                white.withOpacity(0.15),

                                                white.withOpacity(0.15),

                                                // kBackground.withOpacity(0.7),
                                                // kBackground.withOpacity(0.7)
                                                // white.withOpacity(0.15),
                                                // white.withOpacity(0.15)
                                              ],
                                              // begin: Alignment.topLeft,
                                              // end: Alignment.bottomRight,
                                            ),
                                            // linearGradient: LinearGradient(
                                            //   colors: [
                                            //     kBackground.withOpacity(0.7),
                                            //     kBackground.withOpacity(0.7)
                                            //     // white.withOpacity(0.15),
                                            //     // white.withOpacity(0.15)
                                            //   ],
                                            //   begin: Alignment.topLeft,
                                            //   end: Alignment.bottomRight,
                                            // ),
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
                                                        EdgeInsets.all(10.r),
                                                    decoration: BoxDecoration(
                                                      border: GradientBoxBorder(
                                                        gradient: LinearGradient(
                                                            begin: Alignment
                                                                .topLeft,
                                                            end: Alignment
                                                                .bottomRight,
                                                            colors: [
                                                              kBackground,
                                                              kBackground,
                                                              kBackground,
                                                              Colors
                                                                  .transparent,
                                                              Gold,
                                                            ]),

                                                        // gradient: LinearGradient(
                                                        //     begin: Alignment
                                                        //         .topLeft,
                                                        //     end: Alignment
                                                        //         .bottomRight,
                                                        //     colors: [
                                                        //       kBackground,
                                                        //       kBackground,
                                                        //       kBackground,
                                                        //       kBackground,
                                                        //       Gold,
                                                        //       Gold
                                                        //     ]),
                                                        width: 0.5,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          appliedJobs[index]
                                                                  .title ??
                                                              "",
                                                          maxLines: 1,
                                                          style: GoogleFonts
                                                              .gothicA1(
                                                            fontSize:
                                                                kSixteenFont,
                                                            color: whitetwo,
                                                            fontWeight: kFW700,
                                                          ),
                                                        ),
                                                        Text(
                                                          appliedJobs[index]
                                                              .company!
                                                              .title!,
                                                          style: GoogleFonts
                                                              .gothicA1(
                                                            fontSize: 13.sp,
                                                            color: klightdark,
                                                            fontWeight: kFW500,
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Image.asset(
                                                                  'assets/images/link.png',
                                                                  width: 18.w,
                                                                ),
                                                                SizedBox(
                                                                  width: 5.w,
                                                                ),
                                                                Text(
                                                                  appliedJobs[
                                                                          index]
                                                                      .cities![
                                                                          0]
                                                                      .name!,
                                                                  // "Hyderabad, Telangana",
                                                                  style: GoogleFonts
                                                                      .gothicA1(
                                                                    fontSize:
                                                                        10.sp,
                                                                    color:
                                                                        white,
                                                                    fontWeight:
                                                                        kFW700,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Text(
                                                              appliedJobs[index]
                                                                      .candidateJob!
                                                                      .candidate_job_statuss ??
                                                                  "No Status",
                                                              style: GoogleFonts
                                                                  .gothicA1(
                                                                fontSize:
                                                                    kTenFont,
                                                                color: Gold,
                                                                fontWeight:
                                                                    kFW800,
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
                                  : const Center(
                                      child: CircularProgressIndicator(
                                          color: Gold),
                                    ),
                              SizedBox(
                                height: 50.h,
                              ),
                            ],
                          ),
                        )
                      : Center(
                          child: Text(
                            "You haven't applied for any job",
                            style: GoogleFonts.gothicA1(
                              fontSize: kTwelveFont,
                              color: white,
                              fontWeight: kFW600,
                            ),
                          ),
                        ),
                  appliedJobs.isNotEmpty
                      ? SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              isLoading == false
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: appliedJobs.length,
                                      itemBuilder: ((context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                              KJob_Description,
                                              arguments:
                                                  appliedJobs[index].id ?? "",
                                            );
                                          },
                                          child: GlassmorphicContainer(
                                            margin:
                                                EdgeInsets.only(bottom: 15.h),
                                            height: 100.h,
                                            width: double.infinity,
                                            borderRadius: 10.r,
                                            blur: 15,
                                            alignment: Alignment.center,
                                            border: 2,
                                            linearGradient: LinearGradient(
                                              colors: [
                                                white.withOpacity(0.15),

                                                white.withOpacity(0.15),

                                                // kBackground.withOpacity(0.7),
                                                // kBackground.withOpacity(0.7)
                                                // white.withOpacity(0.15),
                                                // white.withOpacity(0.15)
                                              ],
                                              // begin: Alignment.topLeft,
                                              // end: Alignment.bottomRight,
                                            ),
                                            // linearGradient: LinearGradient(
                                            //   colors: [
                                            //     kBackground.withOpacity(0.7),
                                            //     kBackground.withOpacity(0.7)
                                            //     // white.withOpacity(0.15),
                                            //     // white.withOpacity(0.15)
                                            //   ],
                                            //   begin: Alignment.topLeft,
                                            //   end: Alignment.bottomRight,
                                            // ),
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
                                                        EdgeInsets.all(10.r),
                                                    decoration: BoxDecoration(
                                                      border: GradientBoxBorder(
                                                        gradient: LinearGradient(
                                                            begin: Alignment
                                                                .topLeft,
                                                            end: Alignment
                                                                .bottomRight,
                                                            colors: [
                                                              kBackground,
                                                              kBackground,
                                                              kBackground,
                                                              Colors
                                                                  .transparent,
                                                              Gold,
                                                            ]),

                                                        // gradient: LinearGradient(
                                                        //     begin: Alignment
                                                        //         .topLeft,
                                                        //     end: Alignment
                                                        //         .bottomRight,
                                                        //     colors: [
                                                        //       kBackground,
                                                        //       kBackground,
                                                        //       kBackground,
                                                        //       kBackground,
                                                        //       Gold,
                                                        //       Gold
                                                        //     ]),
                                                        width: 0.5,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          appliedJobs[index]
                                                                  .title ??
                                                              "",
                                                          maxLines: 1,
                                                          style: GoogleFonts
                                                              .gothicA1(
                                                            fontSize:
                                                                kSixteenFont,
                                                            color: whitetwo,
                                                            fontWeight: kFW700,
                                                          ),
                                                        ),
                                                        Text(
                                                          appliedJobs[index]
                                                              .company!
                                                              .title!,
                                                          style: GoogleFonts
                                                              .gothicA1(
                                                            fontSize: 13.sp,
                                                            color: klightdark,
                                                            fontWeight: kFW500,
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Image.asset(
                                                                  'assets/images/link.png',
                                                                  width: 18.w,
                                                                ),
                                                                SizedBox(
                                                                  width: 5.w,
                                                                ),
                                                                Text(
                                                                  appliedJobs[
                                                                          index]
                                                                      .cities![
                                                                          0]
                                                                      .name!,
                                                                  // "Hyderabad, Telangana",
                                                                  style: GoogleFonts
                                                                      .gothicA1(
                                                                    fontSize:
                                                                        10.sp,
                                                                    color:
                                                                        white,
                                                                    fontWeight:
                                                                        kFW700,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Text(
                                                              "Applied",
                                                              style: GoogleFonts
                                                                  .gothicA1(
                                                                fontSize:
                                                                    kTenFont,
                                                                color: Gold,
                                                                fontWeight:
                                                                    kFW800,
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
                                  : const Center(
                                      child: CircularProgressIndicator(
                                        color: Gold,
                                      ),
                                    ),
                              SizedBox(
                                height: 50.h,
                              ),
                            ],
                          ),
                        )
                      : Center(
                          child: Text(
                            "You haven't applied for any job",
                            style: GoogleFonts.gothicA1(
                              fontSize: kTwelveFont,
                              color: white,
                              fontWeight: kFW600,
                            ),
                          ),
                        ),
                  appliedJobs.isNotEmpty
                      ? SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              isLoading == false
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: appliedJobs.length,
                                      itemBuilder: ((context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Get.toNamed(
                                              KJob_Description,
                                              arguments:
                                                  appliedJobs[index].id ?? "",
                                            );
                                          },
                                          child: GlassmorphicContainer(
                                            margin:
                                                EdgeInsets.only(bottom: 15.h),
                                            height: 100.h,
                                            width: double.infinity,
                                            borderRadius: 10.r,
                                            blur: 15,
                                            alignment: Alignment.center,
                                            border: 2,
                                            linearGradient: LinearGradient(
                                              colors: [
                                                white.withOpacity(0.15),

                                                white.withOpacity(0.15),

                                                // kBackground.withOpacity(0.7),
                                                // kBackground.withOpacity(0.7)
                                                // white.withOpacity(0.15),
                                                // white.withOpacity(0.15)
                                              ],
                                              // begin: Alignment.topLeft,
                                              // end: Alignment.bottomRight,
                                            ),
                                            // linearGradient: LinearGradient(
                                            //   colors: [
                                            //     kBackground.withOpacity(0.7),
                                            //     kBackground.withOpacity(0.7)
                                            //     // white.withOpacity(0.15),
                                            //     // white.withOpacity(0.15)
                                            //   ],
                                            //   begin: Alignment.topLeft,
                                            //   end: Alignment.bottomRight,
                                            // ),
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
                                                        EdgeInsets.all(10.r),
                                                    decoration: BoxDecoration(
                                                      border: GradientBoxBorder(
                                                        gradient: LinearGradient(
                                                            begin: Alignment
                                                                .topLeft,
                                                            end: Alignment
                                                                .bottomRight,
                                                            colors: [
                                                              kBackground,
                                                              kBackground,
                                                              kBackground,
                                                              Colors
                                                                  .transparent,
                                                              Gold,
                                                            ]),

                                                        // gradient: LinearGradient(
                                                        //     begin: Alignment
                                                        //         .topLeft,
                                                        //     end: Alignment
                                                        //         .bottomRight,
                                                        //     colors: [
                                                        //       kBackground,
                                                        //       kBackground,
                                                        //       kBackground,
                                                        //       kBackground,
                                                        //       Gold,
                                                        //       Gold
                                                        //     ]),
                                                        width: 0.5,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          appliedJobs[index]
                                                                  .title ??
                                                              "",
                                                          maxLines: 1,
                                                          style: GoogleFonts
                                                              .gothicA1(
                                                            fontSize:
                                                                kSixteenFont,
                                                            color: whitetwo,
                                                            fontWeight: kFW700,
                                                          ),
                                                        ),
                                                        Text(
                                                          appliedJobs[index]
                                                              .company!
                                                              .title!,
                                                          style: GoogleFonts
                                                              .gothicA1(
                                                            fontSize: 13.sp,
                                                            color: klightdark,
                                                            fontWeight: kFW500,
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Image.asset(
                                                                  'assets/images/link.png',
                                                                  width: 18.w,
                                                                ),
                                                                SizedBox(
                                                                  width: 5.w,
                                                                ),
                                                                Text(
                                                                  appliedJobs[
                                                                          index]
                                                                      .cities![
                                                                          0]
                                                                      .name!,
                                                                  // "Hyderabad, Telangana",
                                                                  style: GoogleFonts
                                                                      .gothicA1(
                                                                    fontSize:
                                                                        10.sp,
                                                                    color:
                                                                        white,
                                                                    fontWeight:
                                                                        kFW700,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Text(
                                                              "Applied",
                                                              style: GoogleFonts
                                                                  .gothicA1(
                                                                fontSize:
                                                                    kTenFont,
                                                                color: Gold,
                                                                fontWeight:
                                                                    kFW800,
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
                                  : const Center(
                                      child: CircularProgressIndicator(
                                        color: Gold,
                                      ),
                                    ),
                              SizedBox(
                                height: 50.h,
                              ),
                            ],
                          ),
                        )
                      : Center(
                          child: Text(
                            "You haven't applied for any job",
                            style: GoogleFonts.gothicA1(
                              fontSize: kTwelveFont,
                              color: white,
                              fontWeight: kFW600,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

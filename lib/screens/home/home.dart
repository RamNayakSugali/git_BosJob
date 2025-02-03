import 'dart:convert';

import 'package:bossjobs/screens/home/get_started.dart';
import 'package:bossjobs/utils/export_file.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List accessrequest = [];

  bool isLoading = false;
  Future accessHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.getaccessrequest();
    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      // print("new");
      // print(data["data"]["data"]["course"]["all"]);
      // accessrequest = data["data"];
      accessrequest = data["data"]["data"];
    }
    setState(() {
      isLoading = false;
    });
  }

  Map profiledata = {};
//List<dynamic> profiledata = [];
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
    if (data["success"] != 0) {
      setState(() {
        UserSimplePreferences.setCandidateId(
            id: data["data"]["candidates"]["CandidateDetails"]["id"]
                .toString());
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  Map userData = {};
  @override
  void initState() {
    setState(() {
      userData = jsonDecode(UserSimplePreferences.getUserdata().toString());
    });
    super.initState();
    accessHandler();
    profileHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        automaticallyImplyLeading: false,
        backgroundColor: darktwo,
        elevation: 0,
        title: Image.asset(
          'assets/images/logo.png',
          width: 120.w,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(KSearch);
            },
            child: Image.asset(
              'assets/images/searched.png',
              width: 22.w,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          // GestureDetector(
          //   onTap: () {
          //     Get.toNamed(KWishListTabs);
          //   },
          //   child: Container(
          //     //color: white,
          //     //   margin: EdgeInsets.only(top: 15.h, right: 15.w),
          //     child: Image.asset(
          //       //'assets/images/love.png',
          //       'assets/images/love.png',
          //       width: 18.w,
          //     ),
          //   ),
          // ),

          // GestureDetector(
          //     onTap: () {
          //       Get.toNamed(KWishListTabs);
          //     },
          //     child: Icon(Icons.favorite_border)),
          // SizedBox(
          //   width: 8.w,
          // ),
          Center(
            child: GlassmorphicContainer(
              margin: EdgeInsets.only(left: 10.w),
              height: 28.h,
              width: 28.h,
              borderRadius: 50.r,
              blur: 15,
              alignment: Alignment.center,
              border: 0.5,
              linearGradient: LinearGradient(
                colors: [white.withOpacity(0.1), white.withOpacity(0.01)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderGradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    white.withOpacity(0.5),
                    white.withOpacity(0.5),
                    Gold.withOpacity(0.5)
                  ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Stack(
                  children: [
                    // Container(
                    //   //color: white,
                    //   margin: EdgeInsets.only(top: 15.h, right: 15.w),
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       Get.toNamed(KWish_List);
                    //     },
                    //     child: Image.asset(
                    //       //'assets/images/love.png',
                    //       'assets/images/love.png',
                    //       width: 18.w,
                    //     ),
                    //   ),
                    // ),
                    Positioned(
                      // left: 18,
                      // top: 3.5,
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(KNotification);
                            },
                            child: Image.asset(
                              'assets/images/bell.png',
                              width: 15.w,
                            ),
                          ),
                          Positioned(
                              left: 8.r,
                              //top: .h,
                              child: const CircleAvatar(
                                radius: 3,
                                backgroundColor: Colors.green,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          PopupMenuButton(
              color: kBackground.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.h))),
              icon: profiledata.isNotEmpty
                  ? profiledata["candidates"]["Userdetails"]["profile_pic"] !=
                          null
                      ? CircleAvatar(
                          backgroundColor: kBackground,
                          backgroundImage: NetworkImage(
                              "$kProfileURL${profiledata["candidates"]["Userdetails"]["profile_pic"]}"),
                          radius: 35,
                        )
                      : CircleAvatar(
                          backgroundColor: kBackground,
                          radius: 35,
                          child: Image.asset('assets/images/man.png'),
                        )
                  : CircleAvatar(
                      backgroundColor: kBackground,
                      radius: 35,
                      child: Image.asset('assets/images/man.png'),
                    ),
              itemBuilder: (BuildContext context) {
                return [
                  if (userData["is_coach"] == "1") ...[
                    PopupMenuItem<int>(
                        value: 0,
                        child: ListTile(
                          horizontalTitleGap: 0,
                          contentPadding: EdgeInsets.all(0),
                          leading: Image.asset(
                            'assets/images/Counselor icon.png',
                            width: 22.w,
                          ),
                          title: Text("Coach",
                              //maxLines: 2,
                              // textAlign: TextAlign.left,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kFourteenFont,
                                  color: white,
                                  fontWeight: kFW700)),
                        ))
                  ],
                  if (userData["is_institute"] == "1") ...[
                    PopupMenuItem<int>(
                        value: 0,
                        child: ListTile(
                          horizontalTitleGap: 0,
                          contentPadding: EdgeInsets.all(0),
                          leading: Image.asset(
                            'assets/images/Counselor icon.png',
                            width: 22.w,
                          ),
                          title: Text("Institute",
                              //maxLines: 2,
                              // textAlign: TextAlign.left,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kFourteenFont,
                                  color: white,
                                  fontWeight: kFW700)),
                        ))
                  ],
                  if (userData["is_company"] == "1") ...[
                    PopupMenuItem<int>(
                        value: 0,
                        child: ListTile(
                          horizontalTitleGap: 0,
                          contentPadding: EdgeInsets.all(0),
                          leading: Image.asset(
                            'assets/images/Counselor icon.png',
                            width: 22.w,
                          ),
                          title: Text("Company",
                              //maxLines: 2,
                              // textAlign: TextAlign.left,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kFourteenFont,
                                  color: white,
                                  fontWeight: kFW700)),
                        ))
                  ],
                  if (userData["is_placement_officer"] == "1") ...[
                    PopupMenuItem<int>(
                        value: 0,
                        child: ListTile(
                          horizontalTitleGap: 0,
                          contentPadding: EdgeInsets.all(0),
                          leading: Image.asset(
                            'assets/images/Counselor icon.png',
                            width: 22.w,
                          ),
                          title: Text("Placement Officer",
                              //maxLines: 2,
                              // textAlign: TextAlign.left,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kFourteenFont,
                                  color: white,
                                  fontWeight: kFW700)),
                        ))
                  ],
                  if (userData["is_counseller"] == "1") ...[
                    PopupMenuItem<int>(
                        value: 0,
                        child: ListTile(
                          horizontalTitleGap: 0,
                          contentPadding: EdgeInsets.all(0),
                          leading: Image.asset(
                            'assets/images/Counselor icon.png',
                            width: 22.w,
                          ),
                          title: Text("Counceller",
                              //maxLines: 2,
                              // textAlign: TextAlign.left,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kFourteenFont,
                                  color: white,
                                  fontWeight: kFW700)),
                        ))
                  ],
                  if (userData["is_student"] == "1") ...[
                    PopupMenuItem<int>(
                        value: 0,
                        child: ListTile(
                          horizontalTitleGap: 0,
                          contentPadding: EdgeInsets.all(0),
                          leading: Image.asset(
                            'assets/images/Counselor icon.png',
                            width: 22.w,
                          ),
                          title: Text("Student",
                              //maxLines: 2,
                              // textAlign: TextAlign.left,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kFourteenFont,
                                  color: white,
                                  fontWeight: kFW700)),
                        ))
                  ],
                  if (userData["is_superadmin"] == "1") ...[
                    PopupMenuItem<int>(
                        value: 0,
                        child: ListTile(
                          horizontalTitleGap: 0,
                          contentPadding: EdgeInsets.all(0),
                          leading: Image.asset(
                            'assets/images/Counselor icon.png',
                            width: 22.w,
                          ),
                          title: Text("Super Admin",
                              //maxLines: 2,
                              // textAlign: TextAlign.left,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kFourteenFont,
                                  color: white,
                                  fontWeight: kFW700)),
                        ))
                  ],
                  PopupMenuItem<int>(
                      value: 0,
                      child: ListTile(
                        horizontalTitleGap: 0,
                        contentPadding: EdgeInsets.all(0),
                        leading: Image.asset(
                          'assets/images/Counselor icon.png',
                          width: 22.w,
                        ),
                        title: Text("Profile",
                            //maxLines: 2,
                            // textAlign: TextAlign.left,
                            style: GoogleFonts.gothicA1(
                                fontSize: kFourteenFont,
                                color: white,
                                fontWeight: kFW700)),
                      ))
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  Get.toNamed(Kprofile);
                } else if (value == 1) {
                  Get.toNamed(Kprofile);
                  Get.toNamed(Kprofile);
                }
              }),
          // PopupMenuButton(
          //     color: kBackground.withOpacity(0.5),
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.all(Radius.circular(10.h))),
          //     icon: Image.asset(
          //       'assets/images/man.png',
          //     ),
          //     itemBuilder: (BuildContext context) {
          //       return [
          //         PopupMenuItem<int>(
          //             value: 0,
          //             child: ListTile(
          //               horizontalTitleGap: 0,
          //               contentPadding: EdgeInsets.all(0),
          //               leading: Image.asset(
          //                 'assets/images/Counselor icon.png',
          //                 width: 22.w,
          //               ),
          //               title: Text("Counselor",
          //                   //maxLines: 2,
          //                   // textAlign: TextAlign.left,
          //                   style: GoogleFonts.gothicA1(
          //                       fontSize: kFourteenFont,
          //                       color: white,
          //                       fontWeight: kFW700)),
          //             )
          //             // child: Row(
          //             //   crossAxisAlignment: CrossAxisAlignment.center,
          //             //   children: [
          //             //     Image.asset(
          //             //       'assets/images/Counselor icon.png',
          //             //       width: 25.w,
          //             //     ),
          //             //     SizedBox(width: 10.w),
          //             //     Text("Counselor",
          //             //         //maxLines: 2,
          //             //         style: GoogleFonts.gothicA1(
          //             //             fontSize: kTwelveFont,
          //             //             color: white,
          //             //             fontWeight: kFW700)),
          //             //   ],
          //             // ),
          //             ),
          //         PopupMenuItem<int>(
          //             value: 1,
          //             child: ListTile(
          //               horizontalTitleGap: 0,
          //               contentPadding: EdgeInsets.all(0),
          //               leading: Image.asset(
          //                 'assets/images/victor.png',
          //                 width: 20.w,
          //               ),
          //               title: Text("Employer",
          //                   //maxLines: 2,
          //                   // textAlign: TextAlign.left,
          //                   style: GoogleFonts.gothicA1(
          //                       fontSize: kFourteenFont,
          //                       color: white,
          //                       fontWeight: kFW700)),
          //             )
          //             // child: Row(
          //             //   crossAxisAlignment: CrossAxisAlignment.center,
          //             //   children: [
          //             //     Image.asset(
          //             //       'assets/images/victor.png',
          //             //       width: 25.w,
          //             //     ),
          //             //     SizedBox(width: 10.w),
          //             //     Text("Employer",
          //             //         //maxLines: 2,
          //             //         style: GoogleFonts.gothicA1(
          //             //             fontSize: kTwelveFont,
          //             //             color: white,
          //             //             fontWeight: kFW700)),
          //             //   ],
          //             // ),
          //             ),
          //         PopupMenuItem<int>(
          //             value: 2,
          //             child: ListTile(
          //               horizontalTitleGap: 0,
          //               contentPadding: EdgeInsets.all(0),
          //               leading: Image.asset(
          //                 'assets/images/graduate.png',
          //                 width: 20.w,
          //               ),
          //               title: Text("Learner",
          //                   //maxLines: 2,
          //                   // textAlign: TextAlign.left,
          //                   style: GoogleFonts.gothicA1(
          //                       fontSize: kFourteenFont,
          //                       color: white,
          //                       fontWeight: kFW700)),
          //             ))
          //       ];
          //     },
          //     onSelected: (value) {
          //       if (value == 0) {
          //         print("My account menu is selected.");
          //       } else if (value == 1) {
          //         print("Settings menu is selected.");
          //       } else if (value == 2) {
          //         Get.toNamed(Kprofile);
          //       }
          //     }),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.gif',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(15.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const banner(),
                  SizedBox(
                    height: 20.h,
                  ),
                  const glass_card(),
                  SizedBox(
                    height: 10.h,
                  ),
                  const GetStarted(),
                  SizedBox(
                    height: 25.h,
                  ),
                  // const people_video(),
                  // // SizedBox(
                  // //   height: 30.h,
                  // // ),
                  // const Careers_view(),
                  // SizedBox(
                  //   height: 35.h,
                  // ),
                  // const Transformation(),
                  // // SizedBox(
                  // //   height: 35.h,
                  // // ),
                  // const Explore(),
                  // SizedBox(
                  //   height: 15.h,
                  // ),
                  // const learing_bossjobs(),
                  // SizedBox(
                  //   height: 30.h,
                  // ),
                  // Text(
                  //   "Recommended",
                  //   style: GoogleFonts.gothicA1(
                  //       fontSize: kSixteenFont,
                  //       color: white,
                  //       fontWeight: kFW700),
                  // ),
                  // SizedBox(
                  //   height: 15.h,
                  // ),
                  // Recommended(),
                  // SizedBox(
                  //   height: 30.h,
                  // ),
                  // // Text(
                  // //   "Some Success Story",
                  // //   style: GoogleFonts.gothicA1(fontSize: kSixteenFont, color: white, fontWeight: kFW700),
                  // // ),
                  // // SizedBox(
                  // //   height: 15.h,
                  // // ),
                  // // const SucceedStory(),
                  // // SizedBox(
                  // //   height: 35.h,
                  // // ),
                  // // const Bar_chat(),
                  // SizedBox(
                  //   height: 70.h,
                  // ),
                  // const Subscriptions(),
                  SizedBox(
                    height: 100.h,
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

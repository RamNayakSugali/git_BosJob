import 'dart:convert';

import '../../utils/export_file.dart';

class CoachDashboard extends StatefulWidget {
  const CoachDashboard({super.key});

  @override
  State<CoachDashboard> createState() => _CoachDashboardState();
}

class _CoachDashboardState extends State<CoachDashboard> {
  Map userData = {};
  @override
  void initState() {
    setState(() {
      userData = jsonDecode(UserSimplePreferences.getUserdata().toString());
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        automaticallyImplyLeading: false,
        backgroundColor: kBackground,
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
          Center(
            child: GlassmorphicContainer(
              margin: EdgeInsets.only(left: 10.w),
              height: 35.h,
              width: 35.h,
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
              icon: Image.asset(
                'assets/images/man.png',
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
                  SizedBox(
                    height: 15.h,
                  ),
                  CoachSchedule(),
                  SizedBox(
                    height: 20.h,
                  ),
                  CoachLiveCourses()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

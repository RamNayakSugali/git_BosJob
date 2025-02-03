import 'dart:ui';

import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

import '../../utils/export_file.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // var id = Get.arguments;
  Map profiledata = {};
//List<dynamic> profiledata = [];
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
    print(data["data"]["data"]);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    profileHandler();
  }

  final String EDIT = 'assets/images/edit_skill.svg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackground,
        appBar: AppBar(
          backgroundColor: darktwo,
          elevation: 0,
          centerTitle: false,
           iconTheme: const IconThemeData(color: white),
          title: Text(
            'Profile',
            style: GoogleFonts.gothicA1(
                fontSize: 17.sp, color: white, fontWeight: kFW700),
          ),
          actions: [
            Row(
              children: [
                GestureDetector(
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
            const Background(),
            SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.all(15.w),
                  child: Column(
                    children: [
                      isLoading == false
                          ? Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                profiledata["candidates"]["Userdetails"]
                                            ["profile_pic"] !=
                                        null
                                    ? CircleAvatar(
                                        backgroundColor: kBackground,
                                        backgroundImage: NetworkImage(
                                            "$kProfileURL${profiledata["candidates"]["Userdetails"]["profile_pic"]}"),
                                        radius: 50.r,
                                      )
                                    : CircleAvatar(
                                        backgroundColor: kBackground,
                                        radius: 50.r,
                                        child: Image.asset(
                                            'assets/images/man.png'),
                                      ),
                                SizedBox(height: 12.h),
                                SizedBox(
                                  width: 250.w,
                                  child: Text(
                                    profiledata["candidates"]["Userdetails"]
                                        ["name"],
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.gothicA1(
                                        fontSize: 14.sp,
                                        color: white,
                                        fontWeight: kFW900),
                                  ),
                                ),
                                SizedBox(height: 7.h),
                                Text(
                                  profiledata["candidates"]["Userdetails"]
                                      ["default_login"].toString().toUpperCase(),
                                  // "Learner",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.gothicA1(
                                      fontSize: 12.sp,
                                      color: white,
                                      fontWeight: kFW400),
                                ),
                                SizedBox(height: 7.h),
                                profiledata["candidates"]["Userdetails"]
                                            ["city"] !=
                                        null
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/images/link.png',
                                            width: 18.w,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          profiledata["candidates"]
                                                      ["Userdetails"]["city"] !=
                                                  null
                                              ? Text(
                                                  profiledata["candidates"]
                                                              ["Userdetails"]
                                                          ["city"]["name"] +
                                                      ", " +
                                                      profiledata["candidates"]
                                                              ["Userdetails"]
                                                          ["state"]["name"],
                                                  //  profiledata["candidates"]["Userdetails"]["name"],
                                                  //  "Kukatpally, Hyderabad, Telangana.",
                                                  style: GoogleFonts.gothicA1(
                                                    fontSize: kTwelveFont,
                                                    color: white,
                                                    fontWeight: kFW700,
                                                  ),
                                                )
                                              : const SizedBox(),
                                        ],
                                      )
                                    : const SizedBox(),
                                SizedBox(
                                  height: 8.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed(KEdit_Profile,
                                        arguments: profiledata["candidates"]);
                                  },
                                  child: GlassmorphicContainer(
                                    // height: 210.h,
                                    height: 32.h,
                                    width: 95.w,
                                    borderRadius: 20.r,
                                    blur: 15,
                                    alignment: Alignment.center,
                                    border: 0.5,
                                    linearGradient: LinearGradient(
                                      colors: [
                                        white.withOpacity(0.15),
                                        white.withOpacity(0.15),
                                      ],
                                    ),
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
                                            color:
                                                Colors.black.withOpacity(0.1),
                                          )
                                        ],
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 10.0,
                                            sigmaY: 10.0,
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            // padding:
                                            //     EdgeInsets.only(left: 15.w, right: 15.w),
                                            //  padding: EdgeInsets.all(15.r),
                                            decoration: BoxDecoration(
                                              border: const GradientBoxBorder(
                                                gradient: LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: [
                                                      kBackground,
                                                      kBackground,
                                                      kBackground,
                                                      Gold
                                                    ]),
                                                width: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      EDIT,
                                                      color: Gold,
                                                      width: 18.w,
                                                    ),
                                                    SizedBox(
                                                      width: 10.w,
                                                    ),
                                                    Text(
                                                      "Edit",
                                                      style:
                                                          GoogleFonts.gothicA1(
                                                        fontSize: kTwelveFont,
                                                        color: white,
                                                        fontWeight: kFW700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                // SizedBox(
                                                //   height: 15.h,
                                                // ),

                                                // SizedBox(
                                                //   height: 15.h,
                                                // ),

                                                // SizedBox(height: 15.h),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                //  SkillsProfile(),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Let’s get you set up",
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.gothicA1(
                                        fontSize: kSixteenFont,
                                        color: white,
                                        fontWeight: kFW600,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                GlassmorphicContainer(
                                  height: 80.h,
                                  width: double.infinity,
                                  borderRadius: 13.r,
                                  blur: 15,
                                  alignment: Alignment.center,
                                  border: 2,
                                  linearGradient: LinearGradient(
                                      colors: [
                                        white.withOpacity(0.1),
                                        white.withOpacity(0.01)
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                  borderGradient: LinearGradient(
                                      colors: [white.withOpacity(0.5), Gold]),
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
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                  height: 52.h,
                                                  child:
                                                      LiquidLinearProgressIndicator(
                                                    direction: Axis.horizontal,
                                                    value:
                                                        0.25, // Defaults to 0.5.
                                                    valueColor:
                                                        const AlwaysStoppedAnimation(
                                                            Gold), // Defaults to the current Theme's accentColor.
                                                    backgroundColor:
                                                        kBackground.withOpacity(
                                                            0.5), // Defaults to the current Theme's backgroundColor.
                                                    // borderColor: Colors.red,
                                                    // borderWidth: 5.0,
                                                    borderRadius: 0,
                                                    // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                                                    center: Text(
                                                      "35%    Complete your Profile",
                                                      style:
                                                          GoogleFonts.gothicA1(
                                                              fontSize:
                                                                  kTwelveFont,
                                                              color: white,
                                                              fontWeight:
                                                                  kFW500),
                                                    ),
                                                  )
                                                  //Text("data"),
                                                  //     LiquidLinearProgressIndicator(
                                                  //   value: 0.35,
                                                  //   valueColor: AlwaysStoppedAnimation(Gold),
                                                  //   backgroundColor: kBackground,
                                                  //   direction: Axis.horizontal,
                                                  //   center: Container(
                                                  //     padding: EdgeInsets.only(left: 20.w),
                                                  //     alignment: Alignment.centerLeft,
                                                  //     child: Text(
                                                  //       "35%    Complete your Profile",
                                                  //       style: GoogleFonts.gothicA1(
                                                  //           fontSize: kTwelveFont,
                                                  //           color: white,
                                                  //           fontWeight: kFW500),
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 10.w,
                                                    right: 10.w,
                                                    top: 6.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Your profile has 1 item to be improved",
                                                      style:
                                                          GoogleFonts.gothicA1(
                                                              fontSize:
                                                                  kTenFont,
                                                              color: white,
                                                              fontWeight:
                                                                  kFW500),
                                                    ),
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: Gold,
                                                      size: 15.sp,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                              ],
                            )
                          : const Center(
                              child: CircularProgressIndicator(
                              color: Gold,
                            )),
                      Profile_menu(
                        profiledata: profiledata,
                      )
                    ],
                  )),
            ),
          ],
        ));
  }
}

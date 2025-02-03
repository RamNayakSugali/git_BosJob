// ignore_for_file: camel_case_types

import 'dart:convert';
import 'dart:ui';

import '../../utils/export_file.dart';

class Splash_view extends StatefulWidget {
  const Splash_view({super.key});

  @override
  State<Splash_view> createState() => _SplashviewState();
}

class _SplashviewState extends State<Splash_view> {
  bool? isUserLoggedIn;

  @override
  void initState() {
    super.initState();

    isUserLoggedIn = UserSimplePreferences.getLoginStatus();
    Future.delayed(const Duration(seconds: 2), () {
      if (isUserLoggedIn != null && isUserLoggedIn == true) {
        var userDetails =
            jsonDecode(UserSimplePreferences.getUserdata().toString());
  Get.toNamed(kDashboard);
        // userDetails["default_login"] == "student"
        //     ? Get.toNamed(kDashboard)
        //     : Get.toNamed(KCoachDashboard);
      } else {
        Get.toNamed(KLogin);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 70.h,
            ),
            // Container(
            //   margin: EdgeInsets.all(8.r),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       GestureDetector(
            //         onTap: () {
            //           Get.back();
            //         },
            //         child: const Icon(
            //           Icons.arrow_back,
            //           color: white,
            //         ),
            //       ),
            //       Text(
            //         "Skip",
            //         style: GoogleFonts.gothicA1(
            //             fontSize: kTwelveFont,
            //             color: white,
            //             fontWeight: kFW400),
            //       ),
            //     ],
            //   ),
            // ),
            Image.asset(
              'assets/images/girl.png',
              width: 300.w,
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              "Meet the BossJobs",
              style: GoogleFonts.gothicA1(
                  fontSize: kTwentyFourFont, color: white, fontWeight: kFW400),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Meet the Bossjobs for your life future life ",
              style: GoogleFonts.gothicA1(
                  fontSize: 13.sp, color: white, fontWeight: kFW400),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              "Meet the Bossjobs for your life  ",
              style: GoogleFonts.gothicA1(
                  fontSize: 13.sp, color: white, fontWeight: kFW400),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              "Meet the Bossjobs for your",
              style: GoogleFonts.gothicA1(
                  fontSize: 13.sp, color: white, fontWeight: kFW400),
            ),
            SizedBox(
              height: 25.h,
            ),
            GlassmorphicContainer(
              margin: EdgeInsets.all(13.r),
              height: 40.h,
              width: double.infinity,
              borderRadius: 10.r,
              blur: 15,
              alignment: Alignment.center,
              border: 2,
              linearGradient: LinearGradient(colors: [
                grey1..withOpacity(0.3),
                //grey1.withOpacity(0.2),
                Colors.black.withOpacity(1)
              ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              borderGradient:
                  LinearGradient(colors: [white.withOpacity(0.5), Gold]),
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 10,
                    color: Colors.black.withOpacity(0.1),
                  )
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 20.0,
                      sigmaY: 20.0,
                    ),
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: const GradientBoxBorder(
                              gradient: LinearGradient(
                                  colors: [Colors.white38, Gold]),
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: SizedBox(
                          height: 40.h,
                          width: 338.5.w,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(kSplashPage);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                  white.withOpacity(0.08),
                                ),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        side: BorderSide(
                                          color: white.withOpacity(0.1),
                                        )))),
                            child: Text(
                              "Next",
                              style: GoogleFonts.gothicA1(
                                  fontSize: kSixteenFont,
                                  color: white,
                                  fontWeight: kFW700),
                            ),
                          ),
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: camel_case_types

import 'dart:ui';

import 'package:bossjobs/utils/export_file.dart';

class people_video extends StatefulWidget {
  const people_video({super.key});

  @override
  State<people_video> createState() => _peoplevideoState();
}

class _peoplevideoState extends State<people_video> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Peoples of Bossjobs",
          style: GoogleFonts.gothicA1(
              fontSize: kSixteenFont, color: white, fontWeight: kFW700),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          // color: Colors.blue,
          height: 311.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GlassmorphicContainer(
                      margin: EdgeInsets.only(right: 18.w),
                      height: 280.h,
                      width: 298.w,
                      borderRadius: 15,
                      blur: 15,
                      alignment: Alignment.center,
                      border: 2,
                      linearGradient: LinearGradient(colors: [
                        white.withOpacity(0.1),
                        white.withOpacity(0.01)
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderGradient: LinearGradient(
                          colors: [Colors.white.withOpacity(0.5), Gold]),
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
                            child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: const GradientBoxBorder(
                                      gradient: LinearGradient(
                                          colors: [Colors.white38, Gold]),
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(16.r)),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Stack(
                                      children: [
                                        Image.asset(
                                          'assets/images/video.png',
                                          height: 279.h,
                                          fit: BoxFit.fill,
                                        ),
                                        Positioned(
                                          top: 100.w,
                                          left: 100.w,
                                          child: Center(
                                            child: Image.asset(
                                              'assets/images/play.png',
                                              width: 100.w,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 235.h,
                                          child: Row(
                                            children: [
                                              Container(
                                                alignment: Alignment.topLeft,
                                                padding:
                                                    EdgeInsets.only(left: 15.w),
                                                child: Text(
                                                  "Arnad ",
                                                  style: GoogleFonts.gothicA1(
                                                      fontSize: kTwelveFont,
                                                      color: white,
                                                      fontWeight: kFW600),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "- Student",
                                                  style: GoogleFonts.gothicA1(
                                                      fontSize: kTwelveFont,
                                                      color: Gold,
                                                      fontWeight: kFW600),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Finding The path of Success",
                      style: GoogleFonts.gothicA1(
                          fontSize: kSixteenFont,
                          color: white,
                          fontWeight: kFW600),
                    ),
                  ],
                );
              })),
        ),
      ],
    );
  }
}

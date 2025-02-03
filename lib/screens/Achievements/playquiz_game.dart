// ignore_for_file: camel_case_types

import 'dart:ui';

import '../../../utils/export_file.dart';

class playquiz extends StatefulWidget {
  const playquiz({super.key});

  @override
  State<playquiz> createState() => _playquizState();
}

class _playquizState extends State<playquiz> {
  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
    
      height: 155.h,
      width: double.infinity,
      borderRadius: 15,
      blur: 15,
      alignment: Alignment.center,
      border: 2,
      linearGradient: LinearGradient(
          colors: [white.withOpacity(0.15), white.withOpacity(0.15)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
      borderGradient: LinearGradient(
          colors: [white.withOpacity(0.5), Gold.withOpacity(0.01)]),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            blurRadius: 20,
            spreadRadius: 16,
            color: Colors.black.withOpacity(0.1),
          )
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10.0,
              sigmaY: 10.0,
            ),
            child: Container(
                width: double.infinity,
               // height: 190.h,
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(colors: [Colors.white38, Gold]),
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(16.r)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Play Quiz Game",
                            style: GoogleFonts.gothicA1(
                                fontSize: kSixteenFont,
                                color: white,
                                fontWeight: kFW600)),
                        Text("02/20",
                            style: GoogleFonts.gothicA1(
                                fontSize: kTwelveFont,
                                color: white,
                                fontWeight: kFW700)),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Making Frames',
                              style: GoogleFonts.gothicA1(
                                  fontSize: kFourteenFont,
                                  color: Gold,
                                  fontWeight: kFW700),
                            ),
                            Text(
                              'Create frames based on given size',
                              style: GoogleFonts.gothicA1(
                                  fontSize: kTwelveFont,
                                  color: white,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        SizedBox(width: 30.w),
                        Column(
                          children: [
                            Icon(
                              Icons.play_arrow_outlined,
                              color: white,
                            ),
                            Text(
                              "Play",
                              style: GoogleFonts.gothicA1(
                                  fontSize: kTwelveFont,
                                  color: white,
                                  fontWeight: kFW500),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Making Frames',
                              style: GoogleFonts.gothicA1(
                                  fontSize: kFourteenFont,
                                  color: Gold,
                                  fontWeight: kFW700),
                            ),
                            Text(
                              'Create frames based on given size',
                              style: GoogleFonts.gothicA1(
                                  fontSize: kTwelveFont,
                                  color: white,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        SizedBox(width: 30.w),
                        Column(
                          children: [
                            Icon(
                              Icons.play_arrow_outlined,
                              color: white,
                            ),
                            Text(
                              "Play",
                              style: GoogleFonts.gothicA1(
                                  fontSize: kTwelveFont,
                                  color: white,
                                  fontWeight: kFW500),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

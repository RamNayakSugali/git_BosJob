// ignore_for_file: camel_case_types

import 'dart:ui';

import '../../../utils/export_file.dart';

class Achieve_card extends StatefulWidget {
  const Achieve_card({super.key});

  @override
  State<Achieve_card> createState() => _AchievecardState();
}

class _AchievecardState extends State<Achieve_card> {
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
                //   height: 190.h,
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
                        Text("Achievements",
                            style: GoogleFonts.gothicA1(
                                fontSize: kSixteenFont,
                                color: white,
                                fontWeight: kFW700)),
                        Text("05/20",
                            style: GoogleFonts.gothicA1(
                                fontSize: kTwelveFont,
                                color: white,
                                fontWeight: kFW700)),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              child: Image.asset('assets/images/man.png'),
                            ),
                            SizedBox(width: 5.w),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Fundamental of Figma',
                                  style: GoogleFonts.gothicA1(
                                      fontSize: kFourteenFont,
                                      color: Gold,
                                      fontWeight: kFW700),
                                ),
                                Text(
                                  'Total Marks Obtain',
                                  style: GoogleFonts.gothicA1(
                                      fontSize: kTwelveFont,
                                      color: white,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // SizedBox(width: 20.w),
                        Row(
                          children: [
                            const Icon(
                              Icons.download,
                              color: white,
                            ),
                            SizedBox(width: 10.w),
                            CircularPercentIndicator(
                              reverse: true,
                              backgroundColor: kBackground,
                              radius: 20.0,
                              lineWidth: 4.0,
                              animation: true,
                              percent: 0.7,
                              center: Text(
                                "80%",
                                style: GoogleFonts.gothicA1(
                                    fontSize: kTenFont,
                                    color: white,
                                    fontWeight: kFW600),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Gold,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              child: Image.asset('assets/images/man.png'),
                            ),
                            SizedBox(width: 5.w),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Fundamental of Figma',
                                  style: GoogleFonts.gothicA1(
                                      fontSize: kFourteenFont,
                                      color: Gold,
                                      fontWeight: kFW700),
                                ),
                                Text(
                                  'Total Marks Obtain',
                                  style: GoogleFonts.gothicA1(
                                      fontSize: kTwelveFont,
                                      color: white,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // SizedBox(width: 20.w),
                        Row(
                          children: [
                            const Icon(
                              Icons.download,
                              color: white,
                            ),
                            SizedBox(width: 10.w),
                            CircularPercentIndicator(
                              reverse: true,
                              backgroundColor: kBackground,
                              radius: 20.0,
                              lineWidth: 4.0,
                              animation: true,
                              percent: 0.7,
                              center: Text(
                                "80%",
                                style: GoogleFonts.gothicA1(
                                    fontSize: kTenFont,
                                    color: white,
                                    fontWeight: kFW600),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Gold,
                            ),
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

import 'dart:ui';

import 'package:bossjobs/utils/export_file.dart';

class SucceedStory extends StatefulWidget {
  const SucceedStory({super.key});

  @override
  State<SucceedStory> createState() => _SucceedStoryState();
}

class _SucceedStoryState extends State<SucceedStory> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          GlassmorphicContainer(
            //  height: 280.h,
            height: 290.h,
            width: 380.w,
            borderRadius: 15,
            blur: 15,
            border: 2,
            linearGradient: LinearGradient(
                colors: [white.withOpacity(0.1), white.withOpacity(0.01)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderGradient:
                LinearGradient(colors: [Colors.white.withOpacity(0.5), Gold]),
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
                            gradient:
                                LinearGradient(colors: [Colors.white38, Gold]),
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(16.r)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                'assets/images/degreeboy.png',
                                height: 323.w,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 25.h,
                                left: 15.w,
                                child: Text("From Electrical to CS",
                                    maxLines: 1,
                                    style: GoogleFonts.inter(
                                      fontStyle: FontStyle.italic,
                                      fontSize: kTwentyFourFont,
                                      foreground: Paint()
                                        ..shader = const LinearGradient(
                                          colors: <Color>[
                                            Color.fromARGB(255, 208, 153, 66),
                                            Color.fromARGB(255, 201, 115, 109)
                                            //add more color here.
                                          ],
                                        ).createShader(const Rect.fromLTWH(
                                            0.0, 0.0, 200.0, 100.0)),
                                      fontWeight: kFW800,
                                    )),
                              ),
                              Positioned(
                                bottom: 5.h,
                                left: 120.w,
                                child: Text(
                                  "BossJobs",
                                  style: GoogleFonts.gothicA1(
                                      fontSize: 15.sp,
                                      color: white,
                                      fontWeight: kFW400),
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
          Container(
              width: 121.w,
              height: 40.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      spreadRadius: 5,
                      color: Color.fromARGB(255, 13, 12, 12).withOpacity(0.1),
                    )
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        grey.withOpacity(0.5),
                        grey1.withOpacity(0.5),
                        Color.fromARGB(255, 58, 55, 55).withOpacity(0.1),
                      ])),
              child: Text(
                "Know more",
                style: GoogleFonts.gothicA1(
                    fontSize: 13.sp, color: white, fontWeight: kFW700),
              )),
        ],
      ),
    );
  }
}

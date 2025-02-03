// ignore_for_file: non_constant_identifier_names

import 'dart:ui';

import 'package:bossjobs/utils/export_file.dart';

class Transformation extends StatefulWidget {
  const Transformation({super.key});

  @override
  State<Transformation> createState() => _TransformationState();
}

class _TransformationState extends State<Transformation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Assistance",
          style: GoogleFonts.gothicA1(
              fontSize: kTwentyFont, color: white, fontWeight: kFW700),
        ),
        SizedBox(
          height: 15.h,
        ),
        GlassmorphicContainer(
          // margin: EdgeInsets.all(10.r),
          height: 248.h,
          width: double.infinity,
          borderRadius: 0.r,
          blur: 15,
          alignment: Alignment.center,
          border: 2,
          linearGradient: LinearGradient(
              colors: [white.withOpacity(0.1), white.withOpacity(0.01)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderGradient: LinearGradient(
              colors: [white.withOpacity(0.5), Colors.amber.withOpacity(0.5)]),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 16,
                spreadRadius: 16,
                color: Colors.black.withOpacity(0.1),
              )
            ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
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
                        borderRadius: BorderRadius.circular(0.r)),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/sub.png',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Container(
                          alignment: Alignment.center,
                          color: Colors.black54.withOpacity(0.1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "BOSSJOBS TRANSFORM",
                                style: GoogleFonts.gothicA1(
                                    fontSize: kTwentyFont,
                                    color: white,
                                    fontWeight: kFW900),
                              ),
                              Container(
                                //alignment: Alignment.topLeft,
                                padding: EdgeInsets.only(bottom: 10.w),
                                child: Text(
                                  "Don't wait for career change",
                                  style: GoogleFonts.gothicA1(
                                      fontSize: kFourteenFont,
                                      color: white,
                                      fontWeight: kFW600),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Button(),
      ],
    );
  }

  Widget Button() {
    return Card(
      elevation: 30,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: SizedBox(
        // margin: EdgeInsets.only(right: 10.w),
        height: 40.h,
        width: 151.w,
        // decoration:
        //     BoxDecoration(gradient: LinearGradient(colors: [grey1, grey])),
        child: TextButton(
          onPressed: () {
            //Get.toNamed(KRecipet);
          },
          style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll<Color>(grey1),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      side: const BorderSide(color: grey1)))),
          child: Text(
            "Grab the Deal",
            style: GoogleFonts.gothicA1(
                fontSize: kFourteenFont, color: white, fontWeight: kFW700),
          ),
        ),
      ),
    );
  }
}

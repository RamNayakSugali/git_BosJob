// ignore_for_file: camel_case_types

import 'dart:ui';

import '../utils/export_file.dart';

class Mobile_view extends StatefulWidget {
  const Mobile_view({super.key});

  @override
  State<Mobile_view> createState() => _MobileviewState();
}

class _MobileviewState extends State<Mobile_view> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(10.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 35.h,
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: white,
            ),
          ),
          SizedBox(
            height: 130.h,
          ),
          Text(
            'Mobile Verfication',
            style: GoogleFonts.gothicA1(
                fontSize: kTwentyFourFont, color: white, fontWeight: kFW700),
          ),
          SizedBox(
            height: 50.h,
          ),
          Text("Mobile No",
              style: GoogleFonts.inter(
                  color: white, fontSize: kTwelveFont, fontWeight: kFW500)),
          SizedBox(height: 5.h),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                gradient: LinearGradient(colors: [
                  grey..withOpacity(0.2),
                  grey1.withOpacity(0.2),
                  Colors.black.withOpacity(0.3)
                ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
            child: TextFormField(
              style: GoogleFonts.inter(
                  color: white, fontSize: kTwelveFont, fontWeight: kFW500),
              // maxLength: 8,
              decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                  filled: true,
                  fillColor: white.withOpacity(0.08),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: white.withOpacity(0.1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(
                      color: grey,
                    ),
                  ),
                  hintStyle: GoogleFonts.inter(
                      color: white.withOpacity(0.5),
                      fontSize: kFourteenFont,
                      fontWeight: kFW500),
                  hintText: "+91 mobile no"),
              onTap: () {
                // Get.toNamed(KSearch);
              },
            ),
          ),
          SizedBox(
            height: 200.h,
          ),
          GlassmorphicContainer(
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
                            gradient:
                                LinearGradient(colors: [Colors.white38, Gold]),
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: SizedBox(
                        height: 40.h,
                        width: 338.5.w,
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed(KOTP_Screen);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                white.withOpacity(0.08),
                              ),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      side: BorderSide(
                                        color: white.withOpacity(0.1),
                                      )))),
                          child: Text(
                            "send OTP",
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
    );
  }
}

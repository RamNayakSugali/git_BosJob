import 'dart:ui';

import '../utils/export_file.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPview extends StatefulWidget {
  const OTPview({super.key});

  @override
  State<OTPview> createState() => _OTPviewState();
}

class _OTPviewState extends State<OTPview> {
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
            height: 100.h,
          ),
          Text(
            'OTP Verfication',
            style: GoogleFonts.gothicA1(
                fontSize: kTwentyFourFont, color: white, fontWeight: kFW700),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            "OTP sent to 967*****10",
            style: GoogleFonts.gothicA1(
                fontSize: 10.sp, color: Colors.grey, fontWeight: kFW700),
          ),
          SizedBox(
            height: 30.h,
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                height: 56,
                child: OtpTextField(
                  fillColor: kBackground,
                  filled: true,
                  numberOfFields: 4,
                  textStyle: GoogleFonts.poppins(color: white),
                  borderColor: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                  focusedBorderColor: Colors.grey,
                  autoFocus: true,
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    setState(() {
                      //enteredCode = verificationCode;
                    });
                  },
                ),
              ),
              GlassmorphicContainer(
                height: 40.h,
                width: 100.w,
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
                                Get.toNamed(kDashboard);
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
                                "Send",
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
          SizedBox(height: 13.h),
          Container(
            margin: EdgeInsets.only(top: 5.h),
            alignment: Alignment.centerLeft,
            child: Text(
              '00:30 Resend OTP',
              style: GoogleFonts.gothicA1(
                  fontSize: 10.sp, color: Colors.grey, fontWeight: kFW700),
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          SizedBox(
            height: 10.h,
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
                            Get.toNamed(kDashboard);
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
                            "Verfiy",
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
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}

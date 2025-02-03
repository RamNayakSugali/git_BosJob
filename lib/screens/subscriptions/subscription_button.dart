// ignore_for_file: camel_case_types

import 'dart:ui';

import '../../../utils/export_file.dart';

class Button extends StatefulWidget {
  const Button({super.key, required ButtonStyle style});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 450.h),
        GlassmorphicContainer(
          margin: EdgeInsets.all(10.r),
          height: 45.h,
          width: double.infinity,
          borderRadius: 13.r,
          blur: 15,
          alignment: Alignment.center,
          border: 2,
          linearGradient: LinearGradient(
              colors: [white.withOpacity(0.1), white.withOpacity(0.01)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderGradient:
              LinearGradient(colors: [white.withOpacity(0.5), Gold]),
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
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Continue",
                              //maxLines: 2,
                              style: GoogleFonts.gothicA1(
                                  fontSize: kSixteenFont,
                                  color: white,
                                  fontWeight: kFW600)),
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ),
        Text("Restore Purchases, Terms & Conditions",
            maxLines: 2,
            style: GoogleFonts.gothicA1(
                fontSize: kTenFont, color: white, fontWeight: kFW400)),
      ],
    );
  }
}

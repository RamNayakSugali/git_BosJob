// ignore_for_file: camel_case_types

import 'dart:ui';

import '../../../utils/export_file.dart';

class Apply_card extends StatefulWidget {
  const Apply_card({super.key});

  @override
  State<Apply_card> createState() => _ApplycardState();
}

class _ApplycardState extends State<Apply_card> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(KJob_Description);
      },
      child: GlassmorphicContainer(
        margin: EdgeInsets.all(10.r),
        height: 165.h,
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
                  height: 190.h,
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                      border: const GradientBoxBorder(
                        gradient:
                            LinearGradient(colors: [Colors.white38, Gold]),
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
                          Text("Front End Developer",
                              style: GoogleFonts.gothicA1(
                                  fontSize: kEighteenFont,
                                  color: white,
                                  fontWeight: kFW700)),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text("Resbee Info Technologies",
                          style: GoogleFonts.gothicA1(
                              fontSize: 13.sp,
                              color: white,
                              fontWeight: kFW500)),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text("Graduation",
                                  style: GoogleFonts.gothicA1(
                                      fontSize: 11.sp,
                                      color: white,
                                      fontWeight: kFW500)),
                              SizedBox(height: 10.h),
                              Text("0-2 Years",
                                  style: GoogleFonts.gothicA1(
                                      fontSize: 11.sp,
                                      color: white,
                                      fontWeight: kFW500))
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/link.png',
                                width: 20.w,
                              ),
                              SizedBox(width: 5.w),
                              Text("Telangana,  Hyderabad",
                                  style: GoogleFonts.gothicA1(
                                      fontSize: kTwelveFont,
                                      color: white,
                                      fontWeight: kFW700))
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Resume Viewed 2w Ago',
                              style: GoogleFonts.gothicA1(
                                  fontSize: kTenFont,
                                  color: Gold,
                                  fontWeight: kFW700)),
                          SizedBox(
                            // margin: EdgeInsets.only(right: 10.w),
                            height: 40.h,
                            width: 110.w,
                            child: TextButton(
                              onPressed: () {
                                //Get.toNamed(KApplied);
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      const MaterialStatePropertyAll<Color>(
                                          grey),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          side:
                                              const BorderSide(color: grey)))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/copy.png',
                                    width: 20.w,
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    "Similar",
                                    style: GoogleFonts.gothicA1(
                                        fontSize: kTwelveFont,
                                        color: white,
                                        fontWeight: kFW600),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

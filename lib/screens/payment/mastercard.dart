import 'dart:ui';

import '../../../utils/export_file.dart';

class Mastercard extends StatefulWidget {
  const Mastercard({super.key});

  @override
  State<Mastercard> createState() => _MastercardState();
}

class _MastercardState extends State<Mastercard> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            
            width: double.infinity,
          //height: 220.h,
          padding: EdgeInsets.only(top: 10.w, right: 9.w,bottom: 10.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30.w),
                      child: Text(
                        "Card",
                        style: GoogleFonts.gothicA1(
                            fontSize: kFourteenFont,
                            color: white,
                            fontWeight: kFW600),
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/Visa.png',
                          width: 50.w,
                        ),
                        SizedBox(width: 50.w),
                        Image.asset(
                          'assets/images/Mastercard.png',
                          width: 40.w,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Container(
                        width: 255.w,
                       // height: 147.h,
                        margin:
                            EdgeInsets.only(top: 20, left: 12.w, right: 10.w),
                        padding:
                            EdgeInsets.only(top: 10, left: 10.w, right: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 20,
                                spreadRadius: 5,
                                color: Color.fromARGB(255, 13, 12, 12)
                                    .withOpacity(0.1),
                              )
                            ],
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  grey.withOpacity(0.5),
                                  grey1.withOpacity(0.5),
                                  Color.fromARGB(255, 58, 55, 55)
                                      .withOpacity(0.1),
                                ])),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Aryan Kumar",
                                  style: GoogleFonts.gothicA1(
                                      fontSize: kFourteenFont,
                                      color: white,
                                      fontWeight: kFW600),
                                ),
                                Image.asset(
                                  'assets/images/Visa.png',
                                  width: 40.w,
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  'assets/images/wifi 1.png',
                                  width: 25.w,
                                ),
                                SizedBox(width: 20.w),
                                Container(
                                  padding: EdgeInsets.only(right: 20.w),
                                  child: Image.asset(
                                    'assets/images/chip 1.png',
                                    width: 40.w,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.w, top: 15.h),
                              child: Text(
                                "5544  5544  5544  5544",
                                style: GoogleFonts.gothicA1(
                                    fontSize: kTwelveFont,
                                    color: white,
                                    fontWeight: kFW500),
                              ),
                            ),
                            SizedBox(height: 7.h),
                            Container(
                              // padding: EdgeInsets.only(top: 5),
                              margin: EdgeInsets.only(left: 50.w, top: 1.h),
                              child: Row(
                                children: [
                                  Text(
                                    "Expiry",
                                    style: GoogleFonts.gothicA1(
                                        fontSize: 8.sp,
                                        color: white,
                                        fontWeight: kFW600),
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    "2/25",
                                    style: GoogleFonts.gothicA1(
                                        fontSize: kFourteenFont,
                                        color: white,
                                        fontWeight: kFW600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                    Container(
                        padding: EdgeInsets.only(top: 3.h),
                        margin: EdgeInsets.only(left: 10.w),
                       // height: 24.h,
                        width: 34.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 20,
                                spreadRadius: 5,
                                color: Color.fromARGB(255, 13, 12, 12)
                                    .withOpacity(0.1),
                              )
                            ],
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  grey.withOpacity(0.5),
                                  grey1.withOpacity(0.5),
                                  Color.fromARGB(255, 58, 55, 55)
                                      .withOpacity(0.1),
                                ])),
                        child: Text(
                          "+",
                          style: GoogleFonts.gothicA1(
                              fontSize: kTwentyFont,
                              color: white,
                              fontWeight: kFW700),
                        ))
                  ],
                ),
              ],
            )),
          
        Container(
            width:double.infinity,
          
            margin: EdgeInsets.only(top:20.h),
            padding: EdgeInsets.only(top: 15, left: 10.w,bottom: 15.h, right: 10.w),
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
            child: 
            Text(
              "Netbanking",
              style: GoogleFonts.gothicA1(
                  fontSize: 13.sp, color: white, fontWeight: kFW700),
            )),
            SizedBox(height: 60.h),
             CustomProfileButton(
                  label: 'Pay Now',
                  isLoading: true,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                    ;
                    // Get.toNamed(KAchievedDetails);
                  },
                ),
         
      ],
    );
  }
}

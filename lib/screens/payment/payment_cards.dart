import '../../../utils/export_file.dart';

class Payment_card extends StatefulWidget {
  const Payment_card({super.key});

  @override
  State<Payment_card> createState() => _PaymentcardState();
}

class _PaymentcardState extends State<Payment_card> {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
        width: double.infinity,
        height: 115.h,
        // margin: EdgeInsets.only(top: 20, left: 10.w, right: 7.w),
       padding: EdgeInsets.all(10.w),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:   EdgeInsets.only(left:8.0.w),
                  child: Text(
                    "UPI",
                    style: GoogleFonts.gothicA1(
                        fontSize: kFourteenFont,
                        color: white,
                        fontWeight: kFW600),
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/pay.png',
                      width: 40.w,
                    ),
                    SizedBox(width: 10.w),
                    Image.asset(
                      'assets/images/Phonepe.png',
                      width: 75.w,
                    ),
                    SizedBox(width: 10.w),
                    Image.asset(
                      'assets/images/Paytm.png',
                      width: 50.w,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 17.h),
            Row(
              children: [
                SizedBox(
                  width: 228.w,
                 // height: 44.h,
                  // margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
                  child: TextFormField(
                    style: GoogleFonts.inter(
                        color: white,
                        fontSize: kFourteenFont,
                        fontWeight: kFW500),
                    // maxLength: 8,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                      filled: true,
                      fillColor: grey.withOpacity(0.08),
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
                          color: white,
                          fontSize: kFourteenFont,
                          fontWeight: kFW500),
                      hintText: "Enter your UPI ID",
                    ),
                    
                  ),
                ),
                SizedBox(width: 10.w),
                Container(
                   padding: EdgeInsets.only(left: 20.w,right: 20.w),
                    height: 38.h,
                   // width: 95.w,
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
                      "Pay",
                      style: GoogleFonts.gothicA1(
                          fontSize: 15.sp,
                          color: white,
                          fontWeight: kFW700),
                    ))
              ],
            ),
          ],
        ));
  }
}

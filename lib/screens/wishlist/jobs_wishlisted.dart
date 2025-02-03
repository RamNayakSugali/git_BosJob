import 'dart:ui';

import 'package:bossjobs/utils/export_file.dart';

class JobsWishlist extends StatefulWidget {
  const JobsWishlist({super.key});

  @override
  State<JobsWishlist> createState() => _JobsWishlistState();
}

class _JobsWishlistState extends State<JobsWishlist> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310.h,
      child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Wrap(
              children: [
                GlassmorphicContainer(
                  margin: EdgeInsets.only(right: 15.w),
                  //  height: 303.h,
                  height: 280.h,
                  width: 260.w,
                  borderRadius: 20.r,
                  blur: 20.r,
                  alignment: Alignment.center,
                  border: 2,
                  linearGradient: LinearGradient(
                    colors: [
                      white.withOpacity(0.15),
                      white.withOpacity(0.15),
                    ],
                  ),
                  borderGradient: LinearGradient(
                    colors: [
                      kBackground,
                      //  white.withOpacity(0.5),
                      Gold.withOpacity(0.01)
                    ],
                  ),
                  child: Container(
                    margin: EdgeInsets.all(1.h),
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
                            width: 260.w,
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                                border: const GradientBoxBorder(
                                  gradient: LinearGradient(colors: [
                                    Color.fromARGB(97, 7, 7, 7),
                                    darkGrey
                                  ]),
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Column(
                              //  crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // ),

                                Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          10.r), // Image border
                                      child: SizedBox.fromSize(
                                        // size:
                                        //     Size.fromRadius(48), // Image radius
                                        child: Image.asset(
                                            'assets/images/imagecourse.png',
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    // Image.asset(
                                    //   'assets/images/imagecourse.png',
                                    // ),
                                    Positioned(
                                      bottom: 8,
                                      left: 8,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 205.w,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/images/meter.png',
                                                  height: 24.h,
                                                ),
                                                SizedBox(width: 4.w),
                                                Text(
                                                  "Beginner",
                                                  style: GoogleFonts.gothicA1(
                                                    fontSize: kFourteenFont,
                                                    color: Customgreen,
                                                    fontWeight: kFW700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Image.asset(
                                            'assets/images/love.png',
                                            height: 18.h,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "React Native",
                                      style: GoogleFonts.gothicA1(
                                        fontSize: kFourteenFont,
                                        color: whitetwo,
                                        fontWeight: kFW600,
                                      ),
                                    ),
                                    RatingBar.builder(
                                      initialRating: 2,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 16.sp,
                                      unratedColor: white,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 10,
                                      ),
                                      onRatingUpdate: (rating) {},
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '\u{20B9}${699}',
                                          style: GoogleFonts.gothicA1(
                                              fontSize: kFourteenFont,
                                              color: Gold,
                                              fontWeight: kFW700),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          '\u{20B9}${1699}',
                                          style: GoogleFonts.gothicA1(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: kTenFont,
                                              color: white,
                                              fontWeight: kFW500),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "4.5/5 (200)",
                                      style: GoogleFonts.gothicA1(
                                          fontSize: kTwelveFont,
                                          color: customgrey,
                                          fontWeight: kFW700),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Online",
                                    style: GoogleFonts.gothicA1(
                                        fontSize: kTwelveFont,
                                        color: customgrey,
                                        fontWeight: kFW700),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 14.w,
                                          right: 14.w,
                                          top: 6.h,
                                          bottom: 6),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        color: customgrey,
                                      ),
                                      child: Text(
                                        "Product Designer",
                                        style: GoogleFonts.gothicA1(
                                            fontSize: 11.sp,
                                            color: darktwo,
                                            fontWeight: kFW600),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 14.w,
                                          right: 14.w,
                                          top: 6.h,
                                          bottom: 6),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.r),
                                        color: customgrey,
                                      ),
                                      child: Text(
                                        "Visual Designer",
                                        style: GoogleFonts.gothicA1(
                                            fontSize: 11.sp,
                                            color: darktwo,
                                            fontWeight: kFW600),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            );
          })),
    );
  }
}

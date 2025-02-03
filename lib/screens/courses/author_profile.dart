import 'package:bossjobs/utils/export_file.dart';

class AuthorProfile extends StatefulWidget {
  const AuthorProfile({super.key});

  @override
  State<AuthorProfile> createState() => _AuthorProfileState();
}

class _AuthorProfileState extends State<AuthorProfile> {
  Map coachtData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackground,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: white),
          backgroundColor: darktwo,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Author Profile',
            style: GoogleFonts.gothicA1(
                letterSpacing: 1,
                fontSize: kEighteenFont,
                color: white,
                fontWeight: kFW700),
          ),
          actions: [
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(KNotification);
                },
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/bell.png',
                      width: 22.w,
                    ),
                    Positioned(
                        left: 13.r,
                        //top: .h,
                        child: const CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.green,
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 13.w,
            )
          ],
        ),
        body: Stack(
          children: [
            Background(),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                    left: 15.w, right: 15.w, top: 20.h, bottom: 15.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        coachtData["profile_pic"] != null
                            ? CircleAvatar(
                                backgroundColor: kBackground,
                                backgroundImage: NetworkImage(
                                    "$kProfileURL${coachtData["profile_pic"]}"),
                                radius: 40.r,
                              )
                            : CircleAvatar(
                                backgroundColor: kBackground,
                                radius: 40.r,
                                child: Image.asset(
                                  'assets/images/darkWoman.png',
                                  // height: 52.h,
                                ),
                              ),
                        // CircleAvatar(
                        //     backgroundColor: kBackground,
                        //     radius: 40.r,
                        //     child: Image.asset('assets/images/logo.png'),
                        //   ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(coachtData["name"],
                            style: GoogleFonts.gothicA1(
                                fontSize: 22.sp,
                                color: white,
                                fontWeight: kFW700)),
                        // RichText(
                        //   text: TextSpan(
                        //       text: 'Name :',
                        //       style: GoogleFonts.openSans(
                        //           fontSize: kSixteenFont,
                        //           color: white,
                        //           fontWeight: FontWeight.w700),
                        //       children: [
                        //         TextSpan(
                        //           text: coachtData["name"],
                        //           style: GoogleFonts.openSans(
                        //               fontSize: kSixteenFont,
                        //               color: white,
                        //               fontWeight: FontWeight.w700),
                        //         ),
                        //       ]),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Contact",
                              style: GoogleFonts.openSans(
                                  fontSize: kTwelveFont,
                                  color: customgrey,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              coachtData["phone"] ?? "-",
                              //  phone,
                              // workerDetails["worker_phone"],
                              style: GoogleFonts.openSans(
                                  fontSize: kSixteenFont,
                                  color: Gold,
                                  fontWeight: kFW700),
                            ),
                          ],
                        ),
                        SizedBox(width: 80.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gender",
                              style: GoogleFonts.openSans(
                                  fontSize: kTwelveFont,
                                  color: customgrey,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              coachtData["gender_id"] == "2"
                                  ? "Female"
                                  : "Male",
                              //  workerDetails["worker_id"],
                              style: GoogleFonts.openSans(
                                  fontSize: kSixteenFont,
                                  color: Gold,
                                  fontWeight: kFW700),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Email:',
                          style: GoogleFonts.openSans(
                              fontSize: kTwelveFont,
                              color: customgrey,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          coachtData["email"],
                          style: GoogleFonts.openSans(
                              fontSize: kSixteenFont,
                              color: Gold,
                              fontWeight: kFW700),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Marital Status:",
                          style: GoogleFonts.openSans(
                              fontSize: kTwelveFont,
                              color: customgrey,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          coachtData["marriage_status_id"] == "1"
                              ? "Single"
                              : "Married",
                          //  workerDetails["expiry_date"],
                          style: GoogleFonts.openSans(
                              fontSize: kSixteenFont,
                              color: Gold,
                              fontWeight: kFW700),
                        ),
                      ],
                    ),
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //       "Introduction:",
                    //       style: GoogleFonts.openSans(
                    //           fontSize: kTwelveFont,
                    //           color: white,
                    //           fontWeight: FontWeight.w600),
                    //     ),
                    //     Text(
                    //       parse(coachtData["user_introduction"] ?? "" ?? "")
                    //           .body!
                    //           .text,
                    //       // coachtData["user_introduction"] ?? "",

                    //       style: GoogleFonts.openSans(
                    //           fontSize: 13.sp,
                    //           color: white,
                    //           fontWeight: FontWeight.w500),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

import 'dart:ui';

import '../../utils/export_file.dart';
class MentorProfile extends StatefulWidget {
  const MentorProfile({super.key});

  @override
  State<MentorProfile> createState() => _MentorProfileState();
}

class _MentorProfileState extends State<MentorProfile> {
  @override
  Widget build(BuildContext context) {
    return 
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Mentor",
              style: GoogleFonts.gothicA1(
                  fontSize: kSixteenFont, color: white, fontWeight: kFW700)),
        SizedBox(height:20.h),
        Row(
                children: [
                  GestureDetector(
                    onTap: () {
                     // Get.toNamed();
                    },
                    child: 
                    Stack(
                      children: [
                        CircleAvatar(
                            backgroundColor: kBackground,
                            radius: 46,
                            child: Image.asset('assets/images/darkWoman.png',height: 80.h)),
                            Positioned(
                              left:72.w,
                              top: 5.h,
                              child: CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.green,
                        ),
                            ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "R.Bharath",
                        style: GoogleFonts.gothicA1(
                            fontSize: kFourteenFont,
                            color: white,
                            fontWeight: kFW600),
                      ),
                      SizedBox(height:5.h),
                      Text(
                        "Creative Director",
                        style: GoogleFonts.gothicA1(
                            fontSize: 11.sp, color: white, fontWeight: kFW500),
                      ),
                    ],
                  ),
                ],
              ),
        SizedBox(height:30.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GlassmorphicContainer(
                       
                        height: 42.h,
                        width:160.w,
                        borderRadius: 13.r,
                        blur: 15,
                        alignment: Alignment.center,
                        border: 0.5,
                        linearGradient: LinearGradient(
                            colors: [Colors.black.withOpacity(0.1), Colors.black.withOpacity(0.01)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderGradient:
                            LinearGradient(  begin: Alignment.centerLeft,
                            end: Alignment.bottomRight,
                              colors: [white.withOpacity(0.5),white.withOpacity(0.5), Gold.withOpacity(0.5)]),
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
                              child: 
                              Text( "Add to Wishlist",
                                  //maxLines: 2,
                                  style: GoogleFonts.gothicA1(
                                      fontSize: kFourteenFont,
                                      color: white,
                                      fontWeight: kFW500)),
                            ),
                          ),
                        ),
                      ),
          GlassmorphicContainer(
                        
                        height: 42.h,
                        width:160.w,
                        borderRadius: 13.r,
                        blur: 15,
                        alignment: Alignment.center,
                        border: 0.5,
                        linearGradient: LinearGradient(
                            colors: [white.withOpacity(0.1), white.withOpacity(0.01)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderGradient:
                            LinearGradient(  begin: Alignment.centerLeft,
                            end: Alignment.bottomRight,
                              colors: [white.withOpacity(0.5),white.withOpacity(0.5), Gold.withOpacity(0.5)]),
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              blurRadius: 16,
                              spreadRadius: 15,
                              
                              color: Colors.black.withOpacity(0.1),
                            )
                          ]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: 
                            BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 20.0,
                                sigmaY: 20.0,
                              ),
                              child: 
                              Text( " Buy now",
                                  //maxLines: 2,
                                  style: GoogleFonts.gothicA1(
                                      fontSize: kSixteenFont,
                                      color: white,
                                      fontWeight: kFW700)),
                            ),
                          ),
                        ),
                      ),
        ],
      ),
      ],
    );
  }
}
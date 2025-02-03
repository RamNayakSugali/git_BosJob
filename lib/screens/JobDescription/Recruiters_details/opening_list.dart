import 'dart:ui';

import '../../../utils/export_file.dart';

class Opening extends StatefulWidget {
  const Opening({super.key});

  @override
  State<Opening> createState() => _OpeningState();
}

class _OpeningState extends State<Opening> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.grey.withOpacity(0.3)),
      child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Jobs Opening",
                      style: GoogleFonts.gothicA1(
                          fontSize: kEighteenFont,
                          color: white,
                          fontWeight: kFW700),
                    ),
                    SizedBox(width: 5.h),
                    Text(
                      "4",
                      style: GoogleFonts.gothicA1(
                          fontSize: kFourteenFont,
                          color: Gold,
                          fontWeight: kFW700),
                    ),
                  ],
                ),
           
              SizedBox(height: 10.h),
         
          Container(
            margin: EdgeInsets.all(5.r),
            height: 360.h,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: ((context, index) {
                  return Container(
                    margin: EdgeInsets.all(5.r),
                    width: 330.w,
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 10.w, right: 10.w, bottom: 10.h),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Front End Developer",
                                style: GoogleFonts.gothicA1(
                                    fontSize: 13.sp,
                                    color: white,
                                    fontWeight: kFW600),
                              ),
                              Text(
                                "9L-14L",
                                style: GoogleFonts.gothicA1(
                                    fontSize: kFourteenFont,
                                    color: Gold,
                                    fontWeight: kFW700),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Graduation",
                                style: GoogleFonts.gothicA1(
                                    fontSize: 11.sp,
                                    color: white,
                                    fontWeight: kFW500),
                              ),
                              SizedBox(width: 5.h),
                              Text(
                                "0-2Years",
                                style: GoogleFonts.gothicA1(
                                    fontSize: 11.sp,
                                    color: white,
                                    fontWeight: kFW500),
                              ),
                              SizedBox(width: 10.h),
                              Icon(
                                Icons.location_on,
                                color: Gold,
                              ),
                              Text(
                                "Telangana,Hyderabad",
                                style: GoogleFonts.gothicA1(
                                    fontSize: kTwelveFont,
                                    color: white,
                                    fontWeight: kFW500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                })),
          ),
        ],
      ),
    );
  }
}

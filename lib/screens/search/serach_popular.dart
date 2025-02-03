// ignore_for_file: camel_case_types

import '../../../utils/export_file.dart';

class Search_popular extends StatefulWidget {
  const Search_popular({super.key});

  @override
  State<Search_popular> createState() => _SearchpopularState();
}

class _SearchpopularState extends State<Search_popular> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.blue,
      height: 320.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlassmorphicContainer(
                  margin: EdgeInsets.all(10.r),
                  height: 160.h,
                  width: 140.w,
                  borderRadius: 15.r,
                  blur: 15,
                  alignment: Alignment.center,
                  border: 2,
                  linearGradient: LinearGradient(
                      colors: [white.withOpacity(0.1), white.withOpacity(0.01)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderGradient: LinearGradient(
                      colors: [Colors.white.withOpacity(0.5), Gold]),
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
                      child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: const GradientBoxBorder(
                                gradient: LinearGradient(
                                    colors: [Colors.white38, Gold]),
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(15.r)),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/video.png',
                                height: 155.5.h,
                                //width: 125,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                top: 150.w,
                                left: 105.w,
                                child: Center(
                                  child: Icon(Icons.favorite_border_outlined,
                                      color: white, size: 20.sp),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "React Native",
                        style: GoogleFonts.gothicA1(
                            fontSize: kSixteenFont,
                            color: white,
                            fontWeight: kFW600),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\u{20B9}${699}',
                            style: GoogleFonts.gothicA1(
                                fontSize: 13.sp,
                                color: Gold,
                                fontWeight: kFW700),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            '\u{20B9}${1699}',
                            style: GoogleFonts.gothicA1(
                                decoration: TextDecoration.lineThrough,
                                fontSize: kTenFont,
                                color: white,
                                fontWeight: kFW700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          })),
    );
  }
}

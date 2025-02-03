import '../../../utils/export_file.dart';
import 'dart:ui';

class Plans_card extends StatefulWidget {
  const Plans_card({super.key});

  @override
  State<Plans_card> createState() => _PlanscardState();
}

class _PlanscardState extends State<Plans_card> {
  @override
  Widget build(BuildContext context) {
    List categories = [
      {
        "background": "assets/images/broze.png",
        "text": "Bronze",
        "price": "Price/month",
        //"route": KHelp_supprot
      },
      {
        "background": "assets/images/sliver.png",
        "text": "Silver",
        "price": "Price/month",
        //"route": KHelp_supprot
      },
      {
        "background": "assets/images/gold.png",
        "text": "Gold",
        "price": "Price/month",
        // "route": KHelp_supprot
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: ((context, i) {
            return Column(
              children: [
               GlassmorphicContainer(
                    
                    margin: EdgeInsets.only(top: 30.h),
                    height: 150.h,
                    width: 296.w,
                    borderRadius: 13.r,
                    blur: 15,
                    alignment: Alignment.center,
                    border: 2,
                    linearGradient: LinearGradient(colors: [
                      white.withOpacity(0.1),
                      white.withOpacity(0.01)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
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
                              width: 300.w,
                              decoration: BoxDecoration(
                                  border: const GradientBoxBorder(
                                    gradient: LinearGradient(
                                        colors: [Colors.white38, Gold]),
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(16.r)),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    categories[i]["background"],
                                    width: 400.w,
                                    height: double.infinity,
                                    fit: BoxFit.fill,
                                    //width: 30.w,
                                  ),
                                  Positioned(
                                    top: 30.h,
                                    left: 120.w,
                                    child: Text(categories[i]["text"],
                                        style: GoogleFonts.gothicA1(
                                            fontSize: kSixteenFont,
                                            color: white,
                                            fontWeight: kFW800)),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ),
                
                SizedBox(height: 10.h),
                Container(
                //  height: 100.h,
                  width: 200.w,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: ((context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Gold,
                              radius: 5.r,
                            ),
                            SizedBox(width: 20.w),
                            Text("Lorean EpsonLorean",
                                style: GoogleFonts.gothicA1(
                                    fontSize: kFourteenFont,
                                    color: white,
                                    fontWeight: kFW400)),
                          ],
                        );
                      })),
                ),
                SizedBox(height: 30),
                GlassmorphicContainer(
                  margin: EdgeInsets.all(10.r),
                  height: 130.h,
                  width: 296.w,
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
                            width: 300.w,
                            decoration: BoxDecoration(
                                border: const GradientBoxBorder(
                                  gradient: LinearGradient(
                                      colors: [Colors.white38, Gold]),
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Stack(
                              children: [
                                Image.asset(
                                  categories[i]["background"],
                                  width: 400.w,
                                  height: double.infinity,
                                  fit: BoxFit.fill,
                                  //width: 30.w,
                                ),
                                Positioned(
                                  top: 6.h,
                                  left: 120.w,
                                  child: Text(categories[i]["text"],
                                      style: GoogleFonts.gothicA1(
                                          fontSize: kSixteenFont,
                                          color: white,
                                          fontWeight: kFW800)),
                                ),
                                Positioned(
                                  top: 40.h,
                                  left: 80.w,
                                  child: Text(
                                    'Price / month',
                                    style: GoogleFonts.gothicA1(
                                        fontSize: kSixteenFont,
                                        color: white,
                                        fontWeight: kFW800),
                                  ),
                                ),
                                Positioned(
                                  top: 70.h,
                                  left: 90.w,
                                  child: Row(
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
                                        'Onwards',
                                        style: GoogleFonts.gothicA1(
                                            fontSize: 8.sp,
                                            color: white,
                                            fontWeight: kFW400),
                                      ),
                                    ],
                                  ),
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

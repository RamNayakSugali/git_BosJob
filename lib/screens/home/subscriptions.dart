import 'dart:ui';

import 'package:bossjobs/utils/export_file.dart';

class Subscriptions extends StatefulWidget {
  const Subscriptions({super.key});

  @override
  State<Subscriptions> createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
  @override
  Widget build(BuildContext context) {
    List categories = [
      {
        "background": "assets/images/broze.png",

        // "route": KQrcode
      },
      {
        "background": "assets/images/sliver.png",
        //"route": KProfile
      },
      {
        "background": "assets/images/gold.png",
        //"route": KQrcode
      },
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
        "SubScriptions",
        style: GoogleFonts.gothicA1(
            fontSize: kSixteenFont, color: white, fontWeight: kFW700),
      ),
      SizedBox(height: 10.h,),
      Wrap(
        children: [
          for (int i = 0; i < categories.length; i++)
            GlassmorphicContainer(
               margin: EdgeInsets.only(bottom:10.h),
              height: 153.h,
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
                              gradient: LinearGradient(
                                  colors: [Colors.white38, Gold]),
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(16.r)),
                        child: Stack(
                          children: [
                            Image.asset(
                              categories[i]["background"],
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.fill,
                              //width: 30.w,
                            ),
                            Container(
                                padding: EdgeInsets.all(10.r),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Text('Lorean EsponLorean',
                                        maxLines: 2,
                                        style: GoogleFonts.gothicA1(
                                            fontSize: kFourteenFont,
                                            color: white,
                                            fontWeight: FontWeight.w600)),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text('EsponLorean EsponLorean',
                                        maxLines: 2,
                                        style: GoogleFonts.gothicA1(
                                            fontSize: kFourteenFont,
                                            color: white,
                                            fontWeight: FontWeight.w600)),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text('EsponLorean Espon',
                                        maxLines: 2,
                                        style: GoogleFonts.gothicA1(
                                            fontSize: kFourteenFont,
                                            color: white,
                                            fontWeight: FontWeight.w600)),
                                    SizedBox(
                                      height: 22.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Price/month',
                                            maxLines: 2,
                                            style: GoogleFonts.gothicA1(
                                                fontSize: kFourteenFont,
                                                color: white,
                                                fontWeight: FontWeight.w700)),
                                        Row(
                                          children: [
                                            Text('\u{20B9}${699}',
                                                maxLines: 2,
                                                style: GoogleFonts.gothicA1(
                                                    fontSize: kSixteenFont,
                                                    color: Gold,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            Text('  On Wards',
                                                maxLines: 2,
                                                style: GoogleFonts.gothicA1(
                                                    fontSize: kTenFont,
                                                    color: white,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                          ],
                        )),
                  ),
                ),
              ),
            ),
        ],
      ),
    ]);
  }
}

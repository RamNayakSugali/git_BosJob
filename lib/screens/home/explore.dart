import 'dart:ui';

import 'package:bossjobs/utils/export_file.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  List dashboard = [];
  bool isLoading = false;
  Future dashboardListHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.getdashboard();
    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      print("new");
      print(data["data"]["data"]["jobs"]["all"]);
      dashboard = data["data"]["data"]["jobs"]["all"];
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    dashboardListHandler();
  }

  @override
  Widget build(BuildContext context) {
    // List categories = [
    //   {
    //     // "name": "Jobs For You",
    //     // "image": "assets/images/company.png",
    //     "background": "assets/images/Frame1.png",

    //     // "route": KQrcode
    //   },
    //   {
    //     // "name": "Courses For you",
    //     // "image": "assets/images/company.png",
    //     "background": "assets/images/Frame2.png",
    //     //"route": KProfile
    //   },
    //   {
    //     // "name": "Jobs For You",
    //     // "image": "assets/images/company.png",
    //     "background": "assets/images/Frame3.png",
    //     //"route": KQrcode
    //   },
    // ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Explore",
          style: GoogleFonts.gothicA1(
              fontSize: kSixteenFont, color: white, fontWeight: kFW700),
        ),
        SizedBox(
          height: 15.h,
        ),
        isLoading == false
            ? SizedBox(
                height: 150.h,
                child: ListView.builder(
                    itemCount: dashboard.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((
                      context,
                      index,
                    ) {
                      return Wrap(
                        children: [
                          GlassmorphicContainer(
                            margin: EdgeInsets.only(right: 18.r),
                            height: 118.h,
                            width: 223.w,
                            borderRadius: 13.r,
                            blur: 15,
                            alignment: Alignment.center,
                            border: 2,
                            linearGradient: LinearGradient(
                                colors: [
                                  white.withOpacity(0.1),
                                  white.withOpacity(0.01)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            borderGradient: LinearGradient(
                                colors: [white.withOpacity(0.5), Gold]),
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
                                          borderRadius:
                                              BorderRadius.circular(16.r)),
                                      child: Stack(
                                        children: [
                                          // Container(
                                          //   color: Colors.black.withOpacity(0.8),
                                          //   child: Image.asset(
                                          //     categories[i]["background"],
                                          //     //width: 30.w,
                                          //   ),
                                          // ),
                                          Container(
                                            alignment: Alignment.center,
                                            padding:
                                                EdgeInsets.only(left: 10.w),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 110.w,
                                                  child: Text(
                                                      dashboard[index]
                                                          ?["title"],
                                                      //: TextAlign.center,
                                                      maxLines: 2,
                                                      style:
                                                          GoogleFonts.gothicA1(
                                                              fontSize:
                                                                  kSixteenFont,
                                                              color: white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                ),
                                                CircleAvatar(
                                                  radius: 50,
                                                  backgroundColor: kBackground,
                                                  child: Image(
                                                    image: NetworkImage(
                                                        kCourseURL +
                                                            dashboard[index]
                                                                        ?[
                                                                        "company"]
                                                                    ?["user"]?[
                                                                "profile_pic"]),
                                                    errorBuilder: (c, o, s) =>
                                                        Center(
                                                      child: Text(
                                                        "Image",
                                                        style: GoogleFonts
                                                            .gothicA1(
                                                          fontSize:
                                                              kFourteenFont,
                                                          color: white,
                                                          fontWeight: kFW700,
                                                        ),
                                                      ),
                                                    ),
                                                    //fit: BoxFit.fill,
                                                  ),
                                                )
                                                // Image.asset(
                                                //   categories[i]["image"],
                                                //   width: 90.w,
                                                // ),
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
              )
            : const Center(
                child: CircularProgressIndicator(
                color: Gold,
              )),
      ],
    );
  }
}

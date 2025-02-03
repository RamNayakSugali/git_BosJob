import '../../utils/export_file.dart';


// import 'package:swipeable_card_stack/swipeable_card_stack.dart';
//import 'package:example/card_view.dart';


// import 'package:flutter_tindercard/flutter_tindercard.dart';
class AchievementsView extends StatefulWidget {
  const AchievementsView({super.key});

  @override
  State<AchievementsView> createState() => _AchievementsViewState();
}

class _AchievementsViewState extends State<AchievementsView>
    with TickerProviderStateMixin {
  //   List<String> welcomeImages = [
  //   'assets/images/sliderimage.png',
  //   'assets/images/sliderimage.png',
  //   'assets/images/sliderimage.png',
  // ];
  Map achievementsdata = {};
//List<dynamic> profiledata = [];
  bool isLoading = false;
  Future profileHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.getprofiledatajob();

    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      achievementsdata = data["data"];
    }
    print(data["data"]["data"]);
    setState(() {
      isLoading = false;
    });
  }
  bool deleteLoading = false;
  Future deleteAcheivemrtslist(int id) async {
    setState(() {
      deleteLoading = true;
    });
    // Map payload = {"candidate_skill_id": id};
    Map data = await Services.deleteAchevements(id);
    if (data["data"]["message"] != null) {
      Fluttertoast.showToast(
        msg: data["data"]["message"],
      );

      for (int i = 0;
          i < achievementsdata["candidates"]["CandidateAward"].length;
          //educationaldatail["candidates"]["CandidateEducations"].length;
          i++) {
        if (id == achievementsdata["candidates"]["CandidateAward"][i]["id"]) {
          setState(() {
            achievementsdata["candidates"]["CandidateAward"]
                .remove(achievementsdata["candidates"]["CandidateAward"][i]);
          });
        }
      }
    } else {}

    setState(() {
      deleteLoading = false;

      // CategoriesListHandler();
    });
  }

  @override
  void initState() {
    super.initState();

    profileHandler();
  }

  @override
  Widget build(BuildContext context) {
    // CardController controller;
    return Container(
      margin: EdgeInsets.all(15.w),
      child: Column(
        children: [
          SizedBox(height: 15.h),
          Text("Achievements you Achieved",
              maxLines: 2,
              style: GoogleFonts.inter(
                fontStyle: FontStyle.italic,
                fontSize: 26.sp,
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: <Color>[
                      Color.fromARGB(255, 208, 153, 66),
                      Color.fromARGB(255, 201, 115, 109)
                      //add more color here.
                    ],
                  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0)),
                fontWeight: kFW800,
              )),
          SizedBox(height: 20.h),
          isLoading == false
              ? Container(
                  margin: EdgeInsets.only(left: 5.w),
                  //  padding: EdgeInsets.all(8.w),
                  height: 200.h,
                  child: Swiper(
                    itemHeight: 150.h,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13.r),
                            //   color: Colors.grey,
                            image: const DecorationImage(
                              image:
                                  AssetImage('assets/images/sliderimage.png'),
                              //('${welcomeImages[index]}'),
                              // fit: BoxFit.cover,
                              fit: BoxFit.fill,
                            ),
                          ),
                          width: double.infinity,
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 10.w, right: 10.w, top: 85.h),
                            child: Row(
                              //  mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
GestureDetector(
                                      onTap: () {
                                        Get.toNamed(KAchievedDetails,
                                            arguments:
                                                achievementsdata["candidates"]
                                                    ["CandidateAward"][index]);
                                      },
                                      child: Image.asset(
                                          'assets/images/boxpen.png',
                                          color: white,
                                          width: 20.w),
                                    ),
                                    SizedBox(width: 10.w),
                                    SizedBox(
                                      width: 200.w,
                                      child: Text(
                                          achievementsdata["candidates"]
                                                  ["CandidateAward"][index]
                                              ["title"],

                                          //workexperiencedata[index]?["name"] ?? "B.tech",
                                          //"B.tech",
                                          maxLines: 2,
                                          style: GoogleFonts.inter(
                                              color: Gold,
                                              fontSize: kEighteenFont,
                                              fontWeight: kFW600)),
                                    ),
                                  ],
                                ),

GestureDetector(
                                  onTap: () {
                                    deleteAcheivemrtslist(
                                        achievementsdata["candidates"]
                                            ["CandidateAward"][index]["id"]);
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: white,
                                  ),
                                )
                              ],
                            ),
                          ));
                    },
                    itemWidth: double.infinity,
                    // itemCount: achievementsdata.length,
                    itemCount:
                        achievementsdata["candidates"]["CandidateAward"].length,
                    //  control: new SwiperControl(

                    //  ),
                    loop: true,
                    layout: SwiperLayout.STACK,
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                  color: Gold,
                )),

          //  Container(
          //     margin: EdgeInsets.only(left: 5.w),

          //    height: 200.h,
          //     child: Swiper(

          //       itemHeight:150.h,
          //        physics: const NeverScrollableScrollPhysics(),
          //   scrollDirection: Axis.vertical,
          //           itemBuilder: (BuildContext context, int index) {
          //     return Container(
          //              decoration: BoxDecoration(
          //                borderRadius: BorderRadius.circular(13.r),
          //         //   color: Colors.grey,
          //     image: DecorationImage(
          //       image:

          //        AssetImage('${welcomeImages[index]}'),
          //      // fit: BoxFit.cover,
          //       fit: BoxFit.fill,
          //     ),

          //           //Image.asset('${welcomeImages[index]}'),
          //         ),
          //         // padding: const EdgeInsets.only(

          //         //     left: 20, top: 13, bottom: 13, right: 20),
          //         width: double.infinity,
          //         // decoration: BoxDecoration(
          //         //   borderRadius: BorderRadius.circular(13.r),
          //         //   color: Colors.grey,
          //         // ),
          //         child:    Container(
          //             margin: EdgeInsets.only(left: 5.w,right: 10.w,top: 85.h),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //                Image.asset('assets/images/boxpen.png',color:white,width: 20.w),
          //                  SizedBox(width: 10.w),
          //                 Text("B.tech",
          //                 style: GoogleFonts.inter(
          //                     color: Gold, fontSize: kEighteenFont, fontWeight: kFW600)
          //                 ),
          //                 SizedBox(width: 10.w),
          //                 Text("(Computer Science)",
          //                 style: GoogleFonts.inter(
          //                     color: white, fontSize: kTenFont, fontWeight: kFW400)
          //                 ),
          //                 SizedBox(width: 45.w),
          //                 CircularPercentIndicator(
          //                             reverse: true,
          //                             backgroundColor: kBackground,
          //                             radius: 18.0,
          //                             lineWidth: 4.0,
          //                             animation: true,
          //                             percent: 0.7,
          //                             center: Text(
          //                               '80%',
          //                               style: GoogleFonts.gothicA1(
          //                                   color: white, fontSize: 9.sp),
          //                             ),
          //                             circularStrokeCap: CircularStrokeCap.round,
          //                             progressColor: Gold,
          //                           ),
          //               ],
          //             ),
          //           )
          //         );
          //           },
          //           itemWidth: double.infinity,
          //           itemCount: 3,

          //           //  control: new SwiperControl(

          //           //  ),
          //           loop: true,
          //           layout: SwiperLayout.STACK,
          //     ),
          //   ),
          SizedBox(height: 30.h),
          CustomProfileButton(
            label: 'Add +',
            isLoading: true,
            onTap: () {
              Get.toNamed(KAchievedDetails, arguments: {'id': -1});

            },
          ),
        ],
      ),
    );
  }
}

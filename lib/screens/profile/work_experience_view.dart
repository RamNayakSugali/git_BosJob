import '../../utils/export_file.dart';

class Work_experience extends StatefulWidget {
  const Work_experience({super.key});

  @override
  State<Work_experience> createState() => _WorkexperienceState();
}

class _WorkexperienceState extends State<Work_experience>
    with TickerProviderStateMixin {
  // List<String> welcomeImages = [
  //   'assets/images/sliderimage.png',
  //   'assets/images/sliderimage.png',
  //   'assets/images/sliderimage.png',
  //   'assets/images/sliderimage.png',
  // ];
  Map workexperiencedata = {};
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
      workexperiencedata = data["data"];
    }
    print(data["data"]["data"]);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    profileHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.w),
      child: Column(
        children: [
          SizedBox(height: 15.h),
          Text("Show Your Skills and Level Up",
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 145.w,
                                      child: Text(
                                          workexperiencedata["candidates"]
                                                  ["CandidateExperience"][index]
                                              ["title"],

                                          //workexperiencedata[index]?["name"] ?? "B.tech",
                                          //"B.tech",
                                          maxLines: 2,
                                          style: GoogleFonts.inter(
                                              color: Gold,
                                              fontSize: kEighteenFont,
                                              fontWeight: kFW600)),
                                    ),
                                    // Image.asset('assets/images/boxpen.png',
                                    //     color: white, width: 20.w),

                                    SizedBox(
                                      width: 145.w,
                                      child: Text(
                                          workexperiencedata["candidates"]
                                                  ["CandidateExperience"][index]
                                              ["company"],

                                          //workexperiencedata[index]?["name"] ?? "B.tech",
                                          //"B.tech",
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.inter(
                                              color: Gold,
                                              fontSize: kEighteenFont,
                                              fontWeight: kFW600)),
                                    ),
                                  ],
                                ),

                                // SizedBox(width: 10.w),
                                // Text("(Computer Science)",
                                //     style: GoogleFonts.inter(
                                //         color: white,
                                //         fontSize: kTenFont,
                                //         fontWeight: kFW400)),
                                // SizedBox(width: 45.w),
                                // CircularPercentIndicator(
                                //   reverse: true,
                                //   backgroundColor: kBackground,
                                //   radius: 18.0,
                                //   lineWidth: 4.0,
                                //   animation: true,
                                //   percent: 0.7,
                                //   center: Text(
                                //     '80%',
                                //     style: GoogleFonts.gothicA1(
                                //         color: white, fontSize: 9.sp),
                                //   ),
                                //   circularStrokeCap: CircularStrokeCap.round,
                                //   progressColor: Gold,
                                // ),
                              ],
                            ),
                          ));
                    },
                    itemWidth: double.infinity,
                    itemCount: workexperiencedata["candidates"]
                            ["CandidateExperience"]
                        .length,
                    //  itemCount: workexperiencedata.length,

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
          // Container(
          //   margin: EdgeInsets.only(left: 5.w),
          //   height: 200.h,
          //   child: Swiper(
          //     itemHeight: 150.h,
          //     physics: const NeverScrollableScrollPhysics(),
          //     scrollDirection: Axis.vertical,
          //     itemBuilder: (BuildContext context, int index) {
          //       return Container(
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(13.r),
          //             //   color: Colors.grey,
          //             image: DecorationImage(
          //               image: AssetImage('${welcomeImages[index]}'),
          //               // fit: BoxFit.cover,
          //               fit: BoxFit.fill,
          //             ),

          //             //Image.asset('${welcomeImages[index]}'),
          //           ),
          //           // padding: const EdgeInsets.only(

          //           //     left: 20, top: 13, bottom: 13, right: 20),
          //           width: double.infinity,
          //           child: Container(
          //             margin:
          //                 EdgeInsets.only(left: 5.w, right: 10.w, top: 85.h),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //                 Image.asset('assets/images/boxpen.png',
          //                     color: white, width: 20.w),
          //                 SizedBox(width: 10.w),
          //                 Text("B.tech",
          //                     style: GoogleFonts.inter(
          //                         color: Gold,
          //                         fontSize: kEighteenFont,
          //                         fontWeight: kFW600)),
          //                 SizedBox(width: 10.w),
          //                 Text("(Computer Science)",
          //                     style: GoogleFonts.inter(
          //                         color: white,
          //                         fontSize: kTenFont,
          //                         fontWeight: kFW400)),
          //                 SizedBox(width: 45.w),
          //                 CircularPercentIndicator(
          //                   reverse: true,
          //                   backgroundColor: kBackground,
          //                   radius: 18.0,
          //                   lineWidth: 4.0,
          //                   animation: true,
          //                   percent: 0.7,
          //                   center: Text(
          //                     '80%',
          //                     style: GoogleFonts.gothicA1(
          //                         color: white, fontSize: 9.sp),
          //                   ),
          //                   circularStrokeCap: CircularStrokeCap.round,
          //                   progressColor: Gold,
          //                 ),
          //               ],
          //             ),
          //           ));
          //     },
          //     itemWidth: double.infinity,
          //     itemCount: 3,

          //     //  control: new SwiperControl(

          //     //  ),
          //     loop: true,
          //     layout: SwiperLayout.STACK,
          //   ),
          // ),
          SizedBox(height: 30.h),
          //////////////////////////////////////////////
          CustomProfileButton(
            label: 'Add +',
            isLoading: true,
            onTap: () {
              Get.toNamed(KWorkExpDetails);
            },
          ),
        ],
      ),
    );
  }
}

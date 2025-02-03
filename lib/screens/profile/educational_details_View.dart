import 'package:bossjobs/utils/export_file.dart';

class Educational_details extends StatefulWidget {
  const Educational_details({super.key});

  @override
  State<Educational_details> createState() => _EducationaldetailsState();
}

class _EducationaldetailsState extends State<Educational_details>
    with TickerProviderStateMixin {
  // List<String> welcomeImages = [
  //   'assets/images/sliderimage.png',
  //   'assets/images/sliderimage.png',
  //   'assets/images/sliderimage.png',
  //   'assets/images/sliderimage.png',
  // ];

  // List<dynamic> Qualifications = [];
  // bool isLoading = false;
  // Future exerciseListHandler() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   Map data = await Services.getQualificationsPacks();

  //   if (data["message"] != null) {
  //     Fluttertoast.showToast(
  //       msg: data["message"],
  //     );
  //   } else {
  //     Qualifications = data["data"]["data"];
  //   }
  //   print(data["data"]["data"]);
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();

  //   exerciseListHandler();
  // }
  Map educationaldatail = {};
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
      educationaldatail = data["data"];
    }
    print(data["data"]["data"]);
    setState(() {
      isLoading = false;
    });
  }
  bool deleteLoading = false;
  Future deleteEducation(int id) async {
    setState(() {
      deleteLoading = true;
    });
    // Map payload = {"candidate_skill_id": id};
    Map data = await Services.deleteEducationalDetails(id);
    if (data["data"]["message"] != null) {
      Fluttertoast.showToast(
        msg: data["data"]["message"],
      );

      for (int i = 0;
          i < educationaldatail["candidates"]["CandidateEducations"].length;
          i++) {
        if (id ==
            educationaldatail["candidates"]["CandidateEducations"][i]["id"]) {
          setState(() {
            educationaldatail["candidates"]["CandidateEducations"].remove(
                educationaldatail["candidates"]["CandidateEducations"][i]);
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
    return Container(
      margin: EdgeInsets.all(15.w),
      child: Column(
        children: [
          SizedBox(height: 15.h),
          Text("Your Best Academic Results",
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
                            child: 
                            Column(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                                                Container(
                                  padding: EdgeInsets.only(right: 10.w),

                                  //width: 200.w,
                                  child: Text(
                                      educationaldatail["candidates"]
                                              ["CandidateEducations"][index]
                                          ["institute_name"],


                                      maxLines: 2,
                                      style: GoogleFonts.inter(
                                          color: Gold,
                                          fontSize: 15.sp,
                                          fontWeight: kFW600)),
                                ),
                                Row(
                                
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                      onTap: () {
                                        Get.toNamed(KEducationalDetails,
                                            arguments:
                                                educationaldatail["candidates"]
                                                        ["CandidateEducations"]
                                                    [index]);

                                      },
                                      child: Image.asset(
                                          'assets/images/boxpen.png',
                                          color: white,
                                          width: 20.w),
                                    ),
                                        SizedBox(width: 10.w),
                                        SizedBox(
                                          width: 150.w,
                                          child: Text(
                                              educationaldatail["candidates"]
                                                      ["CandidateEducations"][index]
                                                  ["name"],
                                
                                              //   ["institute_name"],
                                              //educationaldatail[index]?["name"] ?? "B.tech",
                                              //"B.tech",
                                              maxLines: 2,
                                              style: GoogleFonts.inter(
                                                  color: Gold,
                                                  fontSize: 13,
                                                  fontWeight: kFW600)),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(right: 10.w),
                                      child: GestureDetector(
                                        onTap: () {
                                          deleteEducation(
                                              educationaldatail["candidates"]
                                                      ["CandidateEducations"][index]
                                                  ["id"]);
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: white,
                                        ),
                                      ),
                                    )
                                
                                  ],
                                ),
                              ],
                            ),
                          ));
                    },
                    itemWidth: double.infinity,
                    itemCount: educationaldatail["candidates"]
                            ["CandidateEducations"]
                        .length,
                    //  itemCount: educationaldatail.length,

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
          SizedBox(height: 30.h),
          CustomProfileButton(
            label: 'Add +',
            isLoading: true,
            onTap: () {
                            Get.toNamed(KEducationalDetails, arguments: {'id': -1});


            },
          ),
        ],
      ),
    );
  }
}

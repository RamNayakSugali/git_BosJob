import 'package:bossjobs/utils/export_file.dart';

class SkillGraphView extends StatefulWidget {
  const SkillGraphView({super.key});

  @override
  State<SkillGraphView> createState() => _SkillGraphViewState();
}

class _SkillGraphViewState extends State<SkillGraphView> {
  @override
  void initState() {
    getSkillInfo();
    getSkillExercise();
    getSkillCourseInfo();
    getSkillJobs();
    super.initState();
  }

  bool isSkillLoading = false;
  Map skillInfo = {};
  Future getSkillInfo() async {
    setState(() {
      isSkillLoading = true;
    });
    Map data = await Services.getSkillInfo(Get.arguments["skillId"]);
    if (data["data"]["message"] != null) {
      Fluttertoast.showToast(
        msg: data["data"]["message"],
      );
    } else {
      skillInfo = data["data"]["data"];
    }
    print(data["data"]["data"]);
    setState(() {
      isSkillLoading = false;
    });
  }

  bool isSkillJobsLoading = false;
  Map skillJobs = {};
  Future getSkillJobs() async {
    setState(() {
      isSkillJobsLoading = true;
    });
    Map data = await Services.getSkillJobs(Get.arguments["skillId"]);
    if (data["data"]["message"] != null) {
    } else {
      skillJobs = data["data"];
    }
    setState(() {
      isSkillJobsLoading = false;
    });
  }

  bool isSkillCourseLoading = false;
  List skillCourse = [];
  Future getSkillCourseInfo() async {
    setState(() {
      isSkillCourseLoading = true;
    });
    Map data = await Services.getSkillCourseInfo(Get.arguments["skillId"]);
    if (data["data"]["message"] != null) {
      skillCourse = [];
    } else {
      skillCourse = data["data"]["data"];
    }
    print(data["data"]["data"]);
    setState(() {
      isSkillCourseLoading = false;
    });
  }

  bool isSkillExerciseLoading = false;
  List skillExercise = [];
  Future getSkillExercise() async {
    setState(() {
      isSkillExerciseLoading = true;
    });
    Map data = await Services.getSkillExercise(Get.arguments["skillId"]);
    if (data["data"]["message"] != null) {
      skillExercise = [];
    } else {
      skillExercise = data["data"]["data"];
    }
    setState(() {
      isSkillExerciseLoading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         iconTheme: const IconThemeData(color: white),
        automaticallyImplyLeading: true,
        backgroundColor: darktwo,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Skills',
          style: GoogleFonts.gothicA1(
            letterSpacing: 1,
            fontSize: 17.sp,
            color: white,
            fontWeight: kFW700,
          ),
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
                    child: const CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 13.w,
          )
        ],
      ),
      bottomSheet: Container(
          margin:
              EdgeInsets.only(left: 15.w, right: 15.w, bottom: 20.h, top: 5.h),
          child: CustomDarkButton(
              label: 'Start',
              isLoading: true,
              onTap: () {
                Get.toNamed(KskillAssesment,arguments:skillInfo );
              }
              ),
        ),
      body: Stack(children: [
        const Background(),
        isSkillLoading==false?
        Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text("Add Skill",
                    style: GoogleFonts.gothicA1(
                      letterSpacing: 2,
                      fontSize: 15.sp,
                      color: white,
                      fontWeight: kFW900,
                    )),
              ),
              SizedBox(
                height: 8.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(skillInfo["skilinfo"]["title"],
                    style: GoogleFonts.gothicA1(
                      letterSpacing: 2,
                      fontSize: 15.sp,
                      color: korange,
                      fontWeight: kFW900,
                    )),
              ),
              SizedBox(
                height: 28.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Text("Before You Start",
                    style: GoogleFonts.gothicA1(
                      letterSpacing: 1,
                      fontSize: 12.sp,
                      color: white,
                      fontWeight: kFW400,
                    )),
              ),
              SizedBox(
                height: 8.h,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Icon(Icons.message,color: white,size: 20.sp,),
                      SizedBox(
                        width: 5.w,
                      ),
                      SizedBox(
                        width: 300.w,
                        child: Text(
                            "You must complete this assessment in one session — make sure your internet is reliable. ",
                            maxLines: 2,
                            style: GoogleFonts.gothicA1(
                              letterSpacing: 1,
                              fontSize: 12.sp,
                              color: white,
                              fontWeight: kFW400,
                            )),
                      )
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Icon(Icons.message,color: white,size: 20.sp,),
                      SizedBox(
                        width: 5.w,
                      ),
                      SizedBox(
                        width: 300.w,
                        child: Text(
                            "If you don’t earn a badge this time, you can only retake this assessment after clearing beginner's courses ",
                            maxLines: 2,
                            style: GoogleFonts.gothicA1(
                              letterSpacing: 1,
                              fontSize: 12.sp,
                              color: white,
                              fontWeight: kFW400,
                            )),
                      )
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Icon(Icons.message,color: white,size: 20.sp,),
                      SizedBox(
                        width: 5.w,
                      ),
                      SizedBox(
                        width: 300.w,
                        child: Text(
                            "We won’t show your results to anyone without your permission.",
                            maxLines: 2,
                            style: GoogleFonts.gothicA1(
                              letterSpacing: 1,
                              fontSize: 12.sp,
                              color: white,
                              fontWeight: kFW400,
                            )),
                      )
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Icon(Icons.message,color: white,size: 20.sp,),
                      SizedBox(
                        width: 5.w,
                      ),
                      SizedBox(
                        width: 300.w,
                        child: Text(
                            "Skill Assessment allows you to demonstrate your knowledge of the skills you've added on your profile by completing assessments specific to those skills. ",
                            maxLines: 2,
                            style: GoogleFonts.gothicA1(
                              letterSpacing: 1,
                              fontSize: 12.sp,
                              color: white,
                              fontWeight: kFW400,
                            )),
                      )
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  Row(
                    children: [
                     SizedBox(
                        width: 5.w,
                      ),
                      Icon(Icons.message,color: white,size: 20.sp,),
                      SizedBox(
                        width: 5.w,
                      ),
                      SizedBox(
                        width: 300.w,
                        child: Text(
                            "A typical assessment consists of 15 multiple choice questions and each question tests at least one concept or subskill. ",
                            maxLines: 2,
                            style: GoogleFonts.gothicA1(
                              letterSpacing: 1,
                              fontSize: 12.sp,
                              color: white,
                              fontWeight: kFW400,
                            )),
                      )
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Icon(Icons.message,color: white,size: 20.sp,),
                      SizedBox(
                        width: 5.w,
                      ),
                      SizedBox(
                        width: 300.w,
                        child: Text(
                            "The Assessment is timed and must be completed in one session. ",
                            maxLines: 2,
                            style: GoogleFonts.gothicA1(
                              letterSpacing: 1,
                              fontSize: 12.sp,
                              color: white,
                              fontWeight: kFW400,
                            )),
                      )
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Icon(Icons.message,color: white,size: 20.sp,),
                      SizedBox(
                        width: 5.w,
                      ),
                      SizedBox(
                        width: 300.w,
                        child: Text(
                            " It’s not mandatory for you to take the assessment. However, taking the assessment will help you rank higher in the application pool received by employers. ",
                            maxLines: 2,
                            style: GoogleFonts.gothicA1(
                              letterSpacing: 1,
                              fontSize: 12.sp,
                              color: white,
                              fontWeight: kFW400,
                            )),
                      )
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Icon(Icons.message,color: white,size: 20.sp,),
                      SizedBox(
                        width: 5.w,
                      ),
                      SizedBox(
                        width: 300.w,
                        child: Text(
                            " It indicates that you have the skills recommended by an employer and increase your chances of getting hired.* ",
                            maxLines: 2,
                            style: GoogleFonts.gothicA1(
                              letterSpacing: 1,
                              fontSize: 12.sp,
                              color: white,
                              fontWeight: kFW400,
                            )),
                      )
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  Row(
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Icon(Icons.message,color: white,size: 20.sp,),
                      SizedBox(
                        width: 5.w,
                      ),
                      SizedBox(
                        width: 300.w,
                        child: Text(
                            "Recruiters won’t be able to see your score. However, based on the Skill score thresholds given by them, your profile automatically ranks accordingly. ",
                            maxLines: 2,
                            style: GoogleFonts.gothicA1(
                              letterSpacing: 1,
                              fontSize: 12.sp,
                              color: white,
                              fontWeight: kFW400,
                            )),
                      )
                    ],
                  ),
                  
                ],
              )
            ],
          ),
        ):const Center(child: CircularProgressIndicator(color: white,),)
      ]),
    );
  }
}

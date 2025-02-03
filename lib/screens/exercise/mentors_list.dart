import 'dart:ui';

import 'package:bossjobs/utils/export_file.dart';

class MentorList extends StatefulWidget {
  const MentorList({super.key});

  @override
  State<MentorList> createState() => _MentorListState();
}

class _MentorListState extends State<MentorList> {
  bool isLoading = false;
  List SearchMentor = [];

  Future exerciseHandler() async {
    setState(() {
      isLoading = true;
    });
    Map payload = {
      "type": "search_exercise",
    };

    var value = await Services.getsearchexerciseList(payload);

    if (value["data"] == null) {
      Fluttertoast.showToast(msg: value["message"]);
    } else {
      SearchMentor = value["data"];
    }
    print(value["data"]);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    exerciseHandler();
  }
//  // var Mentors;
//   List<dynamic> Mentors = [];
//   bool isLoading = false;
//   Future MentorsListHandler() async {
//     setState(() {
//       isLoading = true;
//     });
//     Map data = await Services.getAllExercises();
//     if (data["message"] != null) {
//       Fluttertoast.showToast(
//         msg: data["message"],
//       );
//     } else {
//       Mentors = data["data"]["data"];
//     }
//     print(data["data"]["data"]);
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();

//     MentorsListHandler();
//   }

  @override
  Widget build(BuildContext context) {
    // exercises[index]?["title"]??"",

    return isLoading == false
        ? SizedBox(
            height: 150.h,
            child: ListView.builder(
                itemCount: SearchMentor.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return Wrap(
                    children: [
                      GlassmorphicContainer(
                        margin: EdgeInsets.only(right: 15.w),
                        height: 140.h,
                        width: 120.w,
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
                          margin: EdgeInsets.all(1.h),
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
                                  //  margin: EdgeInsets.all(2.h),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: const GradientBoxBorder(
                                        gradient: LinearGradient(colors: [
                                          Color.fromARGB(97, 7, 7, 7),
                                          darkGrey
                                        ]),
                                        width: 0.5,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(16.r)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 20.h),
                                        //alignment: Alignment.center,
                                        child: CircleAvatar(
                                            backgroundColor: kBackground,
                                            radius: 30.r,
                                            child: Image.asset(
                                                'assets/images/darkWoman.png',
                                                height: 52.h)),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10.h, left: 10.w, bottom: 7.h),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: Colors.green,
                                              radius: 5.r,
                                            ),
                                            SizedBox(width: 10.w),
                                            SizedBox(
                                              width: 70,
                                              child: Text(
                                                SearchMentor[index]?["coach"]
                                                        ?["user"]?["name"] ??
                                                    "Mentor",
                                                maxLines: 1,
                                                style: GoogleFonts.gothicA1(
                                                    fontSize: kFourteenFont,
                                                    color: white,
                                                    fontWeight: kFW600),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 15.w),
                                        child: Text(
                                          "Creative Director",
                                          style: GoogleFonts.gothicA1(
                                              fontSize: 11.sp,
                                              color: white,
                                              fontWeight: kFW500),
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
          ));
  }
}

import 'dart:ui';

import '../../utils/export_file.dart';

class DesignCourses extends StatefulWidget {
  const DesignCourses({super.key});

  @override
  State<DesignCourses> createState() => _DesignCoursesState();
}

class _DesignCoursesState extends State<DesignCourses> {
  var Courses;
  bool isLoading = false;
  Future AllCoursesListHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.getSkillsCourse();
    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      Courses = data["data"]["data"];
    }
    print(data["data"]["data"]);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    AllCoursesListHandler();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: Courses.length,
            //Courses.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                childAspectRatio: (0.31 / 0.63)),
            itemBuilder: ((context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 170.h,
                    margin: EdgeInsets.only(right: 5.w, bottom: 5.h),
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(colors: [grey, Gold]),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Image(
                      image: NetworkImage(kCourseURL +
                          Courses[index]?["course"]?["course_banner"]),
                      fit: BoxFit.fill,
                      errorBuilder: (c, o, s) => Center(
                        child: Text(
                          "Unable to Load Image",
                          style: GoogleFonts.gothicA1(
                            fontSize: kFourteenFont,
                            color: white,
                            fontWeight: kFW700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Courses[index]?["course"]?["title"],

                            //  'React Native',
                            maxLines: 1,
                            style: GoogleFonts.gothicA1(
                                fontSize: 15.sp,
                                color: white,
                                fontWeight: kFW700)),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            Text(
                              '\u{20B9}${Courses[index]?["course"]?["price"]}',
                              style: GoogleFonts.gothicA1(
                                  fontSize: kFourteenFont,
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
                                  fontSize: kTwelveFont,
                                  color: white,
                                  fontWeight: kFW700),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          Courses[index]?["course"]?["coaches"][0]["user"]
                                  ?["name"] ??
                              "",

                          //  Courses[index]?["coaches"]?
                          //                      ["user"]?["name"]??"",
                          // 'Rajesh Khanna,Amrita Dubey',
                          style: GoogleFonts.gothicA1(
                              // decoration: TextDecoration.lineThrough,
                              fontSize: kTenFont,
                              color: white,
                              fontWeight: kFW400),
                        ),
                        SizedBox(height: 8.h),
                        Container(
                            height: 30.h,
                            width: 160.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                    color: Color.fromARGB(255, 13, 12, 12)
                                        .withOpacity(0.1),
                                  )
                                ],
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      grey.withOpacity(0.5),
                                      grey1.withOpacity(0.5),
                                      Color.fromARGB(255, 58, 55, 55)
                                          .withOpacity(0.1),
                                    ])),
                            child: Text(
                              "Buy now",
                              style: GoogleFonts.gothicA1(
                                  fontSize: 13.sp,
                                  color: white,
                                  fontWeight: kFW700),
                            ))
                      ],
                    ),
                  ),
                ],
              );
            }))
        : const Center(
            child: CircularProgressIndicator(
            color: Gold,
          ));
  }
}

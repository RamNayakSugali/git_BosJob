import 'package:bossjobs/screens/courses/courses.dart';

import '../../utils/export_file.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  List<Map<String,dynamic>> categories = [
    {
      "title":"Search Jobs",
      "image":"assets/images/Frame.png",
      "function":Jobs(isHome: true)
    },
    {
      "title":"Buy Courses",
      "image":"assets/images/Frame.png",
      "function":coures(isHome: true)
    },
    {
      "title":"Schedule Interview",
      "image":"assets/images/Frame.png",
      "function":Schedule(isHome: true)
    },
    {
      "title":"Take Test",
      "image":"assets/images/Frame.png",
      "function":Exercise(isHome: true)
    },
    // Category(
    //     title: "Search Jobs", tap: () {
    //       Get.to(Jobs(isHome: true));
    //     }, image: "assets/images/Frame.png"),
    // Category(
    //     title: "Buy Courses", tap: () {
    //       Get.to(coures(isHome: true));
    //     }, image: "assets/images/Frame.png"),
    // Category(
    //     title: "Schedule Interview",
    //     tap: () {
    //       Get.to(Schedule(isHome: true),);
    //     },
    //     image: "assets/images/Frame.png"),
    // Category(title: "Take Test", tap: () {
    //   Get.to(Exercise(isHome: true));
    // }, image: "assets/images/Frame.png"),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Get Started",
          style: GoogleFonts.gothicA1(
              fontSize: kSixteenFont, color: white, fontWeight: kFW700),
        ),
        SizedBox(
          height: 60.h,
          child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap:(){
                    Get.to(categories[index]["function"]);
                  },
                  child: Container(
                     // width: 142.w,
                      height: 58.h,
                      margin: EdgeInsets.only(top: 15.h, right: 15.w),
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              spreadRadius: 5,
                              color: const Color.fromARGB(255, 13, 12, 12)
                                  .withOpacity(0.1),
                            )
                          ],
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                darkGrey,
                                darkGrey,
                              ])),
                      child: Row(
                        children: [
                          Image.asset(
                            categories[index]["image"],
                            width: 25.w,
                          ),
                          SizedBox(width: 5.w),
                          SizedBox(
                            width: 90.w,
                            child: Text(
                              categories[index]["title"],
                              maxLines: 1,
                              // "Netbanking",
                              style: GoogleFonts.gothicA1(
                                  fontSize: 12.sp,
                                  color: white,
                                  fontWeight: kFW700),
                            ),
                          ),
                        ],
                      )),
                );
              })),
        )
      ],
    );
  }
}


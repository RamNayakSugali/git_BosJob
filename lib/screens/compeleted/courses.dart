import '../../../../utils/export_file.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            //mainAxisSpacing: 2,
            childAspectRatio: (0.31 / 0.50)),
        itemBuilder: ((context, index) {
          return Container(
            margin: EdgeInsets.all(8.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 170.h,
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(colors: [grey, Gold]),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(0.r)),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/video.png',
                          height: 250.h,
                          fit: BoxFit.fill,
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset('assets/images/delete.png'),
                                Row(
                                  children: [
                                    Text(
                                      'Cirtificate',
                                      style: GoogleFonts.gothicA1(color: white),
                                    ),
                                    Image.asset(
                                      'assets/images/upload.png',
                                      width: 23.w,
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 7.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('React Native',
                            style: GoogleFonts.gothicA1(
                                fontSize: 13.sp,
                                color: white,
                                fontWeight: kFW600)),
                        Text('Mark Obtain',
                            style: GoogleFonts.gothicA1(
                                fontSize: 11.sp,
                                color: white,
                                fontWeight: kFW400)),
                      ],
                    ),
                    CircularPercentIndicator(
                      reverse: true,
                      backgroundColor: kBackground,
                      radius: 18.0,
                      lineWidth: 4.0,
                      animation: true,
                      percent: 0.7,
                      center: Text(
                        '80%',
                        style:
                            GoogleFonts.gothicA1(color: white, fontSize: 9.sp),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: Gold,
                    ),
                  ],
                ),
              ],
            ),
          );
        }));
  }
}

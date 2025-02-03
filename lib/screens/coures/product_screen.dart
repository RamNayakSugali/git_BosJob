import '../../utils/export_file.dart';

class ProductionScreen extends StatefulWidget {
  const ProductionScreen({super.key});

  @override
  State<ProductionScreen> createState() => _ProductionScreenState();
}

class _ProductionScreenState extends State<ProductionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackground,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: white),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Courses ',
            style: GoogleFonts.gothicA1(
                letterSpacing: 1,
                fontSize: kEighteenFont,
                color: white,
                fontWeight: kFW700),
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
                        //top: .h,
                        child: const CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.green,
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 13.w,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //const Search(),
                const CardPopular(),

                SizedBox(
                  height: 40.h,
                ),
                // Text("Other Courses from same Mentor",
                //     style: GoogleFonts.gothicA1(
                //         fontSize: kSixteenFont,
                //         color: white,
                //         fontWeight: kFW700)),
                // SizedBox(height: 10.h),
                //     gridOtherCourses(),
                // SizedBox(
                //   height: 100.h,
                // ),
              ],
            ),
          ),
        ));
  }
}

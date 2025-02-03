import 'package:bossjobs/screens/courses/course_details.dart';

import '../../utils/export_file.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen({super.key});

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        backgroundColor: darktwo,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Course',
          style: GoogleFonts.gothicA1(
            letterSpacing: 1,
            fontSize: kEighteenFont,
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
          ),
        ],
      ),
      body: Stack(
        children: [
          Background(),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(15.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CourseDetails(),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

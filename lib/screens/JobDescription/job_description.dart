import '../../utils/export_file.dart';

class JobDescribe extends StatefulWidget {
  const JobDescribe({super.key});

  @override
  State<JobDescribe> createState() => _JobDescribeState();
}

class _JobDescribeState extends State<JobDescribe> {
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
            'Job',
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
        body: Stack(
          children: [
            Background(),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(15.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    const DescriptionPage(),
                    SizedBox(
                      height: 45.h,
                    ),
                    // ProfileCardArrow(),
                    SizedBox(
                      height: 10.h,
                    ),
                    // const Google_map(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

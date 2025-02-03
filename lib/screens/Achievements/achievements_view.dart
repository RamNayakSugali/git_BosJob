import '../../../utils/export_file.dart';
import '../courses/mostpopular.dart';

// ignore: camel_case_types
class Achimevements_view extends StatefulWidget {
  const Achimevements_view({super.key});

  @override
  State<Achimevements_view> createState() => _AchimevementsState();
}

class _AchimevementsState extends State<Achimevements_view> {
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
            'Achievement',
            style: GoogleFonts.gothicA1(
                fontSize: kEighteenFont, color: white, fontWeight: kFW700),
          ),
          actions: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(KNotification);
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/bell.png',
                        width: 20.w,
                      ),
                      Positioned(
                          left: 13.r,
                          child: const CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.green,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  width: 13.w,
                ),
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15.w),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: kBackground,
                  radius: 56.r,
                  child: Image.asset(
                    'assets/images/profile2.png',
                    width: 112.w,
                  ),
                ),
                SizedBox(height: 10.h),
                Text("Richard Chapman",
                    style: GoogleFonts.inter(
                        color: white,
                        fontSize: kSixteenFont,
                        fontWeight: kFW600)),
                SizedBox(height: 20.h),
                const Daylist(),
                SizedBox(height: 25.w),
                const classes_list(),
                SizedBox(
                  height: 20.h,
                ),
                const Achieve_card(),
                SizedBox(
                  height: 20.h,
                ),
                const playquiz(),
                SizedBox(
                  height: 20.h,
                ),
                const Most_popular(),
                SizedBox(
                  height: 20.h,
                ),
                //const Bar_chat(),
                SizedBox(height: 20.h)
              ],
            ),
          ),
        ));
  }
}

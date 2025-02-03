// ignore_for_file: camel_case_types

import '../../../utils/export_file.dart';

class Apply_button extends StatefulWidget {
  const Apply_button({super.key});

  @override
  State<Apply_button> createState() => _Apply_buttonState();
}

class _Apply_buttonState extends State<Apply_button> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            SizedBox(
              height: 40.h,
              width: 140.w,
              child: TextButton(
                onPressed: () {
                  //Get.toNamed(KApplied);
                },
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(grey),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            side: const BorderSide(color: grey)))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 8.w),
                    Text(
                      "Recruiter Action",
                      style: GoogleFonts.gothicA1(
                          fontSize: 11.sp, color: white, fontWeight: kFW700),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: 20.w),
            SizedBox(
              // margin: EdgeInsets.only(right: 10.w),
              height: 40.h,
              width: 140.w,
              child: TextButton(
                onPressed: () {
                  // Get.toNamed(KApplied);
                },
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(grey),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            side: const BorderSide(color: grey)))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Applied on BossJob",
                      style: GoogleFonts.gothicA1(
                          fontSize: 11.sp, color: white, fontWeight: kFW700),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Positioned(
            left: 125.r,
            bottom: 24.r,
            //top: .h,
            child: const CircleAvatar(
              radius: 5,
              backgroundColor: Colors.green,
            ))
      ],
    );
  }
}

import '../../../utils/export_file.dart';

class ScheduleDayslist extends StatefulWidget {
  const ScheduleDayslist({super.key});

  @override
  State<ScheduleDayslist> createState() => _ScheduleDayslistState();
}

class _ScheduleDayslistState extends State<ScheduleDayslist> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.blue,
      height: 40.h,
      //margin: EdgeInsets.only(top: 20.h),
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 10.w),
             decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                grey,
                grey1,
              ],
            )
          ),
          
          
              width: 110.w,
              child: 
              Text(
                "Today",
                
                style: GoogleFonts.gothicA1(
                    fontSize: kTwelveFont,
                    color: white,
                    fontWeight: kFW600),
              ),
            );
          })),
    );
  }
}

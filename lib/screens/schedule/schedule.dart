import '../../utils/export_file.dart';

class Schedule extends StatefulWidget {
  bool? isHome;
  Schedule({super.key,this.isHome});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar:
    widget.isHome==true?      
       AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back,color: Colors.white,),onPressed: (){Navigator.of(context).pop();},),
        automaticallyImplyLeading: false,
        backgroundColor: darktwo,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Schedules',
          style: GoogleFonts.gothicA1(
            fontSize: kEighteenFont,
            color: white,
            fontWeight: kFW700,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(KEdit_Schedule);
            },
            child: Image.asset(
              'assets/images/edit.png',
              width: 22.w,
            ),
          ),
          SizedBox(
            width: 13.w,
          ),
        ],
      ):AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: darktwo,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Schedules',
          style: GoogleFonts.gothicA1(
            fontSize: kEighteenFont,
            color: white,
            fontWeight: kFW700,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(KEdit_Schedule);
            },
            child: Image.asset(
              'assets/images/edit.png',
              width: 22.w,
            ),
          ),
          SizedBox(
            width: 13.w,
          ),
        ],
      ),
      body: Stack(
        children: [
          const Background(),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(15.w),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                    width: 50.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: Icon(
                      Icons.calendar_month,
                      size: 30.w,
                      color: Gold,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Calender',
                    style: GoogleFonts.gothicA1(
                      fontSize: 13.sp,
                      color: white,
                      fontWeight: kFW700,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const ScheduleDayslist(),
                  SizedBox(
                    height: 15.h,
                  ),
                  const Calender(),
                  SizedBox(
                    height: 55.h,
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

import '../../../../utils/export_file.dart';
import '../courses/mostpopular.dart';

class Downloaded extends StatefulWidget {
  const Downloaded({super.key});

  @override
  State<Downloaded> createState() => _DownloadedState();
}

class _DownloadedState extends State<Downloaded> {
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
          'Downloaded Session',
          style: GoogleFonts.gothicA1(
              fontSize: kEighteenFont, color: white, fontWeight: kFW700),
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
          child: 
          Container(
            margin: EdgeInsets.all(15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
                  children:   [
            Search(),
             SizedBox(
          height: 15.h,
        ),
             Text(
          'In Progress',
          style: GoogleFonts.gothicA1(
              fontSize: kFourteenFont, color: white, fontWeight: kFW700),
        ),
        SizedBox(
          height: 10.h,
        ),
            Inprogress(),
             SizedBox(
          height: 10.h,
        ),
             Text(
          'My Drive ',
         
          style: GoogleFonts.inter(
            fontSize: kFourteenFont,
            fontWeight: kFW700,
            color: white,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
            Mydrive(),
            SizedBox(
              height: 10,
            ),
             Text(
          'Most Popular Coures',
          style: GoogleFonts.gothicA1(
              fontSize: kSixteenFont, color: white, fontWeight: kFW700),
        ),
        const SizedBox(
          height: 10,
        ),
            Most_popular(),
            SizedBox(
              height: 30,
            )
                  ],
                ),
          )),
    );
  }
}

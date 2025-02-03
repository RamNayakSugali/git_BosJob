import '../../../utils/export_file.dart';

class Personal_info extends StatefulWidget {
  const Personal_info({super.key});

  @override
  State<Personal_info> createState() => _PersonalinfoState();
}

class _PersonalinfoState extends State<Personal_info> {
  @override
  Widget build(BuildContext context) {
    return 
      Column(
        children: [
          CircleAvatar(
            backgroundColor: kBackground,
            radius: 50.r,
            child: Image.asset(
              'assets/images/profile2.png',
              width: 112.w,
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            'Richard Chapman',
            style: GoogleFonts.gothicA1(
                fontSize: kSixteenFont, color: white, fontWeight: kFW600),
          ),
          SizedBox(height: 12.h),
          Text(
            'Co-Founder,Presentience',
            style: GoogleFonts.gothicA1(
                fontSize: kTwelveFont, color: white, fontWeight: kFW700),
          ),
          SizedBox(height: 5.h),
          Text(
            'www.presentience.in',
            style: GoogleFonts.gothicA1(
                fontSize: kTwelveFont, color: white, fontWeight: kFW700),
          ),
        ],
      
    );
  }
}

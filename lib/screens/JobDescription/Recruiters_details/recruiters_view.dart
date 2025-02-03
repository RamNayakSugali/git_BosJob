import 'package:bossjobs/screens/JobDescription/Recruiters_details/opening_list.dart';

import '../../../utils/export_file.dart';

class Recruiters_view extends StatefulWidget {
  const Recruiters_view({super.key});

  @override
  State<Recruiters_view> createState() => _RecruitersviewState();
}

class _RecruitersviewState extends State<Recruiters_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: 
          Container(
            margin: EdgeInsets.all(15.w),
            child: Column(
                  children: [
            const Personal_info(),
            SizedBox(
              height: 30.h,
            ),
            const Opening(),
                  ],
                ),
          )),
    );
  }
}

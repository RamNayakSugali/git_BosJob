// ignore_for_file: camel_case_types

import '../../../utils/export_file.dart';

class classes_list extends StatefulWidget {
  const classes_list({super.key});

  @override
  State<classes_list> createState() => _classeslistState();
}

class _classeslistState extends State<classes_list> {
  @override
  Widget build(BuildContext context) {
    return 
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Classes',
          style: GoogleFonts.gothicA1(
              fontSize: kFourteenFont, color: white, fontWeight: kFW700),
        ),
        SizedBox(
          height: 10.h,
        ),
        ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: ((context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  child: Image.asset('assets/images/man.png'),
                ),
                title: Text(
                  'Fundamental of Figma',
                  style: GoogleFonts.gothicA1(
                      fontSize: kTwelveFont, color: Gold, fontWeight: kFW700),
                ),
                subtitle: Text(
                  '10 Min Remaining',
                  style: GoogleFonts.gothicA1(
                      fontSize: kTenFont, color: white, fontWeight: kFW400),
                ),
                trailing: CircularPercentIndicator(
                  reverse: true,
                  backgroundColor: kBackground,
                  radius: 20.0,
                  lineWidth: 4.0,
                  animation: true,
                  percent: 0.7,
                  center: const Icon(
                    Icons.play_arrow_outlined,
                    color: white,
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Gold,
                ),
              );
            }))
      ],
    );
  }
}

import '../../../../utils/export_file.dart';

class Inprogress extends StatefulWidget {
  const Inprogress({super.key});

  @override
  State<Inprogress> createState() => _InprogressState();
}

class _InprogressState extends State<Inprogress> {
  @override
  Widget build(BuildContext context) {
    return 
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
        }));
  }
}

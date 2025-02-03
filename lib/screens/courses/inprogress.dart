import 'package:bossjobs/utils/export_file.dart';

class InprogressList extends StatefulWidget {
  const InprogressList({super.key});

  @override
  State<InprogressList> createState() => _InprogressListState();
}

class _InprogressListState extends State<InprogressList> {
  bool isLoading = false;
  List SearchProgressCourse = [];

  Future searchcourseHandler() async {
    setState(() {
      isLoading = true;
    });
    Map payload = {
      "candidate_id": "502",
      "listing_type": "all_courses",
      // "candidate_id": "502",
      // // "listing_type": "my_courses",
      // // "listing_type": "all_courses",
      // "type": "my_courses",
      // "type": "all_courses",
    };

    var value = await Services.searchCourse(payload);

    if (value["data"] == null) {
      Fluttertoast.showToast(msg: value["message"]);
    } else {
      SearchProgressCourse = value["data"];
    }
    print(value["data"]);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    searchcourseHandler();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == false
        ? ListView.builder(
            itemCount: SearchProgressCourse.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: ((context, index) {
              return ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  child: Image.asset('assets/images/man.png'),
                ),
                title: Text(
                  SearchProgressCourse[index]["title"],
                  // "ram",
                  // 'Fundamental of Figma',
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
        : const Center(
            child: CircularProgressIndicator(
            color: Gold,
          ));
  }
}

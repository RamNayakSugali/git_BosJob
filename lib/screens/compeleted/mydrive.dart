import '../../../../utils/export_file.dart';

class Mydrive extends StatefulWidget {
  const Mydrive({super.key});

  @override
  State<Mydrive> createState() => _MydriveState();
}

class _MydriveState extends State<Mydrive> {
  bool isLoading = false;
  List SearchCourse = [];

  Future searchcourseHandler() async {
    setState(() {
      isLoading = true;
    });
    Map payload = {
      
       "type": "my_courses",
      
    };

    var value = await Services.searchCourse(payload);

    if (value["data"] == null) {
      Fluttertoast.showToast(msg: value["message"]);
    } else {
      SearchCourse = value["data"];
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
    return 
    GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4),
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/folderz.png",
              height: 45.h,
            ),
            Text(
              'UI/UX Fundamental',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: kTenFont,
                fontWeight: kFW500,
                color: white,
              ),
            ),
          ],
        );
      },
    );
  }
}

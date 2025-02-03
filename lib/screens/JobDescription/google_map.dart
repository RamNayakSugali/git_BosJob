import '../../utils/export_file.dart';

class Google_map extends StatefulWidget {
  const Google_map({super.key});

  @override
  State<Google_map> createState() => _GooglemapState();
}

class _GooglemapState extends State<Google_map> {
  var id = Get.arguments;
    Map individualjobs = {};
  bool isLoading = false;
  Future jobHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.getindividualjob(id);
    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      individualjobs = data["data"]["data"];
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    jobHandler();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(kRecruiters);
          },
          child: 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                      backgroundColor: white,
                      radius: 25,
                      child: Image.asset('assets/images/man.png',
                          height: 52.h)),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                         // individualjobs["placementofficer_sharedjobs"]["placement_officer"][0]["organization_name"],
                        "Resbee Info Technologies",
                    //  $.[]placementofficer_sharedjobs.[]placement_officer.[]organization_name
                        style: GoogleFonts.gothicA1(
                            fontSize: 13.sp,
                            color: white,
                            fontWeight: kFW500),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "Rashee , Co-Founder",
                        style: GoogleFonts.gothicA1(
                            fontSize: 13.sp,
                            color: white,
                            fontWeight: kFW500),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios, color: Gold),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20.h, bottom: 30.h),
          child: Image.asset(
            'assets/images/map.png',
            width: 328.w,
          ),
        ),
      ],
    );
  }
}

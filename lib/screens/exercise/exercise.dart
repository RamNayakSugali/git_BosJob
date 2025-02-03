import '../../utils/export_file.dart';

class Exercise extends StatefulWidget {
  bool? isHome;
  Exercise({super.key,this.isHome});

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  @override
  void initState() {
    profileHandler();
    super.initState();
  }

  Map profiledata = {};
//List<dynamic> profiledata = [];
  bool isLoading = false;
  Future profileHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.getprofiledatajob();

    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      profiledata = data["data"];
      await exerciseHandler();
    }
    print(data["data"]["data"]);
    setState(() {
      isLoading = false;
    });
  }

  List originalSearchExercise = [];
  List searchExercise = [];
  Future exerciseHandler() async {
    Map payload = {
      "candidate_id":
          profiledata["candidates"]["CandidateDetails"]["id"].toString(),
      "type": "search_exercise",
    };

    var value = await Services.getsearchexerciseList(payload);

    if (value["data"] == null) {
      Fluttertoast.showToast(msg: value["message"]);
    } else {
      searchExercise = value["data"];
      originalSearchExercise = value["data"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackground,
        appBar:widget.isHome==true? AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back,color: Colors.white,),onPressed: (){Navigator.of(context).pop();},),
          automaticallyImplyLeading: false,
          backgroundColor: darktwo,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Exercise',
            style: GoogleFonts.gothicA1(
                fontSize: kEighteenFont, color: white, fontWeight: kFW700),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.toNamed(kFavouritedExercise);
              },
              child: Image.asset(
                'assets/images/love.png',
                width: 18.w,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
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
        ):AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: darktwo,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Exercise',
            style: GoogleFonts.gothicA1(
                fontSize: kEighteenFont, color: white, fontWeight: kFW700),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.toNamed(kFavouritedExercise);
              },
              child: Image.asset(
                'assets/images/love.png',
                width: 18.w,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
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
        body: Stack(
          children: [
            Background(),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(15.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(

                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search, color: Gold),
                        filled: true,
                        fillColor: white,
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 15, 10, 15),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(
                            color: white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(
                            color: white,
                          ),
                        ),
                        hintText: "Search Exercise",
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchExercise = originalSearchExercise
                              .where(
                                  (element) => element["title"].contains(value))
                              .toList();
                          debugPrint("${searchExercise.length}");
                        });
                      },
                    ),

                    //  SizedBox(height: 10.h),
                    // Text(
                    //   "Mentors",
                    //   style: GoogleFonts.gothicA1(
                    //       fontSize: kSixteenFont,
                    //       color: white,
                    //       fontWeight: kFW700),
                    // ),
                    // SizedBox(height: 10.h),
                    //   MentorList(),
                    SizedBox(height: 15.h),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Exercise",
                              style: GoogleFonts.gothicA1(
                                  fontSize: kSixteenFont,
                                  color: white,
                                  fontWeight: kFW700)),
                          Text("result(${searchExercise.length})",
                              style: GoogleFonts.gothicA1(
                                  fontSize: kSixteenFont,
                                  color: white,
                                  fontWeight: kFW700))
                        ]),
                    SizedBox(height: 18.h),
                    isLoading == false
                        ? Exercise_view(searchExerciseData: searchExercise)
                        : Center(
                            child: CircularProgressIndicator(
                            color: Gold,
                          )),
                    SizedBox(height: 45.h),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

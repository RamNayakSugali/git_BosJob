import 'dart:io';
import 'dart:ui';

import 'package:bossjobs/utils/export_file.dart';
// import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:intl/intl.dart';
import 'package:material_tag_editor/tag_editor.dart';

class coursedetails extends StatefulWidget {
  int? id;
  Map choosenLessonData;
  coursedetails({super.key, required this.id, required this.choosenLessonData});

  @override
  State<coursedetails> createState() => _coursedetailsState();
}

class _coursedetailsState extends State<coursedetails> {
  TextEditingController Title = TextEditingController();
  List<String> _values = [];
  _onDelete(index) {
    setState(() {
      _values.removeAt(index);
    });
  }

  ////////////////////////////////////////////////////////////////////////////////////
  bool isLoading = false;
  bool isLoadingForCourse = false;
//  var courseid = int.parse(id);
  List takecoursestwo = [];
  //Map takecoursestwo = {};
  // List<int> wishlisted = <int>[];
  var courseid = Get.arguments["course_details"][0]["id"];

  Future lessonshandlerHandler() async {
    setState(() {
      isLoadingForCourse = true;
    });
    Map payload = {
      "pg_type": "take",
      "course_id": courseid.toString(),
      "candidate_id": UserSimplePreferences.getCandidateId(),
    };

    var value = await Services.getTakecourseApis(payload);

    if (value != null) {
      if (value["data"] == null) {
        Fluttertoast.showToast(msg: value["message"]);
      } else {
        takecoursestwo = value["data"]["course_details"];
      }
    }
    setState(() {
      isLoadingForCourse = false;
    });
  }

  Map takecourses = {};
  Map formcomments = {};
  // bool isLoading = false;
  Future jobHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.gettakecourse(widget.id);
    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      takecourses = data["data"]["data"];
    }
    setState(() {
      isLoading = false;
    });
  }

  getFormComments() async {
    setState(() {
      isLoading = true;
    });

    Map data = await Services.getFormComments(courseid);
    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      formcomments = data["data"]["data"];
    }
    setState(() {
      isLoading = false;
    });
  }

  /////////////////////belowfor addreplays forum
  TextEditingController replay = TextEditingController();
  TextEditingController question = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController tag = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formKeytwo = GlobalKey<FormState>();
  final _formKeythree = GlobalKey<FormState>();
  //LoginData data = LoginData();

  Future addreplayforumHandler() async {
    setState(() {
      isLoading = true;
    });
    await getFormComments();

    Map payload = {
      "replay": replay.text,
      "candidate_course_lessonqand_id": formcomments["replays"]["data"][0]
                  ["candidate_course_lessonqand_replays"][0]
              ["candidate_course_lessonqand_id"]
          .toString(),
//$.[]data.replays.[]data.0.candidate_course_lessonqand_replays.0.candidate_course_lessonqand_id
      //$.[]data.[]candidate_course_lessonqand_replays.0.candidate_course_lessonqand_id
      "candidate_id": UserSimplePreferences.getCandidateId(),
    };

    Map value = await Services.addreplayforum(payload);
    //////////////////////////////////////////////////////////////////
    if (value["status"] == "1") {
      Fluttertoast.showToast(
        msg: value["message"],
      );
    } else {
      Fluttertoast.showToast(
        msg: value["message"],
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  // bool _obscureText = true;

  // // Toggles the password show status
  // void _toggle() {
  //   setState(() {
  //     _obscureText = !_obscureText;
  //   });
  // }
//////////////////////////////////////////////////////////////////
  // formData.fields.add(MapEntry("course_id", payload["course_id"])); //
  // formData.fields.add(MapEntry("lesson_id", payload["lesson_id"])); //
  // formData.fields.add(MapEntry("candidate_id", payload["candidate_id"])); //
  // formData.fields.add(MapEntry("question", payload["question"]));
///////////////////////////////////////////////////////////////
  Future addLessonsQuesforum() async {
    setState(() {
      isLoading = true;
    });

    Map payload = {
      "question": question.text,
      "course_id": Get.arguments.toString(),
      "candidate_id": UserSimplePreferences.getCandidateId(),
      "lesson_id": widget.choosenLessonData["id"].toString(),
      "pack_course_id": "",
    };

    Map value = await Services.addLessonsQuesforum(payload);
    if (value["data"]["status"] == "1") {
      Fluttertoast.showToast(
        msg: value["data"]["message"],
      );
    } else {
      Fluttertoast.showToast(
        msg: value["data"]["message"],
      );
    }

    setState(() {
      isLoading = false;
    });
  }

//////////////////////////////////////////////////////////add notes
  Future addNotesHandler() async {
    setState(() {
      isLoading = true;
    });
    Map payload = {
      "note": note.text, //
      "course_id": Get.arguments.toString(), //
      "candidate_id": UserSimplePreferences.getCandidateId(),
      "lesson_id": widget.choosenLessonData["id"].toString(),
      "type": "course",
      "tag": _values
    };
    Map value = await Services.addNotes(payload);
    if (value["data"]["status"] == "1") {
      Fluttertoast.showToast(
        msg: value["data"]["message"],
      );
    } else {
      Fluttertoast.showToast(
        msg: value["data"]["message"],
      );
    }

    setState(() {
      isLoading = false;
    });
  }

////////////////////////////
  @override
  void initState() {
    super.initState();
    jobHandler();
    lessonshandlerHandler();
    getFormComments();
    // addreplayforumHandler();

    // addNotesHandler();
  }

  @override
  Widget build(BuildContext context) {
    return // Example 5
        isLoading == false && isLoadingForCourse == false
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 300.h,
                    child: ContainedTabBarView(
                      tabs: const [
                        Text('Lesson Overview'),
                        Text('Reading Material'),
                        Text('Assignment'),
                        Text('Forum'),
                        Text('Notes'),
                        Text('External Links'),
                      ],
                      tabBarProperties: TabBarProperties(
                        labelPadding: EdgeInsets.only(right: 10, left: 10.w),
                        isScrollable: true,
                        width: double.infinity,
                        height: 35.h,
                        // padding: EdgeInsets.all(15.w),
                        // padding: EdgeInsets.symmetric(
                        //   horizontal: 32.0,
                        //   vertical: 8.0,
                        // ),
                        indicator: ContainerTabIndicator(
                          radius: BorderRadius.circular(16.0),
                          color: grey,
                          // borderWidth: 2.0,
                          // borderColor: Colors.black,
                        ),
                        labelColor: Gold,
                        padding: EdgeInsets.all(0),
                        unselectedLabelColor: whitetwo,
                      ),
                      // tabBarProperties: TabBarProperties(
                      //   isScrollable: true,
                      //   width: double.infinity,
                      //   labelPadding: EdgeInsets.only(right: 10, left: 10.w),
                      //   //margin: EdgeInsets.only(left: 15.w),
                      //   height: 32,
                      //   background: Container(
                      //     decoration: BoxDecoration(
                      //       color: kBackground,
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(8.0)),
                      //       boxShadow: [
                      //         BoxShadow(
                      //           color: Colors.black.withOpacity(0.4),
                      //           spreadRadius: 0.5,
                      //           blurRadius: 2,
                      //           offset: Offset(1, -1),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      //   position: TabBarPosition.top,
                      //   alignment: TabBarAlignment.center,
                      //   indicatorColor: Colors.transparent,
                      //   labelColor: Gold,
                      //   unselectedLabelColor: Colors.grey[400],
                      // ),
                      views: [
                        Container(
                            margin: EdgeInsets.all(15.w),
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                blurRadius: 20,
                                spreadRadius: 16,
                                color: Colors.black.withOpacity(0.1),
                              )
                            ]),
                            // color: Colors.white,
                            child: isLoading == false
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Title",
                                        style: GoogleFonts.gothicA1(
                                            fontSize: kFourteenFont,
                                            color: white,
                                            fontWeight: kFW600),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        widget.choosenLessonData["title"],
                                        //$.[]data.[]qanswers.[]lesson.[]title
                                        //  "Testing Lesson 1",
                                        style: GoogleFonts.gothicA1(
                                            fontSize: kFourteenFont,
                                            color: white,
                                            fontWeight: kFW600),
                                      ),
                                      //
                                      // takecourses["qanswers"].length == 0
                                      //     ? const SizedBox()
                                      //     : Text(
                                      //         takecourses["qanswers"][0]
                                      //                 ["lesson"]["title"] ??
                                      //             "",
                                      //         //$.[]data.[]qanswers.[]lesson.[]title
                                      //         //  "Testing Lesson 1",
                                      //         style: GoogleFonts.gothicA1(
                                      //             fontSize: kFourteenFont,
                                      //             color: white,
                                      //             fontWeight: kFW600),
                                      //       ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Text(
                                        "Introduction",
                                        style: GoogleFonts.gothicA1(
                                            fontSize: kFourteenFont,
                                            color: white,
                                            fontWeight: kFW600),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      widget.choosenLessonData["overview"] ==
                                              null
                                          ? SizedBox()
                                          : Text(
                                              widget.choosenLessonData[
                                                  "overview"],
                                              //$.[]data.[]qanswers.[]lesson.[]title
                                              //  "Testing Lesson 1",
                                              maxLines: 5,
                                              style: GoogleFonts.gothicA1(
                                                  fontSize: kFourteenFont,
                                                  color: white,
                                                  fontWeight: kFW600),
                                            ),

                                      // takecourses["qanswers"].length == 0
                                      //     ? const SizedBox()
                                      //     : Text(
                                      //         takecourses["qanswers"][0]
                                      //                 ["lesson"]["overview"] ??
                                      //             "",
                                      //         //  "Introduction",
                                      //         style: GoogleFonts.gothicA1(
                                      //             fontSize: kFourteenFont,
                                      //             color: white,
                                      //             fontWeight: kFW600),
                                      //       ),
                                    ],
                                  )
                                : Center(
                                    child: CircularProgressIndicator(
                                      color: Gold,
                                    ),
                                  )),
                        Container(
                          margin: EdgeInsets.all(15.w),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              spreadRadius: 16,
                              color: Colors.black.withOpacity(0.1),
                            )
                          ]),
                          // color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Title",
                                style: GoogleFonts.gothicA1(
                                    fontSize: kFourteenFont,
                                    color: white,
                                    fontWeight: kFW600),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              widget.choosenLessonData["lesson_files"].length ==
                                      0
                                  ? Text(
                                      "-",
                                      style: GoogleFonts.gothicA1(
                                          fontSize: kFourteenFont,
                                          color: white,
                                          fontWeight: kFW600),
                                    )
                                  : Text(
                                      widget.choosenLessonData["lesson_files"]
                                          [0]["title"],
                                      style: GoogleFonts.gothicA1(
                                          fontSize: kFourteenFont,
                                          color: white,
                                          fontWeight: kFW600),
                                    ),
                              SizedBox(
                                height: 15.h,
                              ),
                              widget.choosenLessonData["lesson_files"].length ==
                                      0
                                  ? SizedBox()
                                  : GestureDetector(
                                      onTap: () async {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        // final Directory appDocumentsDir =
                                        //     await getTemporaryDirectory();

                                        // FileDownloader.downloadFile(
                                        //     url:
                                        //         "https://bossjobs.co.in/dev/lesson_files/" +
                                        //             widget.choosenLessonData[
                                        //                     "lesson_files"][0]
                                        //                 ["file_name"],
                                        //     name: widget.choosenLessonData[
                                        //         "lesson_files"][0]["file_name"],
                                        //     // name: certificatesdetails[index]
                                        //     //     ["candidate"]["resume_name"],
                                        //     onDownloadCompleted: (path) {
                                        //       final File file = File(path);
                                        //       Fluttertoast.showToast(
                                        //         msg:
                                        //             "Reading Material Downloaded",
                                        //       );
                                        //       setState(() {
                                        //         isLoading = false;
                                        //       });
                                        //       debugPrint("DONE");
                                        //     });
                                        // _launchUrl(
                                        // "https://bossjobs.co.in/dev/lesson_files/" +
                                        //     widget.choosenLessonData[
                                        //             "lesson_files"][0]
                                        //         ["file_name"]);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 150.w,
                                            child: Text(
                                              "https://bossjobs.co.in/dev/lesson_files/" +
                                                  widget.choosenLessonData[
                                                          "lesson_files"][0]
                                                      ["file_name"],
                                              style: GoogleFonts.gothicA1(
                                                  fontSize: kFourteenFont,
                                                  color: white,
                                                  fontWeight: kFW600),
                                            ),
                                          ),
                                          isLoading == true
                                              ? CircularPercentIndicator(
                                                  radius: 5)
                                              : Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.download,
                                                      size: 20.sp,
                                                      color: Gold,
                                                    ),
                                                    Text("Download",
                                                        style:
                                                            GoogleFonts.inter(
                                                                color: Gold,
                                                                fontSize:
                                                                    kTenFont,
                                                                fontWeight:
                                                                    kFW500)),
                                                  ],
                                                ),
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        //"file_name"
                        Container(
                          margin: EdgeInsets.all(15.w),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              spreadRadius: 16,
                              color: Colors.black.withOpacity(0.1),
                            )
                          ]),
                          // color: Colors.white,
                          child: ListView.builder(
                              itemCount: widget
                                  .choosenLessonData["lesson_assignments"]
                                  .length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Text(
                                        "${widget.choosenLessonData["lesson_assignments"][index]["title"]}",
                                        style: GoogleFonts.gothicA1(
                                            fontSize: kFourteenFont,
                                            color: Colors.white,
                                            fontWeight: kFW600)),
                                    TextButton(
                                        onPressed: () async {
                                          // final Directory appDocumentsDir =
                                          //     await getTemporaryDirectory();

                                          // FileDownloader.downloadFile(
                                          //     url:
                                          //         'https://bossjobs.co.in/dev/lesson_assignments/${widget.choosenLessonData["lesson_assignments"][index]["file"]}',
                                          //     name: widget.choosenLessonData[
                                          //             "lesson_assignments"]
                                          //         [index]["file"],
                                          //     // name: certificatesdetails[index]
                                          //     //     ["candidate"]["resume_name"],
                                          //     onDownloadCompleted: (path) {
                                          //       final File file = File(path);
                                          //       Fluttertoast.showToast(
                                          //         msg:
                                          //             "Assignment file Downloaded",
                                          //       );
                                          //       debugPrint("DONE");
                                          //     });
                                          // _launchUrl(
                                          //     "https://bossjobs.co.in/dev/lesson_assignments/${widget.choosenLessonData["lesson_assignments"][index]["file"]}");
                                        },
                                        child: Text(
                                            "${widget.choosenLessonData["lesson_assignments"][index]["file"]}")),
                                  ],
                                );
                              }),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.all(15.w),
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                blurRadius: 20,
                                spreadRadius: 16,
                                color: Colors.black.withOpacity(0.1),
                              )
                            ]),
                            // color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Form(
                                  key: _formKeytwo,
                                  child: CustomTextFormField(
                                    controller: question,
                                    hintText: "Enter Forum",
                                    isMandatory: false,
                                    label: 'Forum',
                                    readOnly: false,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                SizedBox(
                                    height: 40.h,
                                    width: 110.w,
                                    child: Ink(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [white, grey1]),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(80.0)),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          if (_formKeytwo.currentState!
                                              .validate()) {
                                            addLessonsQuesforum();
                                          }
                                        },
                                        //_launchUrl,
                                        style: ButtonStyle(
                                            backgroundColor:
                                                const MaterialStatePropertyAll<
                                                    Color>(grey),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r),
                                                    side: const BorderSide(
                                                        color: grey)))),
                                        child: Text(
                                          "Save",
                                          style: GoogleFonts.gothicA1(
                                              fontSize: kFourteenFont,
                                              color: white,
                                              fontWeight: kFW600),
                                        ),
                                      ),
                                    )),
                                // CustomTextFormField(
                                //   controller: Title,
                                //   hintText: "Search ",
                                //   isMandatory: false,
                                //   label: ' ',
                                //   readOnly: false,
                                // ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  "Forum",
                                  style: GoogleFonts.gothicA1(
                                      fontSize: kFourteenFont,
                                      color: white,
                                      fontWeight: kFW600),
                                ),
                                if (formcomments.isNotEmpty)
                                  for (int k = 0;
                                      k <
                                          formcomments["replays"]["data"]
                                              .length;
                                      k++) ...[
                                    ExpansionTile(
                                      trailing: Icon(
                                        Icons.expand_more,
                                        size: 28.sp,
                                        color: white,
                                      ),
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceBetween,
                                        children: [
                                          formcomments["replays"]["data"][k]
                                                          ["candidate"]["user"]
                                                      ["profile_pic"] !=
                                                  null
                                              ? CircleAvatar(
                                                  backgroundColor: kBackground,
                                                  backgroundImage: NetworkImage(
                                                      "$kProfileURL${formcomments["replays"]["data"][k]["candidate"]["user"]["profile_pic"]}"),
                                                  radius: 15.r,
                                                )
                                              : CircleAvatar(
                                                  backgroundColor: kBackground,
                                                  radius: 15.r,
                                                  child: Image.asset(
                                                      'assets/images/man.png'),
                                                ),
                                          SizedBox(width: 5.w),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                formcomments["replays"]["data"]
                                                    [k]["question"],
                                                style: GoogleFonts.gothicA1(
                                                    fontSize: kFourteenFont,
                                                    color: white,
                                                    fontWeight: kFW700),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Row(
                                                // mainAxisAlignment:
                                                //     MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text(
                                                    formcomments["replays"]
                                                                    ["data"][k]
                                                                ["candidate"]
                                                            ["user"]["name"] +
                                                        ": ",
                                                    style: GoogleFonts.gothicA1(
                                                        fontSize: kTwelveFont,
                                                        color: white,
                                                        fontWeight: kFW500),
                                                  ),
                                                  // Text(
                                                  //   "119 DaysAgo",
                                                  //   style: GoogleFonts.gothicA1(
                                                  //       fontSize: kTwelveFont,
                                                  //       color: white,
                                                  //       fontWeight: kFW500),
                                                  // ),
                                                  //$.[]data.replays.data.0.candidate_course_lessonqand_replays.length
                                                  Text(
                                                    "${formcomments["replays"]["data"][k]["candidate_course_lessonqand_replays"].length.toString()} Replies",
                                                    style: GoogleFonts.gothicA1(
                                                        fontSize: kTwelveFont,
                                                        color: white,
                                                        fontWeight: kFW500),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      expandedCrossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        formcomments["replays"]["data"][k][
                                                        "candidate_course_lessonqand_replays"]
                                                    .length >=
                                                1
                                            ? Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  formcomments["replays"]["data"]
                                                                          [0][
                                                                      "candidate_course_lessonqand_replays"]
                                                                  [
                                                                  0]["candidate"]
                                                              [
                                                              "user"]["profile_pic"] !=
                                                          null
                                                      ? CircleAvatar(
                                                          backgroundColor:
                                                              kBackground,
                                                          backgroundImage:
                                                              NetworkImage(
                                                                  "$kProfileURL${formcomments["replays"]["data"][0]["candidate_course_lessonqand_replays"][0]["candidate"]["user"]["profile_pic"]}"),
                                                          radius: 15.r,
                                                        )
                                                      : CircleAvatar(
                                                          backgroundColor:
                                                              kBackground,
                                                          radius: 15.r,
                                                          child: Image.asset(
                                                              'assets/images/man.png'),
                                                        ),
                                                  SizedBox(
                                                    width: 10.w,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        formcomments["replays"][
                                                                        "data"][0]
                                                                    [
                                                                    "candidate_course_lessonqand_replays"]
                                                                [0]["candidate"]
                                                            ["user"]["name"],
                                                        style: GoogleFonts
                                                            .gothicA1(
                                                                fontSize:
                                                                    kFourteenFont,
                                                                color: white,
                                                                fontWeight:
                                                                    kFW400),
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      //$.[]data.replays.data.0.candidate.user.name
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      for (int l = 0;
                                                          l <
                                                              formcomments["replays"]
                                                                          [
                                                                          "data"][k]
                                                                      [
                                                                      "candidate_course_lessonqand_replays"]
                                                                  .length;
                                                          l++) ...[
                                                        Text(
                                                          formcomments["replays"]
                                                                      ["data"][k]
                                                                  [
                                                                  "candidate_course_lessonqand_replays"]
                                                              [l]["replay"],
                                                          //    "119 Days ago",
                                                          //$.[]data.replays.data.0.candidate_course_lessonqand_replays.[]replay
                                                          style: GoogleFonts
                                                              .gothicA1(
                                                                  fontSize:
                                                                      kTwelveFont,
                                                                  color: white,
                                                                  fontWeight:
                                                                      kFW500),
                                                        )
                                                      ],
                                                    ],
                                                  ),
                                                ],
                                              )
                                            : SizedBox(),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Form(
                                          key: _formKey,
                                          child: CustomFormField(
                                              readOnly: false,
                                              label: "replay",
                                              isMandatory: true,
                                              controller: replay,
                                              hintText: "replay"),
                                          // TextField(
                                          //    controller: replay,
                                          //   decoration: new InputDecoration(
                                          //     focusedBorder: OutlineInputBorder(
                                          //       borderSide: BorderSide(
                                          //           color: Colors.greenAccent,
                                          //           width: 5.0),
                                          //     ),
                                          //     enabledBorder: OutlineInputBorder(
                                          //       borderSide: BorderSide(
                                          //           color: Colors.grey, width: 2.w),
                                          //     ),
                                          //   ),
                                          // ),
                                        ),
                                        SizedBox(height: 10.h),
                                        SizedBox(
                                            height: 30.h,
                                            width: 90.w,
                                            child: Ink(
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [white, grey1]),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(80.0)),
                                              ),
                                              child: TextButton(
                                                onPressed: () {
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    addreplayforumHandler();
                                                  }
                                                },
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        const MaterialStatePropertyAll<
                                                            Color>(grey),
                                                    shape: MaterialStateProperty.all<
                                                            RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.r),
                                                            side:
                                                                const BorderSide(
                                                                    color:
                                                                        grey)))),
                                                child: Text(
                                                  "Save",
                                                  style: GoogleFonts.gothicA1(
                                                      fontSize: kFourteenFont,
                                                      color: white,
                                                      fontWeight: kFW600),
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                    // Align(
                                    //   alignment: Alignment.topLeft,
                                    //   child: Text(
                                    //     formcomments["replays"]["data"][k]
                                    //         ["question"],
                                    //     style: GoogleFonts.gothicA1(
                                    //         fontSize: kFourteenFont,
                                    //         color: white,
                                    //         fontWeight: kFW700),
                                    //   ),
                                    // ),
                                  ],
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  "Question & Answers",
                                  style: GoogleFonts.gothicA1(
                                      fontSize: kFourteenFont,
                                      color: white,
                                      fontWeight: kFW600),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                for (int i = 0;
                                    i < takecourses['qanswers'].length;
                                    i++) ...[
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        children: [
                                          takecourses['qanswers'][i]
                                                          ['candidate']["user"]
                                                      ["profile_pic"] !=
                                                  null
                                              ? CircleAvatar(
                                                  backgroundColor: kBackground,
                                                  backgroundImage: NetworkImage(
                                                      "$kProfileURL${takecourses['qanswers'][i]['candidate']["user"]["profile_pic"]}"),
                                                  radius: 15.r,
                                                )
                                              : CircleAvatar(
                                                  backgroundColor: kBackground,
                                                  radius: 15.r,
                                                  child: Image.asset(
                                                      'assets/images/man.png'),
                                                ),
                                          SizedBox(width: 10),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                takecourses['qanswers'][i]
                                                    ['question'],
                                                style: GoogleFonts.gothicA1(
                                                    fontSize: kFourteenFont,
                                                    color: white,
                                                    fontWeight: kFW700),
                                              ),
                                              SizedBox(
                                                height: 5.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    takecourses['qanswers'][i]
                                                            ['candidate']
                                                        ["user"]["name"],
                                                    //     $.[]data.[]qanswers.[]candidate.user.name
                                                    // $.[]data.[]qanswers.[]created_at
                                                    style: GoogleFonts.gothicA1(
                                                        fontSize: kFourteenFont,
                                                        color: white,
                                                        fontWeight: kFW700),
                                                  ),
                                                  SizedBox(width: 20.w),
                                                  Text(
                                                    "On  ${DateFormat('dd-MMM-yyyy').format(DateTime.parse(takecourses['qanswers'][i]['updated_at']))}",

                                                    //     $.[]data.[]qanswers.[]candidate.user.name
                                                    // $.[]data.[]qanswers.[]created_at
                                                    style: GoogleFonts.gothicA1(
                                                        fontSize: kFourteenFont,
                                                        color: white,
                                                        fontWeight: kFW700),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      ExpansionTile(
                                        trailing: Icon(
                                          Icons.expand_more,
                                          size: 28.sp,
                                          color: white,
                                        ),
                                        title: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              //$.[]data.[]qanswers.[]candidate_course_lessonqand_replays.length
                                              // ignore: prefer_interpolation_to_compose_strings
                                              "Lession : " +
                                                  takecourses['qanswers'][i]
                                                      ['lesson']['title'],
                                              style: GoogleFonts.gothicA1(
                                                fontSize: kSixteenFont,
                                                color: white,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Text(
                                              //$.[]data.[]qanswers.[]candidate_course_lessonqand_replays.length
                                              // ignore: prefer_interpolation_to_compose_strings
                                              takecourses['qanswers'][i][
                                                          'candidate_course_lessonqand_replays']
                                                      .length
                                                      .toString() +
                                                  " Replies",
                                              style: GoogleFonts.gothicA1(
                                                fontSize: kSixteenFont,
                                                color: white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        children: <Widget>[
                                          ListTile(
                                            title: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                for (int j = 0;
                                                    j <
                                                        takecourses['qanswers']
                                                                    [i][
                                                                'candidate_course_lessonqand_replays']
                                                            .length;
                                                    j++) ...[
                                                  Row(
                                                    children: [
                                                      takecourses['qanswers'][i]['candidate_course_lessonqand_replays']
                                                                              [
                                                                              j]
                                                                          [
                                                                          "coach"]
                                                                      ?["user"][
                                                                  "profile_pic"] !=
                                                              null
                                                          ? CircleAvatar(
                                                              backgroundColor:
                                                                  kBackground,
                                                              backgroundImage:
                                                                  NetworkImage(
                                                                      "$kProfileURL${takecourses['qanswers'][i]['candidate_course_lessonqand_replays'][j]["coach"] == null ? "-" : takecourses['qanswers'][i]['candidate_course_lessonqand_replays'][j]["coach"]?["user"]["profile_pic"]}"),
                                                              radius: 15.r,
                                                            )
                                                          : CircleAvatar(
                                                              backgroundColor:
                                                                  kBackground,
                                                              radius: 15.r,
                                                              child: Image.asset(
                                                                  'assets/images/man.png'),
                                                            ),
                                                      SizedBox(width: 10.w),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                              height: 10.h),
                                                          Text(
                                                            takecourses['qanswers'][i]
                                                                            ['candidate_course_lessonqand_replays'][j]
                                                                        [
                                                                        "coach"] ==
                                                                    null
                                                                ? "-"
                                                                : takecourses['qanswers'][i]
                                                                            ['candidate_course_lessonqand_replays'][j]
                                                                        [
                                                                        "coach"]
                                                                    [
                                                                    "user"]["name"],
                                                            style: GoogleFonts
                                                                .gothicA1(
                                                                    fontSize:
                                                                        kSixteenFont,
                                                                    color: Gold,
                                                                    fontWeight:
                                                                        kFW400),
                                                          ),
                                                          SizedBox(height: 5.h),
                                                          Text(
                                                            DateFormat(
                                                                    'dd-MMM-yyyy')
                                                                .format(DateTime.parse(
                                                                    takecourses['qanswers']
                                                                                [i]
                                                                            [
                                                                            'candidate_course_lessonqand_replays'][j]
                                                                        [
                                                                        "updated_at"])),

                                                            //     $.[]data.[]qanswers.[]candidate.user.name
                                                            // $.[]data.[]qanswers.[]created_at
                                                            style: GoogleFonts
                                                                .gothicA1(
                                                                    fontSize:
                                                                        kFourteenFont,
                                                                    color:
                                                                        white,
                                                                    fontWeight:
                                                                        kFW700),
                                                          ),
                                                          SizedBox(height: 5.h),
                                                          Text(
                                                            takecourses['qanswers']
                                                                        [i][
                                                                    'candidate_course_lessonqand_replays']
                                                                [j]["replay"],
                                                            style: GoogleFonts
                                                                .gothicA1(
                                                                    fontSize:
                                                                        kSixteenFont,
                                                                    color:
                                                                        white,
                                                                    fontWeight:
                                                                        kFW400),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ]
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                    ],
                                  )
                                ]
                                // takecourses['qanswers'].length != 0
                                //     ? ListView.builder(
                                //         itemCount: 2,
                                //         itemBuilder:
                                //             (BuildContext context, int index) {
                                //           return Column(
                                //             children: [
                                //               Text(
                                //                 takecourses['qanswers'][index]
                                //                     ['question'],
                                //                 style: GoogleFonts.gothicA1(
                                //                     fontSize: kSixteenFont,
                                //                     color: white,
                                //                     fontWeight: kFW600),
                                //               ),
                                //               Text(
                                //                 takecourses['qanswers'][index]
                                //                     ['lesson']['title'],
                                //                 style: GoogleFonts.gothicA1(
                                //                     fontSize: kSixteenFont,
                                //                     color: white,
                                //                     fontWeight: kFW600),
                                //               )
                                //             ],
                                //           );
                                //         })
                                // : Center(
                                //     child: Text(
                                //       "No data available in Questions ",
                                //       style: GoogleFonts.gothicA1(
                                //           fontSize: kSixteenFont,
                                //           color: white,
                                //           fontWeight: kFW600),
                                //     ),
                                //   ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(15.w),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              spreadRadius: 16,
                              color: Colors.black.withOpacity(0.1),
                            )
                          ]),
                          // color: Colors.white,
                          child: SingleChildScrollView(
                            child: Form(
                              key: _formKeythree,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextFormField(
                                    controller: note,
                                    hintText: "Enter Notes",
                                    isMandatory: false,
                                    label: 'Notes',
                                    readOnly: false,
                                    maxLines: 5,
                                  ),
                                  // CustomTextFormField(
                                  //   keyboardType: TextInputType.multiline,
                                  //   maxLines: 5,
                                  //   controller: Title,
                                  //   hintText: "Enter Notes ",
                                  //   isMandatory: false,
                                  //   label: 'Notes',
                                  //   readOnly: false,
                                  // ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        gradient: LinearGradient(
                                          colors: [
                                            const Color.fromARGB(
                                                    197, 36, 36, 36)
                                                .withOpacity(1),
                                            const Color.fromARGB(
                                                    225, 24, 21, 21)
                                                .withOpacity(1),
                                            Colors.black.withOpacity(0.7)
                                          ],
                                        )),
                                    child: TagEditor(
                                      length: _values.length,
                                      delimiters: [',', ' '],
                                      hasAddButton: true,
                                      textStyle: GoogleFonts.inter(
                                          color: white,
                                          fontSize: kTwelveFont,
                                          fontWeight: kFW500),
                                      inputDecoration: InputDecoration(
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                10, 15, 10, 15),
                                        filled: true,
                                        fillColor: white.withOpacity(0.08),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          borderSide: BorderSide(
                                              color: grey1.withOpacity(0.2)),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          borderSide: BorderSide(
                                              color: grey1.withOpacity(0.2)),
                                        ),
                                        hintStyle: GoogleFonts.inter(
                                            color: white.withOpacity(0.5),
                                            fontSize: kFourteenFont,
                                            fontWeight: kFW500),
                                        hintText: "Add Tags",
                                      ),
                                      onTagChanged: (newValue) {
                                        setState(() {
                                          _values.add(newValue);
                                        });
                                      },
                                      tagBuilder: (context, index) => _Chip(
                                        index: index,
                                        label: _values[index],
                                        onDeleted: _onDelete,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  SizedBox(
                                      height: 40.h,
                                      width: 110.w,
                                      child: Ink(
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: [white, grey1]),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(80.0)),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            if (_formKeythree.currentState!
                                                .validate()) {
                                              addNotesHandler();
                                            }
                                          },
                                          //_launchUrl,
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  const MaterialStatePropertyAll<
                                                      Color>(grey),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      side: const BorderSide(
                                                          color: grey)))),
                                          child: Text(
                                            "Save",
                                            style: GoogleFonts.gothicA1(
                                                fontSize: kFourteenFont,
                                                color: white,
                                                fontWeight: kFW600),
                                          ),
                                        ),
                                      )),
                                  CustomTextFormField(
                                    controller: Title,
                                    hintText: "Search",
                                    isMandatory: false,
                                    label: '',
                                    readOnly: false,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(15.w),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              spreadRadius: 16,
                              color: Colors.black.withOpacity(0.1),
                            )
                          ]),
                          // color: Colors.white,
                          child: widget.choosenLessonData["external_link"] ==
                                  null
                              ? SizedBox()
                              : GestureDetector(
                                  onTap: () async {
                                    _launchUrl(widget
                                        .choosenLessonData["external_link"]);
                                  },
                                  child: Text(
                                    widget.choosenLessonData["external_link"],
                                    //  "No External Links",
                                    style: GoogleFonts.gothicA1(
                                        fontSize: kFourteenFont,
                                        color: white,
                                        fontWeight: kFW600),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  // SizedBox(height: 20.h),
                  // takecoursestwo.isEmpty
                  //     ? const SizedBox()
                  //     : Text(
                  //         // takecoursestwo[0]["course_modules"][0]["lessons"][0]
                  //         //             ["title"] ==
                  //         //         null
                  //         //     ? SizedBox()

                  //         takecoursestwo[0]["title"],
                  //         style: GoogleFonts.gothicA1(
                  //             fontSize: kFourteenFont,
                  //             color: white,
                  //             fontWeight: kFW700),

                  //         //  takecourses["coursedata"][0]["title"] ?? "",
                  //         //  "Test Course_101",
                  //       ),
                  // SizedBox(height: 10.h),
                  // takecoursestwo.isEmpty
                  //     ? const SizedBox()
                  //     : Column(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //               takecoursestwo[0]["course_modules"][0]["title"],
                  //               //$.[]course_details.[]course_modules.0.title
                  //               //"Test Course_101",
                  //               //maxLines: 2,
                  //               style: GoogleFonts.gothicA1(
                  //                   fontSize: kSixteenFont,
                  //                   color: white,
                  //                   fontWeight: kFW500)),
                  //           SizedBox(
                  //             height: 10.h,
                  //           ),
                  //           Row(
                  //             children: [
                  //               Text(
                  //                   takecoursestwo[0]["course_modules"][0]
                  //                                   ["lessons"][0]
                  //                               ["lesson_assignments"]
                  //                           .length
                  //                           .toString() +
                  //                       ' ' +
                  //                       "Exercises",

                  //                   //$.[]course_details.0.course_modules.[]lessons.[]lesson_assignments.length
                  //                   //"0 Exercises",
                  //                   //maxLines: 2,
                  //                   style: GoogleFonts.gothicA1(
                  //                       fontSize: kSixteenFont,
                  //                       color: white,
                  //                       fontWeight: kFW500)),
                  //               Text(
                  //                   takecoursestwo[0]["course_modules"][0]
                  //                               ["lessons"]
                  //                           .length
                  //                           .toString() +
                  //                       " " +
                  //                       "Lessons",
                  //                   //$.[]course_details.[]course_modules.0.lessons.length
                  //                   //1 Lessons",
                  //                   //maxLines: 2,
                  //                   style: GoogleFonts.gothicA1(
                  //                       fontSize: kSixteenFont,
                  //                       color: white,
                  //                       fontWeight: kFW500)),
                  //             ],
                  //           ),
                  //           SizedBox(
                  //             height: 10.h,
                  //           ),

                  //           ///$.[]course_details.[]course_modules.[]lessons.0.title.length
                  //           for (int m = 0;
                  //               m <
                  //                   takecoursestwo[0]["course_modules"][0]
                  //                           ["lessons"]
                  //                       .length;
                  //               m++) ...[
                  //             Column(
                  //               children: [
                  //                 Row(
                  //                   children: [
                  //                     Icon(Icons.check_box, color: white),
                  //                     SizedBox(width: 5.w),
                  //                     Text(
                  //                       //       takecoursestwo[0]["course_modules"][0]
                  //                       // ["lessons"][0]["title"],

                  //                       takecoursestwo[0]["course_modules"][0]
                  //                               ["lessons"][m]["title"] ??
                  //                           "",
                  //                       style: GoogleFonts.gothicA1(
                  //                           fontSize: kTwelveFont,
                  //                           color: white,
                  //                           fontWeight: kFW500),
                  //                     ),
                  //                   ],
                  //                 ),
                  //                 SizedBox(height: 10.h),
                  //     ],
                  //   )
                  // ],

                  // Row(
                  //   children: [
                  //     Icon(Icons.check_box, color: white),
                  //     Text(
                  //         takecoursestwo[0]["course_modules"][0]
                  //             ["org_lessons"][0]["title"],
                  //         //" Testing Lesson 1",
                  //         //maxLines: 2,
                  //         //    $.[]course_details.0.course_modules.[]lessons.[]title
                  //         style: GoogleFonts.gothicA1(
                  //             fontSize: kSixteenFont,
                  //             color: white,
                  //             fontWeight: kFW500)),
                  //   ],
                  //     // )
                  //   ],
                  // ),
                  widget.choosenLessonData["course_exercise"].length > 0
                      ? GestureDetector(
                          onTap: () {
                            Get.toNamed(KCourseAssesment,
                                arguments: widget
                                    .choosenLessonData["course_exercise"]);
                            //  Get.toNamed(KSkillsSCore);
                          },
                          child: Center(
                            child: GlassmorphicContainer(
                              height: 41.h,
                              width: 240.w,
                              borderRadius: 13.r,
                              blur: 15,
                              alignment: Alignment.center,
                              border: 0.5,
                              linearGradient: LinearGradient(
                                  colors: [
                                    white.withOpacity(0.1),
                                    white.withOpacity(0.01)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              borderGradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    white.withOpacity(0.5),
                                    white.withOpacity(0.5),
                                    Gold.withOpacity(0.5)
                                  ]),
                              child: Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    blurRadius: 16,
                                    spreadRadius: 15,
                                    color: Colors.black.withOpacity(0.1),
                                  )
                                ]),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 20.0,
                                      sigmaY: 20.0,
                                    ),
                                    child: Text("Start Quiz",
                                        //maxLines: 2,
                                        style: GoogleFonts.gothicA1(
                                            fontSize: kSixteenFont,
                                            color: white,
                                            fontWeight: kFW700)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              )
            : Center(
                child: CircularProgressIndicator(
                  color: Gold,
                ),
              );
    //  Center(
    //     child: CircularPercentIndicator(radius: 5),
    //   );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch ');
    }
  }
}

class _Chip extends StatelessWidget {
  const _Chip({
    required this.label,
    required this.onDeleted,
    required this.index,
  });

  final String label;
  final ValueChanged<int> onDeleted;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.only(left: 8.0),
      label: Text(label),
      deleteIcon: Icon(
        Icons.close,
        size: 18,
      ),
      onDeleted: () {
        onDeleted(index);
      },
    );
  }
}

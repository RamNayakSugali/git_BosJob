import '../../utils/export_file.dart';

class ViewSkillAnswer extends StatefulWidget {
  const ViewSkillAnswer({super.key});

  @override
  State<ViewSkillAnswer> createState() => _ViewSkillAnswerState();
}

class _ViewSkillAnswerState extends State<ViewSkillAnswer> {
  Map answerdetails = {};
  bool isLoading = false;
  Future ViewAnswerHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.accessedskilltest(Get.arguments["id"]);

    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      answerdetails = data["data"]["data"];
    }
    //  print(data["data"][0]["data"]);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    ViewAnswerHandler();
  }

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
            'Add Skill',
            style: GoogleFonts.gothicA1(
                letterSpacing: 1,
                fontSize: kEighteenFont,
                color: white,
                fontWeight: kFW700),
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
        body: Stack(
          children: [
            Background(),
            SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.all(15.w),
                  child: isLoading == false
                      ? Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  answerdetails["question_master"].isNotEmpty
                                      ? answerdetails["question_master"].length
                                      : 0,
                              itemBuilder: ((context, index) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 30.h),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${(index + 1).toString()}. ",
                                            style: GoogleFonts.gothicA1(
                                                letterSpacing: 0.65,
                                                fontSize: 13.sp,
                                                color: whitetwo,
                                                fontWeight: kFW700),
                                          ),
                                          SizedBox(
                                            width: 300.w,
                                            child: Text(
                                              answerdetails["question_master"]
                                                  [index]["title"],
                                              maxLines: 3,
                                              style: GoogleFonts.gothicA1(
                                                  letterSpacing: 0.65,
                                                  fontSize: 13.sp,
                                                  color: whitetwo,
                                                  fontWeight: kFW700),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.circle_rounded,
                                            size: kTenFont,
                                            color: kred,
                                          ),
                                          SizedBox(width: 8.w),
                                          Text(
                                            "This is my Answer",
                                            style: GoogleFonts.gothicA1(
                                                letterSpacing: 0.75,
                                                fontSize: 15.sp,
                                                color: kred,
                                                fontWeight: kFW700),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                      Row(
                                        children: [
                                          Text(
                                            " Ans - ",
                                            style: GoogleFonts.gothicA1(
                                                letterSpacing: 0.55,
                                                fontSize: 11.sp,
                                                color: kScoregreen,
                                                fontWeight: kFW700),
                                          ),
                                          // kScoregreen

                                          Text(
                                            answerdetails["question_master"]
                                                [index]["answer"],
                                            // "This is my Answer",
                                            style: GoogleFonts.gothicA1(
                                                letterSpacing: 0.55,
                                                fontSize: 11.sp,
                                                color: white,
                                                fontWeight: kFW700),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                            SizedBox(height: 10.h),
                            CustomButton(
                              label: "Back",
                              isLoading: true,
                              onTap: () {
                                Get.back();
                              },
                              // onTap: () {
                              //   if (_formKey.currentState!.validate()) {}
                              //   ;
                              //   // Get.toNamed(KAchievedDetails);
                              // },
                            ),
                            SizedBox(height: 30.h),
                            // Text(
                            //   answerdetails["skilinfo"]["title"],
                            //   //$.[]data.question_master.length
                            //   style: GoogleFonts.gothicA1(
                            //       letterSpacing: 1,
                            //       fontSize: kEighteenFont,
                            //       color: white,
                            //       fontWeight: kFW700),
                            // ),
                            // SizedBox(
                            //   height: 10.h,
                            // ),
                            // SizedBox(
                            //   //  height: 250.h,
                            //   //  height: 310.h,
                            //   height: 500.h,
                            //   child: ListView.builder(
                            //       itemCount:
                            //           answerdetails["question_master"].isNotEmpty
                            //               ? answerdetails["question_master"].length
                            //               : 0,
                            //       scrollDirection: Axis.horizontal,
                            //       shrinkWrap: true,
                            //       itemBuilder: ((context, index) {
                            //         return Container(
                            //           // height: 250.h,
                            //           height: 270.h,
                            //           width: 330.w,
                            //           child: Column(
                            //             // mainAxisAlignment: MainAxisAlignment.start,
                            //             // crossAxisAlignment:
                            //             //     CrossAxisAlignment.start,
                            //             children: [
                            //               Text(
                            //                   answerdetails["question_master"]
                            //                       [index]["title"],
                            //                   style: GoogleFonts.gothicA1(
                            //                       fontSize: kFourteenFont,
                            //                       color: Gold,
                            //                       fontWeight: kFW700)),

                            //               // $.[]data.question_master.0.question_options.[]answer

                            //               SizedBox(
                            //                 height: 190.h,
                            //                 child: ListView.builder(
                            //                     itemCount:
                            //                         answerdetails["question_master"]
                            //                                     [index]
                            //                                 ["question_options"]
                            //                             .length,
                            //                     physics:
                            //                         AlwaysScrollableScrollPhysics(),
                            //                     itemBuilder: ((context, i) {
                            //                       return ListTile(
                            //                         contentPadding:
                            //                             EdgeInsets.all(0),
                            //                         horizontalTitleGap: 0,
                            //                         title: Text(
                            //                             answerdetails["question_master"]
                            //                                         [index]
                            //                                     ["question_options"]
                            //                                 [i]["option"],
                            //                             style: GoogleFonts.gothicA1(
                            //                                 fontSize: kSixteenFont,
                            //                                 color: white,
                            //                                 fontWeight: kFW500)),
                            //                         // leading: Checkbox(

                            //                         // //   fillColor: Colors.blue,
                            //                         //   // fillColor:

                            //                         //       // MaterialStateProperty
                            //                         //       //     .resolveWith(
                            //                         //       //         getColor),
                            //                         //   checkColor:isSubmit==true? grey: white,
                            //                         //   activeColor:isSubmit==true? grey: white,
                            //                         //   value: userChecked.contains(
                            //                         //       assignmetData["exercise_questions"]
                            //                         //                   [index][
                            //                         //               "exercise_question_options"]
                            //                         //           [i]["title"]),
                            //                         //   onChanged: (val) {
                            //                         //     if(!isSubmit){
                            //                         //       _onSelected(
                            //                         //         val!,
                            //                         //         assignmetData["exercise_questions"]
                            //                         //                     [index][
                            //                         //                 "exercise_question_options"]
                            //                         //             [i]["title"]);
                            //                         //     if (val == true) {
                            //                         //       assignmetData["exercise_questions"]
                            //                         //                           [
                            //                         //                           index]
                            //                         //                       [
                            //                         //                       "exercise_question_options"][i]
                            //                         //                   [
                            //                         //                   "is_answer"] ==
                            //                         //               "false"
                            //                         //           ? _howmanyCorrect(
                            //                         //               false,
                            //                         //               assignmetData[
                            //                         //                       "exercise_questions"]
                            //                         //                   .length)
                            //                         //           : _howmanyCorrect(
                            //                         //               true,
                            //                         //               assignmetData[
                            //                         //                       "exercise_questions"]
                            //                         //                   .length);
                            //                         //     }
                            //                         //     else{
                            //                         //       _howmanyCorrect(
                            //                         //               false,
                            //                         //               assignmetData[
                            //                         //                       "exercise_questions"]
                            //                         //                   .length);
                            //                         //     }
                            //                         //     }

                            //                         //   },
                            //                         // )
                            //                         //you can use checkboxlistTile too
                            //                       );
                            //                     })),
                            //               ),
                            //               // SizedBox(height: 10.h,)
                            //               SizedBox(
                            //                 height: 10.h,
                            //               ),
                            //               SizedBox(
                            //                 height: 200.h,
                            //                 child: ListView.builder(
                            //                     itemCount:
                            //                         answerdetails["question_master"]
                            //                                     [index]
                            //                                 ["question_options"]
                            //                             .length,
                            //                     physics:
                            //                         AlwaysScrollableScrollPhysics(),
                            //                     itemBuilder: ((context, j) {
                            //                       return ListTile(
                            //                           contentPadding: EdgeInsets.all(
                            //                               0),
                            //                           horizontalTitleGap: 0,
                            //                           title: answerdetails["question_master"]
                            //                                               [index]
                            //                                           [
                            //                                           "question_options"]
                            //                                       [j]["answer"] ==
                            //                                   true
                            //                               ? Text(
                            //                                   "Answer: ${answerdetails["question_master"][index]["question_options"][j]["option"]}",
                            //                                   style: GoogleFonts
                            //                                       .gothicA1(
                            //                                           fontSize:
                            //                                               kSixteenFont,
                            //                                           color: white,
                            //                                           fontWeight:
                            //                                               kFW500))
                            //                               : SizedBox()
                            //                           // leading: Checkbox(

                            //                           // //   fillColor: Colors.blue,
                            //                           //   // fillColor:

                            //                           //       // MaterialStateProperty
                            //                           //       //     .resolveWith(
                            //                           //       //         getColor),
                            //                           //   checkColor:isSubmit==true? grey: white,
                            //                           //   activeColor:isSubmit==true? grey: white,
                            //                           //   value: userChecked.contains(
                            //                           //       assignmetData["exercise_questions"]
                            //                           //                   [index][
                            //                           //               "exercise_question_options"]
                            //                           //           [i]["title"]),
                            //                           //   onChanged: (val) {
                            //                           //     if(!isSubmit){
                            //                           //       _onSelected(
                            //                           //         val!,
                            //                           //         assignmetData["exercise_questions"]
                            //                           //                     [index][
                            //                           //                 "exercise_question_options"]
                            //                           //             [i]["title"]);
                            //                           //     if (val == true) {
                            //                           //       assignmetData["exercise_questions"]
                            //                           //                           [
                            //                           //                           index]
                            //                           //                       [
                            //                           //                       "exercise_question_options"][i]
                            //                           //                   [
                            //                           //                   "is_answer"] ==
                            //                           //               "false"
                            //                           //           ? _howmanyCorrect(
                            //                           //               false,
                            //                           //               assignmetData[
                            //                           //                       "exercise_questions"]
                            //                           //                   .length)
                            //                           //           : _howmanyCorrect(
                            //                           //               true,
                            //                           //               assignmetData[
                            //                           //                       "exercise_questions"]
                            //                           //                   .length);
                            //                           //     }
                            //                           //     else{
                            //                           //       _howmanyCorrect(
                            //                           //               false,
                            //                           //               assignmetData[
                            //                           //                       "exercise_questions"]
                            //                           //                   .length);
                            //                           //     }
                            //                           //     }

                            //                           //   },
                            //                           // )
                            //                           //you can use checkboxlistTile too
                            //                           );
                            //                     })),
                            //               ),
                            //             ],
                            //           ),
                            //         );
                            //       })),
                            // ),
                            // SizedBox(height: 20.h),
                          ],
                        )
                      : SizedBox()),
            ),
          ],
        ));
  }
}

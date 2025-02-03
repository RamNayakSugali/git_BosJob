// ignore_for_file: camel_case_types

import 'dart:ui';

import 'package:bossjobs/utils/export_file.dart';

class Careers_view extends StatefulWidget {
  const Careers_view({super.key});

  @override
  State<Careers_view> createState() => _CareersState();
}

class _CareersState extends State<Careers_view> {
  var DemandSkills;
  bool isLoading = false;
  Future demandSkillsListHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.getDemandSkills();
    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      DemandSkills = data["data"]["data"];
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    demandSkillsListHandler();
  }

  @override
  Widget build(BuildContext context) {
    // List categories = [
    //   {
    //     "name": "Prepare YourSelf",
    //     "image": "assets/images/prepare.png",
    //     // "route": KQrcode
    //   },
    //   {
    //     "name": "practise for Interview",
    //     "image": "assets/images/practise.png",
    //     //"route": KProfile
    //   },
    //   {
    //     "name": "Upgrade YouSkill",
    //     "image": "assets/images/upgrade.png",
    //     //"route": KQrcode
    //   },
    // ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Studies and Careers",
          style: GoogleFonts.gothicA1(
              fontSize: kSixteenFont, color: white, fontWeight: kFW700),
        ),
        SizedBox(
          height: 15.h,
        ),
        isLoading == false && DemandSkills != null
            ? SizedBox(
                height: 150.h,
                child: ListView.builder(
                    itemCount: DemandSkills.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return GlassmorphicContainer(
                        margin: EdgeInsets.only(right: 15.w),
                        height: 150.h,
                        width: 120.w,
                        borderRadius: 13.r,
                        blur: 15,
                        alignment: Alignment.center,
                        border: 2,
                        linearGradient: LinearGradient(
                            colors: [
                              white.withOpacity(0.1),
                              white.withOpacity(0.01)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderGradient: LinearGradient(
                            colors: [white.withOpacity(0.5), Gold]),
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              blurRadius: 16,
                              spreadRadius: 16,
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
                              child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: const GradientBoxBorder(
                                        gradient: LinearGradient(
                                            colors: [Colors.white38, Gold]),
                                        width: 0.5,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(16.r)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Image.asset(
                                        "assets/images/practise.png",
                                        width: 30.w,
                                      ),
                                      Text(
                                          // categories[index]["name"],
                                          DemandSkills[index]?["title"] ?? "",
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          style: GoogleFonts.gothicA1(
                                              fontSize: kTwelveFont,
                                              color: white,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      );
                    })),
              )
            : const Center(
                child: CircularProgressIndicator(
                color: Gold,
              )),
      ],
    );
  }
}

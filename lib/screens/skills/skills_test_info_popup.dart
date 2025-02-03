import 'dart:ui';

import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../utils/export_file.dart';

import 'package:flutter/cupertino.dart';

Widget buildSuccessDialog(BuildContext context) {
  return AlertDialog(
    insetPadding: EdgeInsets.zero,
    contentPadding: EdgeInsets.zero,
    clipBehavior: Clip.antiAliasWithSaveLayer,

    backgroundColor: kBackground.withOpacity(0.3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.r),
    ),
    elevation: 0,
    //  insetPadding: EdgeInsets.all(0),
    scrollable: true,
    content:
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          dialogBox(),
        ],
      );
    }),
  );
}

Widget dialogBox() {
  return GlassmorphicContainer(
    margin: EdgeInsets.only(left: 15.w, right: 15.w),

    // height: 210.h,
    height: 500.h,
    width: double.infinity,
    borderRadius: 10.r,
    blur: 15,
    alignment: Alignment.center,
    border: 2,
    linearGradient: LinearGradient(
      colors: [
        white.withOpacity(0.15),
        white.withOpacity(0.15),
      ],
    ),
    borderGradient: LinearGradient(
      colors: [
        kBackground,
        //  white.withOpacity(0.5),
        Gold.withOpacity(0.01)
      ],
    ),
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            spreadRadius: 10.r,
            color: Colors.black.withOpacity(0.1),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10.0,
            sigmaY: 10.0,
          ),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            //  padding: EdgeInsets.all(15.r),
            decoration: BoxDecoration(
              border: const GradientBoxBorder(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [kBackground, kBackground, kBackground, Gold]),
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Before You Start",
                  style: GoogleFonts.gothicA1(
                    fontSize: kSixteenFont,
                    color: whitetwo,
                    fontWeight: kFW700,
                  ),
                ),
                Container(
                  height: 400.0, // Change as per your requirement
                  width: 250.0, // Change as per your requirement
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(top: 15.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.circle_rounded,
                              size: kTenFont,
                              color: Gold,
                            ),
                            SizedBox(width: 8.w),
                            SizedBox(
                              width: 230.w,
                              child: Text(
                                "You must complete this assessment in one session - make sure your Internet is reliable.",
                                style: GoogleFonts.gothicA1(
                                    // height: 18.h,
                                    letterSpacing: 0.65,
                                    fontSize: 13.sp,
                                    color: white,
                                    fontWeight: kFW700),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 40.h),
                CustomButton(
                  label: 'Start',
                  isLoading: true,
                  onTap: () {
                    // Get.toNamed(
                    //     //KTestSkill,
                    //     KSkillrules,
                    //     arguments: {
                    //       "id": UnaccessedList[
                    //               index]
                    //           ["skill_master_id"]
                    //     });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

// class AcceptDialogs {
//   static Future<void> showMyDialog(context) {
//     return showDialog(
//         context: context,
//         builder: (_) {
//           return CupertinoAlertDialog(
//             title: const Text("Accepting order"),
//             content: const Text("Are you sure you want to assign this work"),
//           );
//         });
//   }
// }
// class Reports_popup extends StatelessWidget {
//   Reports_popup({
//     Key? key,
//   }) : super(key: key);
//   final String GRAPH = 'assets/images/graph.svg';
//   @override
//   Widget build(BuildContext context) {
//     List menu = [
//       {
//         "name": "Request Address",
//         "text_color": grey,
//       },
//       {
//         "name": "Spoke to Customer",
//         "text_color": grey,
//       },
//     ];
//     return GestureDetector(
//       onTap: () {
//         showPopover(
//           barrierColor: Colors.transparent,
//           context: context,
//           height: 170.h,
//           // height: 260.h,
//           width: 200.w,
//           transitionDuration: const Duration(milliseconds: 100),
//           bodyBuilder: (context) => Padding(
//             padding: EdgeInsets.only(left: 15.w, top: 5.h),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 for (int i = 0; i < menu.length; i++)
//                   GestureDetector(
//                     // onTap: () {
//                     //   if (menu[i]["name"] == "Request Address") {

//                     //   }
//                     //   if (menu[i]["name"] == "Assign to Co-Worker") {

//                     //     Get.toNamed(menu[i]["route"],
//                     //         arguments: {"coWorkers": coWorkers, "id": orderId});
//                     //   }
//                     //   if (menu[i]["name"] == "Logout") {
//                     //     UserSimplePreferences.clearAllData();
//                     //     Get.toNamed(KLogin);
//                     //   }
//                     // },
//                     child: Text(
//                       menu[i]["name"],
//                       textAlign: TextAlign.center,
//                       maxLines: 2,
//                       style: GoogleFonts.inter(
//                           fontSize: 13.sp,
//                           color: menu[i]["text_color"],
//                           fontWeight: kFW500),
//                     ),
//                   )
//               ],
//             ),
//           ),
//           // const ListItemsTwo(),
//           // ignore: avoid_print
//           onPop: () => print('Popover was popped!'),
//           direction: PopoverDirection.bottom,
//           radius: 15.r,
//           arrowHeight: 0.h,
//           arrowWidth: 0.w,
//         );
//       },
//       child: SvgPicture.asset(
//         GRAPH,
//       ),
//     );
//   }
// }

import 'dart:ui';

import 'package:another_xlider/models/fixed_value.dart';

import '../../../../../utils/export_file.dart';

class Applyjob extends StatefulWidget {
  const Applyjob({super.key});

  @override
  State<Applyjob> createState() => _ApplyjobState();
}

bool shouldCheck = false;
bool ischecked = false;

class _ApplyjobState extends State<Applyjob> {
  Future openDialog() => showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            backgroundColor: kBackground.withOpacity(0.7),
            // title:
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [Text("Sort",
            //   style: GoogleFonts.gothicA1(
            //               fontSize: kSixteenFont, color: darkGrey, fontWeight: kFW700)
            //   )]),
            content: Container(
                height: 337.h,
                width: 300.w,
                //color:  Colors.amber,
                child: Column(
                  children: [
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 2,
                                childAspectRatio: (0.98 / 0.45)),
                        itemBuilder: ((context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Container(
                              //     height: 170.h,
                              //     margin: EdgeInsets.all(7.r),
                              //     decoration: BoxDecoration(
                              //         border: const GradientBoxBorder(
                              //           gradient: LinearGradient(colors: [grey, Gold]),
                              //           width: 1,
                              //         ),
                              //         borderRadius: BorderRadius.circular(15.r)),
                              //     child: Image.asset(
                              //       'assets/images/calender.png',
                              //       fit: BoxFit.fill,
                              //     )),
                              Container(
                                padding: EdgeInsets.only(left: 10.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text('React Native',
                                    //     style: GoogleFonts.gothicA1(
                                    //         fontSize: 15.sp,
                                    //         color: Gold,
                                    //         fontWeight: kFW700)),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Row(
                                      children: [
                                        //                 Container(height: 19,
                                        //   width: 19,
                                        //   decoration: BoxDecoration(
                                        //       gradient: LinearGradient(
                                        //         begin: Alignment.topLeft,
                                        //         end: Alignment(10, 3),
                                        //         colors: <Color>[
                                        //           white,
                                        //           Gold,
                                        //   ],
                                        // )
                                        // ),
                                        //   child: Checkbox(value: false, onChanged: (bool? value) {  },),
                                        // ),
                                        /////////////////////////////////////////////////////////////////////////LC
                                        // CustomCheckBox(
                                        //   value: shouldCheck,
                                        //   shouldShowBorder: true,
                                        //   borderColor: Colors.red,
                                        //   checkedFillColor: Colors.red,
                                        //   borderRadius: 8,
                                        //   borderWidth: 1,
                                        //   checkBoxSize: 22,
                                        //   onChanged: (val) {
                                        //     //do your stuff here
                                        //     setState(() {
                                        //       shouldCheck = val;
                                        //     });
                                        //   },
                                        // ),
                                        GestureDetector(
                                          onTap: () {
                                            ischecked = true;
                                          },
                                          child: ShaderMask(
                                              blendMode: BlendMode.srcATop,
                                              shaderCallback: (Rect bounds) =>
                                                  LinearGradient(
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                      colors: [
                                                        white,
                                                        Gold
                                                      ]).createShader(bounds),
                                              child: ischecked == true
                                                  ? Icon(Icons.check_box)
                                                  : Icon(Icons
                                                      .check_box_outline_blank_outlined)
                                              // Icon(Icons
                                              //     .check_box_outline_blank_outlined)
                                              ),
                                        ),
                                        // Text(
                                        //   '\u{20B9}${699}',
                                        //   style: GoogleFonts.gothicA1(
                                        //       fontSize: kFourteenFont,
                                        //       color: Gold,
                                        //       fontWeight: kFW700),
                                        // ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          'Latest Jobs',
                                          style: GoogleFonts.gothicA1(
                                              //decoration: TextDecoration.lineThrough,
                                              fontSize: kTwelveFont,
                                              color: Gold,
                                              fontWeight: kFW700),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        })),
                    SizedBox(
                      height: 80,
                      width: 250,
                      child: FlutterSlider(
                        // visibleTouchArea: true,
                        jump: true,
                        values: const [10],
                        min: 0,
                        max: 200,
                        fixedValues: [
                          FlutterSliderFixedValue(percent: 0, value: ''),
                          FlutterSliderFixedValue(percent: 10, value: ''),
                          FlutterSliderFixedValue(percent: 20, value: ''),
                          FlutterSliderFixedValue(percent: 30, value: ''),
                          FlutterSliderFixedValue(percent: 40, value: ''),
                          FlutterSliderFixedValue(percent: 50, value: ''),
                          FlutterSliderFixedValue(percent: 60, value: ''),
                          FlutterSliderFixedValue(percent: 70, value: ''),
                          FlutterSliderFixedValue(percent: 80, value: ''),
                          FlutterSliderFixedValue(percent: 90, value: ''),
                          FlutterSliderFixedValue(percent: 100, value: ''),
                        ],
                        onDragging: (handlerIndex, lowerValue, upperValue) {
                          if (lowerValue is String) {
                            //  _lowerValue = double.parse(lowerValue);
                          } else {
                            // _lowerValue = lowerValue;
                          }
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(height: 5.h),
                    // Container(
                    //   width: 357.w,
                    //   height: 41.h,
                    //   margin: EdgeInsets.only(top: 20, left: 10.w, right: 10.w),
                    //   padding:
                    //       EdgeInsets.only(top: 4.h, left: 10.w, right: 10.w),
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10.r),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           blurRadius: 20,
                    //           spreadRadius: 5,
                    //           color: Color.fromARGB(255, 13, 12, 12)
                    //               .withOpacity(0.1),
                    //         )
                    //       ],
                    //       gradient: LinearGradient(
                    //           begin: Alignment.topLeft,
                    //           end: Alignment.bottomRight,
                    //           colors: [
                    //             grey.withOpacity(0.5),
                    //             grey1.withOpacity(0.5),
                    //             Color.fromARGB(255, 58, 55, 55)
                    //                 .withOpacity(0.1),
                    //           ])),
                    //   child: Container(
                    //     width: 357.w,
                    //     height: 41.h,
                    //     margin:
                    //         EdgeInsets.only(top: 20, left: 10.w, right: 10.w),
                    //     padding:
                    //         EdgeInsets.only(top: 4.h, left: 10.w, right: 10.w),
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(10.r),
                    //         boxShadow: [
                    //           BoxShadow(
                    //             blurRadius: 20,
                    //             spreadRadius: 5,
                    //             color: Color.fromARGB(255, 13, 12, 12)
                    //                 .withOpacity(0.1),
                    //           )
                    //         ],
                    //         gradient: LinearGradient(
                    //             begin: Alignment.topLeft,
                    //             end: Alignment.bottomRight,
                    //             colors: [
                    //               grey.withOpacity(0.5),
                    //               grey1.withOpacity(0.5),
                    //               Color.fromARGB(255, 58, 55, 55)
                    //                   .withOpacity(0.1),
                    //             ])),
                    //     child: Text("data"),
                    //     //                   Container(
                    //     // height: 36.h,
                    //     // width: double.infinity,
                    //     // child: CustomDropdownButton2(
                    //     //   icon: const Icon(
                    //     //     Icons.expand_more,
                    //     //     size: 25,
                    //     //   ),
                    //     //   hint: "Select State",
                    //     //   dropdownItems:items,
                    //     //   dropdownWidth: 340.w,
                    //     //   value: selectedValue,
                    //     //   onChanged: (value) {
                    //     //     setState(() {
                    //     //       selectedValue = value;
                    //     //     });
                    //     //    // onStateSelection(value);
                    //     //   },
                    //     // )
                    //     // ),
                    //   ),
                    // ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        GlassmorphicContainer(
                          margin: EdgeInsets.only(
                              top: 10.h, left: 10.w, right: 10.w),
                          height: 41.h,
                          width: 100.w,
                          borderRadius: 13.r,
                          blur: 15,
                          alignment: Alignment.center,
                          border: 0.5,
                          linearGradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.1),
                                Colors.black.withOpacity(0.01)
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
                                child: Text("Reset",
                                    //maxLines: 2,
                                    style: GoogleFonts.gothicA1(
                                        fontSize: kFourteenFont,
                                        color: white,
                                        fontWeight: kFW500)),
                              ),
                            ),
                          ),
                        ),
                        GlassmorphicContainer(
                          margin: EdgeInsets.only(
                              top: 10.h, left: 2.w, right: 10.w),
                          height: 41.h,
                          width: 100.w,
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
                                child: Text("Apply",
                                    //maxLines: 2,
                                    style: GoogleFonts.gothicA1(
                                        fontSize: kSixteenFont,
                                        color: white,
                                        fontWeight: kFW700)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          )));
  TextEditingController Applyjobs = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10.w,
          ),
          TextFormField(
            maxLength: 8,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
              prefixIcon: const Icon(Icons.search, color: Gold),
              suffixIcon: GestureDetector(
                onTap: () {
                  openDialog();
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    'assets/images/threewired.png',
                    width: 1.w,
                  ),
                ),
              ),
              filled: true,
              fillColor: white,
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
              hintText: "Apply Jobs",
            ),
            onTap: () {
              //Get.toNamed(KSearch);
            },
          ),
          // CustomSearchField(controller: Applyjobs, hintText: 'Apply Jobs', isMandatory: false, onTap: openDialog(), readOnly: false,),
          Apply_button(),
          Applyjobs_list(),
        ],
      ),
    );
  }
}

//  Scaffold(
//       backgroundColor: kBackground,
//       body: Stack(
//         children: [
//           const Background(),
//           SingleChildScrollView(
//             child:
//             Container(
//               margin: EdgeInsets.all(15.w),
//               child: Column(
//                 children: [
//                   // Apply_card(),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   const Apply_button(),
//                   const Applyjobs_list(),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );

// ignore_for_file: camel_case_types

import 'dart:ui';

import '../../utils/export_file.dart';

class Schedule_form extends StatefulWidget {
  const Schedule_form({super.key});

  @override
  State<Schedule_form> createState() => _ScheduleformState();
}

class _ScheduleformState extends State<Schedule_form> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // height: 20.h,
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 10.h),
          child: Text("Title",
              style: GoogleFonts.inter(
                  color: white, fontSize: kFourteenFont, fontWeight: kFW500)),
        ),
        Container(
          margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
          child: TextFormField(
            // maxLength: 8,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
              filled: true,
              fillColor: white.withOpacity(0.08),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: white.withOpacity(0.1),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: grey,
                ),
              ),
              hintStyle: GoogleFonts.inter(
                  color: white.withOpacity(0.5),
                  fontSize: kFourteenFont,
                  fontWeight: kFW500),
              hintText: "Interview with person..",
            ),
            onTap: () {
              // Get.toNamed(KSearch);
            },
          ),
        ),
        Container(
          // height: 20.h,
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 10.h, top: 10.h),
          child: Text("Date Type",
              style: GoogleFonts.inter(
                  color: white, fontSize: kFourteenFont, fontWeight: kFW500)),
        ),
        Container(
          margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
          child: TextFormField(
            readOnly: true,
            onTap: () async {
              // if (pickedDate != null) {
              //   String formattedDate =
              //       DateFormat('dd-MM-yyyy').format(pickedDate);
              //   //formatted date output using intl package =>  2021-03-16
              //   setState(() {
              //     dateInput.text =
              //         formattedDate; //set output date to TextField value.
              //   });
              // } else {}
            },
            // controller: date,
            //maxLength: 8,
            decoration: InputDecoration(
              isDense: true,
              suffixIcon: Icon(
                Icons.calendar_month,
                size: 25.w,
                color: Gold,
              ),
              contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
              filled: true,
              fillColor: white.withOpacity(0.08),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: white.withOpacity(0.1),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: grey,
                ),
              ),
              hintStyle: GoogleFonts.inter(
                  color: white.withOpacity(0.5),
                  fontSize: kFourteenFont,
                  fontWeight: kFW500),
              hintText: "dd/mm/yyyy",
            ),
          ),
        ),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // height: 20.h,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 10.w, top: 20.h),
              child: Text("Time",
                  style: GoogleFonts.inter(
                      color: white,
                      fontSize: kFourteenFont,
                      fontWeight: kFW500)),
            ),
            SizedBox(width: 130.w),
            Container(
              // height: 20.h,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 14.w, right: 20.w, top: 20.h),
              child: Text("Task",
                  style: GoogleFonts.inter(
                      color: white,
                      fontSize: kFourteenFont,
                      fontWeight: kFW500)),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: 150.w,
              margin: EdgeInsets.only(left: 10.w, right: 20.w, top: 5.h),
              child: TextFormField(
                // maxLength: 8,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                  filled: true,
                  fillColor: white.withOpacity(0.08),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: white.withOpacity(0.1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(
                      color: grey,
                    ),
                  ),
                  hintStyle: GoogleFonts.inter(
                      color: white.withOpacity(0.5),
                      fontSize: kFourteenFont,
                      fontWeight: kFW500),
                  hintText: "11:00 AM",
                ),
                onTap: () {
                  // Get.toNamed(KSearch);
                },
              ),
            ),
            Container(
              //alignment: Alignment.centerLeft,
              width: 150.w,
              margin: EdgeInsets.only(left: 10.w, right: 20.w, top: 5.h),
              child: TextFormField(
                // maxLength: 8,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                  filled: true,
                  fillColor: white.withOpacity(0.08),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: white.withOpacity(0.1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(
                      color: grey,
                    ),
                  ),
                  hintStyle: GoogleFonts.inter(
                      color: white.withOpacity(0.5),
                      fontSize: kFourteenFont,
                      fontWeight: kFW500),
                  hintText: "Jobs,Courses",
                ),
                onTap: () {
                  // Get.toNamed(KSearch);
                },
              ),
            ),
          ],
        ),
        Container(
          // height: 20.h,
          alignment: Alignment.topLeft,
          margin:
              EdgeInsets.only(left: 10.w, right: 20.w, top: 20.h, bottom: 15.h),
          child: Text("Duration 2 hour",
              style: GoogleFonts.inter(
                  color: white, fontSize: kSixteenFont, fontWeight: kFW500)),
        ),
        Container(
          // height: 20.h,
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 10.w, top: 5.h),
          child: Text("Notes",
              style: GoogleFonts.inter(
                  color: white, fontSize: kFourteenFont, fontWeight: kFW500)),
        ),
        Container(
          // height: 250.h,
          margin:
              EdgeInsets.only(left: 10.w, right: 10.w, top: 6.h, bottom: 20.h),
          child: TextFormField(
            //maxLength: 8,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.fromLTRB(10, 1, 10, 95),
              filled: true,
              fillColor: white.withOpacity(0.08),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(
                  color: white.withOpacity(0.1),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: grey,
                ),
              ),
              hintStyle: GoogleFonts.inter(
                  color: white.withOpacity(0.5),
                  fontSize: kFourteenFont,
                  fontWeight: kFW500),
              hintText: "Write something",
            ),
            onTap: () {
              // Get.toNamed(KSearch);
            },
          ),
        ),
        SizedBox(height: 40.h),
        GlassmorphicContainer(
          margin: EdgeInsets.all(10.r),
          height: 40.h,
          width: double.infinity,
          borderRadius: 10.r,
          blur: 15,
          alignment: Alignment.center,
          border: 2,
          linearGradient: LinearGradient(
              colors: [white.withOpacity(0.1), white.withOpacity(0.01)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderGradient:
              LinearGradient(colors: [white.withOpacity(0.5), Gold]),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: 10,
                color: Colors.black.withOpacity(0.1),
              )
            ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 20.0,
                  sigmaY: 20.0,
                ),
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: const GradientBoxBorder(
                          gradient:
                              LinearGradient(colors: [Colors.white38, Gold]),
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: SizedBox(
                      // alignment: Alignment.center,
                      height: 50.h,
                      // padding: EdgeInsets.only(left: 10.w),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 40.h,
                            width: 338.5.w,
                            child: TextButton(
                              onPressed: () {
                                // Get.toNamed(KApply_jobs);
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll<Color>(
                                    white.withOpacity(0.08),
                                  ),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          side: BorderSide(
                                            color: white.withOpacity(0.1),
                                          )))),
                              child: Text(
                                "Save",
                                style: GoogleFonts.gothicA1(
                                    fontSize: kSixteenFont,
                                    color: white,
                                    fontWeight: kFW700),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


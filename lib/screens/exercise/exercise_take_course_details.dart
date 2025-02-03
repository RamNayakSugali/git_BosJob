import 'dart:ui';
import 'package:bossjobs/utils/export_file.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:material_tag_editor/tag_editor.dart';

class exercisecoursedetails extends StatefulWidget {
  const exercisecoursedetails({super.key});

  @override
  State<exercisecoursedetails> createState() => _exercisecoursedetailsState();
}

class _exercisecoursedetailsState extends State<exercisecoursedetails> {
  TextEditingController Title = TextEditingController();
  List<String> _values = [];
  _onDelete(index) {
    setState(() {
      _values.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return // Example 5
        SizedBox(
      height: 300.h,
      child: ContainedTabBarView(
        tabs: [
          Text('Lesson Overview'),
          Text('Reading Material'),
          Text('Assignment'),
          Text('Forum'),
          Text('Notes'),
          Text('External Links'),
        ],
        tabBarProperties: TabBarProperties(
          isScrollable: true,
          width: double.infinity,
          labelPadding: EdgeInsets.only(right: 10, left: 10.w),
          //margin: EdgeInsets.only(left: 15.w),
          height: 32,
          background: Container(
            decoration: BoxDecoration(
              color: kBackground,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 0.5,
                  blurRadius: 2,
                  offset: Offset(1, -1),
                ),
              ],
            ),
          ),
          position: TabBarPosition.top,
          alignment: TabBarAlignment.center,
          indicatorColor: Colors.transparent,
          labelColor: Gold,
          unselectedLabelColor: Colors.grey[400],
        ),
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
                Text(
                  "Testing Lesson 1",
                  style: GoogleFonts.gothicA1(
                      fontSize: kFourteenFont,
                      color: white,
                      fontWeight: kFW600),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Introduction",
                  style: GoogleFonts.gothicA1(
                      fontSize: kFourteenFont,
                      color: white,
                      fontWeight: kFW600),
                ),
                //Introduction
              ],
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
            child: Text(
              "Students 1",
              style: GoogleFonts.gothicA1(
                  fontSize: kFourteenFont, color: white, fontWeight: kFW600),
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
            child: Text(
              "No Assignments",
              style: GoogleFonts.gothicA1(
                  fontSize: kFourteenFont,
                  color: Colors.red,
                  fontWeight: kFW600),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  controller: Title,
                  hintText: "Enter Forum",
                  isMandatory: false,
                  label: 'Forum',
                  readOnly: false,
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                    height: 40.h,
                    width: 110.w,
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [white, grey1]),
                        borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        //_launchUrl,
                        style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll<Color>(grey),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    side: const BorderSide(color: grey)))),
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
                  hintText: "Search ",
                  isMandatory: false,
                  label: ' ',
                  readOnly: false,
                ),
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
                  height: 15.h,
                ),
                Center(
                  child: Text(
                    "No data available in Questions ",
                    style: GoogleFonts.gothicA1(
                        fontSize: kSixteenFont,
                        color: white,
                        fontWeight: kFW600),
                  ),
                ),
              ],
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    controller: Title,
                    hintText: "Enter Notes ",
                    isMandatory: false,
                    label: 'Notes',
                    readOnly: false,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(197, 36, 36, 36)
                                .withOpacity(1),
                            const Color.fromARGB(225, 24, 21, 21)
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
                            const EdgeInsets.fromLTRB(10, 15, 10, 15),
                        filled: true,
                        fillColor: white.withOpacity(0.08),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(color: grey1.withOpacity(0.2)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(color: grey1.withOpacity(0.2)),
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
                          gradient: LinearGradient(colors: [white, grey1]),
                          borderRadius: BorderRadius.all(Radius.circular(80.0)),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          //_launchUrl,
                          style: ButtonStyle(
                              backgroundColor:
                                  const MaterialStatePropertyAll<Color>(grey),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      side: const BorderSide(color: grey)))),
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
            child: Text(
              "No External Links",
              style: GoogleFonts.gothicA1(
                  fontSize: kFourteenFont,
                  color: Colors.red,
                  fontWeight: kFW600),
            ),
          ),
        ],
      ),
    );
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

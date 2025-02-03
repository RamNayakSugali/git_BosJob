// ignore_for_file: unused_local_variable, non_constant_identifier_names, unused_field

import '../../utils/export_file.dart';

class Achievements extends StatefulWidget {
  const Achievements({super.key});

  @override
  State<Achievements> createState() => _AchievementsState();
}

class incidentData {
  String title = '';
  String description = '';
  String year = "";
}

class _AchievementsState extends State<Achievements> {
  String identity = "";
  String? selectedValue;
  bool isLoading = false;
  TextEditingController CourseName = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController CertificateLink = TextEditingController();
  TextEditingController description = TextEditingController();
  var editAwards = Get.arguments;
  final _formKey = GlobalKey<FormState>();
  //  File? _image;
  String base64 = "";
  // bool isLoading = false;
  incidentData data = incidentData();
  Future reportIncident() async {
    // if (base64 == "") {
    //   Fluttertoast.showToast(msg: "please select image");
    // }
    setState(() {
      isLoading = true;
    });

    Map payload = {
      "title": data.title,
      "description": data.description,
      "year": data.year,
// description
// title
// year
      // "image": base64
    };
    Map value = await Services.addachievementsprofile(payload);
    print(value);
    ;
    if (value["message"] != null) {
      Fluttertoast.showToast(msg: value["message"]);
    } else {
      Get.back();
    }
    setState(() {
      isLoading = false;
    });
  }
Future editAchevements(id) async {
    // if (base64 == "") {
    //   Fluttertoast.showToast(msg: "please select image");
    // }
    setState(() {
      isLoading = true;
    });

    Map payload = {
      "title": data.title,
      "description": data.description,
      "year": data.year,
// description
// title
// year
      // "image": base64
    };
    Map value = await Services.editAchevements(id, payload);
    print(value);
    ;
    if (value["data"]["message"] != null) {
      Fluttertoast.showToast(msg: value["data"]["message"]);
      Get.toNamed(Kprofile);
    } else {
      Get.back();
    }
    setState(() {
      isLoading = false;
    });
  }
  @override
  void initState() {
    dateinput.text = "";
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    bool isLoading = false;
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        backgroundColor: darktwo,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Achievements',
          style: GoogleFonts.gothicA1(
              fontSize: 16.sp, color: white, fontWeight: kFW700),
        ),
      ),
      body: Stack(
        children: [
          Background(),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(15.w),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/images/happy.png',
                            width: 358.w,
                          ),
                        ),
                        Positioned(
                          top: 90.h,
                          left: 10.w,
                          child: SizedBox(
                            width: 300.w,
                            height: 65.h,
                            child: Text("Achievements you Achieved",
                                maxLines: 2,
                                style: GoogleFonts.inter(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 26.sp,
                                  foreground: Paint()
                                    ..shader = const LinearGradient(
                                      colors: <Color>[
                                        Color.fromARGB(255, 208, 153, 66),
                                        Color.fromARGB(255, 201, 115, 109)
                                        //add more color here.
                                      ],
                                    ).createShader(const Rect.fromLTWH(
                                        0.0, 0.0, 200.0, 100.0)),
                                  fontWeight: kFW800,
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    // Container(
                    //   margin: EdgeInsets.all(10.r),
                    //   child: TextFormField(
                    //     decoration: const InputDecoration(
                    //       hintStyle: TextStyle(fontSize: 17),
                    //       hintText: 'Text Something',
                    //       border: InputBorder.none,
                    //       contentPadding: EdgeInsets.only(left: 20),
                    //     ),
                    //     validator: (value) {
                    //       if (value!.isEmpty) {
                    //         return 'Please enter some text';
                    //       }
                    //       return null;
                    //     },
                    //     onChanged: (String value) {
                    //       data.title = value;
                    //     },
                    //   ),
                    // ),
                    CustomTextFormField(
                      controller: CourseName,
                      hintText: 
 editAwards["id"] == -1
                          ? "title"
                          : editAwards["title"],
                      isMandatory: false,
                      label: 'Title',
                      readOnly: false,
                                                                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Title';
                        }else{
                          return "";
                        }
                        
                      },
                      onChanged: (String value) {
                        data.title = value;
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    // Container(
                    //   margin: EdgeInsets.all(10.r),
                    //   child: TextFormField(
                    //     decoration: const InputDecoration(
                    //       hintStyle: TextStyle(fontSize: 17),
                    //       hintText: 'Text Something',
                    //       border: InputBorder.none,
                    //       contentPadding: EdgeInsets.only(left: 20),
                    //     ),
                    //     validator: (value) {
                    //       if (value!.isEmpty) {
                    //         return 'Please enter some text';
                    //       }
                    //       return null;
                    //     },
                    //     onChanged: (String value) {
                    //       data.description = value;
                    //     },
                    //   ),
                    // ),
                    CustomTextFormField(
                      controller: description,
                      hintText: editAwards["id"] == -1
                          ? "description"
                          : editAwards["description"],

                      isMandatory: false,
                      label: 'Description',
                    
                                                                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Description';
                        }
                        return null;
                      },
                      readOnly: false,
                      onChanged: (String value) {
                        data.description = value;
                      },
                    ),
                    // CustomTextFormField(
                    //   controller: dateinput,
                    //   hintText: "DOB",
                    //   suffix: InkWell(
                    //     onTap: () async {
                    //       DateTime? pickedDate = await showDatePicker(
                    //           context: context,
                    //           initialDate: DateTime.now(),
                    //           firstDate: DateTime(2000),
                    //           lastDate: DateTime(2101),
                    //           builder: (context, child) {
                    //             return Theme(
                    //               data: Theme.of(context).copyWith(
                    //                 colorScheme:   ColorScheme.light(
                    //                 background: white,
                    //                   primary: Colors.grey,
                    //                   onPrimary:   white,
                    //                   onSurface: Colors.black,
                    //                 ),
                    //                 textButtonTheme: TextButtonThemeData(
                    //                   style: TextButton.styleFrom(
                    //                     primary:  Colors.black,
                    //                   ),
                    //                 ),
                    //               ),
                    //               child: child!,
                    //             );
                    //           });

                    //       if (pickedDate != null) {
                    //         print(pickedDate);
                    //         String formattedDate =
                    //             DateFormat('yyyy-MM-dd').format(pickedDate);
                    //         print(formattedDate);

                    //         setState(() {
                    //           dateinput.text = formattedDate;
                    //         });
                    //       } else {
                    //         print("Date is not selected");
                    //       }
                    //     },
                    //     child: Icon(
                    //       Icons.calendar_month,
                    //       size: 20.w,
                    //       color: Gold,
                    //     ),
                    //   ),
                    //   isMandatory: false,
                    //   label: 'Date Of Birth',
                    //   readOnly: true,
                    // ),

                    SizedBox(
                      height: 15.h,
                    ),
                    // Container(
                    //   margin: EdgeInsets.all(10.r),
                    //   child: TextFormField(
                    //     decoration: const InputDecoration(
                    //       hintStyle: TextStyle(fontSize: 17),
                    //       hintText: 'Text Something',
                    //       border: InputBorder.none,
                    //       contentPadding: EdgeInsets.only(left: 20),
                    //     ),
                    //     validator: (value) {
                    //       if (value!.isEmpty) {
                    //         return 'Please enter some text';
                    //       }
                    //       return null;
                    //     },
                    //     onChanged: (String value) {
                    //       data.year = value;
                    //     },
                    //   ),
                    // ),
                    CustomTextFormField(
                      controller: CertificateLink,
                      hintText: editAwards["id"] == -1 ? "year" : editAwards["year"],

                      isMandatory: false,
                      label: 'Year',
                      readOnly: false,
                      maxLength: 4,
                                                                                                              validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Year Required';
                        }
                        return null;
                      },
                      onChanged: (String value) {
                        data.year = value;
                      },
                    ),
                    // CustomTextFormField(
                    //   controller: CertificateLink,
                    //   hintText: "Certificate Link",
                    //   isMandatory: false,
                    //   label: 'Certificate Link',
                    //   readOnly: false,
                    // ),

                    SizedBox(height: 70.h),
                    editAwards["id"] == -1
                        ? CustomProfileButton(
                            label: 'Save',
                            isLoading: true,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                reportIncident();
                              }
                            },
                            // onTap: () {
                            //   if (_formKey.currentState!.validate()) {}
                            //   ;
                            //   // Get.toNamed(KAchievedDetails);
                            // },
                          )
                        : CustomProfileButton(
                            label: 'Update',
                            isLoading: true,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                editAchevements(editAwards["id"]);
                              }
                            },
                            // onTap: () {
                            //   if (_formKey.currentState!.validate()) {}
                            //   ;
                            //   // Get.toNamed(KAchievedDetails);
                            // },
                          ),

                    SizedBox(height: 30.h)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

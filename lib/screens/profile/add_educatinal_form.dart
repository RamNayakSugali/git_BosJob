// ignore_for_file: unused_local_variable

import '../../utils/export_file.dart';

class Educatinal extends StatefulWidget {
  const Educatinal({super.key});

  @override
  State<Educatinal> createState() => _EducatinalState();
}

class incidentDate {
  String institute_name = '';
  String year_completed = '';
  String percentage_or_grade = "";
  String almamater_master_id = "";
  String affiliation = '';
}

class _EducatinalState extends State<Educatinal> {
  String identity = "";
  String? selectedValue;
  bool isLoading = false;
  TextEditingController CollegeName = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController Marks = TextEditingController();
  TextEditingController Batch = TextEditingController();
  TextEditingController affiliated = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var editData = Get.arguments;
  //final _formKey = GlobalKey<FormState>();
  //  File? _image;
  String base64 = "";
  // bool isLoading = false;
  incidentDate data = incidentDate();
  Future reportIncident() async {
    // if (base64 == "") {
    //   Fluttertoast.showToast(msg: "please select image");
    // }
    setState(() {
      isLoading = true;
    });

    Map payload = {
      "institute_name": data.institute_name,
      "year_completed": data.year_completed,
      "percentage_or_grade": data.percentage_or_grade,
      "almamater_master_id": data.almamater_master_id,

    };
    Map value = await Services.addeducationaldetails(payload);
    print(value);
    ;
    if (value["data"]["message"] != null) {
      Fluttertoast.showToast(msg: value["data"]["message"]);
    } else {
      Get.back();
    }
    setState(() {
      isLoading = false;
    });
  }

  List jobqualificationlist = [];
  // bool isLoading = false;
  Future IndustryHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.getQualificationsPacks();
    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      jobqualificationlist = data["data"]["data"];

      // data["results"];
    }
    print(data["data"]["data"]);
    setState(() {
      isLoading = false;
    });
  }
Future editDetails(id) async {
    // if (base64 == "") {
    //   Fluttertoast.showToast(msg: "please select image");
    // }
    setState(() {
      isLoading = true;
    });

    Map payload = {
      "affiliation": data.affiliation,
      "institute_name": data.institute_name,
      "year_completed": data.year_completed,
      "percentage_or_grade": data.percentage_or_grade,
      "almamater_master_id": data.almamater_master_id,
// description
// title
// year
      // "image": base64
    };
    Map value = await Services.editEducationalDetails(id, payload);
    print(value);
    ;
    if (value["data"]["message"] != null) {
      Fluttertoast.showToast(msg: value["data"]["message"]);
      Get.toNamed(Kprofile);
    } else {
      // Get.back();
    }
    setState(() {
      isLoading = false;
    });
  }
  @override
  void initState() {
    IndustryHandler();
    dateinput.text = "";
    super.initState();
    isLoading = false;
  }

  var dropdownvalue;
  var statedropdownvalue;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    bool isLoading = false;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        backgroundColor: darktwo,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: white,
            )),
        title: Text(
          'Educational Details',
          style: GoogleFonts.gothicA1(
              fontSize: 16.sp, color: white, fontWeight: kFW700),
        ),
      ),
      backgroundColor: kBackground,
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
                            'assets/images/clg.png',
                            width: 358.w,
                          ),
                        ),
                        Positioned(
                          top: 90.h,
                          left: 10.w,
                          child: SizedBox(
                            width: 300.w,
                            height: 65.h,
                            child: Text("Your Best Academic Results",
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
                    //       data.institute_name = value;
                    //     },
                    //   ),
                    // ),
                    CustomTextFormField(
                      controller: CollegeName,
                      hintText: editData["id"] == -1
                          ? "Institute name"
                          : editData["institute_name"],

                      isMandatory: false,
                      label: 'Institute Name',
                      readOnly: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Institute Name';
                        }
                        return null;
                      },
                      onChanged: (String value) {
                        data.institute_name = value;
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                   CustomTextFormField(
                      controller: affiliated,
                      hintText: editData["id"] == -1
                          ? "Affiliated"
                          : editData["affiliation"],
                      isMandatory: false,
                      label: 'Affiliated',
                      readOnly: false,
                      onChanged: (String value) {
                        data.affiliation = value;
                      },
                    ),
                                        SizedBox(
                      height: 15.h,
                    ),
                    CustomTextFormField(
                      controller: Batch,
                      hintText:editData["id"] == -1
                          ? "passed year "
                          : editData["year_completed"],

                      isMandatory: false,
                      label: 'Passed Year',
                      readOnly: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter  Year';
                        }
                        return null;
                      },
                      onChanged: (String value) {
                        data.year_completed = value;
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
                    //                 colorScheme: ColorScheme.light(
                    //                   background: white,
                    //                   primary: Colors.grey,
                    //                   onPrimary: white,
                    //                   onSurface: Colors.black,
                    //                 ),
                    //                 textButtonTheme: TextButtonThemeData(
                    //                   style: TextButton.styleFrom(
                    //                     primary: Colors.black,
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
                    SizedBox(height: 15.h),
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
                    //       data.percentage_or_grade = value;
                    //     },
                    //   ),
                    // ),
                    CustomTextFormField(
                      controller: Marks,
                      hintText: 
                      editData["id"] == -1
                          ? "Grade or Percentage"
                          : editData["percentage_or_grade"],
                      isMandatory: false,
                      label: 'Grade or Percentage',
                      readOnly: false,
                                            validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Grade or Percentage';
                        }
                        return null;
                      },
                      onChanged: (String value) {
                        data.percentage_or_grade = value;
                      },
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     SizedBox(
                    //       width: 160.w,
                    //       child: CustomTextFormField(
                    //         controller: Marks,
                    //         hintText: "Marks",
                    //         isMandatory: false,
                    //         label: 'Marks Obtain',
                    //         readOnly: false,
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 160.w,
                    //       child: CustomTextFormField(
                    //         keyboardType: TextInputType.number,
                    //         controller: Batch,
                    //         hintText: "Batch",
                    //         isMandatory: false,
                    //         label: 'Batch',
                    //         readOnly: false,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 15.h),
                    // Container(
                    //   margin: EdgeInsets.all(10.r),
                    //   child: TextFormField(
                    //     decoration: const InputDecoration(
                    //       hintStyle: TextStyle(fontSize: 17),
                    //       hintText: 'Text Something',
                    //       border: InputBorder.none,
                    //       contentPadding: EdgeInsets.only(left: 20),
                    //     ),
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     return 'Please enter some text';
                    //   }
                    //   return null;
                    // },
                    //     onChanged: (String value) {
                    //       data.almamater_master_id = value as int;
                    //     },
                    //   ),
                    // ),
                    // CustomDrop(
                    //   onChanged: (dynamic str) {
                    //     setState(() {
                    //       identity = str;
                    //     });
                    //   },
                    //   options: const ["Civil", "CSE", "Mechanical"],
                    //   label: 'Stream',
                    //   isMandatory: false,
                    // ),
                    Container(
                      height: 40.h,
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(90, 87, 87, 0.773)
                                  .withOpacity(0.3),
                              const Color.fromARGB(225, 24, 21, 21),
                              // Colors.black.withOpacity(0.7)
                            ],
                          )),
                      // width: double.infinity,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          dropdownColor: kBackground,
                          style: GoogleFonts.inter(
                              color: white,
                              fontSize: kTwelveFont,
                              fontWeight: kFW500),
                          //  iconSize: 24.sp,

                          // alignment: Alignment.centerRight,
                          isExpanded: true,
                          hint: Text(
                            'Select Qualification"',
                            style: GoogleFonts.inter(
                                color: white,
                                fontSize: kTwelveFont,
                                fontWeight: kFW500),
                          ),
                          items: jobqualificationlist.map((item) {
                            return DropdownMenuItem(
                              value: item['id'].toString(),
                              child: Text(item['name'].toString()),
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            setState(() {
                              dropdownvalue = newVal;
                            });
                            data.almamater_master_id = dropdownvalue;
                          },
                          value: dropdownvalue,
                        ),
                      ),
                    ),
                    SizedBox(height: 50.h),
                    isLoading == true
                        ? Center(
                            child: CircularProgressIndicator(
                            color: Gold,
                          ))
                        : editData["id"] == -1
                        ? CustomProfileButton(
                            label: 'Save',
                            isLoading: true,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                reportIncident();
                              }
                            },
                          )
                        : CustomProfileButton(
                            label: 'Update',
                            isLoading: true,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                editDetails(editData["id"]);
                              }
                            },
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

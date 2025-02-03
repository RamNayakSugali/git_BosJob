// ignore_for_file: unused_local_variable

import '../../utils/export_file.dart';

class Experinces extends StatefulWidget {
  const Experinces({super.key, this.title});
  final String? title;
  @override
  State<Experinces> createState() => _ExperincesState();
}

class incidentDatas {
  String title = '';
  String description = '';
  String industry_id = "";

  String company = '';
  String from_year = "";
  String to_year = "";
}

class _ExperincesState extends State<Experinces> {
  String? selectedValue;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
  ];
  String identity = "";
  // String? selectedValue;
  bool isLoading = false;
  TextEditingController Name = TextEditingController();
  TextEditingController Skills = TextEditingController();
  TextEditingController CompanyName = TextEditingController();
  TextEditingController TotalExperience = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController Workperiod = TextEditingController();
  TextEditingController ToWorkperiod = TextEditingController();
  TextEditingController descriptions = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController from_year = TextEditingController();

  TextEditingController to_year = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  List<String> _values = [];
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();

  _onDelete(index) {
    setState(() {
      _values.removeAt(index);
    });
  }

  /// This is just an example for using `TextEditingController` to manipulate
  /// the the `TextField` just like a normal `TextField`.
  _onPressedModifyTextField() {
    final text = 'Test';
    _textEditingController.text = text;
    _textEditingController.value = _textEditingController.value.copyWith(
      text: text,
      selection: TextSelection(
        baseOffset: text.length,
        extentOffset: text.length,
      ),
    );
  }

  // final _formKey = GlobalKey<FormState>();
  //  File? _image;
  String base64 = "";
  // bool isLoading = false;
  incidentDatas data = incidentDatas();
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
      "company": data.company,
      "from_year": data.from_year,
      "to_year": data.to_year,
      "industry_id": data.industry_id

      // "description": data.description,
// description
// title
// year
      // "image": base64
    };
    Map value = await Services.addworkexperience(payload);
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

  List Industrylist = [];
  // bool isLoading = false;
  Future IndustryHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.getindustrylist();
    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      Industrylist = data["data"]["data"];
      print(data["data"]);
      // data["results"];
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
      backgroundColor: kBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        backgroundColor: darktwo,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Work Experience',
          style: GoogleFonts.gothicA1(
              fontSize: 17.sp, color: white, fontWeight: kFW700),
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
                            'assets/images/laptop1.png',
                            width: 358.w,
                          ),
                        ),
                        Positioned(
                          top: 90.h,
                          left: 10.w,
                          child: SizedBox(
                            width: 300.w,
                            height: 65.h,
                            child: Text("Show Your Skills and Level Up",
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
                      controller: Name,
                      hintText: "Title",
                      isMandatory: false,
                      label: 'Title',
                      readOnly: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Title';
                        }
                        return null;
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
                      controller: descriptions,
                      hintText: "description",
                      isMandatory: false,
                      label: 'Description',
                      readOnly: false,
                                            validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Description';
                        }
                        return null;
                      },
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
                    // SizedBox(
                    //   height: 15.h,
                    // ),
                    // Text("Skills",
                    //     style: GoogleFonts.inter(
                    //         color: white,
                    //         fontSize: kFourteenFont,
                    //         fontWeight: kFW500)),
                    SizedBox(
                      height: 10.h,
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
                    //       data.company = value;
                    //     },
                    //   ),
                    // ),
                    CustomTextFormField(
                      controller: company,
                      hintText: "company",
                      isMandatory: false,
                      label: 'Company',
                      readOnly: false,
                                                                  validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Company';
                        }
                        return null;
                      },
                      onChanged: (String value) {
                        data.company = value;
                      },
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10.r),
                    //       gradient: LinearGradient(
                    //         colors: [
                    //           const Color.fromARGB(197, 36, 36, 36).withOpacity(1),
                    //           const Color.fromARGB(225, 24, 21, 21).withOpacity(1),
                    //           Colors.black.withOpacity(0.7)
                    //         ],
                    //       )),
                    //   child: TagEditor(
                    //     length: _values.length,
                    //     delimiters: [',', ' '],
                    //     hasAddButton: true,
                    //     textStyle: GoogleFonts.inter(
                    //         color: white,
                    //         fontSize: kTwelveFont,
                    //         fontWeight: kFW500),
                    //     inputDecoration: InputDecoration(
                    //       isDense: true,
                    //       contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                    //       filled: true,
                    //       fillColor: white.withOpacity(0.08),
                    //       enabledBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10.r),
                    //         borderSide: BorderSide(color: grey1.withOpacity(0.2)),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10.r),
                    //         borderSide: BorderSide(color: grey1.withOpacity(0.2)),
                    //       ),
                    //       hintStyle: GoogleFonts.inter(
                    //           color: white.withOpacity(0.5),
                    //           fontSize: kFourteenFont,
                    //           fontWeight: kFW500),
                    //       hintText: "Skils",
                    //     ),
                    //     onTagChanged: (newValue) {
                    //       setState(() {
                    //         _values.add(newValue);
                    //       });
                    //     },
                    //     tagBuilder: (context, index) => _Chip(
                    //       index: index,
                    //       label: _values[index],
                    //       onDeleted: _onDelete,
                    //     ),
                    //   ),
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
                    //       data.from_year = value;
                    //     },
                    //   ),
                    // ),
                    CustomTextFormField(
                      controller: from_year,
                      hintText: "From Year",
                      isMandatory: false,
                      label: 'From Year',
                      maxLength: 4,
                      readOnly: false,
                                                                                        validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Year Required';
                        }
                        return null;
                      },
                      onChanged: (String value) {
                        data.from_year = value;
                      },
                    ),
                    // CustomTextFormField(
                    //   controller: CompanyName,
                    //   hintText: "Company Name",
                    //   isMandatory: false,
                    //   label: 'Company Name',
                    //   readOnly: false,
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
                    //       data.to_year = value;
                    //     },
                    //   ),
                    // ),
                    CustomTextFormField(
                      controller: to_year,
                      hintText: "To Year",
                      isMandatory: false,
                      label: 'To Year',
                      readOnly: false,
                      maxLength: 4,
                                                                                                              validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Year Required';
                        }
                        return null;
                      },
                      onChanged: (String value) {
                        data.to_year = value;
                      },
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     SizedBox(
                    //       width: 155.w,
                    //       child: CustomTextFormField(
                    //         controller: Workperiod,
                    //         hintText: "Workperiod",
                    //         isMandatory: false,
                    //         label: 'Work Periods',
                    //         readOnly: false,
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.only(top: 18.h),
                    //       child: Text(
                    //         "To",
                    //         style: GoogleFonts.gothicA1(
                    //             fontSize: kTwelveFont,
                    //             color: white,
                    //             fontWeight: kFW500),
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 155.w,
                    //       child: CustomTextFormField(
                    //         controller: ToWorkperiod,
                    //         hintText: "Workperiod",
                    //         isMandatory: false,
                    //         label: '',
                    //         readOnly: false,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 15.h),
                    // CustomTextFormField(
                    //   controller: TotalExperience,
                    //   hintText: "Total Experience",
                    //   isMandatory: false,
                    //   label: 'Total Experience',
                    //   readOnly: false,
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
                            'Select Industry',
                            style: GoogleFonts.inter(
                                color: white,
                                fontSize: kTwelveFont,
                                fontWeight: kFW500),
                          ),
                          items: Industrylist.map((item) {
                            return DropdownMenuItem(
                              value: item['id'].toString(),
                              child: Text(item['title'].toString()),
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            setState(() {
                              dropdownvalue = newVal;
                            });
                            data.industry_id = dropdownvalue;
                          },
                          value: dropdownvalue,
                        ),
                      ),
                    ),
                    // Container(
                    //   height: 40.h,
                    //   padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(10.r),
                    //       gradient: LinearGradient(
                    //         colors: [
                    //           Color.fromRGBO(90, 87, 87, 0.773).withOpacity(0.3),
                    //           const Color.fromARGB(225, 24, 21, 21),
                    //           // Colors.black.withOpacity(0.7)
                    //         ],
                    //       )),
                    //   // width: double.infinity,
                    //   child: DropdownButton(
                    //     dropdownColor: kBackground,
                    //     style: GoogleFonts.inter(
                    //         color: white,
                    //         fontSize: kTwelveFont,
                    //         fontWeight: kFW500),
                    //     //  iconSize: 24.sp,

                    //     // alignment: Alignment.centerRight,
                    //     isExpanded: true,
                    //     hint: Text('CBSE'),
                    //     items: jobqualificationlist.map((item) {
                    //       return DropdownMenuItem(
                    //         value: item['id'].toString(),
                    //         child: Text(item['name'].toString()),
                    //       );
                    //     }).toList(),
                    //     onChanged: (newVal) {
                    //       setState(() {
                    //         dropdownvalue = newVal;
                    //       });
                    //       data.almamater_master_id = dropdownvalue;
                    //     },
                    //     value: dropdownvalue,
                    //   ),
                    // ),
                    SizedBox(height: 50.h),
                    CustomProfileButton(
                      label: 'Save',
                      isLoading: true,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          reportIncident();
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

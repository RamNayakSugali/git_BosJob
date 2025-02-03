import 'dart:io';
import 'dart:ui';

import 'package:bossjobs/models/language_model.dart';
import 'package:bossjobs/models/state_and_city_model.dart';
import 'package:bossjobs/models/update_profile_model.dart';
import 'package:dio/dio.dart' as dio;
// import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../../utils/export_file.dart';

class ProfileForm extends StatefulWidget {
  Map profileData;
  ProfileForm({super.key, required this.profileData});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController currentSalaryController = TextEditingController();
  TextEditingController expectedSalaryController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController dOBController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController linkedinController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  TextEditingController passportController = TextEditingController();
  TextEditingController fbController = TextEditingController();
  TextEditingController yourselfController = TextEditingController();

// yourselfController
  int? genderId;
  int? maritalStatusId;
  int? languageId;
  int? stateId;
  int? cityId;
  bool editState = false;
  bool editLanguage = false;

  final _formKey = GlobalKey<FormState>();

  File? selectedImage;
  final picker = ImagePicker();
  var selectedState;
  String selectedgender = "";
  String selectedstatus = "";
  List<LanguageModel> languages = [];
  List<StateModel> states = [];
  List<CityModel> cities = [];

  bool isLoading = false;
  bool isStateSelected = false;

  Future<void> chooseImage(type) async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxHeight: 500,
        maxWidth: 500);
    setState(() {
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
      } else {
        debugPrint('No image selected.');
      }
    });
  }

  Future<void> choosePDF() async {
    final pickedFile = await picker.pickMedia();
    setState(() {
      if (pickedFile != null) {
        selectedImage = File(pickedFile.path);
        uploadResumeHandler(selectedImage!);
      } else {
        debugPrint('No image selected.');
      }
    });
  }
// ramreq
  Future uploadImageHandler(File file) async {
    setState(() {
      isLoading = true;
    });

    dio.Response response = await Services.updateProfilePhoto(file);
    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        Fluttertoast.showToast(msg: response.data['data']['message']);
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  Future uploadResumeHandler(File file) async {
    setState(() {
      isLoading = true;
    });

    dio.Response response = await Services.uploadResume(file);
    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        Fluttertoast.showToast(msg: response.data['data']['message']);
        Get.back();
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  Future languageHandler() async {
    setState(() {
      isLoading = true;
    });

    dio.Response response = await Services.getLanguages();
    if (response.statusCode == 200) {
      setState(() {
        if (response.data['data'] != null) {
          response.data['data']
              .forEach((v) => languages.add(LanguageModel.fromJson(v)));
        }
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  Future statesHandler() async {
    setState(() {
      isLoading = true;
    });

    dio.Response response = await Services.getStates();
    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        response.data['data']
            .forEach((v) => states.add(StateModel.fromJson(v)));
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  Future citiesHandler(int stateId) async {
    setState(() {
      isLoading = true;
    });

    cities.clear();

    dio.Response response = await Services.getCities();
    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        response.data['data'].forEach((v) {
          setState(() {
            if (v['state_id'] == stateId) {
              cities.add(CityModel.fromJson(v));
            }
          });
        });
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  Widget cityList() {
    return DropdownMenu(
      textStyle: GoogleFonts.inter(
        color: white,
        fontSize: kFourteenFont,
        fontWeight: kFW500,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: white),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      width: MediaQuery.of(context).size.width - 30,
      initialSelection: cities[0],
      controller: cityController,
      dropdownMenuEntries: cities.map((language) {
        return DropdownMenuEntry(
          value: language.id,
          label: language.name!,
        );
      }).toList(),
      onSelected: (value) {
        setState(() {
          debugPrint(value.toString());
          cityId = int.parse(value.toString());
          // FocusManager.instance.primaryFocus?.unfocus();
        });
      },
    );
  }

  Future updateProfileHandler(UpdateProfileModel updateProfileModel) async {
    setState(() {
      isLoading = true;
    });

    dio.Response response = await Services.updateProfile(updateProfileModel);
    if (response.statusCode == 200) {
      if (response.data['data'] != null) {
        Fluttertoast.showToast(msg: response.data['data']["message"]);
      }
    } else {
      Fluttertoast.showToast(msg: response.statusMessage.toString());
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    languageHandler();
    fillFormFields();
    statesHandler();
  }

  fillFormFields() {
    if (widget.profileData["CandidateDetails"] != null) {
      firstNameController.text =
          widget.profileData["CandidateDetails"]["user"]["name"];
      lastNameController.text =
          widget.profileData["CandidateDetails"]["user"]["last_name"] ?? "";
      mobileNumberController.text =
          widget.profileData["CandidateDetails"]["user"]["phone"] ?? "";
      currentSalaryController.text = widget.profileData["CandidateDetails"]
                  ["current_sal"] ==
              null
          ? ""
          : widget.profileData["CandidateDetails"]["current_sal"].toString() ??
              "";
      expectedSalaryController.text = widget.profileData["CandidateDetails"]
                  ["expected_sal"] ==
              null
          ? ""
          : widget.profileData["CandidateDetails"]["expected_sal"].toString();
      "";

      stateController.text =
          widget.profileData["CandidateDetails"]["user"]["state"] != null
              ? widget.profileData["CandidateDetails"]["user"]["state"]["name"]
              : "";
      stateId = widget.profileData["CandidateDetails"]["user"]["state"] != null
          ? widget.profileData["CandidateDetails"]["user"]["state"]["id"]
          : 0;
      cityId = widget.profileData["CandidateDetails"]["user"]["city"] != null
          ? widget.profileData["CandidateDetails"]["user"]["city"]["id"]
          : 0;
      cityController.text =
          widget.profileData["CandidateDetails"]["user"]["city"] != null
              ? widget.profileData["CandidateDetails"]["user"]["city"]["name"]
              : "-";
      languageController.text =
          widget.profileData["CandidateDetails"]["languages"].length > 0
              ? widget.profileData["CandidateDetails"]["languages"][0]["title"]
              : "";
      genderId =
          widget.profileData["CandidateDetails"]["user"]["gender"] != null
              ? widget.profileData["CandidateDetails"]["user"]["gender"]["id"]
              : 0;
      maritalStatusId = widget.profileData["CandidateDetails"]["user"]
                  ["marriage_status"] !=
              null
          ? widget.profileData["CandidateDetails"]["user"]["marriage_status"]
              ["id"]
          : 0;

      stateController.text =
          widget.profileData["CandidateDetails"]["user"]["state"] != null
              ? widget.profileData["CandidateDetails"]["user"]["state"]["name"]
              : "";

      dOBController.text = widget.profileData["CandidateDetails"]["dob"] != null
          ? DateFormat('yyyy-MMM-dd').format(DateTime.parse(
              widget.profileData["CandidateDetails"]["dob"].toString()))
          : "";

      yourselfController.text =
          widget.profileData["CandidateDetails"]["bio"] == null
              ? ""
              : widget.profileData["CandidateDetails"]["bio"];
      "";

      //   fbController.text = widget.profileData["CandidateDetails"]
      //               ["candidate_links"][0]["url"] ==
      //           null
      //       ? ""
      //       : widget.profileData["CandidateDetails"]["candidate_links"][0]["url"];
      //   "";
      // }
      if (widget.profileData["CandidateDetails"]["candidate_links"].length >
          0) {
        fbController.text = widget.profileData["CandidateDetails"]
                    ["candidate_links"][0]["url"] ==
                null
            ? ""
            : widget.profileData["CandidateDetails"]["candidate_links"][0]
                ["url"];
        "";
      } else {
        fbController.text = "";
      }
    }
  }

//"state_id"
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Gold,
            ),
          )
        : SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10.h),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Center(
                          child: Container(
                            alignment: Alignment.center,
                            height: 130,
                            width: 130,
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: ClipOval(
                              child: selectedImage != null
                                  ? Image.file(
                                      selectedImage!,
                                      fit: BoxFit.cover,
                                      height: 130,
                                      width: 130,
                                    )
                                  : const CircleAvatar(
                                      radius: 65,
                                      child: Icon(
                                        Icons.person_outline_rounded,
                                        size: 50,
                                        color: white,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 70.h,
                          left: 205.r,
                          child: InkWell(
                            onTap: () {
                              chooseImage("Gallery");
                            },
                            child: Image.asset(
                              'assets/images/photo.png',
                              width: 32.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "Basic Info",
                      style: GoogleFonts.gothicA1(
                        fontSize: kSixteenFont,
                        color: whitetwo,
                        fontWeight: kFW600,
                      ),
                    ),

                    SizedBox(height: 15.h),
                    CustomTextFormField(
                      controller: firstNameController,
                      hintText: "Enter First Name",
                      isMandatory: false,
                      label: 'First Name',
                      readOnly: false,
                      onChanged: (String value) {},
                    ),
                    SizedBox(height: 15.h),
                    CustomTextFormField(
                      controller: lastNameController,
                      hintText: "Enter Last Name",
                      isMandatory: false,
                      label: 'Last Name',
                      readOnly: false,
                      onChanged: (String value) {},
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      controller: dOBController,
                      hintText: "Select Date of Birth",
                      isMandatory: false,
                      label: 'Date of Birth',
                      readOnly: true,
                      suffix: InkWell(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: const ColorScheme.light(
                                    background: white,
                                    primary: Colors.grey,
                                    onPrimary: white,
                                    onSurface: Colors.black,
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                        // primary: Colors.black,
                                        ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );

                          if (pickedDate != null) {
                            debugPrint(pickedDate.toString());
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            debugPrint(formattedDate);
                            setState(() {
                              dOBController.text = formattedDate;
                            });
                          } else {
                            debugPrint("Date is not selected");
                          }
                        },
                        child: Icon(
                          Icons.calendar_month,
                          size: 20.w,
                          color: Gold,
                        ),
                      ),
                    ),

                    SizedBox(height: 15.h),
                    Text(
                      "Gender",
                      style: GoogleFonts.inter(
                        color: white,
                        fontSize: kFourteenFont,
                        fontWeight: kFW500,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        selectedgender == "1"
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedgender = "1";
                                  });
                                },
                                child: GlassmorphicContainer(
                                  // height: 210.h,
                                  height: 39.h,
                                  width: 96.w,
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
                                          padding: EdgeInsets.only(
                                              left: 15.w, right: 15.w),
                                          //  padding: EdgeInsets.all(15.r),
                                          decoration: BoxDecoration(
                                            border: const GradientBoxBorder(
                                              gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    kBackground,
                                                    kBackground,
                                                    kBackground,
                                                    Gold
                                                  ]),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Male",
                                                style: GoogleFonts.gothicA1(
                                                  fontSize: kFourteenFont,
                                                  color: Gold,
                                                  fontWeight: kFW700,
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: 15.h,
                                              // ),

                                              // SizedBox(
                                              //   height: 15.h,
                                              // ),

                                              // SizedBox(height: 15.h),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedgender = "1";
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 39.h,
                                  width: 96.w,
                                  child: Text(
                                    "Male",
                                    style: GoogleFonts.gothicA1(
                                      fontSize: 11.sp,
                                      color: whitetwo,
                                      fontWeight: kFW500,
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(width: 20.w),
                        selectedgender == "2"
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedgender = "2";
                                  });
                                },
                                child: GlassmorphicContainer(
                                  // height: 210.h,
                                  height: 39.h,
                                  width: 96.w,
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
                                          padding: EdgeInsets.only(
                                              left: 15.w, right: 15.w),
                                          //  padding: EdgeInsets.all(15.r),
                                          decoration: BoxDecoration(
                                            border: const GradientBoxBorder(
                                              gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    kBackground,
                                                    kBackground,
                                                    kBackground,
                                                    Gold
                                                  ]),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Female",
                                                style: GoogleFonts.gothicA1(
                                                  fontSize: kFourteenFont,
                                                  color: Gold,
                                                  fontWeight: kFW700,
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: 15.h,
                                              // ),

                                              // SizedBox(
                                              //   height: 15.h,
                                              // ),

                                              // SizedBox(height: 15.h),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedgender = "2";
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 39.h,
                                  width: 96.w,
                                  child: Text(
                                    "Female",
                                    style: GoogleFonts.gothicA1(
                                      fontSize: 11.sp,
                                      color: whitetwo,
                                      fontWeight: kFW500,
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(width: 20.w),
                        selectedgender == "3"
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedgender = "3";
                                  });
                                },
                                child: GlassmorphicContainer(
                                  // height: 210.h,
                                  height: 39.h,
                                  width: 96.w,
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
                                          padding: EdgeInsets.only(
                                              left: 15.w, right: 15.w),
                                          //  padding: EdgeInsets.all(15.r),
                                          decoration: BoxDecoration(
                                            border: const GradientBoxBorder(
                                              gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    kBackground,
                                                    kBackground,
                                                    kBackground,
                                                    Gold
                                                  ]),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Other",
                                                style: GoogleFonts.gothicA1(
                                                  fontSize: kFourteenFont,
                                                  color: Gold,
                                                  fontWeight: kFW700,
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: 15.h,
                                              // ),

                                              // SizedBox(
                                              //   height: 15.h,
                                              // ),

                                              // SizedBox(height: 15.h),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedgender = "3";
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 39.h,
                                  width: 96.w,
                                  child: Text(
                                    "Other",
                                    style: GoogleFonts.gothicA1(
                                      fontSize: 11.sp,
                                      color: whitetwo,
                                      fontWeight: kFW500,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),

                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: RadioListTile(
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(10)),
                    //         activeColor: white,
                    //         title: Text(
                    //           "Male",
                    //           style: GoogleFonts.inter(
                    //             color: white,
                    //             fontSize: kFourteenFont,
                    //             fontWeight: kFW500,
                    //           ),
                    //         ),
                    //         value: 1,
                    //         groupValue: genderId,
                    //         onChanged: (value) {
                    //           setState(() {
                    //             genderId = value;
                    //           });
                    //         },
                    //       ),
                    //     ),
                    //     SizedBox(width: 10.w),
                    //     Expanded(
                    //       child: RadioListTile(
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(10)),
                    //         activeColor: white,
                    //         title: Text(
                    //           "Female",
                    //           style: GoogleFonts.inter(
                    //             color: white,
                    //             fontSize: kFourteenFont,
                    //             fontWeight: kFW500,
                    //           ),
                    //         ),
                    //         value: 2,
                    //         groupValue: genderId,
                    //         onChanged: (value) {
                    //           setState(() {
                    //             genderId = value;
                    //           });
                    //         },
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    SizedBox(height: 15.h),
                    Text(
                      "Marital Status",
                      style: GoogleFonts.inter(
                        color: white,
                        fontSize: kFourteenFont,
                        fontWeight: kFW500,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        selectedstatus == "1"
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedstatus = "1";
                                  });
                                },
                                child: GlassmorphicContainer(
                                  // height: 210.h,
                                  height: 39.h,
                                  width: 96.w,
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
                                          padding: EdgeInsets.only(
                                              left: 15.w, right: 15.w),
                                          //  padding: EdgeInsets.all(15.r),
                                          decoration: BoxDecoration(
                                            border: const GradientBoxBorder(
                                              gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    kBackground,
                                                    kBackground,
                                                    kBackground,
                                                    Gold
                                                  ]),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Single",
                                                style: GoogleFonts.gothicA1(
                                                  fontSize: kFourteenFont,
                                                  color: Gold,
                                                  fontWeight: kFW700,
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: 15.h,
                                              // ),

                                              // SizedBox(
                                              //   height: 15.h,
                                              // ),

                                              // SizedBox(height: 15.h),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedstatus = "1";
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 39.h,
                                  width: 96.w,
                                  child: Text(
                                    "Single",
                                    style: GoogleFonts.gothicA1(
                                      fontSize: 11.sp,
                                      color: whitetwo,
                                      fontWeight: kFW500,
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(width: 20.w),
                        selectedstatus == "2"
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedstatus = "2";
                                  });
                                },
                                child: GlassmorphicContainer(
                                  // height: 210.h,
                                  height: 39.h,
                                  width: 96.w,
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
                                          padding: EdgeInsets.only(
                                              left: 14.w, right: 14.w),
                                          //  padding: EdgeInsets.all(15.r),
                                          decoration: BoxDecoration(
                                            border: const GradientBoxBorder(
                                              gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  colors: [
                                                    kBackground,
                                                    kBackground,
                                                    kBackground,
                                                    Gold
                                                  ]),
                                              width: 0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Married",
                                                style: GoogleFonts.gothicA1(
                                                  fontSize: 13.sp,
                                                  color: Gold,
                                                  fontWeight: kFW700,
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: 15.h,
                                              // ),

                                              // SizedBox(
                                              //   height: 15.h,
                                              // ),

                                              // SizedBox(height: 15.h),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedstatus = "2";
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 39.h,
                                  width: 96.w,
                                  child: Text(
                                    "Married",
                                    style: GoogleFonts.gothicA1(
                                      fontSize: 11.sp,
                                      color: whitetwo,
                                      fontWeight: kFW500,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),

                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: RadioListTile(
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(10)),
                    //         activeColor: white,
                    //         title: Text(
                    //           "Married",
                    //           style: GoogleFonts.inter(
                    //             color: white,
                    //             fontSize: kFourteenFont,
                    //             fontWeight: kFW500,
                    //           ),
                    //         ),
                    //         value: 1,
                    //         groupValue: maritalStatusId,
                    //         onChanged: (value) {
                    //           setState(() {
                    //             maritalStatusId = value;
                    //           });
                    //         },
                    //       ),
                    //     ),
                    //     SizedBox(width: 10.w),
                    //     Expanded(
                    //       child: RadioListTile(
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(10)),
                    //         activeColor: white,
                    //         title: Text(
                    //           "Unmarried",
                    //           style: GoogleFonts.inter(
                    //             color: white,
                    //             fontSize: kFourteenFont,
                    //             fontWeight: kFW500,
                    //           ),
                    //         ),
                    //         value: 2,
                    //         groupValue: maritalStatusId,
                    //         onChanged: (value) {
                    //           setState(() {
                    //             maritalStatusId = value;
                    //           });
                    //         },
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 15.h),
                    Text(
                      "Language",
                      style: GoogleFonts.inter(
                        color: white,
                        fontSize: kFourteenFont,
                        fontWeight: kFW500,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    editLanguage == false
                        ? languageController.text == ""
                            ? languages.isNotEmpty
                                ? DropdownMenu(
                                    textStyle: GoogleFonts.inter(
                                      color: white,
                                      fontSize: kFourteenFont,
                                      fontWeight: kFW500,
                                    ),
                                    inputDecorationTheme: InputDecorationTheme(
                                      border: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: white),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: white),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width - 30,
                                    initialSelection: languageController.text,
                                    dropdownMenuEntries:
                                        languages.map((language) {
                                      return DropdownMenuEntry(
                                        value: language.id,
                                        label: language.title!,
                                      );
                                    }).toList(),
                                    onSelected: (value) {
                                      setState(() {
                                        debugPrint(value.toString());
                                        languageId =
                                            int.parse(value.toString());
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      });
                                    },
                                  )
                                : const SizedBox()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                    Text(
                                      languageController.text,
                                      style: GoogleFonts.inter(
                                        color: white,
                                        fontSize: kFourteenFont,
                                        fontWeight: kFW500,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            languageHandler();
                                            editLanguage = true;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          size: 20.sp,
                                          color: Gold,
                                        ))
                                  ])
                        : DropdownMenu(
                            textStyle: GoogleFonts.inter(
                              color: white,
                              fontSize: kFourteenFont,
                              fontWeight: kFW500,
                            ),
                            inputDecorationTheme: InputDecorationTheme(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width - 30,
                            initialSelection: languageController.text,
                            dropdownMenuEntries: languages.map((language) {
                              return DropdownMenuEntry(
                                value: language.id,
                                label: language.title!,
                              );
                            }).toList(),
                            onSelected: (value) {
                              setState(() {
                                debugPrint(value.toString());
                                languageId = int.parse(value.toString());
                                FocusManager.instance.primaryFocus?.unfocus();
                              });
                            },
                          ),
                    SizedBox(height: 15.h),
                    Text(
                      "State",
                      style: GoogleFonts.inter(
                        color: white,
                        fontSize: kFourteenFont,
                        fontWeight: kFW500,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    editState == false
                        ? stateController.text == ""
                            ? states.isNotEmpty
                                ? DropdownMenu(
                                    textStyle: GoogleFonts.inter(
                                      color: white,
                                      fontSize: kFourteenFont,
                                      fontWeight: kFW500,
                                    ),
                                    inputDecorationTheme: InputDecorationTheme(
                                      border: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: white),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: white),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    width:
                                        MediaQuery.of(context).size.width - 30,
                                    initialSelection:
                                        selectedState ?? states[0],
                                    dropdownMenuEntries: states.map((language) {
                                      return DropdownMenuEntry(
                                        value: language.id,
                                        label: language.name!,
                                      );
                                    }).toList(),
                                    onSelected: (value) async {
                                      debugPrint(value.toString());
                                      setState(() {
                                        selectedState = value;
                                      });
                                      stateId = int.parse(value.toString());
                                      await citiesHandler(
                                              int.parse(value.toString()))
                                          .then((value) {
                                        setState(() {
                                          isStateSelected = true;
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        });
                                      });
                                    },
                                  )
                                : const SizedBox()
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                    Text(
                                      stateController.text,
                                      style: GoogleFonts.inter(
                                        color: white,
                                        fontSize: kFourteenFont,
                                        fontWeight: kFW500,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            editState = true;
                                            statesHandler();
                                          });
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          size: 20.sp,
                                          color: Gold,
                                        ))
                                  ])
                        : DropdownMenu(
                            textStyle: GoogleFonts.inter(
                              color: white,
                              fontSize: kFourteenFont,
                              fontWeight: kFW500,
                            ),
                            inputDecorationTheme: InputDecorationTheme(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width - 30,
                            initialSelection: selectedState ?? states[0],
                            dropdownMenuEntries: states.map((language) {
                              return DropdownMenuEntry(
                                value: language.id,
                                label: language.name!,
                              );
                            }).toList(),
                            onSelected: (value) async {
                              debugPrint(value.toString());
                              setState(() {
                                selectedState = value;
                              });
                              stateId = int.parse(value.toString());
                              await citiesHandler(int.parse(value.toString()))
                                  .then((value) {
                                setState(() {
                                  isStateSelected = true;
                                  FocusManager.instance.primaryFocus?.unfocus();
                                });
                              });
                            },
                          ),
                    SizedBox(height: 15.h),
                    Text(
                      "City",
                      style: GoogleFonts.inter(
                        color: white,
                        fontSize: kFourteenFont,
                        fontWeight: kFW500,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    editState == false
                        ? cityController.text == ""
                            ? cities.isNotEmpty
                                ? cityList()
                                : Text(
                                    "No cities to display",
                                    style: GoogleFonts.inter(
                                      color: white,
                                      fontSize: kFourteenFont,
                                      fontWeight: kFW500,
                                    ),
                                  )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                    Text(
                                      cityController.text,
                                      style: GoogleFonts.inter(
                                        color: white,
                                        fontSize: kFourteenFont,
                                        fontWeight: kFW500,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.edit,
                                          size: 20.sp,
                                          color: Gold,
                                        ))
                                  ])
                        : cityList(),
                    SizedBox(height: 15.h),
                    Text(
                      "Contact Details",
                      style: GoogleFonts.gothicA1(
                        fontSize: kSixteenFont,
                        color: whitetwo,
                        fontWeight: kFW600,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    CustomTextFormField(
                      controller: mobileNumberController,
                      keyboardType: TextInputType.phone,
                      hintText: "Enter Mobile Number",
                      isMandatory: false,
                      label: 'Mobile Number',
                      readOnly: false,
                      onChanged: (String value) {},
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "Salary Info",
                      style: GoogleFonts.gothicA1(
                        fontSize: kSixteenFont,
                        color: whitetwo,
                        fontWeight: kFW600,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      controller: currentSalaryController,
                      keyboardType: TextInputType.number,
                      hintText: "Enter Current Salary",
                      isMandatory: false,
                      label: 'Current Salary (CTC in Lakhs)',
                      readOnly: false,
                      onChanged: (String value) {},
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      controller: expectedSalaryController,
                      keyboardType: TextInputType.number,
                      hintText: "Enter Expected Salary",
                      isMandatory: false,
                      label: 'Expected Salary (CTC in Lakhs)',
                      readOnly: false,
                      onChanged: (String value) {},
                    ),
                    SizedBox(
                      height: 15.h,
                    ),

                    Text(
                      "Custom Action",
                      style: GoogleFonts.gothicA1(
                        fontSize: kSixteenFont,
                        color: whitetwo,
                        fontWeight: kFW600,
                      ),
                    ),
                    // SizedBox(
                    //   height: 15.h,
                    // ),
                    CustomTextFormField(
                      controller: fbController,
                      keyboardType: TextInputType.text,
                      hintText: "www.facebook.com",
                      isMandatory: false,
                      label: '',
                      readOnly: false,
                      onChanged: (String value) {},
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "+ Add Links",
                        style: GoogleFonts.gothicA1(
                          fontSize: kFourteenFont,
                          color: Gold,
                          fontWeight: kFW600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextFormField(
                      maxLines: 5,
                      controller: yourselfController,
                      keyboardType: TextInputType.text,
                      hintText:
                          "Tell us about yourself and what makes you stand out.",
                      isMandatory: false,
                      label: '',
                      readOnly: false,
                      onChanged: (String value) {},
                    ),

                    // SizedBox(height: 15.h),
                    // CustomTextFormField(
                    //   controller: facebookController,
                    //   hintText: "facebook",
                    //   isMandatory: false,
                    //   label: 'facebook',
                    //   readOnly: false,
                    //   onChanged: (String value) {},
                    // ),
                    // SizedBox(height: 15.h),
                    // CustomTextFormField(
                    //   controller: passportController,
                    //   hintText: "passport",
                    //   isMandatory: false,
                    //   label: 'passport',
                    //   readOnly: false,
                    //   onChanged: (String value) {},
                    // ),
                    // SizedBox(height: 10.h),
                    // CustomTextFormField(
                    //   controller: twitterController,
                    //   hintText: "twitter",
                    //   isMandatory: false,
                    //   label: 'twitter',
                    //   readOnly: false,
                    //   onChanged: (String value) {},
                    // ),

                    SizedBox(height: 30.h),

                    CustomProfileButton(
                      label: widget.profileData["CandidateDetails"]
                                  ["resume_name"] !=
                              null
                          ? 'Update Resume'
                          : 'Upload Resume',
                      isLoading: true,
                      onTap: () {
                        choosePDF();
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.profileData["CandidateDetails"]["resume_name"],
                          style: GoogleFonts.inter(
                            color: white,
                            fontSize: kFourteenFont,
                            fontWeight: kFW500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final Directory appDocumentsDir =
                                await getTemporaryDirectory();

                            // FileDownloader.downloadFile(
                            //     url:
                            //         "https://bossjobs.co.in/dev/candidate_images/" +
                            //             widget.profileData["CandidateDetails"]
                            //                 ["resume"],
                            //     //  name: "ram api resume",
                            //     name: widget.profileData["CandidateDetails"]
                            //         ["resume_name"],
                            //     onDownloadCompleted: (path) {
                            //       final File file = File(path);
                            //       Fluttertoast.showToast(
                            //         msg: "Downloaded Successfully",
                            //       );
                            //       debugPrint("DONE");
                            //     });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.download,
                                size: 20.sp,
                                color: Gold,
                              ),
                              Text("Download",
                                  style: GoogleFonts.inter(
                                      color: Gold,
                                      fontSize: kTenFont,
                                      fontWeight: kFW500)),
                            ],
                          ),
                        )
                      ],
                    ),

                    SizedBox(height: 30.h),
                    CustomProfileButton(
                      label: 'Upadate',
                      isLoading: true,
                      onTap: () async {
                        if (selectedImage != null) {
                          uploadImageHandler(selectedImage!);
                        }
                        if (_formKey.currentState!.validate()) {
                          UpdateProfileModel updateProfileModel =
                              UpdateProfileModel(
                            firstName: firstNameController.text.trim(),
                            lastName: lastNameController.text.trim(),
                            phone: mobileNumberController.text,
                            dob: dOBController.text,
                            genderId: selectedgender,
                            //  genderId: genderId.toString(),  //selectedstatus
                            //  marriageStatusId: maritalStatusId.toString(),
                            marriageStatusId: selectedstatus,
                            currentSal:
                                double.parse(currentSalaryController.text),
                            expectedSal:
                                double.parse(expectedSalaryController.text),
                            languages: languageId != null ? [languageId!] : [],
                            stateId: stateId,
                            cityId: cityId,
                            bio: yourselfController.text,

                            // lookingFor: "",
                            facebook: fbController.text,
                            // twitter: "",
                            // linkedin: "",
                            // passport: "",
                          );
                          await updateProfileHandler(updateProfileModel);
                          Get.back();
                        }
                      },
                    ),
                    SizedBox(height: 30.h)
                  ],
                ),
              ),
            ),
          );
  }
}

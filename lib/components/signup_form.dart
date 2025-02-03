// ignore_for_file: camel_case_types, non_constant_identifier_names

import '../utils/export_file.dart';

class Signup_form extends StatefulWidget {
  const Signup_form({super.key});

  @override
  State<Signup_form> createState() => _SignupformState();
}

class Registerdata {
  String fristname = '';
  // String lastname = '';
  String email = '';
  String mobile = '';
  String password = '';
  String cpassword = '';
}

class _SignupformState extends State<Signup_form> {
  List Roles = [
    {
      "name": "Learner",
    },
    {
      "name": "Coach",
    },
    {
      "name": "Institute",
    },
    {
      "name": "Company",
    },
    {
      "name": "Placement Officer",
    },
    {
      "name": "Counseller",
    },
  ];
  List<int> selectedIndex = [];
  List<Map> requirements =[];
//  List<int> selectedIndexList = <int>[];
  int? selectedItemid;
  List<int> selectedIndexList = <int>[];
  TextEditingController fristname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController Mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController Conform_password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Registerdata data = Registerdata();
  bool isLoading = false;
  Future RegisterHandler() async {
    setState(() {
      isLoading = true;
    });
    Map payload = {
      "full_name": data.fristname,
      "email": data.email,
      "phone": data.mobile,
      "password": data.password,
      "cpassword": data.cpassword,
      "requirement": requirements
      ///////////////////////
      //   "requirement": [
      //   {
      //     "id": 1,
      //     "value": "learner",
      //     "description": "Learner",
      //     "label": 2,
      //     "active": true
      //   },
      //   {
      //     "id": 2,
      //     "value": "coach",
      //     "description": "Coach",
      //     "label": 2,
      //     "active": true
      //   },
      //   {
      //     "id": 3,
      //     "value": "institute",
      //     "description": "Institute",
      //     "label": 2,
      //     "active": true
      //   },
      //   {
      //     "id": 4,
      //     "value": "company",
      //     "description": "Company",
      //     "label": 2,
      //     "active": true
      //   }
      // ]
      ////////////////////////
    };
    // {
    //   "first_name": data.fristname,
    //   //"last_name": data.lastname,
    //   "email": data.email,
    //   "phone": data.mobile,
    //   "password": data.password,
    //   "cpassword": data.cpassword,
    //   "requirement": [
    //     {"id": 1, "value": "learner", "description": "Learner", "active": true},
    //   ],
    // };

    Map value = await Services.createAccount(payload);
    print(value);
    // if (value["message"] != null) {
    //   Fluttertoast.showToast(msg: value["message"]);
    // } else {
    //   await UserSimplePreferences.setLoginStatus(loginStatus: true);
    //   await UserSimplePreferences.setUserdata(
    //       userData: json.encode(value["user_details"]));
    //   await UserSimplePreferences.setToken(token: value["token"]);
    //   Get.toNamed(KLogin);
    // }

    if (value["data"]["message"] != null) {
      Fluttertoast.showToast(msg: value["data"]["message"]);
      Get.toNamed(KLogin);
    } else {
      // await UserSimplePreferences.setToken(token: value["token"]);
      Get.toNamed(KLogin);
      print(value);
    }

    setState(() {
      isLoading = false;
    });
  }

  bool _obscureText = true;

  late String _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();

    //RegisterHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(10.r),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100.h,
            ),
            Text(
              'Sign Up',
              style: GoogleFonts.gothicA1(
                  fontSize: kTwentyFourFont, color: white, fontWeight: kFW700),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text("Frist Name",
                style: GoogleFonts.inter(
                    color: white, fontSize: kTwelveFont, fontWeight: kFW500)),
            SizedBox(height: 5.h),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  gradient: LinearGradient(colors: [
                    grey..withOpacity(0.2),
                    grey1.withOpacity(0.2),
                    Colors.black.withOpacity(0.3)
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
              child: TextFormField(
                style: GoogleFonts.inter(
                    color: white, fontSize: kTwelveFont, fontWeight: kFW500),
                // maxLength: 8,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
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
                  hintText: "frist-name",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onChanged: (String value) {
                  data.fristname = value;
                },
                onTap: () {
                  // Get.toNamed(KSearch);
                },
              ),
            ),
            // SizedBox(
            //   height: 13.h,
            // ),
            // Text("last Name",
            //     style: GoogleFonts.inter(
            //         color: white, fontSize: kTwelveFont, fontWeight: kFW500)),
            // SizedBox(height: 5.h),
            // Container(
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10.r),
            //       gradient: LinearGradient(colors: [
            //         grey..withOpacity(0.2),
            //         grey1.withOpacity(0.2),
            //         Colors.black.withOpacity(0.3)
            //       ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
            //   child: TextFormField(
            //     style: GoogleFonts.inter(
            //         color: white, fontSize: kTwelveFont, fontWeight: kFW500),
            //     // maxLength: 8,
            //     decoration: InputDecoration(
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
            //       hintText: "last-name",
            //     ),
            //     validator: (value) {
            //       if (value!.isEmpty) {
            //         return 'Please enter some text';
            //       }
            //       return null;
            //     },
            //     onChanged: (String value) {
            //       data.lastname = value;
            //     },
            //     onTap: () {
            //       // Get.toNamed(KSearch);
            //     },
            //   ),
            // ),
            SizedBox(
              height: 13.h,
            ),
            Text("Email Id",
                style: GoogleFonts.inter(
                    color: white, fontSize: kTwelveFont, fontWeight: kFW500)),
            SizedBox(height: 5.h),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  gradient: LinearGradient(colors: [
                    grey..withOpacity(0.2),
                    grey1.withOpacity(0.2),
                    Colors.black.withOpacity(0.3)
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
              child: TextFormField(
                style: GoogleFonts.inter(
                    color: white, fontSize: kTwelveFont, fontWeight: kFW500),
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
                  hintText: "email@gmail.com",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onChanged: (String value) {
                  data.email = value;
                },
                onTap: () {
                  // Get.toNamed(KSearch);
                },
              ),
            ),
            SizedBox(height: 13.h),
            Text("Mobile No",
                style: GoogleFonts.inter(
                    color: white, fontSize: kTwelveFont, fontWeight: kFW500)),
            SizedBox(height: 5.h),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  gradient: LinearGradient(colors: [
                    grey..withOpacity(0.2),
                    grey1.withOpacity(0.2),
                    Colors.black.withOpacity(0.3)
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: GoogleFonts.inter(
                    color: white, fontSize: kTwelveFont, fontWeight: kFW500),
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
                  hintText: "mobile no",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onChanged: (String value) {
                  data.mobile = value;
                },
                onTap: () {
                  // Get.toNamed(KSearch);
                },
              ),
            ),
            SizedBox(height: 13.h),
            Text("Password",
                style: GoogleFonts.inter(
                    color: white, fontSize: kTwelveFont, fontWeight: kFW500)),
            SizedBox(height: 5.h),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  gradient: LinearGradient(
                    colors: [
                      grey..withOpacity(0.2),
                      grey1.withOpacity(0.2),
                      Colors.black.withOpacity(0.3)
                    ],
                  )),
              child: TextFormField(
                style: GoogleFonts.inter(
                    color: white, fontSize: kTwelveFont, fontWeight: kFW500),
                // maxLength: 8,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                      onTap: _toggle,
                      child: _obscureText
                          ? const Icon(
                              Icons.visibility_off_outlined,
                              color: white,
                            )
                          : const Icon(
                              Icons.visibility_outlined,
                              color: white,
                            )),
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                  filled: true,
                  fillColor: white.withOpacity(0.08),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: grey1.withOpacity(0.2),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: grey1.withOpacity(0.2),
                    ),
                  ),
                  hintStyle: GoogleFonts.inter(
                      color: white.withOpacity(0.5),
                      fontSize: kFourteenFont,
                      fontWeight: kFW500),
                  hintText: "*************",
                ),

                validator: (value) {
                  value!.length < 6 ? 'Password too short.' : null;
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
                obscureText: _obscureText,
                onChanged: (String value) {
                  data.password = value;
                },
              ),
            ),
            SizedBox(height: 13.h),
            Text(" Confirm Password",
                style: GoogleFonts.inter(
                    color: white, fontSize: kTwelveFont, fontWeight: kFW500)),
            SizedBox(height: 5.h),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  gradient: LinearGradient(
                    colors: [
                      grey..withOpacity(0.2),
                      grey1.withOpacity(0.2),
                      Colors.black.withOpacity(0.3)
                    ],
                  )),
              child: TextFormField(
                style: GoogleFonts.inter(
                    color: white, fontSize: kTwelveFont, fontWeight: kFW500),
                // maxLength: 8,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                      onTap: _toggle,
                      child: _obscureText
                          ? const Icon(
                              Icons.visibility_off_outlined,
                              color: white,
                            )
                          : const Icon(
                              Icons.visibility_outlined,
                              color: white,
                            )),
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                  filled: true,
                  fillColor: white.withOpacity(0.08),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: grey1.withOpacity(0.2),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: grey1.withOpacity(0.2),
                    ),
                  ),
                  hintStyle: GoogleFonts.inter(
                      color: white.withOpacity(0.5),
                      fontSize: kFourteenFont,
                      fontWeight: kFW500),
                  hintText: "*************",
                ),

                validator: (value) {
                  value!.length < 6 ? 'Password too short.' : null;
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
                obscureText: _obscureText,
                onChanged: (String value) {
                  data.cpassword = value;
                },
              ),
            ),
            GridView.builder(
                shrinkWrap: true,
                //scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                //  itemCount: PropertyCategorylist.length,
                itemCount: Roles.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    childAspectRatio: (0.93 / 0.3)),
                // childAspectRatio: (1 / 0.5)),

                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                      if (!selectedIndexList.contains(index)) {
                        selectedIndexList.add(index);
                        requirements.add({"id": index+1, "value": Roles[index]["name"], "description": Roles[index]["name"], "active": true});
                      } else {
                        selectedIndexList.remove(index);
                        requirements = requirements.where((element) => element["id"]!=index+1).toList();
                      }
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                          // Border.all(color: Colors.blueAccent)
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(width: 1.5.w, color: Gold),
                          color: selectedIndexList.contains(index)
                              ? Gold
                              : kBackground.withOpacity(0.5)
                          // gradient: selectedIndexList.contains(index)
                          //     ? LinearGradient(
                          //         colors: [darkblue, Gold],
                          //         begin: Alignment.topLeft,
                          //         end: Alignment.bottomRight,
                          //       )
                          //     : const LinearGradient(
                          //         colors: [white, white],
                          //         begin: Alignment.topLeft,
                          //         end: Alignment.bottomRight,
                          ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            Roles[index]["name"],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.openSans(
                                fontSize: 13.sp,
                                color: selectedIndexList.contains(index)
                                    ? white
                                    : Gold,
                                fontWeight: FontWeight.w500),
                          ),

                          Icon(
                            Icons.done,
                            color: selectedIndexList.contains(index)
                                ? white
                                : kBackground.withOpacity(0.5),
                            size: 18.sp,
                          )
                        ],
                      ),
                    ),
                  );
                }),

            Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  //fillColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                  // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: true,
                  onChanged: (bool? value) {
                    setState(() {});
                  },
                ),
                Text("By Accepting this you agreed all the Terms & Conditions",
                    style: GoogleFonts.inter(
                        color: white, fontSize: 9.sp, fontWeight: kFW500)),
                        
              ],
            ),
            SizedBox(height: 15.h),
                                      GestureDetector(
                onTap: () {
                  Get.toNamed(KLogin);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have a account",
                      style: GoogleFonts.gothicA1(
                          fontSize: 11.sp, color: white, fontWeight: kFW400),
                    ),
                    Text(
                      "  Login",
                      style: GoogleFonts.gothicA1(
                          fontSize: 13.sp, color: white, fontWeight: kFW700),
                    ),
                  ],
                ),
              ),
            SizedBox(
              height: 50.h,
            ),
            CustomButton(
                label: "Sign Up",
                isLoading: true,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    RegisterHandler();
                  }
                }),
            SizedBox(
              height: 10.h,
            ),
            // Container(
            //   alignment: Alignment.center,
            //   child: Text(
            //     "or",
            //     style: GoogleFonts.gothicA1(
            //         fontSize: 11.sp, color: white, fontWeight: kFW700),
            //   ),
            // ),
            // SizedBox(
            //   height: 10.h,
            // ),
            // GestureDetector(
            //   onTap: () {
            //     Get.toNamed(KMobile_Screen);
            //   },
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         "login with ",
            //         style: GoogleFonts.gothicA1(
            //             fontSize: 11.sp, color: white, fontWeight: kFW400),
            //       ),
            //       Text(
            //         " Mob No",
            //         style: GoogleFonts.gothicA1(
            //             fontSize: 11.sp, color: white, fontWeight: kFW700),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 70.h,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: camel_case_types, unused_element, non_constant_identifier_names

import 'dart:convert';

import '../utils/export_file.dart';

class Login_form extends StatefulWidget {
  const Login_form({super.key});

  @override
  State<Login_form> createState() => _LoginformState();
}

// class LoginData {
//   String email = '';
//   String password = '';
// }

class _LoginformState extends State<Login_form> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Map userDetails = {};
  //LoginData data = LoginData();
  bool isLoading = false;

  Future LoginHandler() async {
    setState(() {
      isLoading = true;
    });
    Map payload = {
      "email": email.text,
      "password": password.text,
    };

    Map value = await Services.login(payload);
    //////////////////////////////////////////////////////////////////
    if (value["status"] == "1") {
      Fluttertoast.showToast(
        msg: value["message"],
      );
      print("value");
      print(value);
      await UserSimplePreferences.setUserdata(
          userData: json.encode(value["user_details"]));
      await UserSimplePreferences.setLoginStatus(loginStatus: true);
      await UserSimplePreferences.setToken(token: value["token"]);
      userDetails = jsonDecode(UserSimplePreferences.getUserdata().toString());
      Get.toNamed(kDashboard);
      // userDetails["default_login"] == "student"
      //     ? Get.toNamed(kDashboard)
      //     : Get.toNamed(KCoachDashboard);
    } else {
      Fluttertoast.showToast(
        msg: value["message"],
      );
    }
    //   // print(data);
    //   // await UserSimplePreferences.setUserdata(
    //   //     userData: json.encode(value["user_details"]));
    //   // await UserSimplePreferences.setLoginStatus(loginStatus: true);
    //   // await UserSimplePreferences.setToken(token: value["token"]);
    //   // await UserSimplePreferences.setRefreshToken(
    //   //     refreshToken: data["refresh"]);
    //   // Get.toNamed(kDashboard);
    // }
    /////////////////////////////////////////////////////////////////
    // print("value here");
    // print(value);

    // await UserSimplePreferences.setLoginStatus(loginStatus: true);
    // await value["user_details"];
    // await value["token"];
    // // await UserSimplePreferences.setUserdata(
    // //     userData: json.encode(value["user_details"]));
    // // await UserSimplePreferences.setToken(token: value["token"]);
    // Get.toNamed(kDashboard);

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
    LoginHandler();
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: kBackground,
            title: Text(
              'Are you sure?',
              style: GoogleFonts.outfit(
                  fontSize: kTwentyTwoFont, fontWeight: kFW600, color: white),
            ),
            content: Text(
              'Do you want to exit an App',
              style: GoogleFonts.outfit(
                  fontSize: kFourteenFont, fontWeight: kFW600, color: white),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.all(10.r),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 35.h,
              ),
              // GestureDetector(
              //   onTap: () {
              //     Get.back();
              //   },
              //   child: const Icon(
              //     Icons.arrow_back,
              //     color: white,
              //   ),
              // ),
              SizedBox(
                height: 100.h,
              ),
              Text(
                'Welcome',
                style: GoogleFonts.gothicA1(
                    fontSize: kTwentyFourFont,
                    color: white,
                    fontWeight: kFW700),
              ),
              Text(
                "Lest's sign you in.",
                style: GoogleFonts.gothicA1(
                    fontSize: 10.sp, color: white, fontWeight: kFW700),
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomFormField(
                  readOnly: false,
                  label: "Email",
                  isMandatory: true,
                  controller: email,
                  
                  hintText: "Email"),
              SizedBox(
                height: 20.h,
              ),
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
                  controller: password,
                  onSaved: (value) => _password = value!,
                  obscureText: _obscureText,
                ),
              ),
              // CustomFormField(
              //     readOnly: false,
              //     label: "Password",
              //     isMandatory: true,
              //     controller: password,
              //     hintText: "Password",
              //     isObscureText: true),
              SizedBox(height: 13.h),
              GestureDetector(
                onTap: () {
                  Get.toNamed(KForgot);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 5.h),
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forget Password?',
                    style: GoogleFonts.gothicA1(
                        fontSize: 10.sp, color: white, fontWeight: kFW700),
                  ),
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(KSignup);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have any account?",
                      style: GoogleFonts.gothicA1(
                          fontSize: 11.sp, color: white, fontWeight: kFW400),
                    ),
                    Text(
                      " Signup now",
                      style: GoogleFonts.gothicA1(
                          fontSize: 11.sp, color: white, fontWeight: kFW700),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                  label: "Login",
                  isLoading: true,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      LoginHandler();
                    }
                  }),
              // SizedBox(
              //   height: 10.h,
              // ),
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Image.asset(
              //       'assets/images/goggle.png',
              //       width: 45.w,
              //     ),
              //     SizedBox(
              //       width: 15.w,
              //     ),
              //     Image.asset(
              //       'assets/images/fb.png',
              //       width: 45.w,
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}

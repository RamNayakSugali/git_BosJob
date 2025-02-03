import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/export_file.dart';
import '../utils/export_file.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  TextEditingController gmail = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  //LoginData data = LoginData();
  bool isLoading = false;

  Future forgotHandler() async {
    setState(() {
      isLoading = true;
    });
    Map payload = {
      "email": gmail.text,
    };

    Map value = await Services.forgotPassword(payload);
    //////////////////////////////////////////////////////////////////
    if (value["data"]["status"] == "1") {
      Fluttertoast.showToast(
        msg: value["data"]["message"],
      );
      ;
      Get.toNamed(KLogin);
    } else {
      Fluttertoast.showToast(
        msg: value["data"]["message"],
      );
      Get.toNamed(KLogin);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/otp.png',
                  // width: double.infinity,
                  // fit: BoxFit.cover,
                ),
                // const Login_form(),
                Container(
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
                          'Forgot Password',
                          style: GoogleFonts.gothicA1(
                              fontSize: kTwentyFourFont,
                              color: white,
                              fontWeight: kFW700),
                        ),

                        SizedBox(
                          height: 30.h,
                        ),
                        CustomFormField(
                            readOnly: false,
                            label: "Email",
                            isMandatory: true,
                            controller: gmail,
                            hintText: "Email"),

                        // CustomFormField(
                        //     readOnly: false,
                        //     label: "Password",
                        //     isMandatory: true,
                        //     controller: password,
                        //     hintText: "Password",
                        //     isObscureText: true),
                        SizedBox(height: 13.h),

                        SizedBox(
                          height: 100.h,
                        ),

                        SizedBox(
                          height: 10.h,
                        ),
                        CustomButton(
                            label: "Reset",
                            isLoading: true,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                forgotHandler();
                              }
                            }),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "or",
                            style: GoogleFonts.gothicA1(
                                fontSize: 11.sp,
                                color: white,
                                fontWeight: kFW700),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(KLogin);
                          },
                          child: Center(
                            child: Text(
                              "Login",
                              style: GoogleFonts.gothicA1(
                                  fontSize: 11.sp,
                                  color: white,
                                  fontWeight: kFW700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}

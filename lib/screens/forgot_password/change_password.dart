import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/export_file.dart';
import '../utils/export_file.dart';

class changePassword extends StatefulWidget {
  const changePassword({super.key});

  @override
  State<changePassword> createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {
  TextEditingController old_password = TextEditingController();
  TextEditingController new_password = TextEditingController();
  TextEditingController confirm_new_password = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  //LoginData data = LoginData();
  bool isLoading = false;

  Future changeHandler() async {
    setState(() {
      isLoading = true;
    });
    // Map payload = {
    //   "email": gmail.text,
    // };
    Map payload = {
      "old_password": old_password.text,
      "new_password": new_password.text,
      "confirm_new_password": confirm_new_password.text
      // "old_password": "Devil123456!",
      // "new_password": "Devil123456!@",
      // "confirm_new_password": "Devil123456!@"
    };

    Map value = await Services.changepassword(payload);
    //////////////////////////////////////////////////////////////////
    if (value["data"]["status"] == "1") {
      Fluttertoast.showToast(
        msg: value["data"]["message"],
      );
      ;
      Get.back();
    } else {
      Fluttertoast.showToast(
        msg: value["data"]["message"],
      );
      Get.back();
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
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: white,
                          ),
                        ),
                        SizedBox(
                          height: 100.h,
                        ),
                        Text(
                          'Change Password',
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
                            label: "Old Password",
                            isMandatory: true,
                            controller: old_password,
                            hintText: "Old Password"),
                        SizedBox(height: 13.h),
                        CustomFormField(
                            readOnly: false,
                            label: "New password",
                            isMandatory: true,
                            controller: new_password,
                            hintText: "New password"),
                        SizedBox(height: 13.h),
                        Text("Confirm new password",
                            style: GoogleFonts.inter(
                                color: white,
                                fontSize: kTwelveFont,
                                fontWeight: kFW500)),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              gradient: LinearGradient(
                                  colors: [
                                    grey..withOpacity(0.2),
                                    grey1.withOpacity(0.2),
                                    Colors.black.withOpacity(0.3)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight)),
                          child: TextFormField(
                            readOnly: false,
                            controller: confirm_new_password,

                            // keyboardType: keyboardType,
                            // onChanged: onChanged,
                            // obscureText: isObscureText,
                            style: GoogleFonts.inter(
                                color: white,
                                fontSize: kTwelveFont,
                                fontWeight: kFW500),
                            // maxLength: 8,
                            decoration: InputDecoration(
                              // suffixIcon: suffix,
                              // prefixIcon: prefix,
                              isDense: true,
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 15, 10, 15),
                              filled: true,
                              fillColor: white.withOpacity(0.08),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide:
                                    BorderSide(color: grey1.withOpacity(0.2)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide:
                                    BorderSide(color: grey1.withOpacity(0.2)),
                              ),
                              hintStyle: GoogleFonts.inter(
                                  color: white.withOpacity(0.5),
                                  fontSize: kTwelveFont,
                                  fontWeight: kFW500),
                              hintText: "Confirm new password",
                            ),
                            validator: (value) {
                              if (value != new_password.text) {
                                return 'password do not match';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              _formKey.currentState!.validate();
                            },
                            // validator: (value) {
                            //   if (value!.isEmpty) {
                            //     return 'Please enter Confirm new password';
                            //   }
                            //   return null;
                            // },

                            onTap: () {
                              // Get.toNamed(KSearch);
                            },
                          ),
                        ),
                        // CustomFormField(
                        //     readOnly: false,
                        //     label: "Confirm new password",
                        //     isMandatory: true,
                        //     controller: confirm_new_password,
                        //     hintText: "Confirm new password"),

                        SizedBox(
                          height: 125.h,
                        ),

                        CustomButton(
                            label: "Change",
                            isLoading: true,
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                changeHandler();
                              }
                            }),
                        SizedBox(
                          height: 30.h,
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

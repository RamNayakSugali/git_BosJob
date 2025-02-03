// ignore_for_file: camel_case_types

import '../../utils/export_file.dart';

class Login_view extends StatefulWidget {
  const Login_view({super.key});

  @override
  State<Login_view> createState() => _LoginviewState();
}

class _LoginviewState extends State<Login_view> {
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
                const Login_form(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

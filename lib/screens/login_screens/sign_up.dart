// ignore_for_file: camel_case_types

import '../../utils/export_file.dart';

class Signup_view extends StatefulWidget {
  const Signup_view({super.key});

  @override
  State<Signup_view> createState() => _SignupviewState();
}

class _SignupviewState extends State<Signup_view> {
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
                  'assets/images/signup.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const Signup_form(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

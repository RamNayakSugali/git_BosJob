// ignore_for_file: camel_case_types

import '../../utils/export_file.dart';

class Mobile_login extends StatefulWidget {
  const Mobile_login({super.key});

  @override
  State<Mobile_login> createState() => _MobileloginState();
}

class _MobileloginState extends State<Mobile_login> {
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
                const Mobile_view(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

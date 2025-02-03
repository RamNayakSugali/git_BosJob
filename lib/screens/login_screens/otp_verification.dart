// ignore_for_file: camel_case_types

import '../../utils/export_file.dart';

class OTP_view extends StatefulWidget {
  const OTP_view({super.key});

  @override
  State<OTP_view> createState() => _OTPviewState();
}

class _OTPviewState extends State<OTP_view> {
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
                const OTPview(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

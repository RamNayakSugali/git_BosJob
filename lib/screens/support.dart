import '../utils/export_file.dart';

_makingPhoneCall() async {
  var url = Uri.parse("tel:9776765434");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        backgroundColor: darktwo,
        elevation: 0,
        centerTitle: true,
  iconTheme: const IconThemeData(color: white),
        title: Text(
          'Help & Support',
          style: GoogleFonts.gothicA1(
              fontSize: kEighteenFont, color: white, fontWeight: kFW700),
        ),
      ),
      body: Stack(
        children: [
          Background(),
          SingleChildScrollView(
              child: Container(
            margin: EdgeInsets.all(15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Image.asset(
                  'assets/images/help.png',
                  width: 260.w,
                ),
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  "How can we help you?",
                  style: GoogleFonts.gothicA1(
                      fontSize: kTwentyFont, color: white, fontWeight: kFW700),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "It looks like your are experiencing problems with our this process.We are here to help so please get in touch with us",
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.gothicA1(
                      fontSize: kFourteenFont,
                      color: white,
                      fontWeight: kFW400),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        String email = Uri.encodeComponent("hr@bossjobs.in");
                        String subject = Uri.encodeComponent("Hi");
                        String body =
                            Uri.encodeComponent("Hi! I'm Flutter Developer");
                        print(subject); //output: Hello%20Flutter
                        Uri mail = Uri.parse(
                            "mailto:$email?subject=$subject&body=$body");
                        if (await launchUrl(mail)) {
                          //email app opened
                        } else {
                          //email app is not opened
                        }
                      },
                      // ignore: deprecated_member_use
                      // onTap: launch('mailto:rajatrrpalankar@gmail.com?subject=This is Subject Title&body=This is Body of Email');,
                      // onTap:_launchEmail,
                      child: Image.asset(
                        'assets/images/email.png',
                        width: 165.w,
                      ),
                    ),
                    GestureDetector(
                      onTap: _makingPhoneCall,
                      child: Image.asset(
                        'assets/images/call.png',
                        width: 165.w,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}

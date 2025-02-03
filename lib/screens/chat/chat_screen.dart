// ignore_for_file: camel_case_types

import '../../../../utils/export_file.dart';

class Chat_Screen extends StatefulWidget {
  const Chat_Screen({super.key});

  @override
  State<Chat_Screen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<Chat_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: darkGrey,
            onPressed: () {},
            child: Icon(Icons.search_rounded, color: Gold, size: 35.sp)),
        backgroundColor: kBackground,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: white),
          actions: [
            GestureDetector(
                onTap: () {
                  Get.toNamed(KErrors);
                },
                child: Icon(Icons.more_vert))
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Chat',
            style: GoogleFonts.gothicA1(
                fontSize: kEighteenFont, color: white, fontWeight: kFW700),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 15.w, left: 10.w, right: 10.w),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(KChatting);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10.w),
                    child: ListTile(
                      // selected: true,
                      tileColor: kBackground,
                      //selectedTileColor: Colors.transparent,
                      leading: Image.asset(
                        "assets/images/man.png",
                        height: 40.h,
                      ),
                      trailing: Text(
                        "1 day ago",
                        style: GoogleFonts.inter(
                          fontSize: kTenFont,
                          fontWeight: kFW500,
                          color: white,
                        ),
                      ),
                      subtitle: Text(
                        'Hey you miss your class yesterday..',
                        style: GoogleFonts.inter(
                          fontSize: kTwelveFont,
                          fontWeight: FontWeight.w300,
                          color: white,
                        ),
                      ),
                      title: Text(
                        'Vishnu',
                        style: GoogleFonts.inter(
                          fontSize: kFourteenFont,
                          fontWeight: kFW700,
                          color: Gold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}

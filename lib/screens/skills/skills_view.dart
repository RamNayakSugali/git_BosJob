import '../../utils/export_file.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomSheet: Container(
          margin:
              EdgeInsets.only(left: 15.w, right: 15.w, bottom: 20.h, top: 5.h),
          child: CustomDarkButton(
              label: '+ Add Skills',
              isLoading: true,
              onTap: () {
                Get.toNamed(KAddSkills);
                // _showDialog(context);
              }
              // onTap: () {
              //   if (_formKey.currentState!.validate()) {}
              //   ;
              //   // Get.toNamed(KAchievedDetails);
              // },
              ),
        ),
        backgroundColor: kBackground,
        appBar: AppBar(
          
iconTheme: const IconThemeData(color: white),
          automaticallyImplyLeading: true,
          backgroundColor: darktwo,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Skills',
            style: GoogleFonts.gothicA1(
              letterSpacing: 1,
              fontSize: kEighteenFont,
              color: white,
              fontWeight: kFW700,
            ),
          ),
          actions: [
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(KNotification);
                },
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/bell.png',
                      width: 22.w,
                    ),
                    Positioned(
                      left: 13.r,
                      child: const CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 13.w,
            )
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Container(
              // color: white.withOpacity(0.5),
              decoration: BoxDecoration(
                //  color: Colors.transparent,
                color: grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 30.h,
              margin: EdgeInsets.only(left: 10.w, right: 10.w),
              child: TabBar(
                indicator: BoxDecoration(
                  color: grey,
                  borderRadius: BorderRadius.circular(10.r),
                  // boxShadow: [
                  //   BoxShadow(
                  //       blurRadius: 2.r,
                  //       spreadRadius: 1,
                  //       color: Color.fromARGB(255, 11, 2, 2).withOpacity(0.1)),
                  // ],
                  // gradient: LinearGradient(
                  //   begin: Alignment.topLeft,
                  //   end: Alignment.bottomRight,
                  //   colors: [
                  //     grey,
                  //     grey1,
                  //   ],
                  // ),
                ),
                labelColor: Gold,
                labelStyle: GoogleFonts.gothicA1(
                  color: whitetwo,
                  fontWeight: kFW700,
                  fontSize: kTwelveFont,
                ),
                unselectedLabelColor: white,
                tabs: const [
                  Tab(
                    child: Text("Assessed Skills"),
                  ),
                  Tab(
                    child: Text("Unassessed Skills"),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            const Background(),
            Container(
              margin: EdgeInsets.all(15.w),
              child: const TabBarView(
                children: [accessedSkills(), UnaccessedSkills()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

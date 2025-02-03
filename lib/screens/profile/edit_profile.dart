import '../../utils/export_file.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: kBackground,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: white),
          backgroundColor: darktwo,
          elevation: 0,
          titleSpacing: 80.w,
          title: Text(
            'Profile',
            style: GoogleFonts.gothicA1(
                letterSpacing: 1,
                fontSize: kEighteenFont,
                color: white,
                fontWeight: kFW700),
          ),
          bottom: TabBar(
            indicator: BoxDecoration(
                color: lightgrey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.r)),
            labelStyle: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontWeight: kFW500,
            ),
            isScrollable: true,
            tabs: [
              Tab(
                child: Center(
                  child: Text(
                    "Edit Profile",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500, color: Gold),
                  ),
                ),
              ),
              Tab(
                child: Center(
                  child: Text(
                    "Educational Details",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500, color: Gold),
                  ),
                ),
              ),
              Tab(
                child: Center(
                  child: Text(
                    "Certifications",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500, color: Gold),
                  ),
                ),
              ),
              Tab(
                child: Center(
                  child: Text(
                    "Work Experience",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500, color: Gold),
                  ),
                ),
              ),
              Tab(
                child: Center(
                  child: Text(
                    "Achievements",
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500, color: Gold),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Background(),
            TabBarView(
              children: [
                ProfileForm(
                  profileData: Get.arguments,
                ),
                Educational_details(),
                certifications(),
                Work_experience(),
                AchievementsView(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bossjobs/screens/courses/favourite_courses.dart';

import '../../utils/export_file.dart';

class CourseWishlist extends StatefulWidget {
  const CourseWishlist({super.key});

  @override
  State<CourseWishlist> createState() => _CourseWishlistState();
}

class _CourseWishlistState extends State<CourseWishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        backgroundColor: darktwo,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'WishList',
          style: GoogleFonts.gothicA1(
              fontSize: kEighteenFont, color: white, fontWeight: kFW700),
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
                    //top: .h,
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
          ),
        ],
      ),
      body: Stack(
        children: [
          const Background(),
          FavouriteCourses()
          // SingleChildScrollView(
          //   child: Padding(
          //     padding: EdgeInsets.all(15.w),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         SizedBox(height: 15.h),
          //         Search(),
          //         SizedBox(height: 10.h),
          //         // FavoriteJobList(),
          //         SizedBox(height: 10.h),
          //         WishListCategories(),
          //         SizedBox(height: 15.h),
          //         Text(
          //           "Courses",
          //           style: GoogleFonts.inter(
          //             color: white,
          //             fontSize: kSixteenFont,
          //             fontWeight: kFW700,
          //           ),
          //         ),
          //         SizedBox(
          //           height: 10.h,
          //         ),
          //         Wishlist_grid(),
          //         SizedBox(height: 15.h),
          //         Most_popular(),
          //         SizedBox(height: 15.h),
          //         Text(
          //           "Courses",
          //           style: GoogleFonts.inter(
          //             color: white,
          //             fontSize: kSixteenFont,
          //             fontWeight: kFW700,
          //           ),
          //         ),
          //         SizedBox(height: 10.h),
          //         FavouriteCourses(),
          //         //  const Wishlist_jobs()
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

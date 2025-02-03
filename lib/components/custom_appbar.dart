// ignore_for_file: camel_case_types

import '../utils/export_file.dart';

class Custom_Appbar extends StatefulWidget {
  const Custom_Appbar({super.key});

  @override
  State<Custom_Appbar> createState() => _CustomappbarState();
}

class _CustomappbarState extends State<Custom_Appbar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Image.asset('assets/images/logo.png'),
          actions: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(KWish_List);
                  },
                  child: Image.asset(
                    'assets/images/love.png',
                    width: 20.w,
                  ),
                ),
                SizedBox(
                  width: 17.w,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Kprofile);
                  },
                  child: Image.asset(
                    'assets/images/man.png',
                    width: 27.w,
                  ),
                ),
                SizedBox(
                  width: 17.w,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(KNotification);
                  },
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/bell.png',
                        width: 19.w,
                      ),
                      Positioned(
                          left: 10.r,
                          top: 2.h,
                          child: const CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.green,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  width: 13.w,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  Size get preferredSize => Size.fromHeight(50.h);
}

// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_element

import 'dart:convert';
import 'dart:ui';

import '../utils/export_file.dart';
import 'courses/courses.dart';
import 'exercise/exercise.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  DateTime timeBackPressed = DateTime.now();

  final List<Widget> _screens = [
    const Home(),
    Jobs(isHome: false),
    Schedule(isHome: false),
    coures(isHome: false),
    Exercise(isHome: false),
  ];

  void _incrementCounter() {
    setState(() {});
  }

  Map userDetails = {};
  @override
  void initState() {
    userDetails = jsonDecode(UserSimplePreferences.getUserdata().toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final difference = DateTime.now().difference(timeBackPressed);
          final isExitWarning = difference >= const Duration(seconds: 2);
          timeBackPressed = DateTime.now();
          if (isExitWarning) {
            const message = 'Press back again to exit';
            Fluttertoast.showToast(
              msg: message,
              fontSize: kTwelveFont,
              textColor: Colors.white,
              backgroundColor: Colors.grey,
            );

            return false;
          } else {
            SystemNavigator.pop();

            return true;
          }
        },
        child: Scaffold(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          body: Stack(children: [
            // glassCard(context),
            PageView.builder(
              controller: _pageController,
              itemCount: _screens.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _screens[index];
              },
            ),
            Align(
                alignment: FractionalOffset.bottomCenter,
                child: SizedBox(
                  height: 65.h,
                  child: ClipRect(
                      child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 10.0,
                            sigmaY: 10.0,
                          ),
                          child: Opacity(
                            opacity: 0.8,
                            child: BottomNavigationBar(
                              backgroundColor: white.withOpacity(0.2),
                              selectedItemColor: Gold,
                              unselectedItemColor: white,
                              showUnselectedLabels: true,
                              currentIndex: _pageIndex,
                              type: BottomNavigationBarType.fixed,
                              items: _getBottomWidget(),
                              onTap: (int index) {
                                _setPage(index);
                              },
                            ),
                          ))),
                ))
          ]),
        ));
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }

  BottomNavigationBarItem _barItem(String icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        icon,
        color: index == _pageIndex ? Gold : white,
        height: 25.h,
        width: 25.w,
      ),
      label: label,
    );
  }

  List<BottomNavigationBarItem> _getBottomWidget() {
    List<BottomNavigationBarItem> _list = [];
    _list.add(_barItem(Images.bottom_home, 'Home', 0));
    _list.add(_barItem(Images.bottom_jobs, 'Jobs', 1));
    _list.add(_barItem(Images.bottom_date, 'Schedule', 2));
    _list.add(_barItem(Images.bottom_courses, 'Courses', 3));
    _list.add(_barItem(Images.bottom_profile, 'Exercise', 4));
    return _list;
  }
}

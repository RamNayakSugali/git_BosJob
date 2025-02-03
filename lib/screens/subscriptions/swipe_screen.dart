// ignore_for_file: non_constant_identifier_names

import '../../../utils/export_file.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Swipe extends StatefulWidget {
  const Swipe({super.key});

  @override
  State<Swipe> createState() => _SwipeState();
}

class _SwipeState extends State<Swipe> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final BorderRadiusGeometry radius = const BorderRadius.only(
    topLeft: Radius.circular(5.0),
    topRight: Radius.circular(5.0),
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      minHeight: 40.h,
      margin: EdgeInsets.only(left: 10.h, right: 10.h, top: 30.h),
      color: Colors.grey,
      collapsed: Container(
        decoration: BoxDecoration(
          borderRadius: radius, // this is working
          color: Colors.grey,
        ),
        // height: 30.h,

        child: Column(
          children: const [
            Icon(
              Icons.expand_less,
              color: Gold,
            ),
            Text("Swipe to compare")
          ],
        ),
      ),
      //minHeight: 100.h,
      panel: const Center(
        child: Text("This is the sliding Widget"),
      ),
      borderRadius: radius,
    );
  }
}

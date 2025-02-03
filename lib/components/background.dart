import '../utils/export_file.dart';

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        'assets/images/background.gif',
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
      // Positioned(
      //     //left: 20.w,
      //     bottom: 150.h,
      //     child: Image.asset('assets/images/blue.png')),
      // Positioned(right: 10, child: Image.asset('assets/images/red.png')),
      // Positioned(
      //     left: 30.w,
      //     top: 350.h,
      //     right: 0,
      //     child: Image.asset('assets/images/yellow.png')),
    ]);
  }
}

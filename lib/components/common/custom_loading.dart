import '../../utils/export_file.dart';
import 'package:lottie/lottie.dart';

class LoadingBar extends StatefulWidget {
  const LoadingBar({super.key});

  @override
  State<LoadingBar> createState() => _LoadingBarState();
}

class _LoadingBarState extends State<LoadingBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      child:
          //Lottie.asset('assets/images/loading_json.gif'),
          Image.asset("assets/images/loading.gif", width: 60),
    );
  }
}

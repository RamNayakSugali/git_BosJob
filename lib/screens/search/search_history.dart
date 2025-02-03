// ignore_for_file: camel_case_types

import '../../../utils/export_file.dart';

class Search_history extends StatefulWidget {
  const Search_history({super.key});

  @override
  State<Search_history> createState() => _SearchhistoryState();
}

class _SearchhistoryState extends State<Search_history> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        return 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "UIUX Fundamental",
              style: GoogleFonts.inter(
                  fontSize: kTwelveFont, color: white, fontWeight: kFW500),
            ),
            const Icon(Icons.cancel_outlined, color: white),
          ],
        );
      },
    );
  }
}

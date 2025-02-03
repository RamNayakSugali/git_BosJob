import '../../utils/export_file.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 8,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search, color: Gold),
        filled: true,
        fillColor: white,
        contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: white,
          ),
        ),
        hintText: "Search",
      ),
      onTap: () {
        Get.toNamed(KSearch);
      },
    );
  }
}

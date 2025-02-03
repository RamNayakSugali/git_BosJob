import '../../utils/export_file.dart';

class CustomFormField extends StatelessWidget {
  String label;
  bool isMandatory;
  TextEditingController? controller;
  String hintText;
  Widget? prefix;
  Widget? suffix;
  bool isObscureText;
  bool readOnly;
  TextInputType? keyboardType;
  Function(String)? onChanged;

  CustomFormField(
      {Key? key,
      required this.label,
      required this.isMandatory,
      this.prefix,
      this.suffix,
      required this.readOnly,
      this.keyboardType,
      this.onChanged,
      this.isObscureText = false,
      required this.controller,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.inter(color: white, fontSize: kTwelveFont, fontWeight: kFW500)),
        SizedBox(
          height: 5.h,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              gradient: LinearGradient(
                  colors: [grey..withOpacity(0.2), grey1.withOpacity(0.2), Colors.black.withOpacity(0.3)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight)),
          child: TextFormField(
            readOnly: readOnly,
            controller: controller,
            keyboardType: keyboardType,
            onChanged: onChanged,
            obscureText: isObscureText,
            style: GoogleFonts.inter(color: white, fontSize: kTwelveFont, fontWeight: kFW500),
            // maxLength: 8,
            decoration: InputDecoration(
              suffixIcon: suffix,
              prefixIcon: prefix,
              isDense: true,
              contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
              filled: true,
              fillColor: white.withOpacity(0.08),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: grey1.withOpacity(0.2)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: grey1.withOpacity(0.2)),
              ),
              hintStyle: GoogleFonts.inter(color: white.withOpacity(0.5), fontSize: kTwelveFont, fontWeight: kFW500),
              hintText: hintText,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },

            onTap: () {
              // Get.toNamed(KSearch);
            },
          ),
        ),
      ],
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  String label;
  bool isMandatory;
  TextEditingController? controller;
  String hintText;
  Widget? prefix;
  Widget? suffix;
  bool isObscureText;
  bool readOnly;
  int? maxLines;

  TextInputType? keyboardType;
  Function(String)? onChanged;
  void Function()? onTap;

  CustomTextFormField({
    Key? key,
    required this.label,
    required this.isMandatory,
    this.prefix,
    this.suffix,
    this.maxLines,
    required this.readOnly,
    this.keyboardType,
    this.onChanged,
    this.onTap,
    this.isObscureText = false,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            color: white,
            fontSize: kFourteenFont,
            fontWeight: kFW500,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(197, 36, 36, 36).withOpacity(1),
                const Color.fromARGB(225, 24, 21, 21).withOpacity(1),
                Colors.black.withOpacity(0.7)
              ],
            ),
          ),
          child: TextFormField(
            maxLines: maxLines,
            readOnly: readOnly,
            controller: controller,
            keyboardType: keyboardType,
            onChanged: onChanged,
            obscureText: isObscureText,
            style: GoogleFonts.inter(
              color: white,
              fontSize: kTwelveFont,
              fontWeight: kFW500,
            ),
            decoration: InputDecoration(
              suffixIcon: suffix,
              prefixIcon: prefix,
              isDense: true,
              contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
              filled: true,
              fillColor: white.withOpacity(0.08),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: grey1.withOpacity(0.2)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: grey1.withOpacity(0.2)),
              ),
              hintStyle: GoogleFonts.inter(
                color: white.withOpacity(0.5),
                fontSize: kTwelveFont,
                fontWeight: kFW500,
              ),
              hintText: hintText,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}

class CustomSearchField extends StatelessWidget {
  bool isMandatory;
  TextEditingController? controller;
  String hintText;
  Widget? prefix;
  Widget? suffix;
  bool isObscureText;
  bool readOnly;
  int? maxLines;
  dynamic onTap;
  TextInputType? keyboardType;
  Function(String)? onChanged;

  CustomSearchField(
      {Key? key,
      required this.onTap,
      required this.isMandatory,
      this.prefix,
      this.suffix,
      this.maxLines,
      required this.readOnly,
      this.keyboardType,
      this.onChanged,
      this.isObscureText = false,
      required this.controller,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      child: TextFormField(
        maxLength: 8,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Gold),
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/threewired.png',
                width: 1.w,
              ),
            ),
          ),
          filled: true,
          fillColor: white,
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
          hintText: hintText,
          contentPadding: EdgeInsets.only(top: 7.0),
        ),
      ),
    );
  }
}
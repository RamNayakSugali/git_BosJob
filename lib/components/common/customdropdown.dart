import '../../utils/export_file.dart';
export 'package:dropdown_plus/dropdown_plus.dart';
 

class CustomDrop extends StatelessWidget {
  String label;
  bool isMandatory;
  List<String> options;
  dynamic onChanged;
  CustomDrop(
      {Key? key,
      required this.label,
      required this.isMandatory,
      required this.onChanged,
      required this.options})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
              text: label,
               style: GoogleFonts.inter(
                color: white, fontSize: kTwelveFont, fontWeight: kFW500),
              children: isMandatory
                  ? [
                      TextSpan(
                        text: '*',
                        style: GoogleFonts.openSans(
                          fontSize: kFourteenFont,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ]
                  : []),
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          height: 40.h,
          width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(197, 36, 36, 36).withOpacity(1),
                    const Color.fromARGB(225, 24, 21, 21).withOpacity(1),
                    Colors.black.withOpacity(0.7)
                  ],
                )),
          child: TextDropdownFormField(
            onChanged: onChanged,
            options: options,
            decoration: InputDecoration(
              // suffixIcon: suffix,
              // prefixIcon: prefix,
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
                  fontSize: kFourteenFont,
                  fontWeight: kFW500),
                    suffixIcon: const Icon(
                Icons.expand_more_outlined,
                color: Gold,
              ),
              // hintText: hintText,
            ),

            // validator: (value) {
            //   if (value!.isEmpty) {
            //     return 'This filed not be Empty';
            //   }
            //   return null;
            // },
            dropdownHeight: 100.h,
          ),
        ),
      ],
    );
  }
}

 

  
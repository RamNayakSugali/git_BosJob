import 'dart:ui';

import '../../utils/export_file.dart';

class CustomButton extends StatelessWidget {
  String label;
  bool isLoading;
  dynamic onTap;

  CustomButton(
      {Key? key,
      required this.label,
      required this.isLoading,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      height: 40.h,
      width: double.infinity,
      borderRadius: 10.r,
      blur: 15,
      alignment: Alignment.center,
      border: 2,
      linearGradient: LinearGradient(
        colors: [
          white.withOpacity(0.15),
          white.withOpacity(0.15),
        ],
      ),
      borderGradient: LinearGradient(
        colors: [
          kBackground,
          //  white.withOpacity(0.5),
          Gold.withOpacity(0.01)
        ],
      ),
      // linearGradient: LinearGradient(colors: [
      //   grey1..withOpacity(0.3),
      //   //grey1.withOpacity(0.2),
      //   Colors.black.withOpacity(1)
      // ], begin: Alignment.centerLeft, end: Alignment.centerRight),
      // borderGradient: LinearGradient(colors: [white.withOpacity(0.5), Gold]),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 10,
            color: Colors.black.withOpacity(0.1),
          )
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20.0,
              sigmaY: 20.0,
            ),
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(colors: [Colors.white38, Gold]),
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(10.r)),
                child: SizedBox(
                  height: 40.h,
                  width: 338.5.w,
                  child: TextButton(
                    onPressed: onTap,
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                          white.withOpacity(0.08),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    side: BorderSide(
                                      color: white.withOpacity(0.1),
                                    )))),
                    child: isLoading == false
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Gold,
                            ),
                          )
                        : Text(
                            label,
                            style: GoogleFonts.gothicA1(
                                fontSize: kSixteenFont,
                                color: white,
                                fontWeight: kFW700),
                          ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

class CustomProfileButton extends StatelessWidget {
  String label;
  bool isLoading;
  dynamic onTap;

  CustomProfileButton(
      {Key? key,
      required this.label,
      required this.isLoading,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassmorphicContainer(
        // margin: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
        height: 40.h,
        width: double.infinity,
        borderRadius: 13.r,
        blur: 15,
        alignment: Alignment.center,
        border: 0.5,
        linearGradient: LinearGradient(
            colors: [white.withOpacity(0.1), white.withOpacity(0.01)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderGradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
            colors: [
              white.withOpacity(0.5),
              white.withOpacity(0.5),
              Gold.withOpacity(0.5)
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20.0,
              sigmaY: 20.0,
            ),
            child: isLoading == false
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Gold,
                    ),
                  )
                : Text(
                    label,
                    style: GoogleFonts.gothicA1(
                        fontSize: kSixteenFont,
                        color: white,
                        fontWeight: kFW700),
                  ),
          ),
        ),
      ),
    );
  }
}

// child: isLoading == false
//                   ? const Center(
//                       child: CircularProgressIndicator(),
//                     )
//                   : Text(
//                       label,
//                       style: GoogleFonts.gothicA1(
//                           fontSize: kSixteenFont,
//                           color: white,
//                           fontWeight: kFW700),
//                     ),
class CustomDarkButton extends StatelessWidget {
  String label;
  bool isLoading;
  dynamic onTap;

  CustomDarkButton(
      {Key? key,
      required this.label,
      required this.isLoading,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassmorphicContainer(
        // margin: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
        height: 40.h,
        width: double.infinity,
        borderRadius: 13.r,
        blur: 15,
        alignment: Alignment.center,
        border: 0.5,
        linearGradient: LinearGradient(colors: [
          Colors.black.withOpacity(0.1),
          Colors.black.withOpacity(0.01)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderGradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black.withOpacity(0.5),
              Colors.black.withOpacity(0.5),
              Gold.withOpacity(0.5)
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20.0,
              sigmaY: 20.0,
            ),
            child: isLoading == false
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Gold,
                    ),
                  )
                : Text(
                    label,
                    style: GoogleFonts.gothicA1(
                        fontSize: kSixteenFont,
                        color: white,
                        fontWeight: kFW700),
                  ),
          ),
        ),
      ),
    );
  }
}

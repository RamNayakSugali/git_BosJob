// ignore_for_file: camel_case_types

import '../../utils/export_file.dart';

class Wishlist_grid extends StatefulWidget {
  const Wishlist_grid({super.key});

  @override
  State<Wishlist_grid> createState() => _Wishlist_gridState();
}

class _Wishlist_gridState extends State<Wishlist_grid> {
  @override
  Widget build(BuildContext context) {
    return 
    GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            childAspectRatio: (0.31 / 0.55)),
        itemBuilder: ((context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                 // height: 170.h,
                  margin: EdgeInsets.only(right:7.w,bottom: 7.w),
                  decoration: BoxDecoration(
                      border: const GradientBoxBorder(
                        gradient: LinearGradient(colors: [grey, Gold]),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Image.asset(
                    'assets/images/calender.png',
                    fit: BoxFit.fill,
                  )),
                    SizedBox(
                height: 3.h,
              ),
              Text('React Native',
                  style: GoogleFonts.gothicA1(
                      fontSize: 15.sp,
                      color: white,
                      fontWeight: kFW700)),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  Text(
                    '\u{20B9}${699}',
                    style: GoogleFonts.gothicA1(
                        fontSize: 15.sp,
                        color: Gold,
                        fontWeight: kFW700),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    '\u{20B9}${1699}',
                    style: GoogleFonts.gothicA1(
                        decoration: TextDecoration.lineThrough,
                        fontSize: kTwelveFont,
                        color: white,
                        fontWeight: kFW700),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset("assets/images/delete1.png",
                      width: 40.w),
                  SizedBox(
                    //alignment:Alignment.center,
                    // margin: const EdgeInsets.only(),
                    height: 40.h,
                    width: 120.w,
                    child: TextButton(
                      onPressed: () {
                        // Get.toNamed(KAmountScrn);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  grey),
                          shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(10.r),
                                  side: const BorderSide(
                                      color: grey)))),
                      child: const Text("Buy now",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 15)),
                    ),
                  ),
                ],
              ),
            ],
          );
        }));
  }
}

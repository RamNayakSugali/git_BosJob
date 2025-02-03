// ignore_for_file: camel_case_types

import '../utils/export_file.dart';

class banner extends StatefulWidget {
  const banner({super.key});

  @override
  State<banner> createState() => _bannerState();
}

class _bannerState extends State<banner> {
  var banners;
  bool isLoading = false;
  Future bannerListHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.getBanners();
    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      banners = data["data"];
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    bannerListHandler();
  }

  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    // List<String> images = [
    //   'assets/images/banner.png',
    //   'assets/images/banner.png',
    //   'assets/images/banner.png',
    // ];

    return banners != null
        ? Column(
            children: [
              CarouselSlider.builder(
                itemCount: banners['data'].length,
                itemBuilder: (context, itemIndex, _) => SizedBox(
                  // height: 250.h,
                  width: double.infinity,
                  child: banners['data'][itemIndex]["banner_image"] != null
                      ? ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image(
                            image: NetworkImage(kImageURL +
                                banners['data'][itemIndex]["banner_image"]),
                            errorBuilder: (c, o, s) => Image.asset(
                              'assets/images/default_image.png',
                              // height: 250.h,
                              fit: BoxFit.fill,
                            ),
                            fit: BoxFit.fill,
                          ),
                      )
                      : Image.asset(
                          'assets/images/default_image.png',
                          // height: 250.h,
                          fit: BoxFit.fill,
                          // 'assets/images/logo.png',
                        ),
                ),
                options: CarouselOptions(
                  pauseAutoPlayOnTouch: false,
                  initialPage: 0,
                  reverse: false,
                  height: 180.h,
                  autoPlayInterval: const Duration(seconds: 4),
                  pageSnapping: false,
                  disableCenter: true,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              ),
              //buildIndicator(),
            ],
          )
        : Image.asset(
            'assets/images/logo.png',
          );
  }
}

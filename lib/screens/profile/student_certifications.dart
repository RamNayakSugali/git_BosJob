import 'dart:io';
import 'dart:ui';

import 'package:bossjobs/utils/export_file.dart';

import 'package:file_support/file_support.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
// import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class certifications extends StatefulWidget {
  const certifications({super.key});

  @override
  State<certifications> createState() => _certificationsState();
}

class _certificationsState extends State<certifications>
    with TickerProviderStateMixin {
  //Map certificatesdetails = {};
  List<dynamic> certificatesdetails = [];
  bool isLoading = false;
  Future certificatesHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.getcertficates();

    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      certificatesdetails = data["data"]["data"];
    }
    print(data["data"]["data"]);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    certificatesHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.w),
      child: Column(
        children: [
          SizedBox(height: 15.h),
          Text("Your Certifications",
              maxLines: 2,
              style: GoogleFonts.inter(
                fontStyle: FontStyle.italic,
                fontSize: 26.sp,
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: <Color>[
                      Color.fromARGB(255, 208, 153, 66),
                      Color.fromARGB(255, 201, 115, 109)
                      //add more color here.
                    ],
                  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0)),
                fontWeight: kFW800,
              )),
          SizedBox(height: 20.h),
          isLoading == false
              ? Container(
                  margin: EdgeInsets.only(left: 5.w),
                  //  padding: EdgeInsets.all(8.w),
                  height: 200.h,
                  child: Swiper(
                    itemHeight: 150.h,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13.r),
                            //   color: Colors.grey,
                            image: const DecorationImage(
                              image:
                                  AssetImage('assets/images/sliderimage.png'),
                              //('${welcomeImages[index]}'),
                              // fit: BoxFit.cover,
                              fit: BoxFit.fill,
                            ),
                          ),
                          width: double.infinity,
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 10.w, right: 10.w, top: 85.h),
                            child: Row(
                              //  mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.edit_document,
                                      size: 20.sp,
                                      color: white,
                                    ),
                                    SizedBox(width: 10.w),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 200.w,
                                          child: Text(
                                              certificatesdetails[index]
                                                  ["course"]["type"],
                                              maxLines: 2,
                                              style: GoogleFonts.inter(
                                                  color: Gold,
                                                  fontSize: kEighteenFont,
                                                  fontWeight: kFW600)),
                                        ),
                                        SizedBox(
                                          width: 200.w,
                                          child: Text(
                                              DateFormat('yyyy-MMM-dd').format(
                                                  DateTime.parse(
                                                      certificatesdetails[index]
                                                          ["updated_at"])),
                                              // certificatesdetails[index]
                                              //     ["updated_at"],
                                              maxLines: 2,
                                              style: GoogleFonts.inter(
                                                  color: white,
                                                  fontSize: kFourteenFont,
                                                  fontWeight: kFW500)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    final Directory appDocumentsDir =
                                        await getTemporaryDirectory();

                                    // FileDownloader.downloadFile(
                                    //     url:
                                    //         "https://bossjobs.co.in/dev/candidate_images/" +
                                    //             certificatesdetails[index]
                                    //                 ["candidate"]["resume"],
                                    //     //  name: "ram api resume",
                                    //     name: certificatesdetails[index]
                                    //         ["candidate"]["resume_name"],
                                    //     onDownloadCompleted: (path) {
                                    //       final File file = File(path);
                                    //       Fluttertoast.showToast(
                                    //         msg: "Downloaded Successfully",
                                    //       );
                                    //       debugPrint("DONE");
                                    //     });
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.download,
                                        size: 20.sp,
                                        color: Gold,
                                      ),
                                      Text("Download",
                                          style: GoogleFonts.inter(
                                              color: Gold,
                                              fontSize: kTenFont,
                                              fontWeight: kFW500)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ));
                    },
                    itemWidth: double.infinity,
                    itemCount: certificatesdetails.length,
                    // educationaldatail["candidates"]
                    //         ["CandidateEducations"]
                    //     .length,
                    //  itemCount: educationaldatail.length,

                    //  control: new SwiperControl(

                    //  ),
                    loop: true,
                    layout: SwiperLayout.STACK,
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                  color: Gold,
                )),
        ],
      ),
    );
  }
}

import 'dart:ui';
import 'package:bossjobs/utils/export_file.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vimeo_player_flutter/vimeo_player_flutter.dart';

class lessionVideos extends StatefulWidget {
  const lessionVideos({super.key});

  @override
  State<lessionVideos> createState() => _lessionVideosState();
}

class _lessionVideosState extends State<lessionVideos> {
  final Uri _url = Uri.parse('https://www.youtube.com/watch?v=TPYg7NBo4yY');

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15.h,
        ),
        SizedBox(
          height: 210.h,
          child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return GlassmorphicContainer(
                  margin: EdgeInsets.only(right: 18.w, top: 10.w, bottom: 10.h),
                  height: 210.h,
                  width: 330.w,
                  borderRadius: 15,
                  blur: 15,
                  alignment: Alignment.center,
                  border: 2,
                  linearGradient: LinearGradient(colors: [
                    white.withOpacity(0.15),
                    white.withOpacity(0.15)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  borderGradient: LinearGradient(colors: [
                    Colors.white.withOpacity(0.5),
                    Gold.withOpacity(0.01)
                  ]),
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        spreadRadius: 16,
                        color: Colors.black.withOpacity(0.1),
                      )
                    ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 10.0,
                          sigmaY: 10.0,
                        ),
                        child: Container(
                            width: double.infinity,
                            height: 190.h,
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                                border: const GradientBoxBorder(
                                  gradient: LinearGradient(
                                      colors: [Colors.white38, Gold]),
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(16.r)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    " This lesson does't have any videos, Please Download the Lesson files in Reading Material",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.gothicA1(
                                        fontSize: kFourteenFont,
                                        color: white,
                                        fontWeight: kFW700)),
                                SizedBox(
                                  height: 10.h,
                                ),
                                // SizedBox(
                                //     height: 40.h,
                                //     width: 110.w,
                                //     child: Ink(
                                //       decoration: const BoxDecoration(
                                //         gradient:
                                //             LinearGradient(colors: [white, grey1]),
                                //         borderRadius:
                                //             BorderRadius.all(Radius.circular(80.0)),
                                //       ),
                                //       child: TextButton(
                                //         onPressed: _launchUrl,
                                //         style: ButtonStyle(
                                //             backgroundColor:
                                //                 const MaterialStatePropertyAll<
                                //                     Color>(grey),
                                //             shape: MaterialStateProperty.all<
                                //                     RoundedRectangleBorder>(
                                //                 RoundedRectangleBorder(
                                //                     borderRadius:
                                //                         BorderRadius.circular(10.r),
                                //                     side: const BorderSide(
                                //                         color: grey)))),
                                //         child: Text(
                                //           "Download",
                                //           style: GoogleFonts.gothicA1(
                                //               fontSize: kFourteenFont,
                                //               color: white,
                                //               fontWeight: kFW600),
                                //         ),
                                //       ),
                                //     ))
                              ],
                            )),
                      ),
                    ),
                  ),
                );
              })),
        ),
      ],
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}

class VimePlayer extends StatefulWidget {
  Map lessonInfo;
  VimePlayer({super.key, required this.lessonInfo});

  @override
  State<VimePlayer> createState() => _VimePlayerState();
}

class _VimePlayerState extends State<VimePlayer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          widget.lessonInfo["lesson_videos"].length > 0
              ? Column(
                  children: [
                    Container(
                      height: 225.h,
                      child: VimeoPlayer(
                        videoId: widget.lessonInfo["lesson_videos"][0]["file"],
                      ),
                    ),
                  ],
                )
              : Text("No Video File",style: GoogleFonts.gothicA1(
                              fontSize: kFourteenFont,
                              color: white,
                              fontWeight: kFW700,
                            )),
        ],
      ),
    );
  }
}

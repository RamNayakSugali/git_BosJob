// ignore_for_file: camel_case_types

import 'dart:ui';

import 'package:intl/intl.dart';
import '../../utils/export_file.dart';

class Notification_view extends StatefulWidget {
  const Notification_view({super.key});

  @override
  State<Notification_view> createState() => _NotificationState();
}

class _NotificationState extends State<Notification_view> {
  bool isLoading = false;
  List<dynamic> notificationList = [];

  Future notificationsListHandler() async {
    setState(() {
      isLoading = true;
    });
    Map data = await Services.getnotifications();
    if (data["message"] != null) {
      Fluttertoast.showToast(
        msg: data["message"],
      );
    } else {
      notificationList = data["data"]["data"]["notifications"];
    }
    print(data["data"]["data"]);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    notificationsListHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackground,
        appBar: AppBar(
          backgroundColor: darktwo,
          iconTheme: const IconThemeData(color: white),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Notifications',
            style: GoogleFonts.gothicA1(
                fontSize: kEighteenFont, color: white, fontWeight: kFW700),
          ),
        ),
        body: Stack(
          children: [
            const Background(),
            SingleChildScrollView(
              child: isLoading == false
                  ? Container(
                      margin: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: notificationList.length,
                        //itemCount: 10,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Dismissible(
                            direction: DismissDirection.endToStart,
                            key: Key(index.toString()),
                            background: Container(
                                margin: EdgeInsets.only(top: 15.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.red.withOpacity(0.2),
                                          Colors.red.withOpacity(0.8),
                                        ],
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft))),
                            child: Container(
                              margin: EdgeInsets.only(top: 6.h),
                              child: ListTile(
                                leading: notificationList[index]["user"]
                                            ["profile_pic"] !=
                                        null
                                    ? CircleAvatar(
                                        backgroundColor: kBackground,
                                        backgroundImage: NetworkImage(
                                            "$kProfileURL${notificationList[index]["user"]["profile_pic"]}"),
                                        radius: 23.r,
                                      )
                                    : CircleAvatar(
                                        backgroundColor: kBackground,
                                        radius: 23.r,
                                        child: Image.asset(
                                            'assets/images/man.png'),
                                      ),
                                // Image.asset(
                                //   "assets/images/man.png",
                                //   height: 46.h,
                                // ),

                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      "(${notificationList[index]["user_type"]})",
                                      //  'Reminder for Interview in next 30 min',
                                      style: GoogleFonts.inter(
                                        fontSize: kTwelveFont,
                                        fontWeight: kFW500,
                                        color: customgrey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 150.w,
                                          child: Text(
                                            notificationList[index]["message"],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.inter(
                                              fontSize: 12.sp,
                                              fontWeight: kFW600,
                                              color: white,
                                            ),
                                          ),
                                        ),
                                        GlassmorphicContainer(
                                          // height: 210.h,
                                          height: 26.h,
                                          width: 72.w,
                                          borderRadius: 20.r,
                                          blur: 15,
                                          alignment: Alignment.center,
                                          border: 0.5,
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
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 20,
                                                  spreadRadius: 10.r,
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                )
                                              ],
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaX: 10.0,
                                                  sigmaY: 10.0,
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  // padding:
                                                  //     EdgeInsets.only(left: 15.w, right: 15.w),
                                                  //  padding: EdgeInsets.all(15.r),
                                                  decoration: BoxDecoration(
                                                    border:
                                                        const GradientBoxBorder(
                                                      gradient: LinearGradient(
                                                          begin:
                                                              Alignment.topLeft,
                                                          end: Alignment
                                                              .bottomRight,
                                                          colors: [
                                                            kBackground,
                                                            kBackground,
                                                            kBackground,
                                                            Gold
                                                          ]),
                                                      width: 0.5,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Join",
                                                        style: GoogleFonts
                                                            .gothicA1(
                                                          fontSize: kTwelveFont,
                                                          color: white,
                                                          fontWeight: kFW700,
                                                        ),
                                                      ),
                                                      // SizedBox(
                                                      //   height: 15.h,
                                                      // ),

                                                      // SizedBox(
                                                      //   height: 15.h,
                                                      // ),

                                                      // SizedBox(height: 15.h),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 120.w,
                                      child: Text(
                                        notificationList[index]["user"]["name"],
                                        // 'Richard Chapman',
                                        maxLines: 1,
                                        style: GoogleFonts.inter(
                                          fontSize: 11.sp,
                                          fontWeight: kFW700,
                                          color: Gold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        //'yyyy-MM-dd HH:mm:ss'
                                        DateFormat('yyyy-MMM-dd hh :mm aaa')
                                            .format(DateTime.parse(
                                                notificationList[index]
                                                    ["updated_at"])),
                                        maxLines: 2,
                                        //  'Reminder for Interview in next 30 min',
                                        style: GoogleFonts.inter(
                                          fontSize: 11.sp,
                                          fontWeight: kFW500,
                                          color: customgrey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : SizedBox(
                      height: 500.h,
                      child: Center(
                        child: CircularProgressIndicator(
                            //  backgroundColor: Gold,
                            color: Gold),
                      ),
                    ),
            )
          ],
        ));
  }
}

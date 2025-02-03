import 'dart:ui';

import '../../../../utils/export_file.dart';
class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body:Container(
      margin: EdgeInsets.all(15.w),
        child:
      
       Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
          SizedBox(height: 30.h,),
           Image.asset(
                              'assets/images/errorpic.png',
                              width: 220.w,
                            ),
                            SizedBox(height:30.h),
                            Text("No Internet Connection",
                            style: GoogleFonts.gothicA1(
                              color: white,
                              fontSize: kEighteenFont,
                              fontWeight: kFW700,
                            ),
                            ),
                            SizedBox(height:10.h),
                            
                              
                               Container(
                               margin: EdgeInsets.only(left: 10.w,right: 10.w),
                               alignment: Alignment.center,
                                 child: Text("No Internet Connection found,check your Connection",
                                 textAlign: TextAlign.center,
                                 maxLines: 2,
                                  style: GoogleFonts.gothicA1(
                                  
                                  color: white,
                                  fontSize: 13.sp,
                                  fontWeight: kFW600,
                              ),
                              ),
                               ),
                               SizedBox(height: 80.h),
                                CustomProfileButton(
                  label: 'Try Again',
                  isLoading: true,
                  onTap: () {
                  
                    
                    // Get.toNamed(KAchievedDetails);
                  },
                ),
        
                            
         ],
       ),
       ),
    );
  }
}
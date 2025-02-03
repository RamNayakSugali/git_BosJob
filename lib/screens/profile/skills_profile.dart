// import '../../utils/export_file.dart';

// class SkillsProfile extends StatefulWidget {
//   const SkillsProfile({super.key});

//   @override
//   State<SkillsProfile> createState() => _SkillsProfileState();
// }

// class _SkillsProfileState extends State<SkillsProfile> {
//   // get pieData => null;
//   late List<GDPData> _chartData;

//   @override
//   void initState() {
//     _chartData = getChartData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//           width: 150,
//           height: 150,
//           // color: white,
//           child: SfCircularChart(
//               margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
//               //margin: EdgeInsets.zero,
//               series: <CircularSeries>[
//                 RadialBarSeries<GDPData, String>(

//                     //name: "ram",
//                     gap: '10%',
//                     trackColor: Colors.grey,
//                     trackOpacity: 1,
//                     dataSource: _chartData,
//                     innerRadius: '50%',
//                     pointColorMapper: (GDPData data, _) => Gold,
//                     // gradient:LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors:[grey.withOpacity(0.5),grey1.withOpacity(0.5),Color.fromARGB(255, 58, 55, 55).withOpacity(0.1),
//                     xValueMapper: (GDPData data, _) => data.continent,
//                     yValueMapper: (GDPData data, _) => data.gdp,
//                     maximumValue: 3000,
//                     cornerStyle: CornerStyle.bothCurve)
//               ]),
//         ),
//         SizedBox(
//           width: 10.w,
//         ),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("Skills",
//                 style: GoogleFonts.inter(
//                     color: Gold, fontSize: kSixteenFont, fontWeight: kFW600)),
//             SizedBox(height: 10.h),
//             Text("Finance and Accounting",
//                 style: GoogleFonts.inter(
//                     color: Gold, fontSize: kTwelveFont, fontWeight: kFW600)),
//             SizedBox(height: 5.h),
//             Text("08/10",
//                 style: GoogleFonts.inter(
//                     color: Gold, fontSize: 13.sp, fontWeight: kFW600)),
//             SizedBox(height: 3.h),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Get Verified",
//                     style: GoogleFonts.inter(
//                         color: Gold,
//                         fontSize: kTwelveFont,
//                         fontWeight: kFW500)),
//                 SizedBox(
//                   width: 10.w,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Get.toNamed(KSkills);
//                   },
//                   child: Row(
//                     children: [
//                       Text("More",
//                           style: GoogleFonts.inter(
//                               color: Gold,
//                               fontSize: kFourteenFont,
//                               fontWeight: kFW600)),
//                       Icon(
//                         Icons.arrow_drop_down,
//                         color: Gold,
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   List<GDPData> getChartData() {
//     final List<GDPData> chartData = [
//       GDPData(
//         "Oceania",
//         500,
//       ),
//       GDPData(
//         "Africa",
//         150,
//       ),
//       GDPData(
//         "Europe",
//         250,
//       ),
//     ];
//     return chartData;
//   }
// }

// class GDPData {
//   GDPData(
//     this.continent,
//     this.gdp,
//   );
//   final String continent;
//   final int gdp;
// }

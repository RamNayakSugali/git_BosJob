// // ignore_for_file: camel_case_types

// import '../../../utils/export_file.dart';
// import 'dart:ui';
// import 'package:charts_flutter/flutter.dart' as charts;

// class Bar_chat extends StatefulWidget {
//   const Bar_chat({super.key});

//   @override
//   State<Bar_chat> createState() => _BarchatState();
// }

// class _BarchatState extends State<Bar_chat> {
//   final List<BarChartModel> data = [
//     BarChartModel(
//       year: "1",
//       financial: 250,
//       color: charts.ColorUtil.fromDartColor(white),
//     ),
//     BarChartModel(
//       year: "5",
//       financial: 300,
//       color: charts.ColorUtil.fromDartColor(white),
//     ),
//     BarChartModel(
//       year: "10",
//       financial: 100,
//       color: charts.ColorUtil.fromDartColor(white),
//     ),
//     BarChartModel(
//       year: "15",
//       financial: 450,
//       color: charts.ColorUtil.fromDartColor(white),
//     ),
//     BarChartModel(
//       year: "20",
//       financial: 630,
//       color: charts.ColorUtil.fromDartColor(white),
//     ),
//     BarChartModel(
//       year: "25",
//       financial: 950,
//       color: charts.ColorUtil.fromDartColor(white),
//     ),
//     BarChartModel(
//       year: "30",
//       financial: 400,
//       color: charts.ColorUtil.fromDartColor(Gold),
//     ),
//   ];

//   get primaryMeasureAxis => null;

//   get secondaryMeasureAxis => null;

//   @override
//   Widget build(BuildContext context) {
//     List<charts.Series<BarChartModel, String>> series = [
//       charts.Series(
//         id: "financial",
//         data: data,
//         domainFn: (BarChartModel series, _) => series.year,
//         measureFn: (BarChartModel series, _) => series.financial,
//         colorFn: (BarChartModel series, _) => series.color,
//       ),
//     ];

//     return GlassmorphicContainer(
//       height: 205.h,
//       width: double.infinity,
//       borderRadius: 10.r,
//       blur: 15,
//       // alignment: Alignment.center,
//       border: 2,
//       linearGradient: LinearGradient(
//           colors: [white.withOpacity(0.1), white.withOpacity(0.01)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight),
//       borderGradient: LinearGradient(colors: [white.withOpacity(0.5), Gold]),
//       child: Container(
//         decoration: BoxDecoration(boxShadow: [
//           BoxShadow(
//             blurRadius: 10,
//             spreadRadius: 10,
//             color: Colors.black.withOpacity(0.1),
//           )
//         ]),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(10.0),
//           child: BackdropFilter(
//             filter: ImageFilter.blur(
//               sigmaX: 20.0,
//               sigmaY: 20.0,
//             ),
//             child: Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     border: const GradientBoxBorder(
//                       gradient: LinearGradient(colors: [Colors.white38, Gold]),
//                       width: 0.5,
//                     ),
//                     borderRadius: BorderRadius.circular(10.r)),
//                 child: Container(
//                   // alignment: Alignment.center,
//                   //height: 210.h,
//                   padding: EdgeInsets.all(10.h),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Activity',
//                         style: GoogleFonts.gothicA1(
//                             fontSize: kSixteenFont,
//                             color: white,
//                             fontWeight: kFW700),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(top: 12.h),
//                         height: 150.h,
//                         width: 350.w,
//                         child: charts.BarChart(
//                           series,
//                           animate: true,
//                           vertical: true,
//                           defaultRenderer: charts.BarRendererConfig(
//                               maxBarWidthPx: 10,
//                               cornerStrategy:
//                                   const charts.ConstCornerStrategy(20)),
//                           domainAxis: charts.OrdinalAxisSpec(
//                               // Make sure that we draw the domain axis line.
//                               showAxisLine: false,
//                               // But don't draw anything else.
//                               renderSpec: charts.NoneRenderSpec()),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _onSelectionChanged {}

// class BarChartModel {
//   String year;
//   int financial;
//   final charts.Color color;

//   BarChartModel({
//     required this.year,
//     required this.financial,
//     required this.color,
//   });
// }

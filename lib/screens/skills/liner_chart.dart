// // ignore_for_file: camel_case_types

// import 'dart:ui';

// import '../../utils/export_file.dart';

// class liner_chart extends StatefulWidget {
//   const liner_chart({super.key});

//   @override
//   State<liner_chart> createState() => _linerchartState();
// }

// class _linerchartState extends State<liner_chart> {
//   late List<SalesData> _chartData;
//   late TooltipBehavior _tooltipBehavior;

//   @override
//   initState() {
//     _chartData = getChartData();
//     _tooltipBehavior = TooltipBehavior(enable: true);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final LinearGradient _linearGradient = LinearGradient(colors: <Color>[
//       Color(0xffFF9F00),
//       Color(0xffEBBD7180).withOpacity(0.5),
//       Color(0xff1B1B1B00),
//     ], stops: <double>[
//       0.0,
//       0.5,
//       1.0,
//     ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
//     return 
//     GlassmorphicContainer(
     
//       height: 226.h,
//       width: 350.w,
//       borderRadius: 10.r,
//       blur: 15,
//       // alignment: Alignment.center,
//       border: 2,
//       linearGradient: LinearGradient(
//           colors: [white.withOpacity(0.1), white.withOpacity(0.01)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight),
//       borderGradient: LinearGradient(
//           colors: [white.withOpacity(0.5), white.withOpacity(0.3)]),
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
//                       gradient:
//                           LinearGradient(colors: [Colors.white38, Gold]),
//                       width: 0.5,
//                     ),
//                     borderRadius: BorderRadius.circular(10.r)),
//                 child: Container(
//                   // alignment: Alignment.center,
//                   height: 226.h,
//                   // padding: EdgeInsets.only(left: 10.w),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(top: 10.h, left: 10.w),
                        
//                         child: Text("Skills",
//                             style: GoogleFonts.inter(
//                                 color: white,
//                                 fontSize: kEighteenFont,
//                                 fontWeight: kFW600)),
//                       ),
//                       Container(
//                         //color: Colors.amber,
                       
//                         padding: EdgeInsets.only(top: 20.h),
//                         height: 181.h,
//                         child: SfCartesianChart(
//                           // isTransposed: true,
//                           plotAreaBorderWidth: 0,
//                           // title: ChartTitle(text: 'Yearly sales analysis'),
//                           legend: Legend(isVisible: false),
//                           tooltipBehavior: _tooltipBehavior,
//                           //isTransposed: true,
//                           series: <ChartSeries>[
//                             AreaSeries<SalesData, double>(
//                               // name: 'Sales',
//                               dataSource: _chartData,
//                               xValueMapper: (SalesData sales, _) =>
//                                   sales.year,
//                               yValueMapper: (SalesData sales, _) =>
//                                   sales.sales,

//                               borderWidth: 2,
//                               borderColor: Gold,

//                               gradient: _linearGradient,
//                               dataLabelSettings: DataLabelSettings(
//                                   builder: (data, point, series, pointIndex,
//                                       seriesIndex) {
//                                     return CircleAvatar(
//                                       radius: 5.r,
//                                       backgroundColor: white,
//                                     );
//                                   },
//                                   isVisible: true),
//                               enableTooltip: true,
//                             )
//                           ],
//                           primaryXAxis: NumericAxis(
//                               majorGridLines: MajorGridLines(width: 0),
//                               axisLine: AxisLine(width: 0),
//                               edgeLabelPlacement: EdgeLabelPlacement.shift),
//                           primaryYAxis: NumericAxis(
//                             majorGridLines: MajorGridLines(width: 0),
//                             axisLine: AxisLine(width: 0),
//                             //numberFormat:NumberFormat.simpleCurrency(decimalDigits: 0),
//                             labelFormat: '{value}',
//                           ),
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

//   List<SalesData> getChartData() {
//     final List<SalesData> chartData = [
//       SalesData(2017, 30),
//       SalesData(2018, 25),
//       SalesData(2019, 15),
//       SalesData(2020, 22),
//       SalesData(2021, 35),
//       SalesData(2022, 30),
//     ];
//     return chartData;
//   }
// }

// class SalesData {
//   SalesData(this.year, this.sales);

//   final double year;
//   final double sales;
// }

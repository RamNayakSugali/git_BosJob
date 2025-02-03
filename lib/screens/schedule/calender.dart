import 'dart:ui';
import 'package:bossjobs/controllers/schedule_controller.dart';
import '../../utils/export_file.dart';
 import 'package:intl/intl.dart';
// import 'package:intl/intl.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class _CalenderState extends State<Calender> {
  List<TimePlannerTitle> headers() {
    List<TimePlannerTitle> getList = [];
    DateTime today = DateTime.now();
    DateTime endDate = today.add(const Duration(days: 30));

    while (today.isBefore(endDate)) {
      getList.add(TimePlannerTitle(
        date: DateFormat('dd-MM-yyyy').format(today),
        title: DateFormat('EE').format(today),
      ));
      today = today.add(const Duration(days: 1));
    }
    return getList;
  }

  @override
  Widget build(BuildContext context) {
    ScheduleController scheduleController = Get.put(ScheduleController());

    return SizedBox(
      height: 600.h,
      child: Center(
        child: GetBuilder<ScheduleController>(
          builder: (controller) {
            debugPrint(controller.tasks.length.toString());
            return TimePlanner(
              startHour: 6,
              endHour: 23,
              style: TimePlannerStyle(
                backgroundColor: white,
                showScrollBar: true,
              ),
              headers: headers(),
              tasks: controller.tasks,
            );
          },
        ),
      ),
    );
  }
}

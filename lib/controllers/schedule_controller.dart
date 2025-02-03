import 'dart:math';

import 'package:bossjobs/utils/export_file.dart';

class ScheduleController extends GetxController {
  RxList<TimePlannerTask> tasks = <TimePlannerTask>[].obs;

  Future<void> addObject(
    BuildContext context, {
    required String title,
    required int day,
    required int duration,
    required int hour,
    required int min,
  }) async {
    List<Color?> colors = [Colors.purple, Colors.blue, Colors.green, Colors.orange, Colors.lime[600]];

    tasks.add(
      TimePlannerTask(
        color: colors[Random().nextInt(colors.length)],
        dateTime: TimePlannerDateTime(day: day, hour: hour, minutes: min),
        minutesDuration: duration,
        daysDuration: 1,
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
        },
        child: Text(
          title,
          style: const TextStyle(color: Colors.red, fontSize: 12),
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Task added successfully')));
  }
}

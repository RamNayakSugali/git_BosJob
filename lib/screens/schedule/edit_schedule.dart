import 'package:bossjobs/controllers/schedule_controller.dart';
 import 'package:intl/intl.dart';

import '../../utils/export_file.dart';

class EditSchedule extends StatefulWidget {
  const EditSchedule({super.key});

  @override
  State<EditSchedule> createState() => _EditScheduleState();
}

class _EditScheduleState extends State<EditSchedule> {
  bool isLoading = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController taskController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController dateInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ScheduleController scheduleController = Get.put(ScheduleController());
  String hour = '';
  String min = '';
  int day = 0;

  @override
  void initState() {
    dateInputController.text = "";
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        backgroundColor: darktwo,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Edit Schedules',
          style: GoogleFonts.gothicA1(
            fontSize: kEighteenFont,
            color: white,
            fontWeight: kFW700,
          ),
        ),
      ),
      body: Stack(
        children: [
          const Background(),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(15.r),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundColor: kBackground,
                            radius: 25,
                            child: Image.asset('assets/images/man.png'),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Arvind",
                              style: GoogleFonts.gothicA1(
                                fontSize: kFourteenFont,
                                color: Gold,
                                fontWeight: kFW700,
                              ),
                            ),
                            Text(
                              "Designer",
                              style: GoogleFonts.gothicA1(
                                fontSize: kTwelveFont,
                                color: white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextFormField(
                      controller: titleController,
                      hintText: "Title",
                      isMandatory: false,
                      label: 'Title',
                      readOnly: false,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextFormField(
                      controller: dateInputController,
                      hintText: "Select Date",
                      suffix: InkWell(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: const ColorScheme.light(
                                    background: white,
                                    primary: Colors.grey,
                                    onPrimary: white,
                                    onSurface: Colors.black,
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                     // primary: Colors.black,
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );

                          if (pickedDate != null) {
                            DateTime today = DateTime.now();
                            debugPrint(pickedDate.toString());
                            day = (pickedDate.difference(today).inHours / 24)
                                    .round() +
                                1;
                            debugPrint(day.toString());
                            String formattedDate =
                                DateFormat.yMMMMd('en_US').format(pickedDate);
                            debugPrint(formattedDate);
                            setState(() {
                              dateInputController.text = formattedDate;
                            });
                          } else {
                            debugPrint("Date is not selected");
                          }
                        },
                        child: Icon(
                          Icons.calendar_month,
                          size: 20.w,
                          color: Gold,
                        ),
                      ),
                      isMandatory: false,
                      label: 'Date',
                      readOnly: true,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 160.w,
                          child: CustomTextFormField(
                            onTap: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                initialTime: TimeOfDay.now(),
                                context: context,
                              );

                              if (pickedTime != null) {
                                DateTime parsedTime = DateFormat.jm().parse(
                                    pickedTime.format(context).toString());
                                String formattedTime =
                                    DateFormat('h:mm a').format(parsedTime);
                                hour = DateFormat('H').format(parsedTime);
                                min = DateFormat('mm').format(parsedTime);
                                setState(() {
                                  timeController.text =
                                      formattedTime; //set the value of text field.
                                });
                              } else {
                                debugPrint("Time is not selected");
                              }
                            },
                            controller: timeController,
                            hintText: "Select Time",
                            isMandatory: false,
                            label: 'Start Time',
                            readOnly: true,
                          ),
                        ),
                        SizedBox(
                          width: 160.w,
                          child: CustomTextFormField(
                            controller: taskController,
                            hintText: "Task",
                            isMandatory: false,
                            label: 'Task',
                            readOnly: false,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      width: 160.w,
                      child: CustomTextFormField(
                        keyboardType: TextInputType.number,
                        controller: durationController,
                        hintText: "Enter Duration",
                        isMandatory: false,
                        label: 'Duration (In Minutes)',
                        readOnly: false,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    CustomTextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      controller: notesController,
                      hintText: "Write Something",
                      isMandatory: false,
                      label: 'Notes',
                      readOnly: false,
                    ),
                    SizedBox(height: 35.h),
                    CustomProfileButton(
                      label: 'Save',
                      isLoading: true,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          await scheduleController.addObject(
                            context,
                            title: titleController.text,
                            day: day,
                            duration: int.parse(durationController.text),
                            hour: int.parse(hour),
                            min: int.parse(min),
                          );
                          scheduleController.tasks.refresh();
                          Get.to(kDashboard);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

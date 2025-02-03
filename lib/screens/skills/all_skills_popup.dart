// ignore_for_file: must_be_immutable

import '../../utils/export_file.dart';

class all_skills_dialog extends StatefulWidget {
  dynamic order;
  all_skills_dialog({super.key, required this.order});

  @override
  State<all_skills_dialog> createState() => _all_skills_dialogState();
}

String _chosenValue = 'I\'m not able to help';

class _all_skills_dialogState extends State<all_skills_dialog> {
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Decline Appointment Request"),
          content: Container(
            height: 100,
            width: 200,
            child: Column(
              children: <Widget>[
                new Text("Please select an option for why you declined."),
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter dropDownState) {
                  return DropdownButton<String>(
                    value: _chosenValue,
                    underline: Container(),
                    items: <String>[
                      'I\'m not able to help',
                      'Unclear description',
                      'Not available at set date and time',
                      'Other'
                    ].map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(
                          value,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      dropDownState(() {
                        _chosenValue = value.toString();
                      });
                    },
                  );
                }),
              ],
            ),
          ),
          // actions: <Widget>[
          //   // usually buttons at the bottom of the dialog
          //   new FlatButton(
          //     child: new Text("Close"),
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //   ),

          // ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
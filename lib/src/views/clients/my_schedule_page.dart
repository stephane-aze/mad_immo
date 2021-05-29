import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class MySchedulePage extends StatefulWidget {
  @override
  _MySchedulePageState createState() => _MySchedulePageState();
}

class _MySchedulePageState extends State<MySchedulePage> {
  double _height;
  double _width;

  String _setTimeDebut, _setTimeFin;

  String _hour, _minute, _time;

  String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
  TextEditingController _timeController = TextEditingController();
  TextEditingController _timeController2 = TextEditingController();
  Future<Null> _selectTime(
      BuildContext context, TextEditingController controller) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString().padLeft(2, '0');
        _minute = selectedTime.minute.toString().padLeft(2, '0');
        _time = _hour + ' : ' + _minute;
        controller.text = _time;
      });
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    //dateTime = DateFormat.yMd().format(DateTime.now());
    return new Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                "Mes disponibilités",
                style: TextStyle(fontSize: 40),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: <Widget>[
                Text(
                  'Choisir son créneau d\'horaire',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Horaire de début",
                ),
                InkWell(
                  onTap: () {
                    _selectTime(context, _timeController);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: _width / 1.7,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: TextFormField(
                      style: TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                      onSaved: (String val) {
                        _setTimeDebut = val;
                      },
                      enabled: false,
                      keyboardType: TextInputType.text,
                      controller: _timeController,
                      decoration: InputDecoration(
                          disabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          // labelText: 'Time',
                          contentPadding: EdgeInsets.all(5)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text("Horaire de début"),
                InkWell(
                  onTap: () {
                    _selectTime(context, _timeController2);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: _width / 1.7,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.grey[200]),
                    child: TextFormField(
                      style: TextStyle(fontSize: 40),
                      textAlign: TextAlign.center,
                      onSaved: (String val) {
                        _setTimeFin = val;
                      },
                      enabled: false,
                      keyboardType: TextInputType.text,
                      controller: _timeController2,
                      decoration: InputDecoration(
                          disabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          // labelText: 'Time',
                          contentPadding: EdgeInsets.all(5)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
              onPressed: () {
                sendCreneau(context);
              },
              child: Text('Confirmer'),
              color: Colors.yellow,
            )
          ],
        ),
      ),
    );
  }

  sendCreneau(context) {
    print(_timeController.text);
    print(_timeController2.text);
  }
}

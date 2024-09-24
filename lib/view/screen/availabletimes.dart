import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../controller/addrequest_controller.dart';

class Availabletimes extends StatefulWidget {
  const Availabletimes({Key? key}) : super(key: key);

  @override
  _Availabletimes createState() => _Availabletimes();
}

class _Availabletimes extends State<Availabletimes> {
  final List<String> _checkboxItems = [
    "Sat",
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri"
  ];

  List<bool> _checkboxValues = List.filled(7, false);
  List<TimeOfDay> _startTimes = List.generate(7, (index) => TimeOfDay(hour: 6, minute: 0));
  List<TimeOfDay> _endTimes = List.generate(7, (index) => TimeOfDay(hour: 9, minute: 0));
  List<bool> _newCheckValues = List.filled(7, true);

  _showTimepicker(bool isStartTime, int index) {
    showTimePicker(
      context: context,
      initialTime: isStartTime ? _startTimes[index] : _endTimes[index],
    ).then((value) {
      if (value != null) {
        setState(() {
          isStartTime ? _startTimes[index] = value : _endTimes[index] = value;
        });
      }
    });
  }

  String formatTime24Hour(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: fourBackColor,
        elevation: 0,
        title: const Text("", style: TextStyle(color: white, fontSize: 18)),
        centerTitle: true,
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(50)),
                gradient: LinearGradient(
                    colors: [sixBackColor, fourBackColor],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight))),
      ),
      body: ListView.builder(
          itemCount: _checkboxItems.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                CheckboxListTile(
                  value: _checkboxValues[index],
                  onChanged: (bool? value) {
                    setState(() {
                      _checkboxValues[index] = value!;
                    });
                  },
                  title: Text(_checkboxItems[index]),
                  checkColor: white,
                  activeColor: fourBackColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(formatTime24Hour(_startTimes[index])),
                          MaterialButton(
                            color: white,
                            onPressed: () => _showTimepicker(true, index),
                            child: const Text('Start Time', style: TextStyle(color: fourBackColor)),
                          ),
                        ],
                      ),
                      const SizedBox(width: 60,),
                      Column(
                        children: [
                          Text(formatTime24Hour(_endTimes[index])),
                          MaterialButton(
                            color: white,
                            onPressed: () => _showTimepicker(false, index),
                            child: const Text('End Time', style: TextStyle(color: fourBackColor)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 110, right: 100),
                //   child: CheckboxListTile(
                //     value: _newCheckValues[index],
                //     onChanged: (bool? value) {
                //       setState(() {
                //         _newCheckValues[index] = value!;
                //       });
                //     },
                //     title: const Text('Active '),
                //     checkColor: white,
                //     activeColor: Colors.green,
                //   ),
                // ),
                const Divider(color: fourBackColor),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          List<List<String>> availableTimes = [];
          for (int i = 0; i < _checkboxItems.length; i++) {
            if (_checkboxValues[i]) {
              availableTimes.add([
                _checkboxItems[i], // اليوم
                formatTime24Hour(_startTimes[i]),
                formatTime24Hour(_endTimes[i]),
                _newCheckValues[i] ? "1" : "0",
              ]);
            }
          }
          AddRequestcontrollerImp controller = Get.find();
          controller.setAvailableTimes(availableTimes);
          print(jsonEncode(availableTimes));
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';



class Availabletimes extends StatefulWidget {
  const Availabletimes({Key? key}) : super(key: key);

  @override
  _Availabletimes createState() => _Availabletimes();
}

class _Availabletimes extends State<Availabletimes>
{
  final List<String> _checkboxItems =
  [ "Sat" , "Sun" , "Mon" , "Tue" , "Wed" ,"Thu" ,"Fri"] ;

  List<bool> _checkboxValues  = List.filled(7, false);
  List<TimeOfDay> _startTimes = List.generate(7, (index) => TimeOfDay(hour: 6, minute: 0));
  List<TimeOfDay> _endTimes   = List.generate(7, (index) => TimeOfDay(hour: 9, minute: 0));
  List<bool> _newCheckValues = List.filled(7, true);



   _showTimepicker(bool isStartTime, int index) {
    showTimePicker(
      context: context, // سياق من Builder
      initialTime: isStartTime ? _startTimes[index] : _endTimes[index],
    ).then((value) {
      if (value != null) {
        setState(() {
          isStartTime ? _startTimes[index] = value : _endTimes[index] = value;
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {

   return Scaffold(
     appBar:  AppBar(
       backgroundColor: fourBackColor,
       elevation: 0,
       title: const Text("",
           style: TextStyle(
               color: white,
               fontSize: 18)),
       centerTitle: true,
       flexibleSpace: Container(
           decoration:const BoxDecoration(
               borderRadius: BorderRadius.only(
                   bottomLeft: Radius.circular(60),
                   bottomRight: Radius.circular(50)),
               gradient: LinearGradient(colors: [sixBackColor,fourBackColor],
                   begin: Alignment.centerLeft,
                   end: Alignment.centerRight
               ))),),
     body: ListView.builder(
             itemCount: _checkboxItems.length,
             itemBuilder: (context, index) {
               return Column(
                 children: [
                    CheckboxListTile(
                     value: _checkboxValues[index],
                     onChanged: (bool? value){
                       setState(() {
                         _checkboxValues[index] = value!;
                       });
                     } ,
                     title : Text(_checkboxItems[index]),
                     checkColor: white ,
                     activeColor: fourBackColor,
                   ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60 ,right: 60),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              //diaplay the chosen time
                              Text(_startTimes[index].format(context).toString(),),
                              MaterialButton(
                                color: white,
                                onPressed: () => _showTimepicker(true,index), // استخدم سياق من Builder
                                child:const Text('End Time ', style: TextStyle(color: fourBackColor)),
                              ),
                            ],) ,
                          const SizedBox(width: 60,),
                          Column(
                            children: [
                              //diaplay the chosen time
                              Text(_endTimes[index].format(context).toString(),),
                              MaterialButton(
                                color: white,
                                onPressed: () => _showTimepicker(false,index), // استخدم سياق من Builder
                                child:const Text('Start Time ', style: TextStyle(color: fourBackColor)),
                              ),
                            ],),

                        ],
                      ),
                    ),
                    Padding(
                     padding: const EdgeInsets.only(left: 110 ,right: 100),
                     child: CheckboxListTile(
                       value: _newCheckValues[index], // قيمة خانة الاختيار الجديدة
                       onChanged: (bool? value) {
                         setState(() {
                           _newCheckValues[index] = value!; // تحديث قيمة خانة الاختيار الجديدة
                         });
                       },
                       title: const Text('Active '), // عنوان خانة الاختيار الجديدة
                       checkColor: white,
                       activeColor: Colors.green,
                     ),
                   ),
                    const  Divider(color: fourBackColor),

                  ],);
             }


         ),
     floatingActionButton: FloatingActionButton(
       onPressed: () {
         // هنا يمكنك تنفيذ الإجراءات المرغوبة عند الضغط على الزر
         print("Saved");
       },
       child: Icon(Icons.save),
     ),
   );




  }

}



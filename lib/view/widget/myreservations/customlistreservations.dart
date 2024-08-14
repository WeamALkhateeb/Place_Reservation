import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/core/constant/color.dart';
import 'package:project2/data/model/myreservations.dart';

class CustomListReservations extends StatelessWidget {
  final String name;
  final String totalPrice;
  final String dateAndTime;
  final String day;
  final String start_time;
  final String endTime;

  const CustomListReservations({
    Key? key,
    required this.name,
    required this.totalPrice,
    required this.dateAndTime,
    required this.day,
    required this.endTime,
    required this.start_time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Card(
         child:Row(
          children: [
          Expanded(
              flex:4,
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    name,
                    style:const TextStyle(
                    color: firstBackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                )),
              ),
          ),
          Expanded(
              flex:5,
              child:Padding(
                padding: const EdgeInsets.only(right: 0),
                child: Column(
                    children :[
                      Text(
                        day +" "+dateAndTime,
                        style:const TextStyle(
                            color: firstBackColor,
                            fontSize: 13,
                        //    fontWeight: FontWeight.bold

                        ),),
                      const SizedBox(height: 6,),
                      Text("start: " +start_time ,
                        style:const TextStyle(
                            color: firstBackColor,
                            fontSize:13
                        ),),
                      const SizedBox(height: 6,),
                      Text("end: " +endTime ,
                        style:const TextStyle(
                            color: firstBackColor,
                            fontSize:13
                        ),),
                      const SizedBox(height: 6,),
                      Text("price: "+totalPrice + "S.P",
                        style:const TextStyle(
                            color: firstBackColor,
                            fontSize:13
                        ),),
                    ]
                ),
              )),
        ],
         )
      ),
    );
  }
}

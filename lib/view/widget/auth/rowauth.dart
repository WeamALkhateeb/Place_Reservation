import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';


class Rowauth extends StatelessWidget{
  final String text1;
  final String text2;
  final void Function() onTap;
  const Rowauth({Key? key, required this.text1,required this.onTap,  required this.text2}) : super(key: key);


  @override
  Widget build(BuildContext context) {
   return    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
     Text(text1.tr,style:const TextStyle(color: fiveBackColor,fontWeight: FontWeight.w400,fontSize: 13),),
    const SizedBox(width: 10,),
     InkWell(onTap: onTap,
   child:Container(
   width: 90,
   height: 30,
   decoration: BoxDecoration(
   color:sixBackColor,
   borderRadius: BorderRadius.circular(10)),

   child: Center(child:  Text(text2.tr,style:const TextStyle(color: fourBackColor,fontWeight: FontWeight.bold,fontSize: 13),))))

    ],
   );
  }}





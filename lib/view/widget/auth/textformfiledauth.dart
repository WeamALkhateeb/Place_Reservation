import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';


class Textformfieldauth extends StatelessWidget{
  final String hinttext;
  final IconData iconData;

  const Textformfieldauth({Key? key,
  required this.hinttext,
  required this.iconData,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   return  Container(
       margin: const EdgeInsets.symmetric(horizontal:30,vertical: 5),
       child: TextFormField(
          decoration: InputDecoration(
           filled: true,
           fillColor: sixBackColor,
           hintText: hinttext,
           contentPadding:const  EdgeInsets.only(top: 20,bottom: 20),
           hintStyle:const TextStyle(fontSize: 15),
           enabledBorder: OutlineInputBorder(
             borderSide:const BorderSide(color: fourBackColor, width: 2),
             borderRadius: BorderRadius.circular(20),
           ),
           focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
           prefixIcon: Icon( iconData ,color: fiveBackColor,),
         ),
       ));
  }

}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';


class Textformfieldauth extends StatelessWidget{
  final TextEditingController mycontroller;
  final String hinttext;
  final IconData iconDataprefix;
  final IconData? iconDatasuffix;
  final String? Function(String?)? valid;
  final TextInputType? keyboardType;
  final bool? obscuretext ;
   final void Function()? onTapicon ;



  const Textformfieldauth({Key? key,
    required this.mycontroller,
    required this.hinttext,
    required this.valid,
    this.keyboardType,
    this.obscuretext,
    required this.iconDataprefix,
    this.iconDatasuffix,
    this.onTapicon, }) : super(key: key);

  @override
  Widget build(BuildContext context) {

   return  Container(
       margin: const EdgeInsets.symmetric(horizontal:30,vertical: 5),
       child: TextFormField(
         validator: valid,
          controller: mycontroller,
          keyboardType: keyboardType ,
          obscureText: obscuretext == null || obscuretext== false ? false : true,
          decoration: InputDecoration(
           filled: true,
           fillColor: sixBackColor,
           hintText: hinttext.tr,
           contentPadding:const  EdgeInsets.only(top: 20,bottom: 20),
           hintStyle:const TextStyle(fontSize: 15),
           enabledBorder: OutlineInputBorder(
             borderSide:const BorderSide(color: fourBackColor, width: 2),
             borderRadius: BorderRadius.circular(20),
           ),
           focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
           prefixIcon: Icon(iconDataprefix ,color: fiveBackColor,),
              suffixIcon: InkWell(child: Icon(iconDatasuffix , color: fiveBackColor,) ,
                                  onTap: onTapicon ,)


       )));
  }

}
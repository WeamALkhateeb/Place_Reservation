import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project2/controller/auth/register_controller.dart';
import 'package:project2/core/functions/validateinput.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/materialbuttonauth.dart';
import '../../widget/auth/rowauth.dart';
import '../../widget/auth/textformfiledauth.dart';


class Register extends StatelessWidget{
  const Register({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    RegistercontrollerImp conteoller = Get.put(RegistercontrollerImp());
   return Scaffold(
     appBar: AppBar(
       backgroundColor: fourBackColor,

       elevation: 0,
       title:const Text('Register',style: TextStyle(color: white,fontFamily:'DeliciousHandrawn',fontSize: 25)),
       centerTitle: true,
       flexibleSpace: Container(
           decoration:const BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60),bottomRight: Radius.circular(50)),
               gradient: LinearGradient(colors: [sixBackColor,fourBackColor],
                   begin: Alignment.centerLeft,
                  end: Alignment.centerRight
               ))),),
     body: Container(
       padding: const EdgeInsets.symmetric(vertical: 5),
       width: MediaQuery.of(context).size.width,
       child:SingleChildScrollView(
         scrollDirection: Axis.vertical,
         child: Form(
           key: conteoller.formstatee,
           child: Column(
               children: [
                 const SizedBox(height: 20,),
                 Image.asset('assets/images/Register.png',
                   width: 350,
                   height: 200,),
                 const SizedBox(height: 30,),
                 Textformfieldauth(valid: (value ) { return validateinput(value!, 5 , 25); },mycontroller: conteoller.username,hinttext: 'Enter your name', iconData: Icons.person,),
                 const SizedBox(height: 5,),
                 Textformfieldauth(valid: (value ) {  return validateinput(value!, 10, 50);},mycontroller: conteoller.email,hinttext: 'Enter your email', iconData: Icons.email,),
                 const SizedBox(height: 5,),
                 Textformfieldauth(valid: (value ) {  return validateinput(value!, 8 , 20);},mycontroller: conteoller.password,hinttext: 'Enter your password ', iconData: Icons.lock,),
                 const SizedBox(height: 5,),
                 Textformfieldauth(valid: (value) { return validateinput(value!, 8 , 20); },mycontroller: conteoller.password,hinttext: 'Confirm password ', iconData: Icons.lock,),
                 const  SizedBox(height: 20,),
                 MaterialButtonAuth(onPressed:(){conteoller.Register();},text: 'Sign up',),
                 const SizedBox(height: 35,),
                 Rowauth(text1: " Already have an account ?", onTap: (){
                   conteoller.gotoLogin();
                 }, text2: 'Sign in'),

               ] ),
         )
         ,
       ),
     ) ,
   );
  }

}
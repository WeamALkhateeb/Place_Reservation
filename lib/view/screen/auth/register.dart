import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controller/auth/register_controller.dart';
import 'package:project2/core/class/statusrequest.dart';
import 'package:project2/core/functions/validateinput.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/materialbuttonauth.dart';
import '../../widget/auth/rowauth.dart';
import '../../widget/auth/textformfiledauth.dart';


class Register extends StatelessWidget{
  const Register({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
     Get.put(RegistercontrollerImp());

   return Scaffold(
     appBar: AppBar(
       backgroundColor: fourBackColor,
       elevation: 0,
       title: Text('Register'.tr,style: TextStyle(color: white,fontFamily:'DeliciousHandrawn',fontSize: 25)),
       centerTitle: true,
       flexibleSpace: Container(
           decoration:const BoxDecoration(
               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60),bottomRight: Radius.circular(50)),
               gradient: LinearGradient(colors: [sixBackColor,fourBackColor],
                   begin: Alignment.centerLeft,
                  end: Alignment.centerRight
               ))),),
        body: GetBuilder<RegistercontrollerImp>(
          builder: (controller) => controller.statusRequest==StatusRequest.loading
              ? const Center(child: Text("Loading..."),)
              :Container(
                   padding: const EdgeInsets.symmetric(vertical: 5),
                  width: MediaQuery.of(context).size.width,
                 child:SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                        child: Form(
                              key: controller.formstatee,
                         child: Column(
                   children: [
                     const SizedBox(height: 20,),
                     Image.asset('assets/images/Register.png',
                       width: 350,
                       height: 200,),
                     const SizedBox(height: 30,),
                     Textformfieldauth(valid: (value ) {
                       return validateinput(value!, 5 , 25); },
                       mycontroller: controller.name,
                       hinttext: 'Enter your name',
                       iconDataprefix: Icons.person,
                       keyboardType: TextInputType.name,),
                     const SizedBox(height: 5,),
                     Textformfieldauth(valid: (value ) {
                       return validateinput(value!, 5 , 25); },
                       mycontroller: controller.username,
                       hinttext: 'Enter user name',
                       iconDataprefix: Icons.person,
                       keyboardType: TextInputType.name,),
                     const SizedBox(height: 5,),
                     Textformfieldauth(valid: (value ) {
                       return validateinput(value!, 10, 50);},
                       mycontroller: controller.email,
                       hinttext: 'Enter your email',
                       iconDataprefix: Icons.email,
                     keyboardType: TextInputType.emailAddress,),
                     const SizedBox(height: 5,),
                     GetBuilder<RegistercontrollerImp>(
                       builder: (controller) {
                         return Textformfieldauth(valid: (value ) {
                           return validateinput(value!, 8 , 20);},
                           obscuretext: controller.isshowpassword,
                           onTapicon: (){
                             controller.showpassword();},
                           mycontroller: controller.password,
                           hinttext: 'Enter your password ',
                           iconDataprefix: Icons.lock,
                           iconDatasuffix:controller.isshowpassword? Icons.visibility :Icons.visibility_off ,);
                       }
                     ),
                     const SizedBox(height: 5,),
                     GetBuilder<RegistercontrollerImp>(
                       builder: (context) {
                         return Textformfieldauth(valid: (value) {
                           return validateinput(value!, 8 , 20); },
                           mycontroller: controller.confirmpassword,
                           hinttext: 'Confirm password ',
                           iconDataprefix: Icons.lock,
                           obscuretext: controller.isshowconfpassword,
                           onTapicon: (){
                             controller.showconfpassword(); },
                           iconDatasuffix:controller.isshowconfpassword? Icons.visibility :Icons.visibility_off ,);
                       }
                     ),
                     const  SizedBox(height: 20,),
                     MaterialButtonAuth(onPressed:(){controller.Register();},text: 'Sign up',),
                     const SizedBox(height: 20,),
                     Rowauth(text1: " Already have an account ?".tr, onTap: (){
                       controller.gotoLogin();
                     }, text2: 'Sign in'),

                   ] ),
             )
             ,
       ),
     )

        ) ,
   );
  }

}
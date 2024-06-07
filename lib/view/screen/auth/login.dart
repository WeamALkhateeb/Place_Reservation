import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controller/auth/login_controller.dart';
import 'package:project2/core/constant/color.dart';
import 'package:project2/core/functions/validateinput.dart';
import 'package:project2/view/widget/auth/rowauth.dart';
import 'package:project2/view/widget/auth/textformfiledauth.dart';
import '../../widget/auth/materialbuttonauth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LogincontrollerImp controller = Get.put(LogincontrollerImp());

    return Scaffold(
        appBar: AppBar(
        backgroundColor: fourBackColor,
        elevation: 0,
        title:const Text('Login',style: TextStyle(color: white,fontFamily:'DeliciousHandrawn',fontSize: 25)),
        centerTitle: true,
        flexibleSpace: Container(
                       decoration:const BoxDecoration(
                           borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60),bottomRight: Radius.circular(50)),
                           gradient: LinearGradient(colors: [sixBackColor,fourBackColor],
                           begin: Alignment.centerLeft,
                           end: Alignment.centerRight
                       ))),),
        body:Container(
       padding: const EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.of(context).size.width,
        child:SingleChildScrollView(
          scrollDirection: Axis.vertical,
            child: Form(
              key: controller.formstate,
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  Image.asset('assets/images/login.png',
                  width: 350,
                  height: 300,),
                      const SizedBox(height: 40,),
                    Textformfieldauth(valid: (value ) {
                      return validateinput(value!, 10 , 50); },
                      mycontroller: controller.email ,
                      hinttext: 'Enter your email',
                      iconData: Icons.email,
                      keyboardType: TextInputType.emailAddress,),
                    const SizedBox(height: 5,),
                    Textformfieldauth(valid: (value ) {
                      return validateinput(value!, 8 , 20); },
                      mycontroller: controller.password,
                      hinttext: 'Enter your password ',
                      iconData: Icons.lock,),
                    const  SizedBox(height: 20,),
                    MaterialButtonAuth(onPressed:(){ controller.Login();},text: 'Sign in',),
                    const SizedBox(height: 35,),
                    Rowauth(text1: " Don't have an account ?", onTap: (){
                      controller.gotoRegister();
                    }, text2: 'Sign up'),

  ] ),
            ),
                ), ));
  }
}



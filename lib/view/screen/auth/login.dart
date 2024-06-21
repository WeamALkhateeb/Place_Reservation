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
        title:Text('Login'.tr,style: TextStyle(color: white,fontFamily:'DeliciousHandrawn',fontSize: 25)),
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
              child: GetBuilder<LogincontrollerImp>(
                       builder: (controller) =>
                           Column(
                    children: [
                      const SizedBox(height: 20,),
                       Image.asset('assets/images/login.png',
                      width: 350,
                      height: 300,),
                      const SizedBox(height: 40,),
                        Textformfieldauth(valid: (value ) {
                          return validateinput(value!, 2 , 25); },
                          mycontroller: controller.username ,
                          hinttext: 'Enter user name',
                          iconDataprefix: Icons.person,
                          keyboardType: TextInputType.name,),
                        const SizedBox(height: 5,),
                        GetBuilder<LogincontrollerImp>(
                         builder:(controller)=> Textformfieldauth(valid: (value ) {
                            return validateinput(value!, 8 , 20); },
                            obscuretext: controller.isshowpassword,
                            onTapicon: (){
                            controller.showpassword();},
                            mycontroller: controller.password,
                            hinttext: 'Enter your password'.tr,
                            iconDataprefix: Icons.lock,
                            iconDatasuffix:controller.isshowpassword? Icons.visibility :Icons.visibility_off ,),
                        ),
                        const  SizedBox(height: 20,),
                        MaterialButtonAuth(onPressed:(){ controller.Login();},text: 'Sign in',),
                        const SizedBox(height: 35,),
                        Rowauth(text1: " Don't have an account ?".tr, onTap: (){
                          controller.gotoRegister();
                        }, text2: 'Sign up'),

  ] )

              ),
            ),
                ), ));
  }
}



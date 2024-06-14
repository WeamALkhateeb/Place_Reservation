import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project2/core/constant/routes.dart';

abstract class Logincontroller extends GetxController{
  Login();
  gotoRegister();
}

class LogincontrollerImp extends Logincontroller{

  GlobalKey<FormState> formstate =GlobalKey<FormState>();
 late TextEditingController email;
 late TextEditingController password;
 bool isshowpassword =true;


 showpassword()
 {
   isshowpassword = isshowpassword == true ? false :true;
   update();

 }


  @override
  Login() {
  var formdata = formstate.currentState;
  if(formdata!.validate())
    {print('valid');}
  else
    {print ('not valid');}
  }

  @override
  gotoRegister() {
   Get.offNamed(AppRoute.register);
  }
void onInit(){
   email = TextEditingController();
   password=TextEditingController();
   super.onInit();
}



 void dispose(){
  email.dispose();
  password.dispose();
  super.dispose();
 }
}
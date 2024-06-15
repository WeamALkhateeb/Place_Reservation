import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/constant/routes.dart';



abstract class Registercontroller extends GetxController{
  Register();
  gotoLogin();
}

class RegistercontrollerImp extends Registercontroller{
  GlobalKey<FormState> formstatee =GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmpassword;
  bool isshowpassword =true;


  showpassword()
  {
    isshowpassword = isshowpassword == true ? false :true;
    update();

  }






  @override
  Register() {
    var formdataa = formstatee.currentState;
    if(formdataa!.validate())
    {// انتقال لصفحة الهوم
      print(" valid");}
    else
    {print(" not valid");}
  }

  @override
  gotoLogin() {
    Get.offNamed(AppRoute.login);
  }
  void onInit(){
    username=TextEditingController();
    email = TextEditingController();
    password=TextEditingController();
    confirmpassword=TextEditingController();
    super.onInit();
  }



  void dispose(){
    username.dispose();
    email.dispose();
    password.dispose();
    confirmpassword.dispose();
    super.dispose();
  }
}
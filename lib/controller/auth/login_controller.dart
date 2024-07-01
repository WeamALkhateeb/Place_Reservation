import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project2/core/constant/routes.dart';
import 'package:project2/core/services/services.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingData.dart';
import '../../data/datasource/remote/Auth/login.dart';


abstract class Logincontroller extends GetxController{
  Login();
  gotoRegister();
}

class LogincontrollerImp extends Logincontroller{
  MyServices myServices =Get.find();

  GlobalKey<FormState> formstate =GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController password;
  bool isshowpassword =true;
  StatusRequest? statusRequest;
  LoginData loginData =LoginData(Get.find());

 showpassword()
 {
   isshowpassword = isshowpassword == true ? false :true;
   update();

 }


  @override
  Login() async {
  var formdata = formstate.currentState;
  if(formdata!.validate())
  {
    statusRequest = StatusRequest.loading ;
    update();
    var response = await  loginData.postdata( username.text,password.text);
    print("-----------------------------controller $response--------------------");
    statusRequest=handlingData(response);
    if(StatusRequest.success == statusRequest)
    {
      if(response["status"] == "Success" ){
        // افترض أن `userId` موجود في الاستجابة تحت المفتاح `user_id`
        String user_id = response['model']['id'].toString();

        // حفظ `userId` في SharedPreferences
        saveUserId(user_id);
      Get.offNamed(AppRoute.homepage);
    }
    else
    {  Get.defaultDialog(title: "warning" , middleText: "User name or Password Not Correct ");
    statusRequest = StatusRequest.failure;
    }
    }
    update();
  }

  else
  { print('gggggggg'); }
  }

  void saveUserId(String user_id) {
    myServices.sharedPreferances.setString("id", user_id);
  }

  @override
  gotoRegister() {
   Get.offNamed(AppRoute.register);
  }
void onInit(){
   username = TextEditingController();
   password=TextEditingController();
   super.onInit();
}



 void dispose(){
  username.dispose();
  password.dispose();
  super.dispose();
 }
}
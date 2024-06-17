import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project2/core/class/statusrequest.dart';
import 'package:project2/core/functions/handlingData.dart';
import '../../core/constant/routes.dart';
import '../../data/datasource/remote/Auth/signup.dart';



abstract class Registercontroller extends GetxController{
  Register();
  gotoLogin();
}

class RegistercontrollerImp extends Registercontroller{
  GlobalKey<FormState> formstatee =GlobalKey<FormState>();
  late TextEditingController name;
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmpassword;
  bool isshowpassword =true;
  bool isshowconfpassword =true;
  late StatusRequest statusRequest ;

  SignupData signupData =SignupData(Get.find());
 List data=[];

  showpassword()
  {
    isshowpassword = isshowpassword == true ? false :true;
    update();

  }

  showconfpassword()
  {
    isshowconfpassword = isshowconfpassword == true ? false :true;
    update();

  }

  @override
  Register() async {
    var formdataa = formstatee.currentState;
    if(formdataa!.validate())
    {
      statusRequest = StatusRequest.loading ;
      print('000000000000000000000000000000000000');
      var response = await  signupData.postdata(name.text, username.text,email.text,password.text,confirmpassword.text);
      print("-----------------------------controller $response--------------------");

      statusRequest=handlingData(response);
      if(StatusRequest.success == statusRequest)
        {  print('ةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةةة');
          if(response["status"] == "Success" ){
            data.addAll(response['data']);
            print('ssssssssssssssssssssssssssssssssssssssssssssss');
          }
          else
            {
              statusRequest = StatusRequest.failure;
            }
        }
      update();
    }

    else
    { }
  }

  @override
  gotoLogin() {
    Get.offNamed(AppRoute.login);
  }
  void onInit(){
    name=TextEditingController();
    username=TextEditingController();
    email = TextEditingController();
    password=TextEditingController();
    confirmpassword=TextEditingController();
    super.onInit();
  }



  void dispose(){
    name.dispose();
    username.dispose();
    email.dispose();
    password.dispose();
    confirmpassword.dispose();
    super.dispose();
  }
}
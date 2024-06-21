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
  StatusRequest? statusRequest ;
  List data=[];

  SignupData signupData =SignupData(Get.find());


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
      update();
      var response = await  signupData.postdata( name.text, username.text , email.text , password.text ,confirmpassword.text);
      print("-----------------------------controller $response--------------------");
      statusRequest=handlingData(response);
      if(StatusRequest.success == statusRequest)
        {
            if(response["status"] == "Success" ){
            Get.offNamed(AppRoute.login);
          }
          else
            {  Get.defaultDialog(title: "warning" , middleText: "Username or Email Already Exists ");
               statusRequest = StatusRequest.failure;
            }
        }
      update();
    }

    else
    { print('gggggggg'); }
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
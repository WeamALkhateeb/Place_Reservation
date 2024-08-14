import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingData.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/setting_data.dart';

class SettingController extends GetxController{
  MyServices myServices = Get.find();

  SettingData settingData = SettingData(Get.find());

  late StatusRequest statusReqest;
  ThemeData? themeData;

  void changeTheme(ThemeData theme){
    ThemeData themeData = theme;
    myServices.sharedPreferances.setString("theme", theme.toString());
    Get.changeTheme(themeData) ;
  }

  logout() async {
    statusReqest = StatusRequest.loading;
    var response = await settingData.logoutdata();
    statusReqest = handlingData(response);
    if (response["status"] == "Success") {
      print("11111111111");
      Get.offNamed(AppRoute.login);
    }
    else {
      statusReqest = StatusRequest.failure;
    }
  }

  @override
  void onInit(){
    String? sharedPrefTheme = myServices.sharedPreferances.getString("theme") ;
    print(sharedPrefTheme) ;
  }

}
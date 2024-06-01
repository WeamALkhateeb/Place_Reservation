import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controller/onboarding_controller.dart';

import '../../../core/constant/color.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40, left: 280),
      height: 40,
      child:MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 0),
        onPressed: (){
          controller.next();
        },
        child:  Text("Next".tr,
          style: const TextStyle(
              color: firstBackColor,
              fontWeight: FontWeight.bold,
              fontFamily:'DeliciousHandrawn',
              fontSize: 20
          ),),
        color: thirdBackColor,
      ) ,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controller/onboarding_controller.dart';

import '../../../data/datasource/static.dart';

class SilderOnBoarding extends GetView<OnBoardingControllerImp> {
  const SilderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val){
        controller.onPageChanged(val);
      },
        itemCount: OnBoardingList.length,
        itemBuilder: (context , i) => Column(
          children: [
            const SizedBox(height: 100,),
            Image.asset(OnBoardingList[i].image!),
            const SizedBox(height: 80,),
            Text(OnBoardingList[i].title!,
              style:const TextStyle(
                fontSize:50,
                fontFamily:'DeliciousHandrawn',
                color: Colors.white,
                fontWeight: FontWeight.bold,),),
            const SizedBox(height: 20,),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(OnBoardingList[i].body!,
                textAlign: TextAlign.center,
                style:const TextStyle(
                  fontSize:20,
                  color: Colors.white,
                  fontFamily:'DeliciousHandrawn',
                  //fontWeight: FontWeight.bold,
                  height: 2,
                ),),
            ),
          ],
        )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controller/onboarding_controller.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/static.dart';

class DotControllerOnBoarding extends StatelessWidget {
  const DotControllerOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<OnBoardingControllerImp>(
        builder: ((controller) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(OnBoardingList.length,
                (index) => AnimatedContainer(
              margin: const EdgeInsets.only(right: 5),
              duration: const Duration(milliseconds: 900),
              width: controller.currentPage == index ? 25 : 10 ,
              height: 10,
              decoration: BoxDecoration(
                  color: thirdBackColor,
                  borderRadius: BorderRadius.circular(10)
              ),
            ))
      ],
    )));
  }
}

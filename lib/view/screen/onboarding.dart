import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controller/onboarding_controller.dart';
import '../../core/constant/color.dart';
import '../widget/onboarding/custombutton.dart';
import '../widget/onboarding/dotcontroller.dart';
import '../widget/onboarding/slider.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: firstBackColor,
      body:SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 5,
              child: SilderOnBoarding(),
            ),
             Expanded(
              flex: 1,
                child: Column(
                  children: const [
                    DotControllerOnBoarding(),
                    Spacer(flex: 1,),
                    CustomButtonOnBoarding(),
                  ],
            ))
          ],
        ),
      )
    );
  }
}

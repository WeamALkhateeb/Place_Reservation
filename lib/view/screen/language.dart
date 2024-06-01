import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../../core/localization/changelocal.dart';
import '../widget/language/custombuttomlang.dart';

class Language extends GetView<LocaleController>{
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.find() ;
    var boardController = PageController();
    return Scaffold(
      backgroundColor: firstBackColor,
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "1".tr ,
                style: const TextStyle(
                fontFamily: 'DeliciousHandrawn',
                color: secondBackColor,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),),
              const SizedBox(height: 25,),
              CustomButtonLang(
                text: '2'.tr,
                color: secondBackColor,
                onPressed: () {
                 controller.changeLang("en") ;
                  Get.offNamed(AppRoute.onboarding);
                },
              ),
              const SizedBox(
                height: 10,),
              CustomButtonLang(
                text: '3'.tr,
                color: secondBackColor,
                onPressed: () {
                 controller.changeLang("ar") ;
                  Get.offNamed(AppRoute.onboarding) ;
                },
              ),
            ],
          ),
        )
    );
  }
}

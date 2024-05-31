import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/core/constant/routes.dart';
import 'package:project2/data/datasource/static.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController{

  late PageController pageController ;

  int currentPage = 0;

  @override
  next() {
    currentPage++;
    if (currentPage > OnBoardingList.length-1) {
      Get.offAllNamed(AppRoute.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: Duration(milliseconds: 900),
          curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index ;
    update();
  }

  @override
  void onInit(){
     pageController = PageController();
    super.onInit();
  }

}
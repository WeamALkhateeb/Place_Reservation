import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/imageassest.dart';
import '../../core/services/services.dart';
import '../model/onboarding.dart';

var boardController = PageController();
MyServices myServices = Get.find();

List<OnBoardingModel> OnBoardingList =[
  OnBoardingModel(
      title: "Welcome".tr,
      body:"Now...you can book any place\n you choose from the comfort of your home".tr,
      image:AppImageAsset.onboarding1,
  ),
  OnBoardingModel(
      title: "Categories".tr,
      body:"You can choose the category\n you want to browse and find suitable places".tr,
      image:AppImageAsset.onboarding2,
  ),
  OnBoardingModel(
      title: "Search".tr,
      body:"You can save time and effort\n by searching for the place".tr,
      image:AppImageAsset.onboarding3,
  ),
];
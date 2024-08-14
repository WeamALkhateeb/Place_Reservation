import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/view/screen/home.dart';
import 'package:project2/view/screen/setting.dart';

import '../view/screen/addrequest.dart';
import '../view/screen/myfavorite.dart';
import '../view/screen/myreservations.dart';

abstract class HomeScreenController extends GetxController {
  void changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    const AddRequest(),
    const MyFavorite(),
    const MyReservations(),
    Setting(),
  ];

  @override
  void changePage(int i) {
    currentpage = i;
    update();
  }


}

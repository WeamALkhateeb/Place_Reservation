import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/view/screen/home.dart';

import '../view/screen/addrequest.dart';
import '../view/screen/myfavorite.dart';

abstract class HomeScreenController extends GetxController {
  void changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    const AddRequest(),
    const MyFavorite(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("notifications"),
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text("setting"),
        ),
      ],
    ),
  ];

  @override
  void changePage(int i) {
    currentpage = i;
    update();
  }


}

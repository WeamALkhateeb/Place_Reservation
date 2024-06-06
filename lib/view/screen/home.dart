import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Container();
  }
}

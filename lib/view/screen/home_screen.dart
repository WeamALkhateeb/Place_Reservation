import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controller/home_screen_controller.dart';
import '../../core/constant/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: firstBackColor,
        backgroundColor: white,
        items: const [
          CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined,color:secondBackColor,),
            label: 'Home',
            labelStyle: TextStyle(color: secondBackColor),
          ),
          CurvedNavigationBarItem(

            child: Icon(Icons.add_circle_outline,color:secondBackColor,),
            label: 'add',
            labelStyle: TextStyle(color: secondBackColor),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.favorite_border,color:secondBackColor,),
            label: 'favorite',
            labelStyle: TextStyle(color: secondBackColor),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.notifications_none_sharp,color:secondBackColor,),
            label: 'notifications',
            labelStyle: TextStyle(color: secondBackColor),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.settings_applications,color:secondBackColor,),
            label: 'settings',
            labelStyle: TextStyle(color: secondBackColor),
          ),
        ],
        onTap: (index) {
              controller.changePage(index);
        },
      ),
      body:controller.listPage.elementAt(controller.currentpage),
    ),
    );
  }
}

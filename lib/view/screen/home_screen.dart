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
        items:const[
          CurvedNavigationBarItem(
            child:  Icon(Icons.home_outlined,color:secondBackColor,size: 30,),
            //label: 'Home'.tr,
            labelStyle:  TextStyle(color: secondBackColor),
          ),
          CurvedNavigationBarItem(
            child:  Icon(Icons.add_circle_outline,color:secondBackColor,size: 30,),
          //  label: 'add'.tr,
            labelStyle:  TextStyle(color: secondBackColor),
          ),
          CurvedNavigationBarItem(
            child:  Icon(Icons.favorite_border,color:secondBackColor,size: 30,),
          //  label: 'favorite'.tr,
            labelStyle:  TextStyle(color: secondBackColor),
          ),
          CurvedNavigationBarItem(
            child:  Icon(Icons.shopping_bag_outlined,color:secondBackColor,size: 30,),
           // label: 'MyReservations'.tr,
            labelStyle:  TextStyle(color: secondBackColor),
          ),
          CurvedNavigationBarItem(
            child:  Icon(Icons.settings_applications,color:secondBackColor,size: 30,),
          //  label: 'settings'.tr,
            labelStyle:  TextStyle(color: secondBackColor),
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

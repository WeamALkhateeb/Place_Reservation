import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controller/home_controller.dart';

import '../../controller/auth/login_controller.dart';
import '../../core/constant/color.dart';
import '../../core/functions/validateinput.dart';
import '../widget/auth/textformfiledauth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(250),
        child: AppBar(
          elevation:0,
          backgroundColor: fourBackColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0),bottomRight: Radius.circular(0)),
          ),
          bottom:PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: sixBackColor,
                  contentPadding:const  EdgeInsets.only(top: 10,bottom: 20),
                  hintText: 'search',
                  hintStyle:const TextStyle(fontSize: 15),
                  enabledBorder: OutlineInputBorder(
                    borderSide:const BorderSide(color: sixBackColor, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100 )),
                  prefixIcon: const Icon(Icons.search,color: fourBackColor,),


                )
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';

class AboutAs extends StatelessWidget {
  const AboutAs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children:[
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: sixBackColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_outlined),
                    onPressed: () {
                      Get.offAllNamed(AppRoute.setting);
                    },
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Center(
                      child: Text(
                      "ABOUT_AS",
                      style: TextStyle(
                          color: firstBackColor,
                          fontFamily:'DeliciousHandrawn',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                      ),),),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:const [

            ],
          ),
        ),
        ],),
    );
  }
}

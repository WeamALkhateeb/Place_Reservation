import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/appLink.dart';
import 'package:project2/controller/home_controller.dart';
import '../../core/constant/color.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: AppBar(
            title: const Text('Hi 👋🏻\n Let\'s start browsing',
                style: TextStyle(
                    color: white,
                   fontWeight: FontWeight.w100,
                    fontFamily:'DeliciousHandrawn',
                    fontSize: 22),),
            elevation:0,
            backgroundColor: fourBackColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
            ),
            bottom:PreferredSize(
              preferredSize: const Size.fromHeight(100),
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
            actions:[
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
            ],
          ),
        ),
        body: SizedBox(
        height: 200,
        width: 100,
        child: ListView.separated(
          separatorBuilder:(context, index) => const SizedBox(height: 10,),
          itemCount: controller.categories.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index){
            return Column(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Image.network("${AppLink.imageCategories}/${controller.categories[index]['image']}"),
                ),
                Text("${controller.categories[index]['name']}")
              ],
            );
          },
        ),
      ),
    ),
  );
 }
}

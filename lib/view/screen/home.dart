import 'package:flutter/material.dart';
import 'package:get/get.dart' ;
import 'package:project2/controller/home_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../widget/HomePage/ListCategoriesHome.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
              padding: const EdgeInsets.all(10.0),
                   child:HandlingDataView(
                     statusRequest: controller.statusRequest,
                     widget: ListView(
                      children: [
                        Container(
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
                        HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget:  Column(
                            crossAxisAlignment:CrossAxisAlignment.start ,
                            children: [
                              const SizedBox(height: 10,),
                              Stack(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child:  ListTile(
                                      title: Text( "WELCOME 👋🏻".tr,
                                          style: TextStyle(color: secondBackColor.withOpacity(0.7), fontSize:25, fontFamily: 'DeliciousHandrawn',)
                                      ),
                                      subtitle: Text(
                                          " Let\'s start browsing".tr,
                                          style: TextStyle(
                                            color: secondBackColor.withOpacity(0.7),
                                            fontSize:20,
                                            fontFamily: 'DeliciousHandrawn',)),
                                    ),
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color:firstBackColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin:const EdgeInsets.all( 10),
                                child:  Text(
                                  "Categories:".tr,
                                  style: const TextStyle(
                                    color: firstBackColor,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold ,
                                  ),
                                ),
                              ),
                              const ListCategoriesHome(),
                ],
              ),
                        ),
                      ],
                    ),
                  ),
              ),
<<<<<<< HEAD
            ),
            actions:[
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
            ],
          ),

        ),

        body: ListCategoriesHome(),

    ),
  );
 }
}
=======
      );
    }
  }
>>>>>>> 75292a6ee82d2f5df4801153b356fe1fd56de4a4

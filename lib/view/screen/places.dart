import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controller/favorite_places.dart';
import 'package:project2/core/class/handlingdataview.dart';
import 'package:project2/core/constant/routes.dart';
import 'package:project2/view/widget/places/customlistplaces.dart';
import '../../controller/places_controller.dart';
import '../../core/constant/color.dart';
import '../../data/model/placesmodel.dart';

class Places extends StatelessWidget {
  const Places({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PlacesControllerImp());
    FavoriteController favoriteController = Get.put(FavoriteController());
    return Scaffold(
      body:Container(
            padding: const EdgeInsets.all(15),
            child: GetBuilder<PlacesControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 5),
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
                                Get.offAllNamed(AppRoute.homepage);
                              },
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Expanded(child: TextFormField(
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
                          ),),
                        ]),
                    ),
                    const SizedBox(height: 20,),
                    HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Padding(
                        padding: const EdgeInsets.only(right: 8,left: 8, top: 30),
                        child: GridView.builder(
                          clipBehavior: Clip.none,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.data.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio:1,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 60,
                            ),
                            itemBuilder: (BuildContext context, index) {
                              if(favoriteController.isfavorite[controller.data[index]['id']] == null) {
                                favoriteController.setFavorite(controller.data[index]['id'], false) ;
                              }else{
                                print(favoriteController.isfavorite[controller.data[index]['id']]);
                              }
                             return CustomListPlaces(
                                 placesModel: PlacesModel.fromJson(controller.data[index]),
                                   active: favoriteController.isfavorite[controller.data[index]['id']],
                             );
                            }),
                      ),
                     ),
                    ],
                  ),
              ),
            ),
      ),
    );
  }
}

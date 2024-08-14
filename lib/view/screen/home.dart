import 'package:flutter/material.dart';
import 'package:get/get.dart' ;
import 'package:project2/controller/home_controller.dart';
import 'package:project2/controller/places_controller.dart';
import 'package:project2/data/model/placesmodel.dart';
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
                   child: ListView(
                      children: [
                        Container(
                          child: TextFormField(
                            onChanged: (val){
                              controller.checkSearch(val) ;
                            },
                              controller: controller.search,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: sixBackColor,
                                contentPadding:const  EdgeInsets.only(top: 10,bottom: 20),
                                hintText: 'Search'.tr,
                                hintStyle:const TextStyle(fontSize: 15),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:const BorderSide(color: sixBackColor, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100 )),
                                prefixIcon: IconButton(
                                  icon:const Icon(Icons.search,color: fourBackColor,),
                                  onPressed: (){
                                    controller.onSearchPlaces();
                                  },
                                ),
                              )
                          ),
                        ),
                        !controller.isSearch ?
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
                                          ' Let\'s start browsing'.tr,
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
                        )
                            : ListPlacesSearch(listdataModel: controller.listdata),
                      ],
                    ),

              ),

      );
    }
  }

class ListPlacesSearch extends GetView<HomeControllerImp> {
  final List<PlacesModel> listdataModel ;
  const ListPlacesSearch({Key? key,required this.listdataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdataModel.length,
        shrinkWrap: true,
        physics:const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return InkWell(
            onTap: (){
              controller.goToPlacesDetails(listdataModel[index]) ;
            },
            child: Container(
              margin:const  EdgeInsets.symmetric(vertical: 10),
              child: Card(
                child: Container(
                  padding:const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Image.network(
                            (listdataModel[index].images != null && listdataModel[index].images!.isNotEmpty)
                                ? listdataModel[index].images![0].image ?? ""
                                : "https://projectable.org/wp-content/uploads/2017/01/default-avatar_male-500x500.png",
                            height: 70,
                          ),
                      ),
                      Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text(listdataModel[index].name!),
                            subtitle: Text(listdataModel[index].pricePerHour.toString()),
                          )
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
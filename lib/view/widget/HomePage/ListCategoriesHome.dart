import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/cetegoriesmodel.dart';
=======
import 'package:get/get.dart';
import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/cetegoriesmodel.dart';
import '../../screen/places.dart';
>>>>>>> 75292a6ee82d2f5df4801153b356fe1fd56de4a4

class ListCategoriesHome extends GetView<HomeControllerImp> {

  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return  GridView.builder(
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
          itemCount: controller.categories.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context , index){
            return Categories(
              i : index,
              categoriesModel: CategoriesModel.fromJson(controller.categories[index]),);
          },
=======
    double screenHeight = MediaQuery.of(context).size.height;
    return  SizedBox(
      height:screenHeight *0.6,
      child: GridView.builder(
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
            itemCount: controller.categories.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context , index){
              return Categories(
                i : index,
                categoriesModel: CategoriesModel.fromJson(controller.categories[index]),);
            },
      ),
>>>>>>> 75292a6ee82d2f5df4801153b356fe1fd56de4a4
    ) ;
  }
}

class Categories extends GetView<HomeControllerImp> {
<<<<<<< HEAD
  final CategoriesModel categoriesModel ;
  final int? i ;
  const Categories( {Key? key, required this.categoriesModel ,required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      //  controller.goToSubCategory(controller.categories, i! ) ;
      },
      child: Column(
        children: [
          SizedBox(height: 10,),
          Container(

              child: Image.network(
                    "${categoriesModel.image}"),
            padding:const EdgeInsets.all(5) ,
            height: 150 ,
            width: 180,
            decoration: BoxDecoration(
              color: secondBackColor,
=======
  CategoriesModel categoriesModel ;
  final int i ;

   Categories( {Key? key, required this.categoriesModel, required this.i}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        print( "11111111111111" "${categoriesModel.id}");
        print(categoriesModel);
        controller.goToPlaces(controller.categories, categoriesModel.id!);
      },
      child: Column(
        children: [
          const SizedBox(height: 10,),
          Container(
              child: Image.network(
                    "${categoriesModel.image}"),
            padding:const EdgeInsets.all(5) ,
            height: 120 ,
            width: 160,
            decoration: BoxDecoration(
              color: fourBackColor.withOpacity(0.1),
>>>>>>> 75292a6ee82d2f5df4801153b356fe1fd56de4a4
              borderRadius:BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 10,),
          Text("${categoriesModel.name}",
            style:const TextStyle(
                fontSize: 15,
                color: firstBackColor,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic),
          ) ,
        ],
      ),
    );
  }
}
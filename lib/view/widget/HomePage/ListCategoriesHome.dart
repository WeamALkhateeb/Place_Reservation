import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/cetegoriesmodel.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {

  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    ) ;
  }
}

class Categories extends GetView<HomeControllerImp> {
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
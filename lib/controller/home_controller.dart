import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/core/class/statusrequest.dart';
import 'package:project2/core/constant/routes.dart';
import 'package:project2/core/services/services.dart';
import 'package:project2/data/datasource/remote/home_data.dart';
import 'package:project2/data/model/placesmodel.dart';
import '../core/functions/handlingData.dart';

abstract class HomeController extends GetxController {

  initialData();
  getdata();
  goToPlaces(List categories, int categoryid);
}

class HomeControllerImp extends HomeController {

  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  List categories = [];
  late String user_name;
  late String id;
  HomeData homeData = HomeData(Get.find());
  List<PlacesModel> listdata = [];
  late TextEditingController search;
  bool isSearch = false ;

  checkSearch(val){
    if(val == ""){
      isSearch = false;
    }
    update();
  }


  onSearchPlaces(){
    isSearch = true ;
    searchData() ;
    update();
  }



  @override
  initialData() {
        user_name = myServices.sharedPreferances.toString();
        id = myServices.sharedPreferances.toString();
  }

  @override
  void onInit(){
    search = TextEditingController() ;
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading ;
    var response = await homeData.getdata();
    print("-----------------------------controller $response--------------------");
    statusRequest=handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response["status"] == "Success" ){
        categories.addAll(response['model']);
      } else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search.text) ;
    statusRequest = handlingData(response) ;
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "Success"){
        listdata.clear();
        List responsedata = response['model'] ;
        listdata.addAll(responsedata.map((e) => PlacesModel.fromJson(e)));
      }
      else {
        statusRequest = StatusRequest.failure;
      }
    }
    print("${statusRequest}wwww") ;
    update();
  }

  @override
  goToPlaces( categories, categoryid ) {
    Get.toNamed(AppRoute.places, arguments: {
      "categories"  : categories,
      "categoryid" : categoryid,
    }) ;
  }

  goToPlacesDetails(placesModel) {
    Get.toNamed(AppRoute.placesdetails, arguments: {
      "placesmodel" : placesModel,
    });
  }
}
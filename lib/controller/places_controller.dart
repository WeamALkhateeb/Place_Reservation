import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/appLink.dart';
import 'package:project2/core/class/statusrequest.dart';
import 'package:project2/core/constant/routes.dart';
import 'package:project2/data/datasource/remote/places_data.dart';
import 'package:project2/data/model/placesmodel.dart';
import '../core/functions/handlingData.dart';
import '../data/datasource/remote/home_data.dart';

abstract class PlacesController extends GetxController {

  intialData();
  getPlaces(int categoryid);
  goToPlacesDetails(PlacesModel placesModel);
}

class PlacesControllerImp extends PlacesController {

  int catid = Get.arguments["categoryid"];
  PlacesData placesData = PlacesData(Get.find());
  List data =[];
  late StatusRequest statusRequest ;

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
  intialData() {
    print(catid);
  }

  @override
  void onInit() {
    search = TextEditingController() ;
    getPlaces(catid);
    intialData();
    super.onInit();
  }

  @override
  void onClose() {
    data.clear();
    super.onClose();
  }

  @override
  getPlaces(categoryid) async {
    statusRequest = StatusRequest.loading;
    print(categoryid);
    var response = await placesData.getdata("${AppLink.places}""${categoryid}");
    print(
        "-----------------------------controller $response--------------------");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "Success") {
        data.addAll(response['model']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  @override
  goToPlacesDetails(placesModel) {
    Get.toNamed(AppRoute.placesdetails, arguments: {
      "placesmodel" : placesModel,
    });
  }
}
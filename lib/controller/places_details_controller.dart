import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/data/model/placesmodel.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlingData.dart';
import '../data/datasource/remote/reservations_data.dart';

abstract class PlacesDetailsController extends GetxController{
  intialData();
}

class PlacesDetailsControllerImp extends PlacesDetailsController{

  late StatusRequest statusRequest;
  late PlacesModel placesModel;
  var selectedExtensions = <int, bool>{};
  var selectedType = <int, bool>{};
  var selectedTimes = <int, bool>{};
  List<PlacesModel> data = [];

  DateTime? selectedDate;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;

  ReservationsData reservationsData = ReservationsData(Get.find());

  intialData(){
    placesModel = Get.arguments['placesmodel'];
  }

  void toggleExtension(int index) {
    selectedExtensions[index] = !(selectedExtensions[index] ?? false);
    update();
  }

  void toggleType(int index) {
    selectedType[index] = !(selectedType[index] ?? false);
    update();
  }

  void toggleTime(int index) {
    selectedTimes[index] = !(selectedTimes[index] ?? false);
    update();
  }

  //rating
  @override
  submitRating(int place_id,String text, int rate)async{
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await reservationsData.rating(place_id,text,rate);
    print("$response");
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if (response["status"] == "success") {

        update() ;
      }
    }
    else {
      statusRequest = StatusRequest.failure;
    }
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
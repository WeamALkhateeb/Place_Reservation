import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:project2/core/constant/color.dart';
import 'package:project2/core/constant/routes.dart';
import 'package:project2/data/model/makehours.dart';
import 'package:project2/data/model/myreservations.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlingData.dart';
import '../data/datasource/remote/reservations_data.dart';
import '../data/model/makeDay.dart';
import '../data/model/placesmodel.dart';

abstract class ReservationsController extends GetxController {
  intialData();
  goToReservationDetails(dynamic makeReservation);
  goToReservationDetailsDay(MakeDayModel makeDay);
}

class ReservationsControllerImp extends ReservationsController {
  ReservationsData reservationsData = ReservationsData(Get.find());

  List data = [];
  late StatusRequest statusRequest;
  List availableTimes = [];
  List<MyReservationsModel> myreservations = [];
  PlacesModel placesModel = PlacesModel();

  addmakeHour(int place_id, int type_id, String date_and_time, String start_time, String end_time, List<dynamic>? extensions) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await reservationsData.addmakeHour(place_id, type_id, date_and_time, start_time, end_time, extensions);
    print("-----------------------------controller $response--------------------");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "Success") {
        print("Success");
        MakeHoursModels makeHoursModel = MakeHoursModels.fromJson(response["model"]);
        goToReservationDetails(makeHoursModel);
        Get.toNamed(AppRoute.reservations);
      } else if (response["status"] == "Error") {
        String errorMessage = response['message'] ?? 'حدث خطأ غير معروف';
        if (response['error_list'] != null) {
          errorMessage = response['error_list'].values.join(', ');
        }
        Get.snackbar(
          "خطأ",
          errorMessage,
          snackPosition: SnackPosition.TOP,
          backgroundColor: firstBackColor,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  addmakeDay(int place_id, int type_id, String date_and_time, int numOfDay, List<dynamic>? extensions) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await reservationsData.addmakeDay(place_id, type_id, date_and_time, numOfDay , extensions);
    print("-----------------------------controller $response--------------------");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "Success") {
        print("Success");
        MakeDayModel makeDayModel = MakeDayModel.fromJson(response["model"]);
        goToReservationDetailsDay(makeDayModel);
        Get.toNamed(AppRoute.reservations);
      } else if (response["status"] == "Error") {
        String errorMessage = response['message'] ?? 'حدث خطأ غير معروف';
        if (response['error_list'] != null) {
          errorMessage = response['error_list'].values.join(', ');
        }
        Get.snackbar(
          "خطأ",
          errorMessage,
          snackPosition: SnackPosition.TOP,
          backgroundColor: firstBackColor,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  getMyReservations() async{
    statusRequest = StatusRequest.loading ;
    update();
    var response = await reservationsData.getMyReservations();
    print("-----------------------------controller $response--------------------");
    statusRequest=handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response["status"] == "Success" ){
        List listData = response['model'];
        myreservations.addAll(listData.map((e) => MyReservationsModel.fromJson(e)));
      } else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToReservationDetails(dynamic makeReservation) {
    if (makeReservation is MakeHoursModels) {
      Get.toNamed(AppRoute.reservations, arguments: {
        "makehours": makeReservation,
      });
    } else if (makeReservation is MakeDayModel) {
      Get.toNamed(AppRoute.reservations, arguments: {
        "makeday": makeReservation,
      });
    }
  }

  @override
  goToReservationDetailsDay(MakeDayModel makeDay) {
    Get.toNamed(AppRoute.reservations, arguments: {
      "makeday": makeDay,
    });
  }

  @override
  intialData() {
    getMyReservations();
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';
import '../core/constant/color.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingData.dart';
import '../data/datasource/remote/reservations_data.dart';

abstract class ReservationDetailsController extends GetxController {
  intialData();
}

class ReservationDetailsControllerImp extends ReservationDetailsController {
  ReservationsData reservationsData = ReservationsData(Get.find());

  List data = [];
  late StatusRequest statusRequest;
  late dynamic makeReservation;

  intialData() {
    makeReservation = Get.arguments['makehours'] ?? Get.arguments['makeday'];
  }

  addReservationsHours(int place_id, int type_id, String date_and_time, String start_time, String end_time, List<dynamic>? extensions) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await reservationsData.addReservationsHours(place_id, type_id, date_and_time, start_time, end_time, extensions);
    print("-----------------------------controller $response--------------------");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "Success") {
        print("Success");
        Get.snackbar(
          "نجاح",
          "تم الحجز بنجاح",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
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

  addReservationsDays(int place_id, int type_id, String date_and_time, int numOfDay, List<dynamic>? extensions) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await reservationsData.addReservationsDays(place_id, type_id, date_and_time, numOfDay, extensions);
    print("-----------------------------controller $response--------------------");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "Success") {
        print("Success");
        Get.snackbar(
          "نجاح",
          "تم الحجز بنجاح",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
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

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}

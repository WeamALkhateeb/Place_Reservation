import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controller/home_controller.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlingData.dart';
import '../data/datasource/remote/addrequest_data.dart';

abstract class AddRequestcontroller extends GetxController {

  Future<void> sendRequest(
      String name ,String goverment,
      String city,String area,
      String street,int maximumCapacity,
      String pricePerHour,String space,
      String categoryId,String dayHour,
      List<String> types,List<List<String>> extensions,
      List<List<String>> availableTimes,File image,
      List<File> images,String token
      );
// void setAvailableTimes(List<Map<String, String>> times);
}
class AddRequestcontrollerImp extends AddRequestcontroller {

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  AddRequestData addRequestData = AddRequestData(Get.find());
  late HomeController homeController ;
  late TextEditingController placename;
  late TextEditingController placemaximumcapacity;
  late TextEditingController priceperhour;
  late TextEditingController placespace;
  late TextEditingController typeinformation;
  String selectiontime = "DAYS";

  late TextEditingController goverment;
  late TextEditingController city;
  late TextEditingController area;
  late TextEditingController street;

  late TextEditingController namevalue;
  late TextEditingController descriptionvalue;
  late TextEditingController pricevalue;
  List<List<String>> extensions = [];
  List<List<String>> availableTimes = [];
  List categories = [];
  List<String> types=[];
  String categoriesSelection = '';

  StatusRequest? statusRequest;

  @override
  void setAvailableTimes(List<List<String>> times) {
    availableTimes = times;
  }

  @override
  Future<void> sendRequest(
      String name,
      String goverment,
      String city,
      String area,
      String street,
      int maximumCapacity,
      String pricePerHour,
      String space,
      String categoryId,
      String dayHour,
      List<String> types,
      List<List<String>> extensions,
      List<List<String>> availableTimes,
      File image,
      List<File> images,
      String token
      ) async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await addRequestData.addRequest(
          name,
          goverment,
          city,
          area,
          street,
          maximumCapacity,
          double.parse(pricePerHour).toString(),
          double.parse(space).toString(),
          categoryId,
          dayHour,
          types,
          extensions,
          availableTimes,
          image,
          images,
          token
      );

      statusRequest = handlingData(response);
      response.fold(
            (failure) {
          print('Failed: $failure');
          Get.rawSnackbar(
            title: "Failed",
            messageText: const Text("Failed to send request"),
          );
        },
            (data) {
          if (data['status'] == 'Success') {
            Get.rawSnackbar(
              title: "success",
              messageText: const Text("The request has been sent successfully"),
            );
          } else {
            print('Failed: ${data["message"]}');
            Get.rawSnackbar(
              title: "Failed",
              messageText: const Text("Failed to send request"),
            );
          }
        },
      );
      statusRequest = StatusRequest.failure;
      Get.rawSnackbar(
        title: "Error",
        messageText: const Text("An error occurred while sending the request"),
      );
    } else {
      print('Form is not valid');
    }
  }


  @override
  void onInit() {
    placename = TextEditingController();
    placemaximumcapacity = TextEditingController();
    priceperhour = TextEditingController();
    placespace = TextEditingController();
    goverment = TextEditingController();
    city = TextEditingController();
    area = TextEditingController();
    street = TextEditingController();
    typeinformation = TextEditingController();
    namevalue = TextEditingController();
    descriptionvalue = TextEditingController();
    pricevalue = TextEditingController();
    HomeControllerImp homeController = Get.find<HomeControllerImp>();
    categories = homeController.categories;
    super.onInit();
  }

  @override
  void dispose() {
    placename.dispose();
    placemaximumcapacity.dispose();
    priceperhour.dispose();
    placespace.dispose();
    goverment.dispose();
    city.dispose();
    area.dispose();
    street.dispose();
    typeinformation.dispose();
    namevalue.dispose();
    descriptionvalue.dispose();
    pricevalue.dispose();
    super.dispose();
  }
}
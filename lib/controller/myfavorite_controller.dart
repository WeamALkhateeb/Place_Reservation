import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/core/class/statusrequest.dart';
import '../core/functions/handlingData.dart';
import '../data/datasource/remote/myfavorite_data.dart';
import '../data/model/myfavorite.dart';

class MyFavoriteController extends GetxController {
  late StatusRequest statusRequest;
  TextEditingController? search;
  bool isSearch = false;
  List<MyFavoriteModel> data = [];

  MyFavoriteData favoriteData = MyFavoriteData(Get.find());

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.getData();
    print("========================= $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "Success") {
        print("wwwwwwwwwwwwwwwwwwwwwwwwwww");
        List listData = response['model'];
        data.addAll(listData.map((e) => MyFavoriteModel.fromJson(e)).toList());
        print(response);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}

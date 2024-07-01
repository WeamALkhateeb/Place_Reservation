import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/appLink.dart';
import 'package:project2/core/class/statusrequest.dart';
import 'package:project2/data/datasource/static.dart';
import '../core/functions/handlingData.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/favorite_places_data.dart';
import '../data/model/myfavorite.dart';



class FavoriteController extends GetxController {
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  TextEditingController? Search;
  bool isSearch = false;
  List<MyFavoriteModel> data = [];
  FavoriteData favoriteData = FavoriteData(Get.find());
  Map isfavorite = {};
 String? favid;

  setFavorite(id, val) {
    isfavorite[id] = val;
    update();
  }

  addfav(String place_id) async {
    statusRequest = StatusRequest.loading;
    update();

    String? userId = myServices.sharedPreferances.getString("id");

    if (userId == null) {
      // التعامل مع الحالة الفارغة
      Get.rawSnackbar(
        title: "خطأ",
        messageText: const Text("لم يتم العثور على معرف المستخدم"),
      );
      statusRequest = StatusRequest.failure;
      update();
      return;
    }

    var response = await favoriteData.addfavorite(userId, place_id);
    print("========controller $response");
    statusRequest = handlingData(response);
    favid = response['model']['id'].toString();
    print("asksakkkkkkkkdssds----------------------${favid}");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print("asksakkkkkkkkdssds----------------------${favid}");
        Get.rawSnackbar(
          title: "اشعار",
          messageText: const Text("تم اضافة المنتج الى fav"),
        );
      }
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  deletefav(String place_id) async {
    statusRequest = StatusRequest.loading;
    update();
    String? userId = myServices.sharedPreferances.getString("id");
    if (userId == null) {
      Get.rawSnackbar(
        title: "خطأ",
        messageText: const Text("لم يتم العثور على معرف المستخدم"),
      );
      statusRequest = StatusRequest.failure;
      update();
      return;
    }
    var response = await favoriteData.deletefavorite(userId, place_id,"${AppLink.deletefav}""${favid}");
    print("========controller $response");
    statusRequest = handlingData(response);
    if (response['status'] == "success") {
      Get.rawSnackbar(
        title: "اشعار",
        messageText: const Text("تم حذف المنتج الى السلة"),
      );
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }
}

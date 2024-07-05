import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/appLink.dart';
import 'package:project2/core/class/statusrequest.dart';
import '../core/functions/handlingData.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/favorite_places_data.dart';
import '../data/model/myfavorite.dart';
import '../data/model/placesmodel.dart';

class FavoriteController extends GetxController {
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  TextEditingController? Search;
  bool isSearch = false;
  List<MyFavoriteModel> data = [];
  FavoriteData favoriteData = FavoriteData(Get.find());
  Map<int, String> favidMap = {};
  Map<int, bool> isfavorite = {};
  String? placesid;

  @override
  void onInit() {
    super.onInit();
    loadInitialFavorites();
  }

  void loadInitialFavorites() {
    List<PlacesModel> placesList = [];
    for (var place in placesList) {
      isfavorite[place.id!] = place.isFavourite == 1;
    }
    update();
  }

  setFavorite(int id, bool val) {
    isfavorite[id] = val;
    update();
  }

  addfav(int place_id) async {
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
    var response = await favoriteData.addfavorite(userId, place_id.toString());
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success && response['status'] == "success") {
      if (response['model'] != null && response['model']['id'] != null) {
        favidMap[place_id] = response['model']['id'].toString();
        setFavorite(place_id, true);
        Get.rawSnackbar(
          title: "اشعار",
          messageText: const Text("تم اضافة المنتج الى fav"),
        );
      } else {
        print("Error: favid not found in the response");
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
  }

  deletefav(int place_id) async {
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
    String? favid = favidMap[place_id];
    if (favid == null) {
      Get.rawSnackbar(
        title: "خطأ",
        messageText: const Text("لم يتم العثور على معرف المفضلة"),
      );
      statusRequest = StatusRequest.failure;
      update();
      return;
    }

    var response = await favoriteData.deletefavorite(userId, place_id.toString(), "${AppLink.deletefav}$favid");
    print("========controller $response");
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success && response['status'] == "Success") {
      setFavorite(place_id, false);
      favidMap.remove(place_id);
      Get.rawSnackbar(
        title: "اشعار",
        messageText: const Text("تم حذف المنتج من المفضلة"),
      );
    } else {
      statusRequest = StatusRequest.failure;
    }
  }

}

import 'package:get/get.dart';
import 'package:project2/appLink.dart';
import 'package:project2/core/class/statusrequest.dart';
import 'package:project2/data/datasource/remote/Auth/places_data.dart';
import '../core/functions/handlingData.dart';

abstract class PlacesController extends GetxController {

  intialData();
  getPlaces(int categoryid);
}

class PlacesControllerImp extends PlacesController {

  int catid = Get.arguments["categoryid"];

  PlacesData placesData = PlacesData(Get.find());

  List data =[];
  late StatusRequest statusRequest ;


  @override
  intialData() {
    print(catid);
  }

  @override
  void onInit() {
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
}
import 'package:get/get.dart';
import 'package:project2/core/class/statusrequest.dart';
import 'package:project2/core/constant/routes.dart';
import 'package:project2/core/services/services.dart';
import 'package:project2/data/datasource/remote/home_data.dart';
import '../core/functions/handlingData.dart';

abstract class HomeController extends GetxController {

  initialData();
  getdata();
  goToPlaces(List categories, int categoryid);
}

class HomeControllerImp extends HomeController {

  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());

  List categories = [];

  late String user_name;
  late String id;

  late StatusRequest statusRequest;

  @override
  initialData() {
        user_name = myServices.sharedPreferances.toString();
        id = myServices.sharedPreferances.toString();
  }

  @override
  void onInit(){
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

  @override
  goToPlaces( categories, categoryid ) {
    Get.toNamed(AppRoute.places, arguments: {
      "categories"  : categories,
      "categoryid" : categoryid,
    }) ;
  }
}
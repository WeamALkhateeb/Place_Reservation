import 'package:get/get.dart';
import 'package:project2/core/class/statusrequest.dart';
import 'package:project2/core/services/services.dart';
import 'package:project2/data/datasource/remote/home_data.dart';
import '../core/functions/handlingData.dart';

abstract class HomeController extends GetxController {

  initialData();
  getdata();
}

class HomeControllerImp extends HomeController {

  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());

  List categories = [];

  late StatusRequest statusRequest;

  @override
  initialData() {

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
      categories.addAll(response['categories']);
     } else{
         statusRequest = StatusRequest.failure;
    }
    }
    update();
  }
}
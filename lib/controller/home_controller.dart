import 'package:get/get.dart';
import 'package:project2/core/services/services.dart';

class HomeController extends GetxController {

}

class HomeControllerImp extends HomeController {

  MyServices myServices = Get.find();


  initialData() {

  }

  @override
  void onInit(){
    initialData();
    super.onInit();
  }
}
import 'package:get/get.dart';
import 'package:project2/data/model/placesmodel.dart';

abstract class PlacesDetailsController extends GetxController{

}

class PlacesDetailsControllerImp extends PlacesDetailsController{
  late PlacesModel placesModel;
  var selectedExtensions = <int, bool>{} ;


  intialData(){
    placesModel = Get.arguments['placesmodel'];
  }

  void toggleExtension(int index) {
    selectedExtensions[index] = !(selectedExtensions[index] ?? false);
  }

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
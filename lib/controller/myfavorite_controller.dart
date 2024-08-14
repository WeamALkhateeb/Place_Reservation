import 'package:get/get.dart';
import 'package:project2/core/class/statusrequest.dart';
import 'package:project2/data/model/placesmodel.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingData.dart';
import '../data/datasource/remote/myfavorite_data.dart';
import '../data/model/myfavorite.dart';

class MyFavoriteController extends GetxController {
  late StatusRequest statusRequest;
  List<MyFavoriteModel> data = [];
  List<Place> dataplaces = [];
  MyFavoriteData favoriteData = MyFavoriteData(Get.find());

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.getData();
    print("========================= $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "Success") {
        List listData = response['model'];
        data.addAll(listData.map((e) => MyFavoriteModel.fromJson(e)).toList());

        // استخراج قائمة الأماكن فقط
        dataplaces.addAll(data.where((e) => e.place != null).map((e) => e.place!).toList());

        print(dataplaces);
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

  goToPlacesDetails(placesModel) {
    Get.toNamed(AppRoute.placesdetails, arguments: {
      "placesmodel" : placesModel,
    });
  }
}

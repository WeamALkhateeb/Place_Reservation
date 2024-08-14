import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controller/home_controller.dart';
import 'package:project2/core/class/handlingdataview.dart';
import '../../controller/favorite_places.dart';
import '../../controller/myfavorite_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    FavoriteController favoriteController = Get.put(FavoriteController());
    HomeControllerImp homeController = Get.put(HomeControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<MyFavoriteController>(
          builder: (controller) => ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: sixBackColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_outlined),
                        onPressed: () {
                          Get.offAllNamed(AppRoute.homepage);
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                     Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: sixBackColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "My Favorite",
                            style: TextStyle(
                              color: firstBackColor,
                              fontFamily:'DeliciousHandrawn',
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1.5,
                indent: 15,
                endIndent: 15,
              ),
              const SizedBox(height: 20,),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    var favoriteItem = controller.data[index];
                    var placeName = favoriteItem.place?.name ?? 'No Name';
                    var placeId = favoriteItem.place?.id;
                    var placeImage = (favoriteItem.place?.images != null && favoriteItem.place!.images!.isNotEmpty)
                        ? favoriteItem.place!.images![0].image
                        : "https://projectable.org/wp-content/uploads/2017/01/default-avatar_male-500x500.png";

                    if (favoriteController.isfavorite[placeId] == null) {
                      favoriteController.setFavorite(placeId!, favoriteItem.place!.isFavourite == 1);
                    }

                    return InkWell(
                      onTap: () {
                        controller.goToPlacesDetails(controller.dataplaces[index]);
                      },
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Card(
                              elevation: 10,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      placeName,
                                      style: const TextStyle(
                                        color: firstBackColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        GetBuilder<FavoriteController>(
                                          builder: (favoriteController) => IconButton(
                                            onPressed: () {
                                              bool isFavorite = favoriteController.isfavorite[placeId] ?? false;
                                              if(favoriteController.isfavorite[placeId] == true) {
                                                favoriteController.setFavorite(placeId!, false) ;
                                                favoriteController.addfav(placeId);
                                              } else if(favoriteController.isfavorite[placeId] == false) {
                                                favoriteController.setFavorite(placeId!, true) ;
                                                favoriteController.addfav(placeId);
                                              }
                                            },
                                            icon: Icon(
                                              favoriteController.isfavorite[placeId] == false
                                                  ? Icons.favorite_outlined
                                                  : Icons.favorite_border_rounded,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 50,
                            child: Image.network(
                              placeImage!,
                              height: 70,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
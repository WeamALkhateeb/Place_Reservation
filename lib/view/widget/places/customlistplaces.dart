import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controller/places_controller.dart';
import '../../../controller/favorite_places.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/placesmodel.dart';

class CustomListPlaces extends GetView<PlacesControllerImp> {
  final PlacesModel placesModel;

  const CustomListPlaces({Key? key, required this.placesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPlacesDetails(placesModel);
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
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${placesModel.name}",
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
                          builder: (controller) => IconButton(
                            onPressed: () {
                              bool isFavorite = controller.isfavorite[placesModel.id] ?? false;
                              if(controller.isfavorite[placesModel.id] == true) {
                                controller.setFavorite(placesModel.id!, false) ;
                                controller.addfav(placesModel.id!);
                              } else if(controller.isfavorite[placesModel.id] == false) {
                                controller.setFavorite(placesModel.id!, true) ;
                                controller.addfav(placesModel.id!);
                              }
                            },
                            icon: Icon(
                              controller.isfavorite[placesModel.id] == true
                                  ? Icons.favorite_outlined
                                  : Icons.favorite_border_rounded,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Rating:      ",
                          style: TextStyle(
                            color: firstBackColor,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Center(
                          child: StarRating(
                            starCount: 5,
                            rating: placesModel.rate?.toInt() ?? 1,
                            iconSize: 15,
                            color: firstBackColor,
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
            top: -20,
            left: 25,
            child: Image.network(
              (placesModel.images != null && placesModel.images!.isNotEmpty)
                  ? placesModel.images![0].image ?? ""
                  : "https://projectable.org/wp-content/uploads/2017/01/default-avatar_male-500x500.png",
              height: 70,
            ),
          ),
        ],
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final int starCount;
  final int rating;
  final double iconSize;
  final Color color;

  StarRating({
    required this.starCount,
    required this.rating,
    this.iconSize = 24.0,
    this.color = firstBackColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(starCount, (index) {
        return Icon(
          index < rating.floor() ? Icons.star : Icons.star_border,
          size: iconSize,
          color: color,
        );
      }),
    );
  }
}

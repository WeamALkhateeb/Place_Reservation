import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:project2/view/screen/onboarding.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/placesmodel.dart';

class CustomListPlaces extends StatelessWidget {
  final PlacesModel placesModel;
  const CustomListPlaces({Key? key, required this.placesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
          return InkWell(
            onTap: (){

            },
            child: Stack(
             clipBehavior: Clip.none,
              children: [
                Container(
                  padding:const EdgeInsets.symmetric(vertical: 10),
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${placesModel.name}",
                            style: const TextStyle(
                                color: firstBackColor,
                                fontSize:18,
                                fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {

                                  },
                                  icon: const Icon(Icons.favorite,size: 25,color: Colors.red,))
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

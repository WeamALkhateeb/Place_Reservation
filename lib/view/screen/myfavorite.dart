import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/core/class/handlingdataview.dart';
import '../../controller/myfavorite_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<MyFavoriteController>(
          builder: ((controller) => ListView(
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
                        const SizedBox(width: 10,),
                        Expanded(child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: sixBackColor,
                              contentPadding: const EdgeInsets.only(top: 10, bottom: 20),
                              hintText: 'search',
                              hintStyle: const TextStyle(fontSize: 15),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: sixBackColor, width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
                              prefixIcon: const Icon(Icons.search, color: fourBackColor,),
                            )
                        ),),
                      ]),
                ),
                HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.data.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,),
                    itemBuilder: (context, index) {
                      var favoriteItem = controller.data[index];
                      var placeName = favoriteItem.place?.name ?? 'No Name';
                      print(favoriteItem.place?.name);
                      return Card(
                        child: Center(
                          child: Text(placeName),
                        ),
                      );
                    },
                  ),
                )
              ]
          )),
        ),
      ),
    );
  }
}

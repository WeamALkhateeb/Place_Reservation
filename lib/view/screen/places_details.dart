import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controller/places_details_controller.dart';
import 'package:project2/core/constant/color.dart';
import '../../data/model/placesmodel.dart';
import '../widget/auth/materialbuttonauth.dart';

class PlacesDetails extends StatelessWidget {
  const PlacesDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlacesDetailsControllerImp controller = Get.put(PlacesDetailsControllerImp());
    final List<String> imageUrls = controller.placesModel.images?.map((image) => image.image ?? '').toList() ?? [];
    final List<Extensions> extensions = controller.placesModel.extensions ?? [];

    return Scaffold(
      bottomNavigationBar: MaterialButtonAuth(
        text: 'Reservation',
        onPressed: () {
          final selectedExtensionsList = controller.selectedExtensions.entries
              .where((entry) => entry.value)
              .map((entry) => extensions[entry.key])
              .toList();
        },
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 250.0,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: firstBackColor, width: 3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(
                          imageUrls[index],
                          width: 250,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        ' ${index + 1}',
                        style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1.5,
            indent: 15,
            endIndent: 15,
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              "${controller.placesModel.name}",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: firstBackColor,
                fontSize: 30,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              'Description',
              style: TextStyle(
                color: firstBackColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Maximum number of people : ${controller.placesModel.maximumCapacity}\n\n"
                  "Price_Per_Hour : ${controller.placesModel.pricePerHour} S.P \n\n "
                  "Space : ${controller.placesModel.space}",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(
            color: Colors.grey,
            thickness: 1.5,
            indent: 15,
            endIndent: 15,
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Extensions',
              style: TextStyle(
                color: firstBackColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          GetBuilder<PlacesDetailsControllerImp>(
            builder: (controller) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: extensions.length,
                itemBuilder: (context, index) {
                  final extension = extensions[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  extension.name ?? '',
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  extension.description ?? '',
                                  style: TextStyle(fontSize: 15),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Price: ${extension.price ?? 0} S.P',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            Transform.scale(
                              scale: 1.3,
                              child: Checkbox(
                                value: controller.selectedExtensions[index] ?? false,
                                onChanged: (bool? value) {
                                  controller.toggleExtension(index);
                                  controller.update();  // Notify GetBuilder to update the UI
                                },
                                activeColor: firstBackColor,
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

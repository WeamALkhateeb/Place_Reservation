import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/controller/places_details_controller.dart';
import 'package:project2/core/constant/color.dart';
import 'package:project2/view/widget/places/dialograting.dart';
import '../../data/model/placesmodel.dart';
import '../widget/auth/materialbuttonauth.dart';
import 'package:project2/controller/reservations_controller.dart';

class PlacesDetails extends StatelessWidget {
  const PlacesDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PlacesDetailsControllerImp controller = Get.put(PlacesDetailsControllerImp());
    final ReservationsControllerImp reservationsController = Get.put(ReservationsControllerImp());

    final List<String> imageUrls = controller.placesModel.images?.map((image) => image.image ?? '').toList() ?? [];
    final List<Extensions> extensions = controller.placesModel.extensions ?? [];
    final List<Types> types = controller.placesModel.types ?? [];
    final List<AvailableTimes> availableTimes = controller.placesModel.availableTimes ?? [];

    final Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
    final Rx<TimeOfDay?> selectedStartTime = Rx<TimeOfDay?>(null);
    final Rx<TimeOfDay?> selectedEndTime = Rx<TimeOfDay?>(null);
    final Rx<int?> selectedDays = Rx<int?>(null);

    Future<void> selectDate(BuildContext context) async {
      DateTime currentDate = DateTime.now();
      DateTime? selected = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(currentDate.year - 5),
        lastDate: DateTime(currentDate.year + 5),
      );

      if (selected != null && selected != selectedDate.value) {
        selectedDate.value = selected;
      }
    }

    Future<void> selectStartTime(BuildContext context) async {
      TimeOfDay? selected = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selected != null) {
        selectedStartTime.value = selected;
      }
    }

    Future<void> selectEndTime(BuildContext context) async {
      TimeOfDay? selected = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selected != null) {
        selectedEndTime.value = selected;
      }
    }

    String formatNumber(int number) {
      return number.toString().padLeft(2, '0');
    }

    return Scaffold(
      bottomNavigationBar: MaterialButtonAuth(
        text: 'Reservation'.tr,
        onPressed: () {
          final selectedExtensionsList = controller.selectedExtensions.entries
              .where((entry) => entry.value)
              .map((entry) => extensions[entry.key].id)
              .toList();
          final selectedTypeList = controller.selectedType.entries
              .where((entry) => entry.value)
              .map((entry) => types[entry.key].id)
              .toList();
          final selectedTimesList = controller.selectedTimes.entries
              .where((entry) => entry.value)
              .map((entry) => availableTimes[entry.key])
              .toList();

          if (controller.placesModel.day_hour == 'HOURS') {
            if (selectedDate.value == null || selectedStartTime.value == null || selectedEndTime.value == null) {
              Get.snackbar(
                "Error".tr,
                "You must choose the date, start time and end time".tr,
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.red,
                colorText: Colors.white,
                duration: const Duration(seconds: 3),
              );
              return;
            }

            String date = '${selectedDate.value!.year}-${formatNumber(selectedDate.value!.month)}-${formatNumber(selectedDate.value!.day)}';
            String startTime = '${formatNumber(selectedStartTime.value!.hour)}:${formatNumber(selectedStartTime.value!.minute)}:00';
            String endTime = '$date ${formatNumber(selectedEndTime.value!.hour)}:${formatNumber(selectedEndTime.value!.minute)}:00';

            int? typeId = selectedTypeList.isNotEmpty ? selectedTypeList.first : 0;
            List<dynamic>? extensionsIds = (selectedExtensionsList.isNotEmpty ? selectedExtensionsList : null)?.cast<dynamic>();

            reservationsController.addmakeHour(
                controller.placesModel.id!,
                typeId!,
                date,
                startTime,
                endTime,
                extensionsIds
            );
          } else {
            if (selectedDate.value == null || selectedDays.value == null) {
              Get.snackbar(
                "Error".tr,
                "You must choose the date and number of days".tr,
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.red,
                colorText: Colors.white,
                duration: const Duration(seconds: 3),
              );
              return;
            }

            String date = '${selectedDate.value!.year}-${formatNumber(selectedDate.value!.month)}-${formatNumber(selectedDate.value!.day)}';
            int days = selectedDays.value!;

            int? typeId = selectedTypeList.isNotEmpty ? selectedTypeList.first : 0;
            List<dynamic>? extensionsIds = (selectedExtensionsList.isNotEmpty ? selectedExtensionsList : null)?.cast<dynamic>();

            reservationsController.addmakeDay(
                controller.placesModel.id!,
                typeId!,
                date,
                days,
                extensionsIds
            );
          }
        },
      ),
      body: GetBuilder<PlacesDetailsControllerImp>(
        builder: (controller) => ListView(
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
                          style: const TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
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
                "${controller.placesModel.name} ",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: firstBackColor,
                  fontSize: 30,
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Description'.tr,
                style: const TextStyle(
                  color: firstBackColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                "maximumCapacity :".tr +"${controller.placesModel.maximumCapacity}\n"+
                    "pricePerHour :".tr +"${controller.placesModel.pricePerHour}\n"+
                    "space :".tr +"${controller.placesModel.space}\n"+
                    "address :".tr +"${controller.placesModel.address?.goverment}_${controller.placesModel.address?.city}_${controller.placesModel.address?.area}",
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  showDialogRating(context, controller.placesModel.id.toString());
                },
                style: ElevatedButton.styleFrom(
                  primary: firstBackColor,
                ),
                child: Text('RATING'.tr),
              ),
            ),

             Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Extensions'.tr,
                style: const TextStyle(
                  color: firstBackColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
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
                                    controller.update();
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
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Types'.tr,
                style: const TextStyle(
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
                  itemCount: types.length,
                  itemBuilder: (context, index) {
                    final type = types[index];
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
                                    type.name ?? '',
                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Transform.scale(
                                scale: 1.3,
                                child: Checkbox(
                                  value: controller.selectedType[index] ?? false,
                                  onChanged: (bool? value) {
                                    controller.toggleType(index);
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
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Available Times'.tr,
                style: const TextStyle(
                  color: firstBackColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ExpansionTile(
                title: Text(
                  'View Available Times'.tr,
                  style: const TextStyle(
                    color: firstBackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                children: availableTimes.where((time) {
                  // تحقق من النمط قبل العرض
                  if (controller.placesModel.day_hour == 'HOURS') {
                    return true; // عرض جميع الأوقات (الأيام مع الساعات)
                  } else if (controller.placesModel.day_hour == 'DAYS') {
                    return true; // عرض الأيام فقط
                  }
                  return false;
                }).map((time) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // عرض الأوقات المتاحة بناءً على النمط
                        if (controller.placesModel.day_hour == 'HOURS')
                          Text(
                            '${time.day}:   ${time.fromTime}   -   ${time.toTime}',
                            style: const TextStyle(fontSize: 15),
                          )
                        else if (controller.placesModel.day_hour == 'DAYS')
                          Text(
                            '${time.day}', // عرض اليوم فقط دون الساعات
                            style: const TextStyle(fontSize: 15),
                          ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Obx(() => Text(
                      selectedDate.value == null
                          ? 'choose date :'.tr
                          : '${selectedDate.value!.year}-${formatNumber(selectedDate.value!.month)}-${formatNumber(selectedDate.value!.day)}',
                      style: const TextStyle(fontSize: 18, color: firstBackColor),
                    )),

                  ),
                  ElevatedButton(
                    onPressed: () {
                      selectDate(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: firstBackColor,
                    ),
                    child:  Text('choose date'.tr),
                  ),
                ],
              ),
            ),
            if (controller.placesModel.day_hour == 'HOURS') ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Obx(() => Text(
                        selectedStartTime.value == null
                            ? 'choose startTime :'.tr
                            : '${formatNumber(selectedStartTime.value!.hour)}:${formatNumber(selectedStartTime.value!.minute)}',
                        style: const TextStyle(fontSize: 18),
                      )),

                    ),
                    ElevatedButton(
                      onPressed: () {
                        selectStartTime(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: firstBackColor,
                      ),
                      child:  Text('choose startTime'.tr),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Obx(() => Text(
                        selectedEndTime.value == null
                            ? 'choose endTime :'.tr
                            : '${formatNumber(selectedEndTime.value!.hour)}:${formatNumber(selectedEndTime.value!.minute)}',
                        style: const TextStyle(fontSize: 18),
                      )),

                    ),
                    ElevatedButton(
                      onPressed: () {
                        selectEndTime(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: firstBackColor,
                      ),
                      child:  Text('choose endTime'.tr),
                    ),
                  ],
                ),
              ),
            ] else if (controller.placesModel.day_hour == 'DAYS') ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child:Obx(() =>  Text(
                        selectedDays.value == null
                            ? 'choose number of days :'
                            : '${selectedDays.value} days',
                        style: const TextStyle(fontSize: 18, color: firstBackColor),
                      ),),
                    ),
                    DropdownButton<int>(
                      value: selectedDays.value,
                      onChanged: (int? newValue) {
                        selectedDays.value = newValue;
                      },
                      items: List.generate(30, (index) => index + 1).map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text('$value days'),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/core/constant/imageassest.dart';
import 'package:project2/core/constant/routes.dart';
import '../../controller/ReservationDetails_controller.dart';
import '../../core/constant/color.dart';
import '../../data/model/makeDay.dart';
import '../../data/model/makehours.dart';
import '../widget/auth/materialbuttonauth.dart';

class Reservations extends StatelessWidget {
  const Reservations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReservationDetailsControllerImp reservationDetailsController = Get.put(ReservationDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: MaterialButtonAuth(
        text: 'AGREE'.tr,
        onPressed: () {
          if (reservationDetailsController.makeReservation is MakeHoursModels) {
            reservationDetailsController.addReservationsHours(
                reservationDetailsController.makeReservation.placeId,
                reservationDetailsController.makeReservation.typeId,
                reservationDetailsController.makeReservation.dateAndTime,
                reservationDetailsController.makeReservation.startTime,
                reservationDetailsController.makeReservation.endTime,
                reservationDetailsController.makeReservation.extensions);
          }
          else if (reservationDetailsController.makeReservation is MakeDayModel) {
            reservationDetailsController.addReservationsDays(
                reservationDetailsController.makeReservation.placeId,
                reservationDetailsController.makeReservation.typeId,
                reservationDetailsController.makeReservation.dateAndTime,
                reservationDetailsController.makeReservation.numOfDay,
                reservationDetailsController.makeReservation.extensions);
          }
        },
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.center,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: IconButton(onPressed: (){
                      Get.toNamed(AppRoute.placesdetails);
                    }, icon: const Icon(Icons.arrow_back_ios)),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    alignment: Alignment.center,
                    child:  Text(
                      "Reservations Details".tr,
                      style : const TextStyle(
                        color: firstBackColor,
                        fontFamily: 'DeliciousHandrawn',
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 5,
            decoration: BoxDecoration(
              color: firstBackColor.withAlpha(180),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Card(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.asset(AppImageAsset.question),
                      ),
                      const SizedBox(width: 30),
                       Expanded(
                        flex: 3,
                        child: ListTile(
                          title: Text(
                            "Do you agree to the Reservation?".tr,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                if (reservationDetailsController.makeReservation is MakeHoursModels) ...[
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "StartTime:".tr +"${reservationDetailsController.makeReservation.startTime}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "EndTime:".tr+"${reservationDetailsController.makeReservation.endTime}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
                if (reservationDetailsController.makeReservation is MakeDayModel) ...[
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "DateAndTime:".tr+"${reservationDetailsController.makeReservation.dateAndTime}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "NumOfDay:".tr +"${reservationDetailsController.makeReservation.numOfDay}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 25),
                Card(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.center,
                    child: Text(
                      "TotalPrice:".tr+"${reservationDetailsController.makeReservation.totalPrice} S.P",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

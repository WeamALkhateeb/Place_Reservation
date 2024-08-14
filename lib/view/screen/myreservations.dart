import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/view/widget/myreservations/customlistreservations.dart';
import '../../controller/favorite_places.dart';
import '../../controller/reservations_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';

class MyReservations extends StatelessWidget {
  const MyReservations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Get.put(ReservationsControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<ReservationsControllerImp>(
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
                            "My Reservations",
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
              const SizedBox(height: 10,),
              Container(
                color: white,
                padding:const EdgeInsets.all(8),
                child: Column(
                  children: [
                    ...List.generate(
                        controller.myreservations.length,
                            (index) => CustomListReservations(
                          name:"${controller.myreservations[index].place?.name}",
                          totalPrice:"${controller.myreservations[index].totalPrice}",
                              endTime: "${controller.myreservations[index].endTime}",
                              day: "${controller.myreservations[index].day}",
                              dateAndTime: "${controller.myreservations[index].dateAndTime}",
                              start_time: "${controller.myreservations[index].startTime}",
                    ),
                   )
                ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
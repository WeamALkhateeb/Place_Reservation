import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:project2/controller/places_details_controller.dart';
import 'package:project2/core/constant/color.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../../core/constant/imageassest.dart';

void showDialogRating(BuildContext context ,String place_id){
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      title:const Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: firstBackColor,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      message:const Text(
        'You can rate the place and write any feedback',
        textAlign: TextAlign.center,
        style:  TextStyle(fontSize: 15),
      ),
      image:Image.asset(AppImageAsset.question,height: 150,width: 150,),
      submitButtonText: 'Submit',
      submitButtonTextStyle:const TextStyle(
        color: Colors.deepOrangeAccent,
        fontWeight: FontWeight.bold,
      ),
      commentHint: 'Feedback',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        PlacesDetailsControllerImp controller = Get.find() ;
        controller.submitRating(int.parse(place_id),response.comment,response.rating.toInt());
      },
    ),
  );
}
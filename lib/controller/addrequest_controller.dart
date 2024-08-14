import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project2/controller/home_controller.dart';
import 'package:project2/data/datasource/remote/addrequest_data.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlingData.dart';



abstract class AddRequestcontroller extends GetxController{
  Sendrequest( File image , List<File> images );

}

class AddRequestcontrollerImp extends AddRequestcontroller{

  GlobalKey<FormState> formstate =GlobalKey<FormState>();
  HomeControllerImp homeControllerImp = Get.put(HomeControllerImp());
  late TextEditingController placename;
  late TextEditingController placemaximumcapacity;
  late TextEditingController priceperhour;
  late TextEditingController placespace;
  late TextEditingController typeinformation;
  String selectiontime = "DAYS";
  List<String> Type=[];
  //location
  late TextEditingController goverment;
  late TextEditingController city;
  late TextEditingController area;
  late TextEditingController street;
  //extensions
  late TextEditingController namevalue;
  late TextEditingController descriptionvalue;
  late TextEditingController pricevalue;
  List<String> extensions = [];

  String categorieselection = '';
  List<String> availabletimes = [''];

  StatusRequest? statusRequest ;


  @override
  Sendrequest( File image, List<File> images) async {
    var formdata = formstate.currentState;
    if(formdata!.validate())
    {
      statusRequest = StatusRequest.loading ;
      update();
      print('111111111111111');

      String typesJson = jsonEncode(Type);

      String  extensionsJson = jsonEncode(extensions);


      String availabletimesJson = jsonEncode(availabletimes);

      var response = await  AddrequestData.postdata(
          placename.text ,
          goverment.text,
          city.text,
          area.text,
          street.text,
          placemaximumcapacity.text,
          priceperhour.text,
          placespace.text,
          '1',
          extensionsJson ,
          typesJson ,
          availabletimesJson ,
          selectiontime,
          images ,
          image );

      print("-----------------------------controller $response--------------------");
      statusRequest=handlingData(response);
      if(StatusRequest.success == statusRequest)
      { if(response["status"] == "Success" )
      {
        //Get.offNamed(AppRoute.homepage);
        print('Successssssssssssssssssssssssssssssssssssssssssssss');
      }
      else
        {statusRequest = StatusRequest.failure;}

      }
      update();
    }


  }

  @override
  void onInit(){
    placename = TextEditingController();
    placemaximumcapacity = TextEditingController();
    priceperhour= TextEditingController();
    placespace= TextEditingController();
    goverment= TextEditingController();
    city= TextEditingController();
    area= TextEditingController();
    street= TextEditingController();
    typeinformation = TextEditingController();
    namevalue = TextEditingController();
    descriptionvalue = TextEditingController();
    pricevalue = TextEditingController();
    super.onInit();
  }



  void dispose(){

    placename.dispose();
    placemaximumcapacity.dispose();
    priceperhour.dispose();
    placespace.dispose();
    goverment.dispose();
    city.dispose();
    area.dispose();
    street.dispose();
    typeinformation.dispose();
    namevalue.dispose();
    descriptionvalue.dispose();
    pricevalue.dispose();
    super.dispose();
  }


}
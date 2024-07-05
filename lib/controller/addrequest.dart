import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project2/data/datasource/remote/addrequest.dart';
import '../core/class/statusrequest.dart';
import '../core/functions/handlingData.dart';



abstract class AddRequestcontroller extends GetxController{
  Sendrequest(  _imageFiles ,  image);

}

class AddRequestcontrollerImp extends AddRequestcontroller{

  GlobalKey<FormState> formstate =GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController placename;
  late TextEditingController placedetails;
  late TextEditingController goverment;
  late TextEditingController city;
  late TextEditingController area;
  late TextEditingController street;
  StatusRequest? statusRequest ;




  @override
  Sendrequest( _imageFiles , image,) async {
    var formdata = formstate.currentState;
    if(formdata!.validate())
    {
      statusRequest = StatusRequest.loading ;
      update();
      print('111111111111111');

      var response = await  AddrequestData.postdata(username.text ,placename.text, placedetails.text, _imageFiles , image,);
      print("-----------------------------controller $response--------------------");
      statusRequest=handlingData(response);
      if(StatusRequest.success == statusRequest)
      { if(response["status"] == "Success" )
      {
        //Get.offNamed(AppRoute.homepage);
        print('33333333333333333333333');
      }
      else
      {  Get.defaultDialog(title: "warning" , middleText: "User name or Password Not Correct ");
      statusRequest = StatusRequest.failure;
      }
      }
      update();
    }


  }

  @override

  void onInit(){
    username = TextEditingController();
    placename = TextEditingController();
    placedetails = TextEditingController();
    goverment= TextEditingController();
    city= TextEditingController();
    area= TextEditingController();
    street= TextEditingController();
    super.onInit();
  }



  void dispose(){
    username.dispose();
    placename.dispose();
    placedetails.dispose();
    goverment.dispose();
    city.dispose();
    area.dispose();
    street.dispose();
    super.dispose();
  }


}
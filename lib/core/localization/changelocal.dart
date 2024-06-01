import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../services/services.dart';



class LocaleController extends GetxController{

  Locale? language ;

  MyServices myServices = Get.find() ;

  void changeLang(String langcode){
    Locale locale = Locale(langcode) ;
    myServices.sharedPreferances.setString("lang", langcode);
    Get.updateLocale(locale) ;
  }


  @override
  void onInit(){
    String? sharedPrefLang = myServices.sharedPreferances.getString("lang") ;
    if(sharedPrefLang == "ar"){
      language = const Locale("ar") ;
    }
    else if(sharedPrefLang == "en"){
      language = const Locale("en") ;
    }
    else{
      language = Locale(Get.deviceLocale!.languageCode) ;
    }
  }
}
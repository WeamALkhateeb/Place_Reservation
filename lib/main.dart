import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/core/localization/changelocal.dart';
import 'package:project2/core/localization/translation.dart';
import 'package:project2/core/services/services.dart';
<<<<<<< HEAD
import 'package:project2/view/screen/addrequest.dart';
=======
import 'package:project2/view/screen/home.dart';
import 'package:project2/view/screen/home_screen.dart';
import 'package:project2/view/screen/language.dart';
import 'package:project2/view/screen/auth/login.dart';
import 'package:project2/view/screen/onboarding.dart';
import 'package:project2/view/screen/places.dart';
>>>>>>> 75292a6ee82d2f5df4801153b356fe1fd56de4a4
import 'bindings/intialbindings.dart';
import 'routes.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      locale: controller.language,
<<<<<<< HEAD
      home: AddRequest(),
=======
      home: const Login(),
>>>>>>> 75292a6ee82d2f5df4801153b356fe1fd56de4a4
      initialBinding: initalBindings(),
      getPages: routes ,

    );
  }
}



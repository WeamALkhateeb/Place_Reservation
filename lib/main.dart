import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/core/localization/changelocal.dart';
import 'package:project2/core/localization/translation.dart';
import 'package:project2/core/services/services.dart';
import 'package:project2/routes.dart';
import 'package:project2/view/screen/auth/login.dart';
import 'package:project2/view/screen/language.dart';
import 'package:project2/view/screen/reservations.dart';
import 'bindings/intialbindings.dart';


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
      home:  const Login(),
      initialBinding: initalBindings(),
      getPages: routes ,

    );
  }
}



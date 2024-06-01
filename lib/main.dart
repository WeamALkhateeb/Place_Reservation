import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project2/view/screen/auth/login.dart';
import 'package:project2/view/screen/onboarding.dart';

import 'routes.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
      routes: routes ,

    );
  }
}



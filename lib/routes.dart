import 'package:flutter/material.dart';
import 'package:project2/core/constant/routes.dart';
import 'package:project2/view/screen/auth/login.dart';
import 'package:project2/view/screen/language.dart';
import 'package:project2/view/screen/onboarding.dart';

Map<String, Widget Function(BuildContext)> routes = {
    AppRoute.language : (context) => const Language(),
    AppRoute.onboarding : (context) => const OnBoarding(),
    AppRoute.login : (context) => const Login()
};
import 'package:flutter/material.dart';
import 'package:project2/view/screen/addrequest.dart';
import 'package:project2/view/screen/auth/login.dart';
import 'package:project2/view/screen/auth/register.dart';
import 'package:project2/view/screen/home.dart';
import 'package:project2/view/screen/language.dart';
import 'package:project2/view/screen/onboarding.dart';
import 'core/constant/routes.dart';

Map<String, Widget Function(BuildContext)> routes = {
    AppRoute.language : (context) => const Language(),
    AppRoute.onboarding : (context) => const OnBoarding(),
    AppRoute.login : (context) => const Login(),
    AppRoute.register : (context) => const Register(),
    AppRoute.homepage : (context) => const HomePage(),
    AppRoute.addrequest: (context) =>  AddRequest(),

};
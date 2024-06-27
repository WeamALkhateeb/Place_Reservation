import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:project2/view/screen/addrequest.dart';
=======
import 'package:get/get_navigation/src/routes/get_route.dart';
>>>>>>> 75292a6ee82d2f5df4801153b356fe1fd56de4a4
import 'package:project2/view/screen/auth/login.dart';
import 'package:project2/view/screen/auth/register.dart';
import 'package:project2/view/screen/home_screen.dart';
import 'package:project2/view/screen/language.dart';
import 'package:project2/view/screen/onboarding.dart';
import 'package:project2/view/screen/places.dart';
import 'core/constant/routes.dart';

<<<<<<< HEAD
Map<String, Widget Function(BuildContext)> routes = {
    AppRoute.language : (context) => const Language(),
    AppRoute.onboarding : (context) => const OnBoarding(),
    AppRoute.login : (context) => const Login(),
    AppRoute.register : (context) => const Register(),
    AppRoute.homepage : (context) => const HomePage(),
    AppRoute.addrequest: (context) =>  AddRequest(),

};
=======
List<GetPage<dynamic>>? routes = [
    GetPage(name: AppRoute.language, page: ()=> const Language()),
    GetPage(name: AppRoute.onboarding, page: ()=> const OnBoarding()),
    GetPage(name: AppRoute.login, page: ()=> const Login()),
    GetPage(name: AppRoute.register, page: ()=> const Register()),
    GetPage(name: AppRoute.homepage, page: ()=> const HomeScreen()),
    GetPage(name: AppRoute.places, page: ()=> const Places()),
    // AppRoute.login : (context) => const Login(),
    // AppRoute.register : (context) => const Register(),
    // AppRoute.homepage : (context) => const HomeScreen(),
    // AppRoute.places : (context) =>  const Places(),
];
>>>>>>> 75292a6ee82d2f5df4801153b356fe1fd56de4a4

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:project2/view/screen/auth/login.dart';
import 'package:project2/view/screen/auth/register.dart';
import 'package:project2/view/screen/home_screen.dart';
import 'package:project2/view/screen/language.dart';
import 'package:project2/view/screen/onboarding.dart';
import 'package:project2/view/screen/places.dart';
import 'package:project2/view/screen/places_details.dart';
import 'core/constant/routes.dart';

List<GetPage<dynamic>>? routes = [
    GetPage(name: AppRoute.language, page: ()=> const Language()),
    GetPage(name: AppRoute.onboarding, page: ()=> const OnBoarding()),
    GetPage(name: AppRoute.login, page: ()=> const Login()),
    GetPage(name: AppRoute.register, page: ()=> const Register()),
    GetPage(name: AppRoute.homepage, page: ()=> const HomeScreen()),
    GetPage(name: AppRoute.places, page: ()=> const Places()),
    GetPage(name: AppRoute.placesdetails, page: ()=>  const PlacesDetails()),
];


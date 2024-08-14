import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:project2/data/model/myreservations.dart';
import 'package:project2/view/screen/aboutas.dart';
import 'package:project2/view/screen/auth/login.dart';
import 'package:project2/view/screen/auth/register.dart';
import 'package:project2/view/screen/contactas.dart';
import 'package:project2/view/screen/home_screen.dart';
import 'package:project2/view/screen/language.dart';
import 'package:project2/view/screen/myreservations.dart';
import 'package:project2/view/screen/onboarding.dart';
import 'package:project2/view/screen/places.dart';
import 'package:project2/view/screen/places_details.dart';
import 'package:project2/view/screen/reservations.dart';
import 'package:project2/view/screen/setting.dart';
import 'core/constant/routes.dart';

List<GetPage<dynamic>>? routes = [
    GetPage(name: AppRoute.language, page: ()=> const Language()),
    GetPage(name: AppRoute.onboarding, page: ()=> const OnBoarding()),
    GetPage(name: AppRoute.login, page: ()=> const Login()),
    GetPage(name: AppRoute.register, page: ()=> const Register()),
    GetPage(name: AppRoute.homepage, page: ()=> const HomeScreen()),
    GetPage(name: AppRoute.places, page: ()=> const Places()),
    GetPage(name: AppRoute.placesdetails, page: ()=>  const PlacesDetails()),
    GetPage(name: AppRoute.reservations, page: ()=>  const Reservations()),
    GetPage(name: AppRoute.myreservations, page: ()=>  const MyReservations()),
    GetPage(name: AppRoute.setting, page: ()=>  Setting()),
    GetPage(name: AppRoute.aboutas, page: ()=>  const AboutAs()),
    GetPage(name: AppRoute.contactas, page: ()=>  const ContactAs()),
];



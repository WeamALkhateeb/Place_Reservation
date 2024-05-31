import 'package:flutter/material.dart';
import 'package:project2/core/constant/routes.dart';
import 'package:project2/view/screen/auth/login.dart';

Map<String, Widget Function(BuildContext)> routes = {
    AppRoute.login : (context) => const Login()
};
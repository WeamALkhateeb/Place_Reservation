import 'package:flutter/material.dart';
import 'package:project2/core/constant/color.dart';
import 'package:project2/view/widget/auth/rowauth.dart';
import 'package:project2/view/widget/auth/textformfiledauth.dart';
import '../../widget/auth/materialbuttonauth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: fourBackColor,
        elevation: 0,
        title:const Text('Login',style: TextStyle(color: fourBackColor,fontFamily:'DeliciousHandrawn',fontSize: 25)),
        centerTitle: true,
        flexibleSpace: Container(
                       decoration:const BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60),bottomRight: Radius.circular(60)),
                       gradient: LinearGradient(colors: [fourBackColor,sixBackColor],
                         begin: Alignment.bottomCenter,
                         end: Alignment.bottomCenter

                       ))),),
       body:Container(
       padding: const EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.of(context).size.width,
        child:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Image.asset('assets/images/login.png',
              width: 350,
              height: 300,),
              const SizedBox(height: 40,),
              const Textformfieldauth(hinttext: 'Enter your email', iconData: Icons.email,),
              const SizedBox(height: 5,),
              const Textformfieldauth(hinttext: 'Enter your password ', iconData: Icons.lock,),
              const  SizedBox(height: 20,),
              MaterialButtonAuth(onPressed:(){},text: 'Sign in',),
              const SizedBox(height: 35,),
              Rowauth(text1: " Don't have an account ?", onTap: (){}, text2: 'Sign up'),

             ] )
            ,
          ),
        ) ,
      );
  }
}



import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/project_1/bottomNavigationBar.dart';
import 'package:flutter_demo/project_1/homePage.dart';
import 'package:flutter_demo/project_1/login_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});



  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

   static const String KEYLOGIN = 'login';
  var isLoggedIn;


  @override
  void initState() {
    super.initState();
    whereToGo();
  }
   void whereToGo()async {
     var shrefPref =  await SharedPreferences.getInstance();
     isLoggedIn = shrefPref.getBool(KEYLOGIN);
     print('::::::::::::::::::::::::::::::::::::::::::$isLoggedIn');
     setState(() {});
   }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Center(
          child: Lottie.asset("asets/Images/Animation1.json"),
        ),
        nextScreen:  isLoggedIn!=null
            ? isLoggedIn==true
                ? Bottomnavigationbar() :LoginScreen()
            :LoginScreen(),
      splashIconSize: 200,
      backgroundColor: Colors.pink.shade50,
      duration: 4000,
    );
  }


}

import 'dart:async';
// import 'dart:js';

import 'package:expenso_app/constants.dart';
import 'package:expenso_app/screens/home/home_page.dart';
import 'package:expenso_app/screens/onboarding/login_screen.dart';
import 'package:expenso_app/screens/onboarding/signup_screen.dart';

import 'package:expenso_app/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String LOGIN_KEY = "LoggedIn";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getAppLogoUI(),
            hSpacer(),
            Text(
              AppConstants.app_name,
              style: TextStyle(
                fontSize: 45,
                fontFamily: "poppins",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getAppLogoUI() {
    return CircleAvatar(
      backgroundColor: AppColors.blackColor,
      radius: 64,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Image.asset(
          "assets/icon/expenses.png",
          color: Colors.white,
        ),
      ),
    );
  }

  void whereToGo() async {
    var pref = await SharedPreferences.getInstance();

    var isLogin = pref.getBool(LOGIN_KEY);
    Timer(Duration(seconds: 2), () async {
      // Widget navigateToPage = LoginScreen();

      if (isLogin != null) {
        if (isLogin) {
          //when true
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
        } else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
          // navigateToPage = SignUpScreen();
        }
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
        // navigateToPage = SignUpScreen();
      }

      // Navigator.pushReplacement(
      //     context as BuildContext,
      //     MaterialPageRoute(
      //       builder: (context) => navigateToPage,
      //     ));
    });
  }
}

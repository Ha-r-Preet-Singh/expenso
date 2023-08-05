import 'package:expenso_app/screens/home/home_page.dart';
import 'package:expenso_app/screens/onboarding/forget_password.dart';
import 'package:expenso_app/screens/onboarding/signup_screen.dart';
import 'package:expenso_app/screens/splash/splash_screen.dart';
import 'package:expenso_app/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../database_provider/app_database.dart';
import '../../models/user_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var portraitKey = GlobalKey<FormState>();
  var landscapeKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var orientation;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Padding(
              padding: EdgeInsets.only(top: media.size.height * .12),
              child: Form(
                key: portraitKey,
                child: Column(
                  children: [
                    Text(
                      AppConstants.app_name,
                      style: TextStyle(
                        fontSize: 45,
                        fontFamily: "poppins",
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    hSpacer(mHeight: media.size.height * .07),
                    SizedBox(
                      width: media.size.width * .9,
                      child: TextFormField(
                        onTap: () {},
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.greyColor,
                          hintText: "Enter Your Email",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: AppColors.blackColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: AppColors.blackColor),
                          ),
                        ),
                        validator: (value) {
                          if (value == "" || !value!.contains("@")) {
                            return "Please enter valid email!";
                          }
                          return null;
                        },
                      ),
                    ),
                    hSpacer(),
                    SizedBox(
                      width: media.size.width * .9,
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.greyColor,
                          hintText: "Enter Your Password",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: AppColors.blackColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(color: AppColors.blackColor),
                          ),
                        ),
                        validator: (value) {
                          if (value == "" || value!.length < 5) {
                            return "Please enter valid Password(length must be 6 characters)!";
                          }
                          return null;
                        },
                      ),
                    ),
                    hSpacer(mHeight: media.size.height * .07),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetPassword(),
                            ));
                      },
                      child: Text(
                        "Forget my Password?",
                        style: TextStyle(
                            color: AppColors.blackColor, fontFamily: "poppins"),
                      ),
                    ),
                    hSpacer(),
                    SizedBox(
                      height: media.size.height * .07,
                      width: media.size.width * .9,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.blackColor,
                              elevation: 10),
                          onPressed: () async {
                            // if and if user is Authenticated!

                            if (portraitKey.currentState!.validate()) {
                              var check = await AppDatabase().authenticateUser(
                                email: emailController.text,
                                password: passwordController.text,
                              );

                              if (check) {
                                var pref =
                                    await SharedPreferences.getInstance();
                                pref.setBool(SplashScreenState.LOGIN_KEY, true);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(),
                                    ));
                              } else {
                                // show error
                              }
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 22,
                                fontFamily: "poppins"),
                          )),
                    ),
                    hSpacer(mHeight: media.size.height * .06),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Have an Account?",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                              fontFamily: "poppins"),
                        ),
                        wSpacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ));
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColors.blackColor,
                                fontFamily: "poppins",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    hSpacer(mHeight: media.size.height * .07),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: media.size.height * .001,
                          width: media.size.width * .35,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                        ),
                        wSpacer(),
                        Text(
                          "Sign up with",
                          style: TextStyle(
                              color: AppColors.blackColor,
                              fontFamily: "poppins",
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        wSpacer(),
                        Container(
                          height: media.size.height * .001,
                          width: media.size.width * .35,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    hSpacer(mHeight: 50.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Container(
                            height: media.size.height * .06,
                            width: media.size.height * .06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xfff7fafb),
                            ),
                            child: Center(
                                child: Image.network(
                                    "https://icons-for-free.com/iconfiles/png/512/facebook+logo+logo+website+icon-1320190502625926346.png")),
                          ),
                        ),
                        wSpacer(mWidth: media.size.width * .08),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Container(
                            height: media.size.height * .06,
                            width: media.size.height * .06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xfff7fafb),
                            ),
                            child: Center(
                                child: Image.network(
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/706px-Google_%22G%22_Logo.svg.png",
                              scale: 24,
                            )),
                          ),
                        ),
                        wSpacer(mWidth: media.size.width * .08),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Container(
                            height: media.size.height * .06,
                            width: media.size.height * .06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xfff7fafb),
                            ),
                            child: Center(
                                child: Image.network(
                              "https://img.freepik.com/free-icon/twitter_318-674515.jpg",
                              scale: 18,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(top: media.size.height * .12),
              child: Form(
                key: landscapeKey,
                child: Column(
                  children: [
                    Text(
                      AppConstants.app_name,
                      style: TextStyle(
                        fontSize: 45,
                        fontFamily: "poppins",
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    hSpacer(mHeight: media.size.height * .03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: media.size.height * .001,
                          width: media.size.width * .30,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                        ),
                        wSpacer(mWidth: media.size.width * .03),
                        Text(
                          "Sign up with",
                          style: TextStyle(
                              color: AppColors.blackColor,
                              fontFamily: "poppins",
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        wSpacer(mWidth: media.size.width * .03),
                        Container(
                          height: media.size.height * .001,
                          width: media.size.width * .10,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                        ),
                        wSpacer(mWidth: media.size.width * .03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Container(
                                height: media.size.height * .1,
                                width: media.size.height * .1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xfff7fafb),
                                ),
                                child: Center(
                                    child: Image.network(
                                        "https://icons-for-free.com/iconfiles/png/512/facebook+logo+logo+website+icon-1320190502625926346.png")),
                              ),
                            ),
                            wSpacer(mWidth: media.size.width * .04),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Container(
                                height: media.size.height * .1,
                                width: media.size.height * .1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xfff7fafb),
                                ),
                                child: Center(
                                    child: Image.network(
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/706px-Google_%22G%22_Logo.svg.png",
                                  scale: 24,
                                )),
                              ),
                            ),
                            wSpacer(mWidth: media.size.width * .04),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Container(
                                height: media.size.height * .1,
                                width: media.size.height * .1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xfff7fafb),
                                ),
                                child: Center(
                                    child: Image.network(
                                  "https://img.freepik.com/free-icon/twitter_318-674515.jpg",
                                  scale: 18,
                                )),
                              ),
                            ),
                            // wSpacer(mWidth: media.size.width*.02),
                            // Container(
                            //   height: media.size.height*.001,
                            //   width: media.size.width*.10,
                            //   decoration: BoxDecoration(
                            //     color: Colors.grey,
                            //   ),
                            // ),
                            // wSpacer(mWidth: media.size.width*.03),
                          ],
                        ),
                      ],
                    ),
                    hSpacer(mHeight: media.size.height * .03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: media.size.width * .45,
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.greyColor,
                              hintText: "Enter Your Email",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: AppColors.blackColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide:
                                    BorderSide(color: AppColors.blackColor),
                              ),
                            ),
                            validator: (value) {
                              if (value == "" || !value!.contains("@")) {
                                return "Please enter valid email!";
                              }
                              return null;
                            },
                          ),
                        ),
                        wSpacer(mWidth: media.size.width * .05),
                        SizedBox(
                          width: media.size.width * .45,
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.greyColor,
                              hintText: "Enter Your Password",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: AppColors.blackColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide:
                                    BorderSide(color: AppColors.blackColor),
                              ),
                            ),
                            validator: (value) {
                              if (value == "" || value!.length < 5) {
                                return "Please enter valid Password(length must be 6 characters)!";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    hSpacer(mHeight: media.size.height * .03),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetPassword(),
                            ));
                      },
                      child: Text(
                        "Forget my Password?",
                        style: TextStyle(
                            color: AppColors.blackColor, fontFamily: "poppins"),
                      ),
                    ),
                    hSpacer(mHeight: media.size.height * .03),
                    SizedBox(
                      height: media.size.height * .15,
                      width: media.size.width * .9,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.blackColor,
                              elevation: 10),
                          onPressed: () async {
                            // if and if user is Authenticated!
                            var pref = await SharedPreferences.getInstance();
                            pref.setBool(SplashScreenState.LOGIN_KEY, true);
                            if (landscapeKey.currentState!.validate()) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ));
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 22,
                                fontFamily: "poppins"),
                          )),
                    ),
                    hSpacer(mHeight: media.size.height * .03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Have an Account?",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                              fontFamily: "poppins"),
                        ),
                        wSpacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ));
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColors.blackColor,
                                fontFamily: "poppins",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

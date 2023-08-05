import 'package:expenso_app/database_provider/app_database.dart';
import 'package:expenso_app/models/user_model.dart';
import 'package:expenso_app/screens/onboarding/login_screen.dart';
import 'package:expenso_app/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../ui_helper.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var portraitKey = GlobalKey<FormState>();
  var landscapeKey = GlobalKey<FormState>();
  var orientation;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
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
                    hSpacer(),
                    SizedBox(
                      width: media.size.width * .9,
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.greyColor,
                          hintText: "Confirm Your Password",
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
                            return "Password should be Same(length must be 6 characters)!";
                          }
                          return null;
                        },
                      ),
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
                          "Login with",
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
                    hSpacer(mHeight: media.size.height * .07),
                    SizedBox(
                      height: media.size.height * .07,
                      width: media.size.width * .9,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.blackColor,
                              elevation: 10),
                          onPressed: () async {
                            if (portraitKey.currentState!.validate()) {
                              var check =
                                  await AppDatabase().createUser(UserModel(
                                email: emailController.text,
                                password: passwordController.text,
                              ));

                              if (check) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ));
                              } else {
                                // show error
                              }
                            }
                          },
                          child: Text(
                            "Sign Up",
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
                          "Already Have a Account?",
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
                                  builder: (context) => LoginScreen(),
                                ));
                          },
                          child: Text(
                            "Login",
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
          } else {
            return Padding(
              padding: EdgeInsets.only(top: media.size.height * .06),
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
                    hSpacer(mHeight: media.size.height * .04),
                    SizedBox(
                      width: media.size.width * .9,
                      child: TextFormField(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: media.size.width * .42,
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
                        wSpacer(mWidth: media.size.width * .06),
                        SizedBox(
                          width: media.size.width * .42,
                          child: TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.greyColor,
                              hintText: "Confirm Your Password",
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
                                return "Password should be same(length must be 6 characters)!";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    hSpacer(mHeight: media.size.height * .05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already Have a Account?",
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
                                      builder: (context) => LoginScreen(),
                                    ));
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.blackColor,
                                    fontFamily: "poppins",
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        wSpacer(),
                        Container(
                          height: media.size.height * .001,
                          width: media.size.width * .15,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                        ),
                        wSpacer(),
                        Text(
                          " or Login with",
                          style: TextStyle(
                              color: AppColors.blackColor,
                              fontFamily: "poppins",
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        wSpacer(),
                        Container(
                          height: media.size.height * .001,
                          width: media.size.width * .10,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                        ),
                        wSpacer(),
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
                          ],
                        ),
                      ],
                    ),
                    hSpacer(mHeight: media.size.height * .02),
                    hSpacer(mHeight: media.size.height * .02),
                    SizedBox(
                      height: media.size.height * .14,
                      width: media.size.width * .9,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.blackColor,
                              elevation: 10),
                          onPressed: () async {
                            if (landscapeKey.currentState!.validate()) {
                              var check =
                                  await AppDatabase().createUser(UserModel(
                                email: emailController.text,
                                password: passwordController.text,
                              ));

                              if (check) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ));
                              } else {
                                // show error
                              }
                            }
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 22,
                                fontFamily: "poppins"),
                          )),
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

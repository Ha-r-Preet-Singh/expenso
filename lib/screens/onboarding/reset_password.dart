import 'package:expenso_app/screens/onboarding/login_screen.dart';
import 'package:expenso_app/ui_helper.dart';
import 'package:flutter/material.dart';

import '../../database_provider/app_database.dart';


class ResetPassword extends StatefulWidget {
  String email;
  ResetPassword({required this.email});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var portraitKey = GlobalKey<FormState>();
  var landscapeKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  // var emailController = TextEditingController();


  var orientation;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if(orientation==Orientation.portrait){
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: portraitKey,
                child: Column(
                  crossAxisAlignment:   CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Reset Your Password",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: "poppins",color: AppColors.blackColor),),
                        Text("Enter Your Password Here",style: TextStyle(fontSize: 17,color:Colors.grey.shade700,fontFamily: "poppins", fontWeight: FontWeight.w500),),
                        hSpacer(mHeight: media.size.height * .03),

                        SizedBox(
                          width: media.size.width * .9,
                          child: TextFormField(
                            onTap: (){

                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.greyColor,
                              hintText: "Enter New Password",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: AppColors.blackColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
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
                        hSpacer(mHeight: media.size.height * .014),
                        SizedBox(
                          width: media.size.width * .9,
                          child: TextFormField(
                            onTap: (){

                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.greyColor,
                              hintText: "Confirm New Password",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: AppColors.blackColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
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

                      ],
                    ),
                    Column(
                      children: [

                        hSpacer(mHeight: media.size.height * .02),
                        SizedBox(
                          height: media.size.height * .07,
                          width: media.size.width * .9,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.blackColor,
                                  elevation: 10),
                              onPressed: ()async {
                                // if and if user is Authenticated!

                                if (portraitKey.currentState!.validate()) {
                                  var check =
                                  await AppDatabase().resetPassword(passwordController.text, widget.email);
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
                                "Continue",
                                style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 22,
                                    fontFamily: "poppins"),
                              )),
                        ),
                        hSpacer(mHeight: media.size.height * .02),
                      ],
                    ),




                  ],
                ),
              ),
            );
          }else{
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: landscapeKey,
                child: Column(
                  crossAxisAlignment:   CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Reset Your Password",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: "poppins",color: AppColors.blackColor),),
                        Text("Enter Your Password Here",style: TextStyle(fontSize: 17,color:Colors.grey.shade700,fontFamily: "poppins", fontWeight: FontWeight.w500),),
                        hSpacer(mHeight: media.size.height * .03),

                        SizedBox(
                          width: media.size.width * .9,
                          child: TextFormField(
                            onTap: (){

                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.greyColor,
                              hintText: "Enter New Password",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: AppColors.blackColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
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
                        hSpacer(mHeight: media.size.height * .014),
                        SizedBox(
                          width: media.size.width * .9,
                          child: TextFormField(
                            onTap: (){

                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.greyColor,
                              hintText: "Confirm New Password",
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: AppColors.blackColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
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


                        )],
                    ),
                    Column(
                      children: [

                        hSpacer(mHeight: media.size.height * .02),
                        SizedBox(
                          height: media.size.height * .14,
                          width: media.size.width * .9,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.blackColor,
                                  elevation: 10),
                              onPressed: ()async {
                                // if and if user is Authenticated!

                                if (portraitKey.currentState!.validate()) {
                                  var check =
                                  await AppDatabase().resetPassword(passwordController.text, widget.email);
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
                                "Continue",
                                style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: 22,
                                    fontFamily: "poppins"),
                              )),
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

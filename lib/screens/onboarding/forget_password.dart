import 'package:expenso_app/screens/onboarding/reset_password.dart';
import 'package:expenso_app/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../database_provider/app_database.dart';



class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  var portraitKey = GlobalKey<FormState>();
  var landscapeKey = GlobalKey<FormState>();
  var emailController = TextEditingController();


  var orientation;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
      ),
      body:OrientationBuilder(
        builder: (context, orientation) {
          if(orientation==Orientation.portrait){
            return  Padding(
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
                        Text("Forget Password",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: "poppins",color: AppColors.blackColor),),
                        Text("Enter Your Email Here",style: TextStyle(fontSize: 17,color:Colors.grey.shade700,fontFamily: "poppins", fontWeight: FontWeight.w500),),
                        hSpacer(mHeight: media.size.height * .03),

                        SizedBox(
                          width: media.size.width * .9,
                          child: TextFormField(
                            onTap: (){

                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.greyColor,
                              hintText: "xyz@gmail.com",
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
                              if (value == "" || !value!.contains("@")) {
                                return "Please enter valid email!";
                              }
                              return null;
                            },
                          ),
                        ),

                      ],
                    ),
                    Column(
                      children: [


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
                                  await AppDatabase().forgetPassword(emailController.text);
                                  if (check) {

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ResetPassword(email: emailController.text,),
                                        ));
                                  } else {
                                    // show error
                                  }
                                }
                              },
                              child: Text(
                                "Confirm",
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
          }else{
            return  Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: landscapeKey,
                child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment:   CrossAxisAlignment.start,
                      children: [
                        Text("Forget Password",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: "poppins",color: AppColors.blackColor),),
                        Text("Enter Your Email Here",style: TextStyle(fontSize: 17,color:Colors.grey.shade700,fontFamily: "poppins", fontWeight: FontWeight.w500),),
                        hSpacer(mHeight: media.size.height * .03),

                        SizedBox(
                          width: media.size.width * .9,
                          child: TextFormField(
                            onTap: (){

                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.greyColor,
                              hintText: "xyz@gmail.com",
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
                              if (value == "" || !value!.contains("@")) {
                                return "Please enter valid email!";
                              }
                              return null;
                            },
                          ),
                        ),

                      ],
                    ),
                    hSpacer(mHeight: media.size.height * .02),
                    Column(
                      children: [
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
                                  await AppDatabase().forgetPassword(emailController.text);
                                  if (check) {

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ResetPassword(email:emailController.text),
                                        ));
                                  } else {
                                    // show error
                                  }
                                }
                              },
                              child: Text(
                                "Confirm",
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

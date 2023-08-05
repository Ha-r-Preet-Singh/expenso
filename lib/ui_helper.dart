


import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColors {
  static final Color whiteColor = Color(0xffffffff);
  static final Color blackColor = Color(0xff191929);
  static final Color greyColor =  Color(0xffF6F6F6);
  static final Color  greenColor = Color(0xff37b345);
  static final Color redColor = Color(0xffe76060);
}



Widget hSpacer({mHeight = 11.0}){
  return SizedBox(
    height: mHeight,

  );
}


Widget wSpacer({mWidth = 11.0}){
  return SizedBox(
    width: mWidth,
  );
}


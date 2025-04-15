import 'dart:developer';

import 'package:flutter/material.dart';

class AppColors {
  static Map<int, Color> colorSwatch =
  {
    50:const Color.fromRGBO(4,131,184, .1),
    100:const Color.fromRGBO(4,131,184, .2),
    200:const Color.fromRGBO(4,131,184, .3),
    300:const Color.fromRGBO(4,131,184, .4),
    400:const Color.fromRGBO(4,131,184, .5),
    500:const Color.fromRGBO(4,131,184, .6),
    600:const Color.fromRGBO(4,131,184, .7),
    700:const Color.fromRGBO(4,131,184, .8),
    800:const Color.fromRGBO(4,131,184, .9),
    900:const Color.fromRGBO(4,131,184, 1),
  };

  // static const Color primaryColor = Color(0xFF07ADAE);
   static const Color primaryColor = Color.fromRGBO(152, 25, 14, 1);
   static const Color lightPrimaryColor = Color.fromRGBO(152, 25, 14, 0.7);
   static const Color bgColor = Color.fromRGBO(226,232,240,1);
  static const Color whiteColor = Color.fromRGBO(241,245,249,1);
}

String getImage(String image){
  log(image);
  return "https://medblocks.appsowk.org/$image";
}
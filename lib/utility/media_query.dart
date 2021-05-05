// this class have static members which can be accessed by just class name
// this class used to find height width of the device
// we are just creating a instance once so that all the static variable will be allocated memory
import 'package:flutter/material.dart';

class ClassMediaQuery{

  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static bool isDark;
  static double notchHeight;

  ClassMediaQuery(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    notchHeight = _mediaQueryData.padding.top;
    isDark = _mediaQueryData.platformBrightness == Brightness.dark;
  }

}
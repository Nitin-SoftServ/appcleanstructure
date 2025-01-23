///styles.dart contains several style definitions for the app, like statusBar style, TextStyles, InputDecoration style and more.

import 'package:appstructureapp/styles/sizes.dart';
import 'package:flutter/material.dart';

lightTextStyle({required fontSize,required color,height}) {
  return TextStyle(fontSize: fontSize, color: color,fontWeight: FontWeight.w400, fontFamily: "Satoshi");
}

regularTextStyle({required fontSize,required color,height}) {
  return TextStyle(fontSize: fontSize, color: color,fontWeight: FontWeight.w500,height: height, fontFamily: "Satoshi");
}

mediumTextStyle({required fontSize,required color,height}) {
  return TextStyle(fontSize: fontSize, color: color,fontWeight: FontWeight.w600, fontFamily: "Satoshi");
}

boldTextStyle({required fontSize,required color,height}) {
  return TextStyle(fontSize: fontSize, color: color,fontWeight: FontWeight.w700, fontFamily: "Satoshi");
}

appBarTextStyle({fontSize,required color}) {
  return TextStyle(fontSize: fontSize??dimen20, color: color,fontWeight: FontWeight.w700, fontFamily: "Satoshi");
}

extraSmallBorderRadius(){
  return BorderRadius.circular(2);
}

smallBorderRadius(){
  return BorderRadius.circular(4);
}

mediumBorderRadius(){
  return BorderRadius.circular(6);
}

largeBorderRadius(){
  return BorderRadius.circular(10);
}





import 'package:appstructureapp/styles/colors.dart';
import 'package:appstructureapp/styles/sizes.dart';
import 'package:appstructureapp/styles/styles.dart';
import 'package:flutter/material.dart';


ElevatedButtonThemeData buttonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
        shape: WidgetStateProperty.resolveWith<OutlinedBorder>((_) {
          return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10));
        }),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (states) =>
                    AppColors.colBackground)));


buttonWidget({text, color, margin,textColor}){
  return Container(
    alignment: Alignment.center,
    margin: margin,
    decoration: BoxDecoration(
        color:  color,
        borderRadius: BorderRadius.circular(16)),
    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
    child: Text(
      text,
      style: regularTextStyle(
          fontSize: dimen14,
          color: textColor
      ),
    ),
  );
}
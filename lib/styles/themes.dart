import 'package:appstructureapp/styles/sizes.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData get lightTheme {
  return ThemeData(
      fontFamily: "",
      primarySwatch: Colors.blue,
      useMaterial3: true,
      cardTheme: const CardTheme(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(fontSize: 12.0),
        bodyLarge: TextStyle(fontSize: 12.0),


      ),
      appBarTheme:  const AppBarTheme(
        // iconTheme: IconThemeData(color: Colors.black),
        iconTheme: IconThemeData(color: AppColors.darkGrey),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: "",
          fontWeight: FontWeight.w600,
        ),
      ),
      scaffoldBackgroundColor: Colors.white,

      ///Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: kRadius30),
          ),
          textStyle: WidgetStateProperty.all<TextStyle>(
            const TextStyle(
                fontFamily: "",
                fontWeight: FontWeight.w600,
                fontSize: 13),
          ),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            /// disabled state shouldn't be RED :)
            if (states.contains(WidgetState.disabled)) {
              return AppColors.darkGrey;
            }
            return AppColors.blue;
          }),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          overlayColor: WidgetStateProperty.all<Color>(AppColors.grey),
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.only(
              left: 35,
              right: 35,
              top: 15,
              bottom: 15,
            ),
          ),
        ),
      ),

      ///TextButton theme
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all<TextStyle>(
            const TextStyle(
                fontFamily: "Font.montserrat",
                fontWeight: FontWeight.w600,
                fontSize: 13),
          ),
        ),
      ),
      switchTheme: SwitchThemeData(
        trackColor: WidgetStateProperty.all<Color>(AppColors.blue),
      )
  );
}

///Expand darkTheme to meet your needs
ThemeData get darkTheme {
  return ThemeData();
}
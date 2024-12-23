import 'package:flutter/material.dart';
import 'package:ui_ecommerce/constant.dart';

ThemeData themeData(bool isDarkMode) {
  return ThemeData(
      fontFamily: "Muli",
       brightness: isDarkMode ? Brightness.dark : Brightness.light,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0,
        // iconTheme: IconThemeData(
        //   color: Colors.black,
        // ),
        titleTextStyle: TextStyle(
          // color: Colors.black,
          fontSize: 20,
        )
      ),
      // scaffoldBackgroundColor: const Color(0xFFF6F6F6),
      textTheme: textTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      inputDecorationTheme: inputDecorationTheme());
}

TextTheme textTheme() {
  return const TextTheme(
    titleMedium: TextStyle(color: kTextColor),
    bodyMedium: TextStyle(color: kTextColor),
  );
}

InputDecorationTheme inputDecorationTheme() {
  const outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30),
    ),
    borderSide: BorderSide(color: kPrimaryColor),
    gapPadding: 10,
  );
  return const InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(
      horizontal: 42,
      vertical: 20,
    ),
    labelStyle: TextStyle(
      color: kPrimaryColor,
    ),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

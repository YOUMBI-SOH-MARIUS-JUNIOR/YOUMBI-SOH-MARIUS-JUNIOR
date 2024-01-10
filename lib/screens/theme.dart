// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:project1/screens/constant.dart';


ThemeData LightThemeData(BuildContext context){
  return ThemeData.light().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme:const AppBarTheme(color: Colors.white,),
    iconTheme: const IconThemeData(color: kContentColorLightTheme),
    //textTheme: GoogleFonts.interTextTheme(Theme.of(context.textTheme)
    //.apply(bodyColor : kContentColorLightTheme),
    colorScheme: const ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ), 
  );
} 
ThemeData darkThemeData(BuildContext context){
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor:kContentColorLightTheme,
    appBarTheme:const AppBarTheme(color: kContentColorLightTheme),
    iconTheme: const IconThemeData(color: kContentColorDarkTheme),
    //textTheme: GoogleFonts.interTextTheme(Theme.of(context.textTheme)
    //.apply(bodyColor : kContentColorLightTheme),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ), 
  );
} 
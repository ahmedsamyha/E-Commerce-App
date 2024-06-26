import 'package:flutter/material.dart';


class CustomOutlineButtonTheme{
  CustomOutlineButtonTheme._();

  //Light OutlineButton Theme -----------------------------

  static OutlinedButtonThemeData lightOutlineButtonTheme = OutlinedButtonThemeData(

    style:  OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: const BorderSide(color: Colors.grey),
      textStyle: const TextStyle(fontSize: 16, color: Colors.black , fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 16 , horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
    ),
  );

  //Dark OutlineButton Theme -----------------------------

  static OutlinedButtonThemeData darkOutlineButtonTheme = OutlinedButtonThemeData(

    style:  OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      side: const BorderSide(color: Colors.grey),
      textStyle: const TextStyle(fontSize: 16, color: Colors.white , fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 16 , horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
    ),
  );
}
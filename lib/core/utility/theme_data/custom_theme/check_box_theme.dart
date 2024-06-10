import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomCheckBoxTheme{
  CustomCheckBoxTheme._();

//Light CheckBox Theme -----------------------------

static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  checkColor: MaterialStateProperty.resolveWith((states) {
    if(states.contains(MaterialState.selected)){
      return Colors.white;
    }else{
      return Colors.black;
    }
  }),
  fillColor: MaterialStateProperty.resolveWith((states) {
    if(states.contains(MaterialState.selected)){
      return AppColors.primary;
    }else{
      return Colors.transparent;
    }
  })
);


//Dark CheckBox Theme -----------------------------

  static CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      checkColor: MaterialStateProperty.resolveWith((states) {
        if(states.contains(MaterialState.selected)){
          return Colors.white;
        }else{
          return Colors.black;
        }
      }),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if(states.contains(MaterialState.selected)){
          return AppColors.primary;
        }else{
          return Colors.transparent;
        }
      })
  );

}
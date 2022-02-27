import 'package:api_placeholder/core/constants/color_const.dart';
import 'package:flutter/material.dart';

class ThemeComp {
  static get mainTheme => ThemeData(
        colorScheme: ColorScheme.light(
          primary: ColorConst.kPrimaryColor
        ),
      );
}

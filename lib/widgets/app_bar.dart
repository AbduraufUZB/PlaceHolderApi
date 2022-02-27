import 'package:api_placeholder/core/constants/color_const.dart';
import 'package:api_placeholder/core/constants/font_const.dart';
import 'package:flutter/material.dart';

class MyAppBar {
  static myAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            Icons.search,
            color: ColorConst.kBlack,
          ),
        ),
      ],
      title: Text(
        "Evan",
        style: TextStyle(
          color: ColorConst.kBlack.withOpacity(0.6),
          fontSize: FontConst.kLargeFont,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

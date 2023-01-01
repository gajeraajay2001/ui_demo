import 'package:flutter/material.dart';

import '../constants/sizeConstant.dart';

class AppTheme {
  Color get primaryColor => Color(0xffAF0171);
  AppTheme._();
  TextStyle get getTitleTextStyle {
    return TextStyle(
      fontSize: MySize.getHeight(18),
      fontWeight: FontWeight.w800,
    );
  }

  TextStyle get getNormalGreyTextStyle {
    return TextStyle(
      fontSize: MySize.getHeight(15),
      fontWeight: FontWeight.w600,
      color: Colors.grey.shade500,
    );
  }

  TextStyle get getNormalBlackTextStyle {
    return TextStyle(
      fontSize: MySize.getHeight(13),
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get getWhiteTextStyle {
    return TextStyle(
      fontSize: MySize.getHeight(13),
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
  }
}

AppTheme get appTheme => AppTheme._();

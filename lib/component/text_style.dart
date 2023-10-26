import 'package:flutter/material.dart';
import 'package:watchstore/gen/fonts.gen.dart';
import 'package:watchstore/resouece/colors.dart';

class LightAppTextStyle {
  LightAppTextStyle._();

  static const TextStyle title = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: AppColors.titleColor,
  );
  static const TextStyle hint = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: AppColors.hintColor,
  );
  static const TextStyle buttonText = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 14,
    color: AppColors.appbarColor,
  );
  static const TextStyle avatarTextStyle = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 11,
    color: AppColors.titleColor,
  );
  static const TextStyle wrongEditNumber = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 11,
    color: AppColors.primaryColor,
  );
  static const TextStyle bottomNavActive = TextStyle(
    fontFamily: FontFamily.dana,
    fontSize: 12,
    color: AppColors.titleColor,
  );
  static const TextStyle bottomNavDeActive = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 12,
      color: Color.fromARGB(255, 196, 196, 196));
}

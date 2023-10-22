import 'package:flutter/material.dart';
import 'package:watchstore/resouece/dimens.dart';

class AppButtonStyle {
  AppButtonStyle._();

  static ButtonStyle mainButtonStyle = ButtonStyle(
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(Dimens.medium),
  )));
}

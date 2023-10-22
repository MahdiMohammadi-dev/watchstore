import 'package:flutter/material.dart';
import 'package:watchstore/extensions/sized_box_extension.dart';
import 'package:watchstore/resouece/dimens.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final String hint;
  final Widget icon;
  TextEditingController controller;
  TextInputType? textInputType;
  AppTextField({
    required this.label,
    required this.hint,
    this.icon = const SizedBox(),
    required this.controller,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(Dimens.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(label),
          Dimens.medium.sizedBoxHeight,
          SizedBox(
            height: size.height * .07,
            width: size.width * .75,
            child: TextField(
              textAlign: TextAlign.center,
              controller: controller,
              keyboardType: textInputType,
              decoration: InputDecoration(
                hintText: hint,
                prefixIcon: icon,
              ),
            ),
          )
        ],
      ),
    );
  }
}

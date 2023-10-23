import 'package:flutter/material.dart';
import 'package:watchstore/component/button_style.dart';
import 'package:watchstore/component/text_style.dart';

class MainButton extends StatelessWidget {
  final String buttonText;
  void Function() onpressed;
  MainButton({required this.buttonText, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .07,
      width: size.width * .75,
      child: ElevatedButton(
        style: AppButtonStyle.mainButtonStyle,
        onPressed: onpressed,
        child: Text(
          buttonText,
          style: LightAppTextStyle.buttonText,
        ),
      ),
    );
  }
}

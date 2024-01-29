import 'dart:io';
import 'package:flutter/material.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/extensions/sized_box_extension.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/resouece/dimens.dart';
import 'package:watchstore/resouece/strings.dart';

class Avatar extends StatelessWidget {
  Avatar({super.key, required this.onTap, required this.file});
  final onTap;
  final file;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: file == null
                ? Image.asset(Assets.png.avatar.path)
                : Image.file(
                    file,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
          ),
          Dimens.medium.sizedBoxHeight,
          const Text(
            AppStrings.chooseProfileImage,
            style: LightAppTextStyle.avatarTextStyle,
          ),
        ],
      ),
    );
  }
}

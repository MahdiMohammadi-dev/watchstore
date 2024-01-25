import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/extensions/sized_box_extension.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/resouece/dimens.dart';
import 'package:watchstore/resouece/strings.dart';

class Avatar extends StatelessWidget {
  Avatar({
    super.key,
  });
  File? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles();

            if (result != null) {
              File file = File(result.files.single.path!);
              imageUrl = file;
            } else {
              // User canceled the picker
            }
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: Image.file(imageUrl!),
          ),
        ),
        Dimens.medium.sizedBoxHeight,
        Text(
          AppStrings.chooseProfileImage,
          style: LightAppTextStyle.avatarTextStyle,
        ),
      ],
    );
  }
}

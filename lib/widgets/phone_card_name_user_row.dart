import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/extensions/sized_box_extension.dart';
import 'package:watchstore/resouece/dimens.dart';

class PhoneCardNameUserRow extends StatelessWidget {
  const PhoneCardNameUserRow({
    super.key,
    required this.title,
    required this.svgIcon,
  });
  final title;
  final svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.small),
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          children: [
            SvgPicture.asset(svgIcon),
            Dimens.small.sizedBoxWidth,
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style:
                  LightAppTextStyle.title.copyWith(fontSize: 14, height: 1.8),
            ),
          ],
        ),
      ),
    );
  }
}

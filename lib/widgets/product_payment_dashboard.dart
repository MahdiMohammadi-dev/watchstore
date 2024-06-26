import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/extensions/sized_box_extension.dart';
import 'package:watchstore/resouece/dimens.dart';

class ProductPaymentDashboard extends StatelessWidget {
  const ProductPaymentDashboard({
    super.key,
    required this.svgIcon,
    required this.title,
    required this.subtitle,
  });
  final svgIcon;
  final title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(svgIcon),
        Dimens.large.sizedBoxHeight,
        Text(
          title,
          style: LightAppTextStyle.wrongEditNumber
              .copyWith(color: Colors.black, fontSize: 10),
        ),
        Dimens.medium.sizedBoxHeight,
        Text(
          subtitle,
          style: LightAppTextStyle.wrongEditNumber
              .copyWith(color: Colors.black, fontSize: 10),
        ),
      ],
    );
  }
}

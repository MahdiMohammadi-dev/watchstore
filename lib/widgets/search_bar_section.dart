import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/resouece/colors.dart';
import 'package:watchstore/resouece/dimens.dart';
import 'package:watchstore/resouece/strings.dart';

class SearchBarSection extends StatelessWidget {
  const SearchBarSection({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.medium),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 52,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.appbarColor,
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(120, 0, 0, 0),
                    offset: Offset(0, 3),
                    blurRadius: 3),
              ],
              borderRadius: BorderRadius.circular(60)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(Assets.svg.search),
              const Text(
                AppStrings.searchProduct,
                style: LightAppTextStyle.hint,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(Assets.png.mainLogo.path),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

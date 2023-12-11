import 'package:flutter/material.dart';
import 'package:watchstore/resouece/colors.dart';
import 'package:watchstore/resouece/dimens.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({super.key, required this.child});

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
        child: Container(
          height: preferredSize.height,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(Dimens.medium),
                bottomLeft: Radius.circular(Dimens.medium),
              ),
              color: AppColors.appbarColor,
              boxShadow: [
                BoxShadow(color: AppColors.hintColor, offset: Offset(0, 2))
              ]),
          child: child,
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}

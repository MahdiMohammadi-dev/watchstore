import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/resouece/colors.dart';
import 'package:watchstore/resouece/dimens.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CartBadge(cartCount: 6,),
                  Row(
                    children: [
                      const Text(
                        'پرفروش ترین ها',
                        style: LightAppTextStyle.title,
                      ),
                      const SizedBox(
                        width: Dimens.medium,
                      ),
                      SvgPicture.asset(Assets.svg.sort)
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(Assets.svg.close))
                ],
              ),
            )),
        backgroundColor: Colors.white,
        body: const Center(
          child: Text(
            "لیست محصولات",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}

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
          child: child,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(Dimens.medium),
                bottomLeft: Radius.circular(Dimens.medium),
              ),
              color: AppColors.appbarColor,
              boxShadow: [
                BoxShadow(color: AppColors.hintColor, offset: Offset(0, 2))
              ]),
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}

class CartBadge extends StatelessWidget {
  const CartBadge({Key? key, this.cartCount = 0}) : super(key: key);
  final cartCount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(width: 32,height: 32,),
        SvgPicture.asset(Assets.svg.cart,
          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),),
        Visibility(
          visible: cartCount>0?true:false,
          child: Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: Text(cartCount.toString(),style: TextStyle(color: Colors.white),),
            ),
          ),
        )
      ],
    );
  }
}

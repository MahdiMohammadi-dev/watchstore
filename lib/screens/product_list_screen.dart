import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/resouece/colors.dart';
import 'package:watchstore/resouece/dimens.dart';
import 'package:watchstore/widgets/cart_badges.dart';
import 'package:watchstore/widgets/custom_app_bar.dart';
import 'package:watchstore/widgets/product_item.dart';

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
                const CartBadge(
                  cartCount: 6,
                ),
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
                    onPressed: () {}, icon: SvgPicture.asset(Assets.svg.close))
              ],
            ),
          )),
          backgroundColor: Colors.white,
          body: const Column(
            children: [
              TagList(),
              ProductGridViewSection(),
            ],
          )),
    );
  }
}

class TagList extends StatelessWidget {
  const TagList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Dimens.large),
      child: SizedBox(
        height: 24,
        child: ListView.builder(
            reverse: true,
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.medium),
                margin: const EdgeInsets.symmetric(horizontal: Dimens.medium),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(Dimens.large)),
                child: Text(
                  'کاسیو',
                  style: LightAppTextStyle.title.copyWith(color: Colors.white),
                ),
              );
            }),
      ),
    );
  }
}

class ProductGridViewSection extends StatelessWidget {
  const ProductGridViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              childAspectRatio: 0.7,
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return ProductItem(
                productTitle: 'ساعت کاسیو',
                productPrice: '12500',
                productImage: Assets.png.unnamed.path);
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/extensions/number_sepration.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/resouece/colors.dart';
import 'package:watchstore/resouece/dimens.dart';
import 'package:watchstore/resouece/strings.dart';
import 'package:watchstore/widgets/custom_app_bar.dart';
import 'package:watchstore/widgets/surface_container.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
            child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              AppStrings.basket,
              style: LightAppTextStyle.title,
            ),
          ),
        )),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: Dimens.medium),
                  padding: const EdgeInsets.all(Dimens.medium),
                  width: double.infinity,
                  height: size.height * .1,
                  decoration:
                      const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 3),
                        blurRadius: 3.0),
                  ]),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(Assets.svg.leftArrow)),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.sendToAddress,
                              style: LightAppTextStyle.hint
                                  .copyWith(color: Colors.grey),
                            ),
                            FittedBox(
                              child: Text(
                                  ' ،تهران،ایران-فلکه دوم صادقیه،خیابان جناح،نبویان',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis,
                                  style: LightAppTextStyle.title
                                      .copyWith(fontWeight: FontWeight.normal)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const ShoppingCartItem(
                  count: 3,
                  productTitle: 'ساعت هوشمند شیائومی m5',
                  ProductPrice: 35000,
                  ProdctOffPrice: 27000,
                )
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.only(right: 15, left: 15),
                width: size.width,
                height: size.height * 0.08,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        'مجموع ${27000.seperatednumber} تومان',
                        style: LightAppTextStyle.title,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(Dimens.small),
                          elevation: 0,
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimens.small))),
                      onPressed: () {},
                      child: const Text(
                        'افزون به سبد خرید',
                        style: LightAppTextStyle.buttonText,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ShoppingCartItem extends StatelessWidget {
  const ShoppingCartItem({
    super.key,
    this.count,
    required this.productTitle,
    required this.ProductPrice,
    required this.ProdctOffPrice,
  });
  final count;
  final productTitle;
  final int ProductPrice;
  final int ProdctOffPrice;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(itemBuilder: (context, index) {
      return SurfaceContainer(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    productTitle.toString(),
                    style: LightAppTextStyle.title.copyWith(fontSize: 12),
                  ),
                  Text(
                    'قیمت: ${ProductPrice.seperatednumber}',
                    style: LightAppTextStyle.title
                        .copyWith(fontWeight: FontWeight.w100),
                  ),
                  Text(
                    'با تخفیف: ${ProdctOffPrice.seperatednumber}',
                    style: LightAppTextStyle.hint
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  const Divider(
                    color: AppColors.hintColor,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(Assets.svg.delete)),
                      const Expanded(child: SizedBox()),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(Assets.svg.minus)),
                      Text(
                        '$count عدد',
                        style:
                            LightAppTextStyle.hint.copyWith(color: Colors.grey),
                        textDirection: TextDirection.rtl,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(Assets.svg.plus))
                    ],
                  )
                ],
              ),
            ),
            Image.asset(
              Assets.png.unnamed.path,
              height: 120,
            ),
          ],
        ),
      );
    }));
  }
}

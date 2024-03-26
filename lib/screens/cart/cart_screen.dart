import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/data/repository/cart_repository.dart';
import 'package:watchstore/extensions/number_sepration.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/resouece/dimens.dart';
import 'package:watchstore/resouece/strings.dart';
import 'package:watchstore/screens/cart/bloc/cart_bloc.dart';
import 'package:watchstore/widgets/custom_app_bar.dart';
import 'package:watchstore/widgets/shopping_cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) {
        final test = CartBloc(cartRepository);
        test.add(CartInitEvent());
        test.add(CartCountEvent());
        return test;
      },
      child: SafeArea(
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
                                    style: LightAppTextStyle.title.copyWith(
                                        fontWeight: FontWeight.normal)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoadingState) {
                        return const LinearProgressIndicator();
                      } else if (state is CartErrorState) {
                        return const Center(
                          child: Text('Error...!'),
                        );
                      } else if (state is CartSuccessLoaded) {
                        return ShoppingCartItem(
                          cartModelList: state.cartList,
                        );
                      } else if (state is CartItemAddedState) {
                        return ShoppingCartItem(
                          cartModelList: state.cartList,
                        );
                      } else if (state is CartItemDeleteState) {
                        return ShoppingCartItem(cartModelList: state.cartList);
                      } else if (state is CartItemRemovedState) {
                        return ShoppingCartItem(cartModelList: state.cartList);
                      } else {
                        return Center(
                          child: TextButton(
                            onPressed: () {
                              BlocProvider.of<CartBloc>(context)
                                  .add(CartInitEvent());
                            },
                            child: const Text('تلاش مجدد'),
                          ),
                        );
                      }
                    },
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
                          'مجموع //${27000.seperatednumber} تومان',
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
                          'پرداخت',
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
      ),
    );
  }
}

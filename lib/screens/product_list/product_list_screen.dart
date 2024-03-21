import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/data/repository/cart_repository.dart';
import 'package:watchstore/data/repository/product_repository.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/gen/fonts.gen.dart';
import 'package:watchstore/resouece/colors.dart';
import 'package:watchstore/resouece/dimens.dart';
import 'package:watchstore/screens/product_list/bloc/product_list_bloc.dart';
import 'package:watchstore/widgets/cart_badges.dart';
import 'package:watchstore/widgets/custom_app_bar.dart';
import 'package:watchstore/widgets/product_item.dart';

class ProductListScreen extends StatelessWidget {
  final params;

  const ProductListScreen({super.key, this.params});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = ProductListBloc(productRepository);
        bloc.add(ProductListInit(params: params));
        return bloc;
      },
      child: SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
                child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ValueListenableBuilder(
                      valueListenable: cartRepository.cartCount,
                      builder: (BuildContext context, value, Widget? child) {
                        return CartBadge(
                          cartCount: value,
                        );
                      }),
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
            body: Column(
              children: [
                const TagList(),
                BlocBuilder<ProductListBloc, ProductListState>(
                  builder: (context, state) {
                    if (state is ProductListLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is ProductListSuccess) {
                      return Expanded(
                        child: GridView.builder(
                            itemCount: state.productList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 2,
                                    childAspectRatio: 0.5,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return ProductItem(
                                productTitle: state.productList[index].title,
                                specialExpiration:
                                    state.productList[index].special_expiration,
                                offPercentage:
                                    state.productList[index].discount,
                                productPrice: state.productList[index].price,
                                lastPrice:
                                    state.productList[index].discount_price,
                                productImage: state.productList[index].image,
                                id: state.productList[index].id,
                              );
                            }),
                      );
                    } else if (state is ProductListError) {
                      return const Center(
                        child: Text(
                          'اطلاعاتی یافت نشد',
                          style: TextStyle(fontFamily: FontFamily.dana),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            )),
      ),
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

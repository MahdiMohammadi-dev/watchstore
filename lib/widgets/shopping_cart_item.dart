import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/data/model/cart_model.dart';
import 'package:watchstore/gen/assets.gen.dart';
import 'package:watchstore/resouece/colors.dart';
import 'package:watchstore/screens/cart/bloc/cart_bloc.dart';
import 'package:watchstore/widgets/surface_container.dart';

class ShoppingCartItem extends StatefulWidget {
  ShoppingCartItem({
    super.key,
    required this.cartModelList,
  });

  final List<CartModel> cartModelList;

  @override
  State<ShoppingCartItem> createState() => _ShoppingCartItemState();
}

class _ShoppingCartItemState extends State<ShoppingCartItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: widget.cartModelList.length,
            itemBuilder: (context, index) {
              final cartBloc = BlocProvider.of<CartBloc>(context);

              return SurfaceContainer(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            widget.cartModelList[index].product,
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style:
                                LightAppTextStyle.title.copyWith(fontSize: 12),
                          ),
                          Text(
                            'قیمت: ${widget.cartModelList[index].price}',
                            style: LightAppTextStyle.title
                                .copyWith(fontWeight: FontWeight.w100),
                          ),
                          Text(
                            'با تخفیف: ${widget.cartModelList[index].discountPrice}',
                            style: LightAppTextStyle.hint
                                .copyWith(color: AppColors.primaryColor),
                          ),
                          const Divider(
                            color: AppColors.hintColor,
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () => cartBloc.add((AddToCartEvent(
                                      productId: widget
                                          .cartModelList[index].productId))),
                                  icon: SvgPicture.asset(Assets.svg.delete)),
                              const Expanded(child: SizedBox()),
                              IconButton(
                                  onPressed: () {
                                    setState(() {});
                                    cartBloc.add(RemoveFromCart(
                                        productId: widget
                                            .cartModelList[index].productId));
                                  },
                                  icon: SvgPicture.asset(Assets.svg.minus)),
                              Text(
                                '${widget.cartModelList[index].count} عدد',
                                style: LightAppTextStyle.hint
                                    .copyWith(color: Colors.grey),
                                textDirection: TextDirection.rtl,
                              ),
                              IconButton(
                                  onPressed: () => cartBloc.add(deleteFromCart(
                                      productId: widget
                                          .cartModelList[index].productId)),
                                  icon: SvgPicture.asset(Assets.svg.plus))
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Image.network(
                      widget.cartModelList[index].image!,
                      height: 70,
                    ),
                  ],
                ),
              );
            }));
  }
}

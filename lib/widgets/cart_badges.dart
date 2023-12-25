import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watchstore/gen/assets.gen.dart';

class CartBadge extends StatelessWidget {
  const CartBadge(
      {Key? key,
      this.cartCount = 0,
      this.visibility = true,
      this.percentVisibility = false})
      : super(key: key);
  final cartCount;
  final bool visibility;
  final bool percentVisibility;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          width: 35,
          height: 35,
        ),
        Visibility(
          visible: visibility,
          child: SvgPicture.asset(
            Assets.svg.cart,
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
        ),
        Visibility(
          visible: cartCount > 0 ? true : false,
          child: Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: Row(
                children: [
                  Text(
                    cartCount.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  Visibility(
                      visible: percentVisibility,
                      child: const Text(
                        "%",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

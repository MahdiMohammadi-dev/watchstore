import 'package:flutter/material.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/extensions/sized_box_extension.dart';
import 'package:watchstore/resouece/dimens.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.productTitle,
    required this.productPrice,
    required this.productImage,
    this.lastPrice = 0,
    this.offPercentage = 0,
    this.offClock = 0,
  });

  final productTitle;
  final productPrice;
  final productImage;
  final lastPrice;
  final offPercentage;
  final offClock;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Dimens.medium),
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.medium),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 238, 238, 238),
                Color.fromARGB(255, 255, 255, 255),
              ])),
      child: Column(
        children: [
          Expanded(child: Image.network(productImage)),
          Padding(
            padding: const EdgeInsets.all(Dimens.medium),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                productTitle,
                style: LightAppTextStyle.title,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      productPrice.toString() + "تومان",
                      textDirection: TextDirection.rtl,
                      style: LightAppTextStyle.title,
                    ),
                  ),
                  Dimens.medium.sizedBoxHeight,
                  Visibility(
                    visible: offPercentage > 0 ? true : false,
                    child: Text(lastPrice.toString(),
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey)),
                  ),
                ],
              ),
              Visibility(
                visible: offPercentage > 0 ? true : false,
                child: Container(
                  padding: const EdgeInsets.all(Dimens.small),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(60)),
                  child: Text(
                    "$offPercentage %",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: Dimens.medium,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              )
            ],
          ),
          Visibility(
            visible: offClock > 0 ? true : false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 2,
                width: double.infinity,
                color: Colors.blue,
              ),
            ),
          ),
          Dimens.small.sizedBoxHeight,
          Visibility(
            visible: offClock > 0 ? true : false,
            child: Text(offClock.toString(),
                style: LightAppTextStyle.title.copyWith(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}

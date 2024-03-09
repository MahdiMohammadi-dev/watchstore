import 'dart:async';

import 'package:flutter/material.dart';
import 'package:watchstore/component/text_style.dart';
import 'package:watchstore/extensions/sized_box_extension.dart';
import 'package:watchstore/resouece/dimens.dart';
import 'package:watchstore/utils/fomrat_time.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.productTitle,
    required this.productPrice,
    required this.productImage,
    this.lastPrice = 0,
    this.offPercentage = 0,
    this.specialExpiration = "",
  });

  final productTitle;
  final productPrice;
  final productImage;
  final lastPrice;
  final offPercentage;
  final specialExpiration;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  Duration difference = const Duration(seconds: 0);
  late Timer timer;
  int inSecond = 0;
  @override
  void initState() {
    super.initState();
    timer = Timer(difference, () {});
    if (widget.specialExpiration != "") {
      DateTime now = DateTime.now();
      DateTime expiration = DateTime.parse(widget.specialExpiration);

      difference = now.difference(expiration).abs();
      inSecond = difference.inSeconds;
      startTimer();
    }
  }

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
          Expanded(child: Image.network(widget.productImage)),
          Padding(
            padding: const EdgeInsets.all(Dimens.medium),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.productTitle,
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
                      widget.productPrice.toString() + "تومان",
                      textDirection: TextDirection.rtl,
                      style: LightAppTextStyle.title,
                    ),
                  ),
                  Dimens.medium.sizedBoxHeight,
                  Visibility(
                    visible: widget.offPercentage > 0 ? true : false,
                    child: Text(widget.lastPrice.toString(),
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey)),
                  ),
                ],
              ),
              Visibility(
                visible: widget.offPercentage > 0 ? true : false,
                child: Container(
                  padding: const EdgeInsets.all(Dimens.small),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(60)),
                  child: Text(
                    "${widget.offPercentage} %",
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
            visible: difference.inSeconds > 0 ? true : false,
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
            visible: difference.inSeconds > 0 ? true : false,
            child: Text(formatTime(inSecond),
                style: LightAppTextStyle.title.copyWith(color: Colors.blue)),
          ),
        ],
      ),
    );
  }

  void startTimer() {
    const onSec = Duration(seconds: 1);
    timer = Timer.periodic(onSec, (timer) {
      setState(() {
        if (inSecond == 0) {
        } else {
          inSecond--;
        }
      });
      timer.cancel();
    });
  }
}

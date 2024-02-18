import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:watchstore/data/model/slider_model.dart';
import 'package:watchstore/resouece/dimens.dart';

class HomeScreenSlider extends StatefulWidget {
  const HomeScreenSlider({super.key, required this.imgList});

  final List<SliderModel> imgList;

  @override
  State<HomeScreenSlider> createState() => _HomeScreenSliderState();
}

class _HomeScreenSliderState extends State<HomeScreenSlider> {
  final CarouselController _carouselController = CarouselController();

  int currentImage = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Column(
        children: [
          CarouselSlider(
              carouselController: _carouselController,
              items: widget.imgList
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(Dimens.medium),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(Dimens.medium),
                          child: Image.network(
                            e.image,
                            fit: BoxFit.fill,
                          )),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                  pauseAutoPlayOnTouch: true,
                  autoPlay: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentImage = index;
                    });
                  },
                  scrollPhysics: const BouncingScrollPhysics())),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.imgList
                .asMap()
                .entries
                .map((e) => Padding(
                      padding: const EdgeInsets.all(3),
                      child: GestureDetector(
                        onTap: () => _carouselController.animateToPage(e.key),
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentImage == e.key
                                  ? Colors.black
                                  : Colors.grey),
                        ),
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}

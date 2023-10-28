import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:watchstore/resouece/dimens.dart';

final List<String> imagelist = [
  'https://ticktackgallery.com/media/wysiwyg/campaign-banner/fetr1401/kenneth-cole-final_.jpg',
  'https://ticktackgallery.com/media/wysiwyg/campaign-banner/fetr1401/polo-final.jpg',
  'https://ticktackgallery.com/media/wysiwyg/campaign-banner/fetr1401/orient-final.jpg',
  'https://ticktackgallery.com/media/wysiwyg/campaign-banner/fetr1401/kenneth-cole-final_.jpg',
  'https://ticktackgallery.com/media/wysiwyg/campaign-banner/fetr1401/seiko-final.jpg',
  'https://ticktackgallery.com/media/wysiwyg/campaign-banner/fetr1401/romanson_1.jpg',
];

class HomeScreenSlider extends StatefulWidget {
  const HomeScreenSlider({super.key, required this.imglist});

  final List<String> imglist;

  @override
  State<HomeScreenSlider> createState() => _HomeScreenSliderState();
}

class _HomeScreenSliderState extends State<HomeScreenSlider> {
  final CarouselController _carouselController = CarouselController();
  final List<Widget> imagelistitems = imagelist
      .map(
        (e) => Padding(
          padding: const EdgeInsets.all(Dimens.medium),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimens.medium),
              child: Image.network(
                e,
                fit: BoxFit.fill,
              )),
        ),
      )
      .toList();
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
              items: imagelistitems,
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
            children: imagelist
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

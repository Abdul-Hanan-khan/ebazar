import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSlider extends StatelessWidget {
  final List<String> imgList;

  ImageSlider(this.imgList);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        initialPage: 2,
        autoPlay: true,
      ),
      items: imgList
          .map(
            (item) => Container(
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                // color: Colors.green,
                image:
                    DecorationImage(image: AssetImage(item), fit: BoxFit.cover),
              ),
            ),
          ).toList(),
    );
  }
}

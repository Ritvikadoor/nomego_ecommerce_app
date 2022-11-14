import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nomego_ecommerce_app/constants/global_variables.dart';

class CarouselImage extends StatelessWidget {
  const CarouselImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map(
        (i) {
          return Builder(
            builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  i,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1,
        height: 200,
      ),
    );
  }
}

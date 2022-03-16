import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../globals.dart' as globals;
import '../widgets/product_card.dart';

class NewArrivalsMobile extends StatelessWidget {
  const NewArrivalsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> imageSliders = globals.imgList
        .map(
          (item) => ProductCard(imageUrl: item),
        )
        .toList();

    CarouselController controller = CarouselController();

    return CarouselSlider(
      items: imageSliders,
      carouselController: controller,
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
      ),
    );
  }
}

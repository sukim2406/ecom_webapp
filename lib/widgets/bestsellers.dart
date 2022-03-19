import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../globals.dart' as globals;
import '../widgets/product_card.dart';

class BestsellersMobile extends StatelessWidget {
  final myUid;
  const BestsellersMobile({
    Key? key,
    required this.myUid,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    CarouselController controller = CarouselController();

    List<Widget> imageSliders = globals.tempProductData
        .map(
          (item) => ProductCard(
            product: item,
            myUid: myUid,
          ),
        )
        .toList();

    return CarouselSlider(
      items: imageSliders,
      carouselController: controller,
      options: CarouselOptions(
        autoPlayInterval: const Duration(seconds: 4),
        autoPlay: false,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
      ),
    );
  }
}

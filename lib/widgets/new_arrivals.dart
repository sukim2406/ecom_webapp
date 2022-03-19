import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../globals.dart' as globals;
import '../widgets/product_card.dart';

class NewArrivalsMobile extends StatelessWidget {
  final myUid;
  const NewArrivalsMobile({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> imageSliders = globals.tempProductData
        .map(
          (item) => ProductCard(
            product: item,
            myUid: myUid,
          ),
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

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

    return Column(
      children: <Widget>[
        SizedBox(
          width: globals.getWidth(context, .8),
          child: const Text(
            'New Arrivals',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        CarouselSlider(
          items: imageSliders,
          carouselController: controller,
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
          ),
        ),
      ],
    );
  }
}

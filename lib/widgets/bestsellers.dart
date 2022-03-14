import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../globals.dart' as globals;
import '../widgets/product_card.dart';

class BestsellersMobile extends StatelessWidget {
  const BestsellersMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarouselController controller = CarouselController();

    List<Widget> imageSliders = globals.imgList
        .map(
          (item) => ProductCard(imageUrl: item),
        )
        .toList();

    return Column(
      children: <Widget>[
        SizedBox(
          width: globals.getWidth(context, .8),
          child: const Text(
            'Bestsellers',
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
            autoPlayInterval: const Duration(seconds: 4),
            autoPlay: false,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
          ),
        ),
        // Row(
        //   children: [
        //     SizedBox(
        //       width: globals.getWidth(context, .1),
        //     ),
        //     ElevatedButton(
        //       onPressed: () => controller.previousPage(
        //         duration: const Duration(milliseconds: 300),
        //         curve: Curves.linear,
        //       ),
        //       child: const Icon(Icons.navigate_before),
        //     ),
        //     Expanded(
        //       child: Container(),
        //     ),
        //     ElevatedButton(
        //       onPressed: () => controller.nextPage(
        //         duration: const Duration(milliseconds: 300),
        //         curve: Curves.linear,
        //       ),
        //       child: const Icon(Icons.navigate_next),
        //     ),
        //     SizedBox(
        //       width: globals.getWidth(context, .1),
        //     ),
        //   ],
        // )
      ],
    );
  }
}

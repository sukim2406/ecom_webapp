import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../globals.dart' as globals;
import '../widgets/product_card.dart';
import '../controllers/product_controller.dart';

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
    List<Widget> imageSliders = [];
    CarouselController controller = CarouselController();

    return FutureBuilder(
      future: ProductController.instance.getProductsByCategory('best'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var temp = snapshot.data! as List<Object?>;
          imageSliders = temp
              .map(
                (doc) => ProductCard(
                  product: doc as Map,
                  myUid: myUid,
                ),
              )
              .toList();
          return CarouselSlider(
            items: imageSliders,
            carouselController: controller,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../globals.dart' as globals;
import '../widgets/blog_card.dart';

class Blogs extends StatelessWidget {
  const Blogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarouselController controller = CarouselController();

    List<Widget> blogSliders = globals.blogList
        .map(
          (item) => BlogCard(imageUrl: item),
        )
        .toList();
    return Column(
      children: <Widget>[
        SizedBox(
          width: globals.getWidth(context, .8),
          child: const Text(
            'Notice',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        CarouselSlider(
          items: blogSliders,
          carouselController: controller,
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../globals.dart' as globals;
import '../widgets/blog_card.dart';

class BlogsMobile extends StatelessWidget {
  const BlogsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> blogSliders = globals.tempBlogData
        .map(
          (item) => BlogCardMobile(blog: item),
        )
        .toList();
    return CarouselSlider(
      options: CarouselOptions(
        height: globals.getHeight(context, .5),
        viewportFraction: 1,
        enlargeCenterPage: false,
        autoPlay: true,
      ),
      items: blogSliders,
    );
  }
}

class BlogsTablet extends StatelessWidget {
  const BlogsTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> blogSliders = globals.tempBlogData
        .map(
          (item) => BlogCardTablet(blog: item),
        )
        .toList();
    return SizedBox(
      height: 150.0,
      width: 200.0,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 150,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          autoPlay: true,
        ),
        items: blogSliders,
      ),
    );
  }
}

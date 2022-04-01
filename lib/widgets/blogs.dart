import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../globals.dart' as globals;
import '../widgets/blog_card.dart';
import '../controllers/blog_controller.dart';

class BlogsMobile extends StatelessWidget {
  final String myUid;
  const BlogsMobile({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> blogSliders = [];
    return FutureBuilder(
      future: BlogController.instance.getAllBlogs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var temp = snapshot.data! as List<Object?>;
          blogSliders = temp
              .map(
                (doc) => BlogCardMobile(blog: doc as Map, myUid: myUid),
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
        } else {
          return Container();
        }
      },
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

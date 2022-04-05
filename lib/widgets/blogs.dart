import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../globals.dart' as globals;
import '../widgets/blog_card.dart';
import '../controllers/blog_controller.dart';
import '../widgets/responsive_layout.dart';

class Blogs extends StatelessWidget {
  final String myUid;
  const Blogs({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> blogSliders = [];
    return ResponsiveLayout(
      mobileVer: FutureBuilder(
        future: BlogController.instance.getAllBlogs(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var temp = snapshot.data! as List<Object?>;
            blogSliders = temp
                .map(
                  (doc) => BlogCard(blog: doc as Map, myUid: myUid),
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
      ),
      tabletVer: FutureBuilder(
        future: BlogController.instance.getAllBlogs(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var temp = snapshot.data! as List<Object?>;
            blogSliders = temp
                .map(
                  (doc) => BlogCardTablet(
                    blog: doc as Map,
                    myUid: myUid,
                  ),
                )
                .toList();
            return SizedBox(
              height: 150.0,
              width: 200.0,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: globals.getHeight(context, .5),
                  viewportFraction: 1,
                  enlargeCenterPage: false,
                  autoPlay: true,
                ),
                items: blogSliders,
              ),
            );
          } else {
            return Container();
          }
        },
      ),
      desktopVer: FutureBuilder(
        future: BlogController.instance.getAllBlogs(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var temp = snapshot.data! as List<Object?>;
            blogSliders = temp
                .map((doc) => BlogCardDesktop(
                      blog: doc as Map,
                      myUid: myUid,
                    ))
                .toList();
            return ListView(
              children: blogSliders,
            );
          } else {
            return Text('Error');
          }
        },
      ),
    );
  }
}

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
  final String myUid;
  const BlogsTablet({
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
                (doc) => BlogCardTablet(
                  blog: doc as Map,
                  myUid: myUid,
                ),
              )
              .toList();
          return SizedBox(
            height: 150.0,
            width: 200.0,
            child: CarouselSlider(
              options: CarouselOptions(
                height: globals.getHeight(context, .5),
                viewportFraction: 1,
                enlargeCenterPage: false,
                autoPlay: true,
              ),
              items: blogSliders,
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

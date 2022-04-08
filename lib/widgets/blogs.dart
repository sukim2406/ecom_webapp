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
      mobileVer: BlogsMobile(
        myUid: myUid,
      ),
      tabletVer: BlogsTablet(
        myUid: myUid,
      ),
      desktopVer: BlogsDesktop(
        myUid: myUid,
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

class BlogsDesktop extends StatelessWidget {
  final String myUid;
  const BlogsDesktop({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> blogSliders = [];
    return SizedBox(
      height: globals.getHeight(context, .8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: globals.getHeight(context, .35),
            child: const Image(
              image: AssetImage('img/Supreme-Logo.png'),
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: globals.getHeight(context, .05),
            width: globals.getWidth(context, .4),
            child: const Text(
              'NOTICE',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: globals.getHeight(context, .3),
            ),
            child: FutureBuilder(
              future: BlogController.instance.getAllBlogs(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var temp = snapshot.data! as List<Object?>;
                  blogSliders = temp
                      .map(
                        (doc) => BlogCardDesktop(
                          blog: doc as Map,
                          myUid: myUid,
                        ),
                      )
                      .toList();
                  return SizedBox(
                    height: globals.getHeight(context, .1),
                    width: globals.getWidth(context, .4),
                    child: ListView(
                      shrinkWrap: true,
                      // reverse: true,
                      children: blogSliders,
                    ),
                  );
                } else {
                  return const Text('Error');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

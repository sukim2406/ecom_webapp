import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widgets/product_card.dart';
import '../controllers/product_controller.dart';
import '../globals.dart' as globals;

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

class BestsellersTablet extends StatelessWidget {
  final String myUid;
  const BestsellersTablet({
    Key? key,
    required this.myUid,
  }) : super(key: key);

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
                (doc) => ProductCardTablet(
                  product: doc as Map,
                  myUid: myUid,
                ),
              )
              .toList();
          return Column(
            children: [
              SizedBox(
                height: globals.getHeight(context, .1),
              ),
              CarouselSlider(
                items: imageSliders,
                carouselController: controller,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  height: globals.getHeight(context, .3),
                  aspectRatio: 2.0,
                ),
              ),
              SizedBox(
                height: globals.getHeight(context, .1),
              ),
              SizedBox(
                height: globals.getHeight(context, .2),
                width: globals.getWidth(context, .8),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageSliders.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: globals.getHeight(context, .3),
                      width: globals.getWidth(context, .3),
                      child: imageSliders[index],
                    );
                  },
                ),
              )
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class BestsellersDesktop extends StatelessWidget {
  final String myUid;
  const BestsellersDesktop({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> imageSliders = [];
    return FutureBuilder(
      future: ProductController.instance.getProductsByCategory('best'),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.hasError) {
          return const Text('Error');
        }
        var temp = snapshot.data! as List<Object?>;
        imageSliders = temp
            .map(
              (doc) => ProductCardTablet(
                product: doc as Map,
                myUid: myUid,
              ),
            )
            .toList();
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imageSliders.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: globals.getHeight(context, .2),
              width: globals.getWidth(context, .2),
              child: imageSliders[index],
            );
          },
        );
      },
    );
  }
}

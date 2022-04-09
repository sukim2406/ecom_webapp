import 'package:ecom_webapp/widgets/responsive_layout.dart';
import 'package:flutter/material.dart';

import '../widgets/menu_list.dart';
import '../widgets/product_card.dart';
import '../widgets/appbar_widget.dart';
import '../controllers/product_controller.dart';
import '../widgets/new_arrivals.dart';
import '../widgets/bestsellers.dart';
import '../widgets/favorites.dart';
import '../globals.dart' as globals;

class Products extends StatelessWidget {
  final String myUid;
  int initialIndex;
  Products({
    Key? key,
    required this.myUid,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> productList = [];
    return ResponsiveLayout(
      mobileVer: ProductsMobile(
        myUid: myUid,
      ),
      tabletVer: ProductsTablet(
        myUid: myUid,
      ),
      desktopVer: ProductsDesktop(
        myUid: myUid,
      ),
    );
  }
}

class ProductsMobile extends StatelessWidget {
  final String myUid;
  const ProductsMobile({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> productList = [];
    return Scaffold(
      appBar: AppbarWidget(
        tabBar: false,
        myUid: myUid,
      ),
      drawer: Drawer(
        child: MenuList(
          myUid: myUid,
        ),
      ),
      body: FutureBuilder(
        future: ProductController.instance.getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var temp = snapshot.data! as List<Object?>;
            productList = temp
                .map((doc) => ProductCard(
                      product: doc as Map,
                      myUid: myUid,
                    ))
                .toList();
          }
          return Container(
            color: Colors.black,
            child: (snapshot.hasData)
                ? GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20.0),
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    children: productList,
                  )
                : Container(),
          );
        },
      ),
    );
  }
}

class ProductsTablet extends StatelessWidget {
  final String myUid;
  int initialIndex;
  ProductsTablet({
    Key? key,
    required this.myUid,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> productList = [];
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        initialIndex: initialIndex,
        child: Scaffold(
          appBar: AppbarWidgetTablet(
            myUid: myUid,
            tabBar: true,
          ),
          body: Container(
            color: Colors.black,
            height: globals.getHeight(context, 1),
            width: globals.getWidth(context, 1),
            child: Column(
              children: [
                SizedBox(
                  height: globals.getHeight(context, .8),
                  width: globals.getWidth(context, 1),
                  child: TabBarView(
                    children: [
                      Container(
                        color: Colors.black,
                        child: NewArrivalsTablet(
                          myUid: myUid,
                        ),
                      ),
                      Container(
                        color: Colors.black,
                        child: BestsellersTablet(
                          myUid: myUid,
                        ),
                      ),
                      FutureBuilder(
                        future: ProductController.instance.getAllProducts(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var temp = snapshot.data! as List<Object?>;
                            productList = temp
                                .map((doc) => ProductCard(
                                      product: doc as Map,
                                      myUid: myUid,
                                    ))
                                .toList();
                          }
                          return Container(
                            color: Colors.black,
                            child: (snapshot.hasData)
                                ? GridView.count(
                                    primary: false,
                                    padding: const EdgeInsets.all(20.0),
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                    children: productList,
                                  )
                                : Container(),
                          );
                        },
                      ),
                      Container(
                        color: Colors.black,
                        child: FavoritesMobile(
                          myUid: myUid,
                        ),
                      ),
                    ],
                  ),
                ),
                MenuList(myUid: myUid),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductsDesktop extends StatelessWidget {
  final String myUid;
  const ProductsDesktop({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> productList = [];
    return SizedBox(
      width: globals.getWidth(context, .8),
      height: globals.getHeight(context, .7),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: globals.getHeight(context, .05),
              width: globals.getWidth(context, .8),
              alignment: Alignment.centerLeft,
              child: const Text(
                'NEW ARRIVALS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: globals.getHeight(context, .2),
              child: NewArrivalsDesktop(
                myUid: myUid,
              ),
            ),
            Container(
              height: globals.getHeight(context, .05),
              width: globals.getWidth(context, .8),
              alignment: Alignment.centerLeft,
              child: const Text(
                'BESTSELLERS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: globals.getHeight(context, .2),
              child: BestsellersDesktop(
                myUid: myUid,
              ),
            ),
            Container(
              height: globals.getHeight(context, .05),
              width: globals.getWidth(context, .8),
              alignment: Alignment.centerLeft,
              child: const Text(
                'ALL PRODUCTS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: globals.getHeight(context, .8),
              child: FutureBuilder(
                future: ProductController.instance.getAllProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var temp = snapshot.data! as List<Object?>;
                    productList = temp
                        .map((doc) => ProductCard(
                              product: doc as Map,
                              myUid: myUid,
                            ))
                        .toList();
                  }
                  return Container(
                    color: Colors.black,
                    child: (snapshot.hasData)
                        ? GridView.count(
                            shrinkWrap: true,
                            primary: false,
                            padding: const EdgeInsets.all(20.0),
                            crossAxisCount: 4,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            children: productList,
                          )
                        : Container(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

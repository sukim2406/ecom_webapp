import 'package:ecom_webapp/pages/cart.dart';
import 'package:ecom_webapp/pages/find_order.dart';
import 'package:ecom_webapp/pages/login.dart';
import 'package:ecom_webapp/pages/products.dart';
import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../widgets/new_arrivals.dart';
import '../widgets/bestsellers.dart';
import '../widgets/blogs.dart';
import '../widgets/menu_list.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/favorites.dart';
import '../widgets/responsive_layout.dart';
import '../pages/cart.dart';
import '../pages/about.dart';

class Landing extends StatefulWidget {
  final String myUid;
  final int initialIndex;
  const Landing({
    Key? key,
    required this.myUid,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    scrollFunction(to) {
      scrollController.animateTo(globals.getHeight(context, to),
          duration: const Duration(
            seconds: 1,
          ),
          curve: Curves.ease);
    }

    refreshFunction(to) {
      scrollFunction(to);
      setState(() {});
    }

    return ResponsiveLayout(
      mobileVer: LandingMobile(
        myUid: widget.myUid,
      ),
      tabletVer: LandingTablet(
        myUid: widget.myUid,
      ),
      desktopVer: LandingDesktop(
        myUid: widget.myUid,
        refreshFunction: refreshFunction,
      ),
    );
  }
}

class LandingMobile extends StatelessWidget {
  final String myUid;
  final int initialIndex;
  const LandingMobile({
    Key? key,
    required this.myUid,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        initialIndex: initialIndex,
        child: Scaffold(
          appBar: AppbarWidget(
            tabBar: true,
            myUid: myUid,
          ),
          drawer: Drawer(
            child: MenuList(
              myUid: myUid,
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                color: Colors.black,
                child: Blogs(
                  myUid: myUid,
                ),
              ),
              Container(
                color: Colors.black,
                child: NewArrivalsMobile(
                  myUid: myUid,
                ),
              ),
              Container(
                color: Colors.black,
                child: BestsellersMobile(
                  myUid: myUid,
                ),
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
      ),
    );
  }
}

class LandingTablet extends StatelessWidget {
  final String myUid;
  final int initialIndex;
  const LandingTablet({
    Key? key,
    required this.myUid,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 400.0,
                height: 150.0,
                child: Image(
                  image: AssetImage('img/Supreme-Logo.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(
                height: globals.getHeight(context, .02),
              ),
              MenuList(
                myUid: myUid,
              ),
              SizedBox(
                height: globals.getHeight(context, .02),
              ),
              Blogs(
                myUid: myUid,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LandingDesktop extends StatelessWidget {
  final String myUid;
  final Function? refreshFunction;
  const LandingDesktop({
    Key? key,
    required this.myUid,
    this.refreshFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    scrollFunction(to) {
      scrollController.animateTo(globals.getHeight(context, to),
          duration: const Duration(
            seconds: 1,
          ),
          curve: Curves.ease);
    }

    return Scaffold(
      body: Container(
        height: globals.getHeight(context, 1),
        width: globals.getWidth(context, 1),
        color: Colors.black,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          controller: scrollController,
          child: SizedBox(
            width: globals.getWidth(context, 1),
            height: globals.getHeight(context, 6),
            child: ListView(
              children: [
                // ********** LANDING **********
                SizedBox(
                  height: globals.getHeight(
                    context,
                    1,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuList(
                        myUid: myUid,
                        scrollTo: scrollFunction,
                      ),
                      Blogs(myUid: myUid),
                      SizedBox(
                        height: globals.getHeight(
                          context,
                          .1,
                        ),
                      )
                    ],
                  ),
                ),
                // ********** PRODUCTS **********
                SizedBox(
                  height: globals.getHeight(
                    context,
                    1,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuList(
                        myUid: myUid,
                        scrollTo: scrollFunction,
                      ),
                      SizedBox(
                        width: globals.getWidth(context, .8),
                        height: globals.getHeight(context, .05),
                        child: const Image(
                          image: AssetImage('img/Supreme-Logo.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: globals.getHeight(context, .05),
                      ),
                      Products(myUid: myUid),
                      SizedBox(
                        height: globals.getHeight(context, .1),
                      )
                    ],
                  ),
                ),
                // ********** CART **********
                SizedBox(
                  height: globals.getHeight(context, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuList(
                        myUid: myUid,
                        scrollTo: scrollFunction,
                      ),
                      SizedBox(
                        width: globals.getWidth(context, .8),
                        height: globals.getHeight(context, .05),
                        child: const Image(
                          image: AssetImage('img/Supreme-Logo.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: globals.getHeight(context, .05),
                      ),
                      Cart(
                        myUid: myUid,
                      ),
                      SizedBox(
                        height: globals.getHeight(context, .1),
                      ),
                    ],
                  ),
                ),
                // ********** ORDERS **********
                SizedBox(
                  height: globals.getHeight(context, 1),
                  width: globals.getWidth(context, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuList(
                        myUid: myUid,
                        scrollTo: scrollFunction,
                      ),
                      SizedBox(
                        height: globals.getHeight(context, .1),
                      ),
                      FindOrder(myUid: myUid),
                      SizedBox(
                        height: globals.getHeight(context, .1),
                      ),
                    ],
                  ),
                ),
                // ********** ABOUT **********
                SizedBox(
                  height: globals.getHeight(context, 1),
                  width: globals.getWidth(context, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuList(
                        myUid: myUid,
                        scrollTo: scrollFunction,
                      ),
                      SizedBox(
                        width: globals.getWidth(context, .8),
                        height: globals.getHeight(context, .05),
                        child: const Image(
                          image: AssetImage('img/Supreme-Logo.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: globals.getHeight(context, .05),
                      ),
                      About(
                        myUid: myUid,
                      ),
                      SizedBox(
                        height: globals.getHeight(context, .1),
                      ),
                    ],
                  ),
                ),
                // ********** LOG IN **********
                SizedBox(
                  height: globals.getHeight(context, 1),
                  width: globals.getWidth(context, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuList(
                        myUid: myUid,
                        scrollTo: scrollFunction,
                      ),
                      SizedBox(
                        height: globals.getHeight(context, .1),
                      ),
                      LogIn(
                        myUid: myUid,
                        // func: scrollTo,
                      ),
                      SizedBox(
                        height: globals.getHeight(context, .1),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

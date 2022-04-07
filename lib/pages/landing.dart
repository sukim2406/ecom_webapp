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
  int initialIndex;
  Landing({
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
          duration: Duration(
            seconds: 1,
          ),
          curve: Curves.ease);
    }

    refreshFunction(to) {
      scrollFunction(to);
      setState(() {});
    }

    return ResponsiveLayout(
      mobileVer: MaterialApp(
        home: DefaultTabController(
          length: 4,
          initialIndex: widget.initialIndex,
          child: Scaffold(
            appBar: AppbarWidget(
              tabBar: true,
              myUid: widget.myUid,
            ),
            drawer: Drawer(
              child: MenuList(
                myUid: widget.myUid,
              ),
            ),
            body: TabBarView(
              children: [
                Container(
                  color: Colors.black,
                  child: Blogs(
                    myUid: widget.myUid,
                  ),
                ),
                Container(
                  color: Colors.black,
                  child: NewArrivalsMobile(
                    myUid: widget.myUid,
                  ),
                ),
                Container(
                  color: Colors.black,
                  child: BestsellersMobile(
                    myUid: widget.myUid,
                  ),
                ),
                Container(
                  color: Colors.black,
                  child: FavoritesMobile(
                    myUid: widget.myUid,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      tabletVer: Scaffold(
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
                  myUid: widget.myUid,
                ),
                SizedBox(
                  height: globals.getHeight(context, .02),
                ),
                Blogs(
                  myUid: widget.myUid,
                ),
              ],
            ),
          ),
        ),
      ),
      desktopVer: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          controller: scrollController,
          child: Container(
            width: globals.getWidth(context, 1),
            height: globals.getHeight(context, 6),
            color: Colors.black,
            child: ListView(
              children: [
                // ********** LANDING **********
                Container(
                  height: globals.getHeight(
                    context,
                    1,
                  ),
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: globals.getHeight(
                          context,
                          .01,
                        ),
                      ),
                      SizedBox(
                        height: globals.getHeight(context, .09),
                        child: MenuList(
                          myUid: widget.myUid,
                          scrollTo: scrollFunction,
                        ),
                      ),
                      SizedBox(
                        height: globals.getHeight(context, .8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              image: AssetImage('img/Supreme-Logo.png'),
                            ),
                            SizedBox(
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
                            Blogs(
                              myUid: widget.myUid,
                            ),
                          ],
                        ),
                      ),
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
                Container(
                  height: globals.getHeight(
                    context,
                    1,
                  ),
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: globals.getHeight(context, .01),
                      ),
                      SizedBox(
                        height: globals.getHeight(context, .09),
                        child: MenuList(
                          myUid: widget.myUid,
                          scrollTo: scrollFunction,
                        ),
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
                      SizedBox(
                        width: globals.getWidth(context, .8),
                        height: globals.getHeight(context, .7),
                        child: SingleChildScrollView(
                          child: Products(myUid: widget.myUid),
                        ),
                      ),
                      SizedBox(
                        height: globals.getHeight(context, .1),
                      )
                    ],
                  ),
                ),
                // ********** CART **********
                Container(
                  height: globals.getHeight(context, 1),
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: globals.getHeight(context, .01),
                      ),
                      SizedBox(
                        height: globals.getHeight(context, .09),
                        child: MenuList(
                          myUid: widget.myUid,
                          scrollTo: scrollFunction,
                        ),
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
                      Container(
                        height: globals.getHeight(context, .75),
                        width: globals.getWidth(context, .8),
                        color: Colors.black,
                        child: Cart(myUid: widget.myUid),
                      ),
                      SizedBox(
                        height: globals.getHeight(context, .05),
                      ),
                    ],
                  ),
                ),
                // ********** ORDERS **********
                Container(
                  height: globals.getHeight(context, 1),
                  width: globals.getWidth(context, 1),
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: globals.getHeight(context, .01),
                      ),
                      SizedBox(
                        height: globals.getHeight(context, .09),
                        child: MenuList(
                          myUid: widget.myUid,
                          scrollTo: scrollFunction,
                        ),
                      ),
                      SizedBox(
                        height: globals.getHeight(context, .8),
                        width: globals.getWidth(context, .8),
                        child: FindOrder(myUid: widget.myUid),
                      ),
                    ],
                  ),
                ),
                // ********** ABOUT **********
                Container(
                  height: globals.getHeight(context, 1),
                  width: globals.getWidth(context, 1),
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: globals.getHeight(context, .01),
                      ),
                      SizedBox(
                        height: globals.getHeight(context, .09),
                        child: MenuList(
                          myUid: widget.myUid,
                          scrollTo: scrollFunction,
                        ),
                      ),
                      SizedBox(
                        height: globals.getHeight(context, .8),
                        width: globals.getWidth(context, .8),
                        child: About(myUid: widget.myUid),
                      ),
                    ],
                  ),
                ),
                // ********** LOG IN **********
                Container(
                  height: globals.getHeight(context, 1),
                  width: globals.getWidth(context, 1),
                  color: Colors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: globals.getHeight(
                          context,
                          .01,
                        ),
                      ),
                      SizedBox(
                        height: globals.getHeight(context, .09),
                        child: MenuList(
                          myUid: widget.myUid,
                          scrollTo: scrollFunction,
                        ),
                      ),
                      LogIn(
                        myUid: widget.myUid,
                        func: refreshFunction,
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
// class Landing extends StatelessWidget {
//   final String myUid;
//   int initialIndex;
//   Landing({
//     Key? key,
//     required this.myUid,
//     this.initialIndex = 0,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     ScrollController scrollController = ScrollController();

//     scrollFunction(to) {
//       scrollController.animateTo(globals.getHeight(context, to),
//           duration: Duration(
//             seconds: 1,
//           ),
//           curve: Curves.ease);
//     }

//     return ResponsiveLayout(
//       mobileVer: MaterialApp(
//         home: DefaultTabController(
//           length: 4,
//           initialIndex: initialIndex,
//           child: Scaffold(
//             appBar: AppbarWidget(
//               tabBar: true,
//               myUid: myUid,
//             ),
//             drawer: Drawer(
//               child: MenuList(
//                 myUid: myUid,
//               ),
//             ),
//             body: TabBarView(
//               children: [
//                 Container(
//                   color: Colors.black,
//                   child: Blogs(
//                     myUid: myUid,
//                   ),
//                 ),
//                 Container(
//                   color: Colors.black,
//                   child: NewArrivalsMobile(
//                     myUid: myUid,
//                   ),
//                 ),
//                 Container(
//                   color: Colors.black,
//                   child: BestsellersMobile(
//                     myUid: myUid,
//                   ),
//                 ),
//                 Container(
//                   color: Colors.black,
//                   child: FavoritesMobile(
//                     myUid: myUid,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       tabletVer: Scaffold(
//         body: Container(
//           color: Colors.black,
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   width: 400.0,
//                   height: 150.0,
//                   child: Image(
//                     image: AssetImage('img/Supreme-Logo.png'),
//                     fit: BoxFit.fitWidth,
//                   ),
//                 ),
//                 SizedBox(
//                   height: globals.getHeight(context, .02),
//                 ),
//                 MenuList(
//                   myUid: myUid,
//                 ),
//                 SizedBox(
//                   height: globals.getHeight(context, .02),
//                 ),
//                 Blogs(
//                   myUid: myUid,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       desktopVer: Scaffold(
//         body: SingleChildScrollView(
//           physics: NeverScrollableScrollPhysics(),
//           controller: scrollController,
//           child: Container(
//             width: globals.getWidth(context, 1),
//             height: globals.getHeight(context, 6),
//             color: Colors.black,
//             child: ListView(
//               children: [
//                 // ********** LANDING **********
//                 Container(
//                   height: globals.getHeight(
//                     context,
//                     1,
//                   ),
//                   color: Colors.black,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: globals.getHeight(
//                           context,
//                           .01,
//                         ),
//                       ),
//                       SizedBox(
//                         height: globals.getHeight(context, .09),
//                         child: MenuList(
//                           myUid: myUid,
//                           scrollTo: scrollFunction,
//                         ),
//                       ),
//                       SizedBox(
//                         height: globals.getHeight(context, .8),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Image(
//                               image: AssetImage('img/Supreme-Logo.png'),
//                             ),
//                             SizedBox(
//                               width: globals.getWidth(context, .4),
//                               child: const Text(
//                                 'NOTICE',
//                                 textAlign: TextAlign.left,
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                             ),
//                             Blogs(
//                               myUid: myUid,
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: globals.getHeight(
//                           context,
//                           .1,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 // ********** PRODUCTS **********
//                 Container(
//                   height: globals.getHeight(
//                     context,
//                     1,
//                   ),
//                   color: Colors.black,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: globals.getHeight(context, .01),
//                       ),
//                       SizedBox(
//                         height: globals.getHeight(context, .09),
//                         child: MenuList(
//                           myUid: myUid,
//                           scrollTo: scrollFunction,
//                         ),
//                       ),
//                       SizedBox(
//                         width: globals.getWidth(context, .8),
//                         height: globals.getHeight(context, .05),
//                         child: const Image(
//                           image: AssetImage('img/Supreme-Logo.png'),
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                       SizedBox(
//                         height: globals.getHeight(context, .05),
//                       ),
//                       SizedBox(
//                         width: globals.getWidth(context, .8),
//                         height: globals.getHeight(context, .7),
//                         child: SingleChildScrollView(
//                           child: Products(myUid: myUid),
//                         ),
//                       ),
//                       SizedBox(
//                         height: globals.getHeight(context, .1),
//                       )
//                     ],
//                   ),
//                 ),
//                 // ********** CART **********
//                 Container(
//                   height: globals.getHeight(context, 1),
//                   color: Colors.black,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: globals.getHeight(context, .01),
//                       ),
//                       SizedBox(
//                         height: globals.getHeight(context, .09),
//                         child: MenuList(
//                           myUid: myUid,
//                           scrollTo: scrollFunction,
//                         ),
//                       ),
//                       SizedBox(
//                         width: globals.getWidth(context, .8),
//                         height: globals.getHeight(context, .05),
//                         child: const Image(
//                           image: AssetImage('img/Supreme-Logo.png'),
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                       SizedBox(
//                         height: globals.getHeight(context, .05),
//                       ),
//                       Container(
//                         height: globals.getHeight(context, .75),
//                         width: globals.getWidth(context, .8),
//                         color: Colors.black,
//                         child: Cart(myUid: myUid),
//                       ),
//                       SizedBox(
//                         height: globals.getHeight(context, .05),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // ********** ORDERS **********
//                 Container(
//                   height: globals.getHeight(context, 1),
//                   width: globals.getWidth(context, 1),
//                   color: Colors.amber,
//                 ),
//                 // ********** ABOUT **********
//                 Container(
//                   height: globals.getHeight(context, 1),
//                   width: globals.getWidth(context, 1),
//                   color: Colors.amber,
//                 ),
//                 // ********** LOG IN **********
//                 Container(
//                   height: globals.getHeight(context, 1),
//                   width: globals.getWidth(context, 1),
//                   color: Colors.black,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: globals.getHeight(
//                           context,
//                           .01,
//                         ),
//                       ),
//                       SizedBox(
//                         height: globals.getHeight(context, .09),
//                         child: MenuList(
//                           myUid: myUid,
//                           scrollTo: scrollFunction,
//                         ),
//                       ),
//                       LogIn(myUid: myUid),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class LandingMobile extends StatelessWidget {
  final myUid;
  int initialIndex;
  LandingMobile({
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
                child: BlogsMobile(
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
  final myUid;
  int initialIndex;
  LandingTablet({
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
              BlogsTablet(
                myUid: myUid,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

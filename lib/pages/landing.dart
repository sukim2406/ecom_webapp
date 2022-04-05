import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../widgets/new_arrivals.dart';
import '../widgets/bestsellers.dart';
import '../widgets/blogs.dart';
import '../widgets/menu_list.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/favorites.dart';
import '../widgets/responsive_layout.dart';

class Landing extends StatelessWidget {
  final String myUid;
  int initialIndex;
  Landing({
    Key? key,
    required this.myUid,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileVer: MaterialApp(
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
      ),
      desktopVer: Scaffold(
        body: Container(
          height: globals.getHeight(context, 1),
          width: globals.getWidth(context, 1),
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('img/Supreme-Logo.png'),
              ),
              Container(
                height: globals.getHeight(context, .3),
                width: globals.getWidth(context, .3),
                color: Colors.grey,
                child: Blogs(
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

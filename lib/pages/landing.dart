import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../widgets/appbar_padding.dart';
import '../widgets/new_arrivals.dart';
import '../widgets/bestsellers.dart';
import '../widgets/blogs.dart';
import '../widgets/menu_list.dart';

class LandingMobile extends StatelessWidget {
  const LandingMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.black,
            flexibleSpace: Image(
              image: const AssetImage('img/Supreme-Logo.png'),
              height: globals.getHeight(context, .1),
              fit: BoxFit.fitHeight,
            ),
            actions: const [
              Icon(
                Icons.favorite,
              ),
              AppbarPadding(),
              Icon(
                Icons.search,
              ),
              AppbarPadding(),
            ],
            bottom: const TabBar(
              indicatorColor: Colors.red,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              tabs: [
                Tab(
                  text: 'NEWSLETTERS',
                ),
                Tab(
                  text: 'NEW ARRIVALS',
                ),
                Tab(
                  text: 'BEST',
                ),
              ],
            ),
          ),
          drawer: const Drawer(
            child: MenuListMobile(),
          ),
          body: TabBarView(
            children: [
              Container(
                color: Colors.black,
                child: const BlogsMobile(),
              ),
              Container(
                color: Colors.black,
                child: const NewArrivalsMobile(),
              ),
              Container(
                color: Colors.black,
                child: const BestsellersMobile(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LandingTablet extends StatelessWidget {
  const LandingTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            const MenuListTablet(),
            SizedBox(
              height: globals.getHeight(context, .02),
            ),
            const BlogsTablet(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../widgets/new_arrivals.dart';
import '../widgets/bestsellers.dart';
import '../widgets/blogs.dart';
import '../widgets/menu_list.dart';
import '../widgets/appbar_widget.dart';
import '../static.dart';

class LandingMobile extends StatelessWidget {
  final myUid;
  const LandingMobile({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppbarWidget(
            tabBar: true,
            myUid: myUid,
          ),
          drawer: Drawer(
            child: MenuListMobile(
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

import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../widgets/appbar_widget.dart';
import '../widgets/responsive_layout.dart';
import '../widgets/menu_list.dart';

class About extends StatelessWidget {
  final String myUid;
  const About({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileVer: AboutMobile(
        myUid: myUid,
      ),
      tabletVer: AboutTablet(
        myUid: myUid,
      ),
      desktopVer: AboutDesktop(
        myUid: myUid,
      ),
    );
  }
}

class AboutMobile extends StatelessWidget {
  final String myUid;
  const AboutMobile({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        tabBar: false,
        myUid: myUid,
      ),
      body: Container(
        color: Colors.black,
        width: globals.getWidth(context, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'About Page',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'About this page',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutTablet extends StatelessWidget {
  final String myUid;
  const AboutTablet({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: globals.getWidth(context, 1),
        height: globals.getHeight(context, 1),
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'About Page',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'About this page',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: globals.getHeight(context, .1),
            ),
            MenuList(myUid: myUid),
          ],
        ),
      ),
    );
  }
}

class AboutDesktop extends StatelessWidget {
  final String myUid;
  const AboutDesktop({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: globals.getWidth(context, .8),
      height: globals.getHeight(context, .7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'About Page',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'About this page',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

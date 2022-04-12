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
        child: SizedBox(
          width: globals.getWidth(context, .8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'THIS IS NOT REAL SUPREME WEBPAGE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: globals.getHeight(context, .05),
              ),
              const Text(
                'This page is created by Soun Sean Kim ssk.sosodev@gmail.com as a personal project',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const Text(
                'Purpose of this page is to practice Flutter Web as frontend and Google Firebase as backend by',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const Text(
                'creating responsive e-commerce style web app.',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const Text(
                'No real information is needed to place order, it is just to generate all result pages.',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: globals.getHeight(context, .025),
              ),
              const Text(
                'Supreme logos and product pictures from Supreme - https://www.supremenewyork.com/',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const Text(
                'Person icons created by Ilham Fitrotul Hayat - Flaticon https://www.flaticon.com/free-icons/person',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
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
              'THIS IS NOT REAL SUPREME WEBPAGE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: globals.getHeight(context, .05),
            ),
            const Text(
              'This page is created by Soun Sean Kim ssk.sosodev@gmail.com as a personal project',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const Text(
              'Purpose of this page is to practice Flutter Web as frontend and Google Firebase as backend by',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const Text(
              'creating responsive e-commerce style web app.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const Text(
              'No real information is needed to place order, it is just to generate all result pages.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: globals.getHeight(context, .025),
            ),
            const Text(
              'Supreme logos and product pictures from Supreme - https://www.supremenewyork.com/',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const Text(
              'Person icons created by Ilham Fitrotul Hayat - Flaticon https://www.flaticon.com/free-icons/person',
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
      width: globals.getWidth(context, .4),
      height: globals.getHeight(context, .7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'THIS IS NOT REAL SUPREME WEBPAGE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: globals.getHeight(context, .05),
          ),
          const Text(
            'This page is created by Soun Sean Kim ssk.sosodev@gmail.com as a personal project',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const Text(
            'Purpose of this page is to practice Flutter Web as frontend and Google Firebase as backend by',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const Text(
            'creating responsive e-commerce style web app.',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const Text(
            'No real information is needed to place order, it is just to generate all result pages.',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: globals.getHeight(context, .025),
          ),
          const Text(
            'Supreme logos and product pictures from Supreme - https://www.supremenewyork.com/',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const Text(
            'Person icons created by Ilham Fitrotul Hayat - Flaticon https://www.flaticon.com/free-icons/person',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

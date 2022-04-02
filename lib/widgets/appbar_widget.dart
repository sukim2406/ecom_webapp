import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../widgets/appbar_padding.dart';
import '../pages/login.dart';
import '../widgets/search_product.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String myUid;
  final bool tabBar;
  const AppbarWidget({
    Key? key,
    required this.tabBar,
    required this.myUid,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(120.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: Colors.black,
      flexibleSpace: const Image(
        image: AssetImage('img/Supreme-Logo.png'),
        height: 80.0,
        fit: BoxFit.fitHeight,
      ),
      actions: [
        const AppbarPadding(),
        SizedBox(
          width: globals.getWidth(context, .3),
          child: SearchProduct(
            myUid: myUid,
          ),
        ),
      ],
      bottom: (tabBar)
          ? const TabBar(
              indicatorColor: Colors.red,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
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
                Tab(text: 'FAVORITES'),
              ],
            )
          : null,
    );
  }
}

class AppbarWidgetTablet extends StatelessWidget
    implements PreferredSizeWidget {
  final String myUid;
  final bool tabBar;
  const AppbarWidgetTablet({
    Key? key,
    required this.tabBar,
    required this.myUid,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(120.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: Colors.black,
      flexibleSpace: const Image(
        image: AssetImage('img/Supreme-Logo.png'),
        height: 80.0,
        fit: BoxFit.fitHeight,
      ),
      actions: [
        const AppbarPadding(),
        SizedBox(
          width: globals.getWidth(context, .3),
          child: SearchProduct(
            myUid: myUid,
          ),
        ),
      ],
      bottom: (tabBar)
          ? const TabBar(
              indicatorColor: Colors.red,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              tabs: [
                Tab(
                  text: 'NEW ARRIVALS',
                ),
                Tab(
                  text: 'BEST',
                ),
                Tab(
                  text: 'ALL PRODUCTS',
                ),
                Tab(
                  text: 'FAVORITES',
                ),
              ],
            )
          : null,
    );
  }
}

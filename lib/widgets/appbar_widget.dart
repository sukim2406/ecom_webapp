import 'package:flutter/material.dart';

import '../widgets/appbar_padding.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool tabBar;
  const AppbarWidget({
    Key? key,
    required this.tabBar,
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
      bottom: (tabBar)
          ? const TabBar(
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
            )
          : null,
    );
  }
}

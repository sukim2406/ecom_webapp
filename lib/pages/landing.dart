import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../widgets/dropdown.dart';
import '../widgets/appbar_padding.dart';
import '../widgets/new_arrivals.dart';
import '../widgets/bestsellers.dart';
import '../widgets/blogs.dart';
import '../widgets/appbar.dart';

class LandingMobile extends StatelessWidget {
  const LandingMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: Appbar() as PreferredSizeWidget,
      appBar: AppBar(
        backgroundColor: Colors.white,
        flexibleSpace: const Image(
          image: AssetImage('img/Supreme-Logo.png'),
          fit: BoxFit.fitHeight,
        ),
        actions: [
          const Dropdown(),
          const AppbarPadding(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: globals.getHeight(context, .05),
            ),
            const Blogs(),
            SizedBox(
              height: globals.getHeight(context, .05),
            ),
            const NewArrivalsMobile(),
            SizedBox(
              height: globals.getHeight(context, .05),
            ),
            const BestsellersMobile(),
          ],
        ),
      ),
    );
  }
}

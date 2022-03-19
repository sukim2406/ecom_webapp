import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../widgets/menu_list.dart';
import '../widgets/product_card.dart';
import '../widgets/appbar_widget.dart';

class ProductsMobile extends StatelessWidget {
  final String myUid;
  const ProductsMobile({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> productList = globals.tempProductData
        .map(
          (item) => ProductCard(
            product: item,
            myUid: myUid,
          ),
        )
        .toList();

    return Scaffold(
      appBar: const AppbarWidget(
        tabBar: false,
      ),
      drawer: Drawer(
        child: MenuListMobile(
          myUid: myUid,
        ),
      ),
      body: Container(
        color: Colors.black,
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20.0),
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          crossAxisCount: 2,
          children: productList,
        ),
      ),
    );
  }
}

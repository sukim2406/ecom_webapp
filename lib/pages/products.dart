import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../widgets/appbar_padding.dart';
import '../widgets/menu_list.dart';
import '../widgets/product_card.dart';

class ProductsMobile extends StatelessWidget {
  const ProductsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> productList = globals.imgList
        .map(
          (item) => ProductCard(imageUrl: item),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
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
      ),
      drawer: const Drawer(
        child: MenuListMobile(),
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

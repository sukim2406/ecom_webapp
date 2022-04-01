import 'package:flutter/material.dart';

import '../widgets/menu_list.dart';
import '../widgets/product_card.dart';
import '../widgets/appbar_widget.dart';
import '../controllers/product_controller.dart';

class ProductsMobile extends StatelessWidget {
  final String myUid;
  const ProductsMobile({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> productList = [];

    return Scaffold(
      appBar: AppbarWidget(
        tabBar: false,
        myUid: myUid,
      ),
      drawer: Drawer(
        child: MenuListMobile(
          myUid: myUid,
        ),
      ),
      body: FutureBuilder(
        future: ProductController.instance.getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var temp = snapshot.data! as List<Object?>;
            productList = temp
                .map((doc) => ProductCard(
                      product: doc as Map,
                      myUid: myUid,
                    ))
                .toList();
          }
          return Container(
            color: Colors.black,
            child: (snapshot.hasData)
                ? GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20.0),
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    children: productList,
                  )
                : Container(),
          );
        },
      ),
    );
  }
}

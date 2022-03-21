import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../globals.dart' as globals;
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
    List<Widget> productList = globals.tempProductData
        .map(
          (item) => ProductCard(
            product: item,
            myUid: myUid,
          ),
        )
        .toList();

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
        // future: ProductController.instance.getAllProducts(),
        builder: (context, snapshot) {
          print(snapshot.data);
          return Container(
            color: Colors.black,
            child: Text(
              snapshot.data.toString(),
              style: TextStyle(color: Colors.white),
            ),
            // child: GridView.count(
            //   primary: false,
            //   padding: const EdgeInsets.all(20.0),
            //   crossAxisCount: 2,
            //   crossAxisSpacing: 10.0,
            //   mainAxisSpacing: 10.0,
            //   children: snapshot,
            // ),
          );
        },
      ),
      // body: Container(
      //   color: Colors.black,
      //   child: GridView.count(
      //     primary: false,
      //     padding: const EdgeInsets.all(20.0),
      //     crossAxisSpacing: 10.0,
      //     mainAxisSpacing: 10.0,
      //     crossAxisCount: 2,
      //     children: productList,
      //   ),
      // ),
    );
  }
}

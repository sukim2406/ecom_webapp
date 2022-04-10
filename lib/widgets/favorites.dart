import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../controllers/user_controller.dart';
import '../controllers/product_controller.dart';
import './product_card.dart';

class FavoritesMobile extends StatefulWidget {
  final String myUid;
  const FavoritesMobile({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  State<FavoritesMobile> createState() => _FavoritesMobileState();
}

class _FavoritesMobileState extends State<FavoritesMobile> {
  List pids = [];
  List products = [];
  List<Widget> productList = [];

  @override
  void initState() {
    getFavorites();
    super.initState();
  }

  getFavorites() async {
    pids = await UserController.instance.getFavorites(widget.myUid);

    await Future.forEach(pids, (pid) async {
      var temp = await ProductController.instance.getProductByPid(pid);
      products.add(temp.data());
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    productList = products
        .map(
          (product) => GestureDetector(
            child: ProductCard(product: product, myUid: widget.myUid),
          ),
        )
        .toList();

    return (widget.myUid != '')
        ? StreamBuilder(
            stream: UserController.instance.getFavoriteStream(widget.myUid),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              var tempMap = snapshot.data?.data() as Map;
              print(tempMap);
              if (!listEquals(tempMap['favorite'], pids)) {
                pids = tempMap['favorite'];
              }
              return GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20.0),
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: productList,
              );
            },
          )
        : const Text(
            'Log In to see favorites',
            style: TextStyle(color: Colors.white),
          );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../controllers/user_controller.dart';
import '../controllers/product_controller.dart';
import './product_card.dart';
import '../globals.dart' as globals;

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
    if (widget.myUid != '') {
      getFavorites();
    }
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
              if (tempMap['favorite'].isNotEmpty) {
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
              } else {
                return const Text(
                  'No Favorites',
                  style: TextStyle(color: Colors.white),
                );
              }
            },
          )
        : const Text(
            'Log In to see favorites',
            style: TextStyle(color: Colors.white),
          );
  }
}

class FavoritesTablet extends StatefulWidget {
  final String myUid;
  const FavoritesTablet({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  State<FavoritesTablet> createState() => _FavoritesTabletState();
}

class _FavoritesTabletState extends State<FavoritesTablet> {
  List pids = [];
  List products = [];
  List<Widget> productList = [];

  @override
  void initState() {
    if (widget.myUid != '') {
      getFavorites();
    }
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
              if (tempMap['favorite'].isNotEmpty) {
                if (!listEquals(tempMap['favorite'], pids)) {
                  pids = tempMap['favorite'];
                }
                return GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20.0),
                  crossAxisCount: 5,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  children: productList,
                );
              } else {
                return const Text(
                  'No Favorites',
                  style: TextStyle(color: Colors.white),
                );
              }
            },
          )
        : const Text(
            'Log In to see favorites',
            style: TextStyle(color: Colors.white),
          );
  }
}

class FavoritesDesktop extends StatefulWidget {
  final String myUid;
  const FavoritesDesktop({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  State<FavoritesDesktop> createState() => _FavoritesDesktopState();
}

class _FavoritesDesktopState extends State<FavoritesDesktop> {
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
    return StreamBuilder(
      stream: UserController.instance.getFavoriteStream(widget.myUid),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        var tempMap = snapshot.data?.data() as Map;
        if (!listEquals(tempMap['favorite'], pids)) {
          pids = tempMap['favorite'];
        }
        if (snapshot.hasData) {
          return (productList.isNotEmpty)
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: globals.getHeight(context, .2),
                      width: globals.getWidth(context, .2),
                      child: productList[index],
                    );
                  },
                )
              : const Text(
                  'No Saved Favorites',
                  style: TextStyle(color: Colors.white),
                );
        } else {
          return const Text(
            'Error',
            style: TextStyle(
              color: Colors.white,
            ),
          );
        }
      },
    );
  }
}

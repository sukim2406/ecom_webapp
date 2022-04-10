import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../globals.dart' as globals;
import '../widgets/appbar_widget.dart';
import '../pages/cart.dart';
import '../static.dart';
import '../controllers/user_controller.dart';
import '../pages/landing.dart';

class ProductDetailMobile extends StatefulWidget {
  final String myUid;
  final Map product;
  const ProductDetailMobile({
    Key? key,
    required this.myUid,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailMobile> createState() => _ProductDetailMobileState();
}

class _ProductDetailMobileState extends State<ProductDetailMobile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List favorites = [];

    return Scaffold(
      appBar: AppbarWidget(
        tabBar: false,
        myUid: widget.myUid,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: globals.getWidth(context, 1),
          height: globals.getHeight(context, 1.2),
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.red,
                height: globals.getHeight(context, .4),
                width: globals.getWidth(context, .8),
                child: Image.network(
                  widget.product['image'],
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: globals.getWidth(context, .8),
                child: Column(
                  children: [
                    Text(
                      widget.product['name'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      widget.product['detail'],
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    RichText(
                      text: TextSpan(
                        text: widget.product['price'].toString(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        children: const [
                          TextSpan(
                            text: ' USD',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: globals.getWidth(context, .4),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      side: const BorderSide(
                        width: 2.0,
                        color: Colors.red,
                      )),
                  onPressed: () async {
                    if (widget.myUid == '') {
                      GuestCart.addItemToCart(widget.product['pid']);
                    } else {
                      bool duplicate = false;
                      var temp = await UserController.instance
                          .getCartFromUser(widget.myUid);
                      temp.forEach(
                        (item) {
                          if (item['pid'] == widget.product['pid']) {
                            item['cnt'] += 1;
                            duplicate = true;
                          }
                        },
                      );
                      if (!duplicate) {
                        var tempMap = {
                          'pid': widget.product['pid'],
                          'cnt': 1,
                        };
                        temp.add(tempMap);
                      }
                      UserController.instance.updateCart(widget.myUid, temp);
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Cart(
                          myUid: widget.myUid,
                        ),
                      ),
                    );
                  },
                  child: const Text('Order now'),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: globals.getWidth(context, .4),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      side: const BorderSide(
                        width: 2.0,
                        color: Colors.red,
                      )),
                  onPressed: () async {
                    if (widget.myUid == '') {
                      GuestCart.addItemToCart(widget.product['pid']);
                    } else {
                      bool duplicate = false;
                      var temp = await UserController.instance
                          .getCartFromUser(widget.myUid);
                      temp.forEach(
                        (item) {
                          if (item['pid'] == widget.product['pid']) {
                            item['cnt'] += 1;
                            duplicate = true;
                          }
                        },
                      );
                      if (!duplicate) {
                        var tempMap = {
                          'pid': widget.product['pid'],
                          'cnt': 1,
                        };
                        temp.add(tempMap);
                      }
                      UserController.instance.updateCart(widget.myUid, temp);
                    }
                    Fluttertoast.showToast(
                      msg: 'item added',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  },
                  child: const Text('Add to cart'),
                ),
              ),
              const SizedBox(height: 20.0),
              (widget.myUid.isNotEmpty)
                  ? StreamBuilder(
                      stream: UserController.instance
                          .getFavoriteStream(widget.myUid),
                      builder:
                          (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.data != null) {
                          var tempMap = snapshot.data?.data() as Map;
                          favorites = tempMap['favorite'];
                        }
                        return (favorites.contains(widget.product['pid']))
                            ? Column(
                                children: [
                                  const Text(
                                    'Unset favorite',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      List temp = favorites;
                                      temp.remove(widget.product['pid']);
                                      UserController.instance
                                          .updateFavorites(widget.myUid, temp);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LandingMobile(
                                            myUid: widget.myUid,
                                            initialIndex: 3,
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  const Text(
                                    'Save as favorite',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      List temp = favorites;
                                      temp.add(widget.product['pid']);
                                      UserController.instance
                                          .updateFavorites(widget.myUid, temp);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LandingMobile(
                                            myUid: widget.myUid,
                                            initialIndex: 3,
                                          ),
                                        ),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.favorite_border_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              );
                      },
                    )
                  : SizedBox(
                      height: globals.getHeight(context, .1),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

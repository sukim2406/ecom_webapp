import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../widgets/appbar_widget.dart';
import '../widgets/cart_item.dart';
import '../static.dart';

class CartMobile extends StatefulWidget {
  final String myUid;
  const CartMobile({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  State<CartMobile> createState() => _CartMobileState();
}

class _CartMobileState extends State<CartMobile> {
  List cartItems = [];
  @override
  void initState() {
    getCartItems();
    super.initState();
  }

  void getCartItems() {
    if (widget.myUid == '') {
      cartItems = GuestCart.cartItems;
    } else {
      cartItems = globals.tempProductData;
    }
    setState(() {});
  }

  void updateCart(pid) {
    setState(() {
      cartItems.removeWhere((element) => element['pid'] == pid);
      getCartItems();
    });
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    if (cartItems.isNotEmpty) {
      cartItems.forEach(
        (item) {
          totalPrice = totalPrice +
              (globals.getProductById(item['pid'])['price'] * item['cnt']);
        },
      );
    }
    return totalPrice;
  }

  num getTotalItemCnt() {
    num totalCnt = 0;
    if (cartItems.isNotEmpty) {
      cartItems.forEach((item) {
        totalCnt = totalCnt + item['cnt'];
      });
    }

    return totalCnt;
  }

  createCartList() {
    List<Widget> list = [];
    getCartItems();
    cartItems.forEach(
      (element) {
        Map tempItem = globals.getProductById(element['pid']);
        tempItem['qty'] = element['cnt'];
        list.add(
          CartItemMobile(
            item: tempItem,
            update: updateCart,
          ),
        );
      },
    );

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        tabBar: false,
        myUid: widget.myUid,
      ),
      body: Container(
        width: globals.getWidth(context, 1.0),
        height: globals.getHeight(context, 1.0),
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 20,
              ),
              width: globals.getWidth(context, .8),
              child: const Text(
                'SHOPPING BAG',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: globals.getHeight(context, .6),
              width: globals.getWidth(context, .8),
              // color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'ITEM',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      const Icon(
                        Icons.refresh,
                        color: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  (cartItems.isNotEmpty)
                      ? Container(
                          color: Colors.grey,
                          height: globals.getHeight(context, .4),
                          // child: ListView(children: createCartList())
                          child: ListView.builder(
                            itemCount: cartItems.length,
                            itemBuilder: (context, index) {
                              Map cartItem = globals
                                  .getProductById(cartItems[index]['pid']);
                              cartItem['qty'] = cartItems[index]['cnt'];
                              return CartItemMobile(
                                item: cartItem,
                                update: updateCart,
                              );
                            },
                          ),
                        )
                      : Container(
                          color: Colors.grey,
                          height: globals.getHeight(context, .4),
                          width: globals.getWidth(context, 1),
                          child: Text(
                            'no items yet',
                          ),
                        ),
                  Container(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Text(
                          getTotalItemCnt().toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          ' items',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Text(
                          getTotalPrice().toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          ' USD',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(),
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
                          onPressed: () {},
                          child: const Text('CHECK OUT'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

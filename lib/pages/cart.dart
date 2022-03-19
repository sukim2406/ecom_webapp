import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../widgets/appbar_widget.dart';
import '../widgets/cart_item.dart';

class CartMobile extends StatelessWidget {
  final List cartItems;
  const CartMobile({
    Key? key,
    required this.cartItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double getTotalPrice() {
      double totalPrice = 0.0;
      if (cartItems.isNotEmpty) {
        cartItems.forEach(
          (item) {
            // totalPrice += (globals.getProductById(item['pid'])['price']);
            totalPrice = totalPrice +
                (globals.getProductById(item['pid'])['price'] * item['cnt']);
          },
        );
      }
      return totalPrice;
    }

    return Scaffold(
      appBar: const AppbarWidget(
        tabBar: false,
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
                          color: Colors.grey[200],
                          height: globals.getHeight(context, .4),
                          child: ListView.builder(
                            itemCount: cartItems.length,
                            itemBuilder: (context, index) {
                              return CartItemMobile(
                                  item: globals
                                      .getProductById(cartItems[index]['pid']));
                              // return CartItemMobile(item: cartItems[index]['pid']);
                            },
                          ),
                        )
                      : Container(
                          color: Colors.grey[200],
                          height: globals.getHeight(context, .4),
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
                          globals.tempProductData.length.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'items',
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

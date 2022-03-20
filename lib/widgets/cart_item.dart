import 'package:ecom_webapp/static.dart';
import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../pages/cart.dart';

class CartItemMobile extends StatelessWidget {
  final Map item;
  const CartItemMobile({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: globals.getWidth(context, 1.0),
      height: globals.getHeight(context, .15),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Remove item?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Cancel',
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              GuestCart.removeItemFromCart(item['pid']);
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'OK',
                            ))
                      ],
                    );
                  });
            },
            child: const Icon(
              Icons.cancel_outlined,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          SizedBox(
            width: globals.getWidth(context, .2),
            child: Image(
              image: AssetImage(
                item['image'],
              ),
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          SizedBox(
            width: globals.getWidth(context, .2),
            child: Text(
              item['name'],
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          SizedBox(
            width: globals.getWidth(context, .1),
            child: Text(
              item['qty'].toString(),
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          SizedBox(
            width: globals.getWidth(context, .1),
            child: Text(
              item['price'].toString(),
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}

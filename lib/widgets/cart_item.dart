import 'package:flutter/material.dart';

import '../globals.dart' as globals;

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
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          SizedBox(
            width: globals.getWidth(context, .2),
            child: Text(
              item['price'].toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

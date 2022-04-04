import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../pages/product_detail.dart';

class ProductCard extends StatelessWidget {
  final Map product;
  final String myUid;
  const ProductCard({
    Key? key,
    required this.product,
    required this.myUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailMobile(
              product: product,
              myUid: myUid,
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
        child: Container(
          color: Colors.red,
          child: Image.network(
            product['image'],
            fit: BoxFit.contain,
            width: globals.getWidth(context, .8),
          ),
        ),
      ),
    );
  }
}

class ProductCardTablet extends StatelessWidget {
  final Map product;
  final String myUid;
  const ProductCardTablet({
    Key? key,
    required this.product,
    required this.myUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailMobile(
              product: product,
              myUid: myUid,
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
        child: Container(
          color: Colors.red,
          child: Image.network(
            product['image'],
            fit: BoxFit.contain,
            width: globals.getWidth(context, .4),
            // height: globals.getHeight(context, .2),
          ),
        ),
      ),
    );
  }
}

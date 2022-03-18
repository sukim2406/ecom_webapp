import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../widgets/appbar_widget.dart';
import '../pages/cart.dart';

class ProductDetailMobile extends StatelessWidget {
  final Map product;
  const ProductDetailMobile({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(tabBar: false),
      body: Container(
        width: globals.getWidth(context, 1),
        height: globals.getHeight(context, 1),
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: globals.getHeight(context, .4),
              width: globals.getWidth(context, .8),
              child: Image(
                image: AssetImage(
                  product['image'],
                ),
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              product['name'],
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
              product['detail'],
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            RichText(
              text: TextSpan(
                text: product['price'].toString(),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartMobile(
                        cartItems: [product],
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
                onPressed: () {},
                child: const Text('Add to cart'),
              ),
            ),
            SizedBox(
              height: globals.getHeight(context, .1),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../controllers/order_controller.dart';

class OrderReceiptMobile extends StatelessWidget {
  final String orderId;
  const OrderReceiptMobile({
    Key? key,
    required this.orderId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: globals.getHeight(context, 1),
        width: globals.getWidth(context, 1),
        color: Colors.black,
        child: FutureBuilder(
          future: OrderController.instance.getOrderDocument(orderId),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error');
            } else if (snapshot.hasData) {
              var temp = snapshot.data! as Map;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Order Receipt',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'please save this page for record',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    orderId,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    temp['email'],
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

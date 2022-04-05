import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../globals.dart' as globals;
import '../controllers/order_controller.dart';
import '../widgets/responsive_layout.dart';
import '../widgets/max_width_container.dart';
import '../pages/landing.dart';

class OrderReceipt extends StatelessWidget {
  final String myUid;
  final String orderId;
  const OrderReceipt({
    Key? key,
    required this.orderId,
    required this.myUid,
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
              return const Text('Error');
            } else if (snapshot.hasData) {
              var orderData = snapshot.data! as Map;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'THANK YOU FOR ORDERING FROM US',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: globals.getHeight(context, .02),
                  ),
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
                  SizedBox(
                    height: globals.getHeight(context, .02),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: globals.getWidth(context, .3),
                        child: const Text(
                          'ORDER ID',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: globals.getWidth(context, .05),
                      ),
                      SizedBox(
                        width: globals.getWidth(context, .5),
                        child: Text(
                          orderId,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: globals.getWidth(context, .3),
                        child: const Text(
                          'ORDER STATUS',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: globals.getWidth(context, .05),
                      ),
                      SizedBox(
                        width: globals.getWidth(context, .5),
                        child: Text(
                          orderData['status'],
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: globals.getWidth(context, .3),
                        child: const Text(
                          'EMAIL',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: globals.getWidth(context, .05),
                      ),
                      SizedBox(
                        width: globals.getWidth(context, .5),
                        child: Text(
                          orderData['email'],
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: globals.getWidth(context, .3),
                        child: const Text(
                          'SHIPPING ADDRESS',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: globals.getWidth(context, .05),
                      ),
                      SizedBox(
                        width: globals.getWidth(context, .5),
                        child: Text(
                          orderData['shipping'],
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: globals.getWidth(context, .3),
                        child: const Text(
                          'BILLING ADDRESS',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: globals.getWidth(context, .05),
                      ),
                      SizedBox(
                        width: globals.getWidth(context, .5),
                        child: Text(
                          orderData['billing'],
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: globals.getWidth(context, .3),
                        child: const Text(
                          'PAYMENT INFO',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: globals.getWidth(context, .05),
                      ),
                      SizedBox(
                        width: globals.getWidth(context, .5),
                        child: Text(
                          orderData['payment'],
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: globals.getWidth(context, .3),
                        child: const Text(
                          'PRODUCTS',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: globals.getWidth(context, .05),
                      ),
                      SingleChildScrollView(
                        child: SizedBox(
                          width: globals.getWidth(context, .5),
                          height: globals.getHeight(context, .1),
                          child: ListView.builder(
                            itemCount: orderData['order']['products'].length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: globals.getWidth(context, .3),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: globals.getWidth(context, .15),
                                      child: Text(
                                        orderData['order']['products'][index]
                                            ['name'],
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: globals.getWidth(context, .075),
                                      child: Text(
                                        orderData['order']['products'][index]
                                                ['qty']
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: globals.getWidth(context, .075),
                                      child: Text(
                                        orderData['order']['products'][index]
                                                ['price']
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: globals.getWidth(context, .3),
                        child: const Text(
                          'SUBTOTAL',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: globals.getWidth(context, .05),
                      ),
                      SizedBox(
                        width: globals.getWidth(context, .5),
                        child: Text(
                          orderData['order']['subtotal'].toStringAsFixed(2),
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: globals.getWidth(context, .3),
                        child: const Text(
                          'TAX',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: globals.getWidth(context, .05),
                      ),
                      SizedBox(
                        width: globals.getWidth(context, .5),
                        child: Text(
                          orderData['order']['tax'].toStringAsFixed(2),
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: globals.getWidth(context, .3),
                        child: const Text(
                          'TOTAL',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: globals.getWidth(context, .05),
                      ),
                      SizedBox(
                        width: globals.getWidth(context, .5),
                        child: Text(
                          orderData['order']['total'].toStringAsFixed(2),
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: globals.getHeight(context, .02),
                  ),
                  const Text(
                    'if you have any questions, please contect by ssk.sosodev@gmail.com',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: globals.getHeight(context, .02),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offAll(
                        () => MaxWidthContainer(
                          child: ResponsiveLayout(
                            mobileVer: LandingMobile(
                              myUid: myUid,
                            ),
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'go back to home',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  )
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

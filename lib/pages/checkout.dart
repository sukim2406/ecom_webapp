import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';
import '../globals.dart' as globals;
import '../controllers/auth_controller.dart';
import '../controllers/order_controller.dart';
import '../pages/order_receipt.dart';

class CheckoutMobile extends StatefulWidget {
  final String myUid;
  final List items;
  const CheckoutMobile({
    Key? key,
    required this.myUid,
    required this.items,
  }) : super(key: key);

  @override
  State<CheckoutMobile> createState() => _CheckoutMobileState();
}

class _CheckoutMobileState extends State<CheckoutMobile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController billingController = TextEditingController();
  TextEditingController paymentController = TextEditingController();
  bool sameAddress = false;

  checkEmptyInputs() {
    bool empty = false;
    if (emailController.text.isEmpty) {
      empty = true;
    }
    if (addressController.text.isEmpty) {
      empty = true;
    }
    if (billingController.text.isEmpty) {
      empty = true;
    }
    if (paymentController.text.isEmpty) {
      empty = true;
    }

    return empty;
  }

  getSubtotal() {
    double subtotal = 0.0;
    widget.items.forEach((item) {
      subtotal += (item['qty'] * item['price']);
    });
    return subtotal;
  }

  getTax() {
    double subtotal = getSubtotal();
    double tax = subtotal * .07;
    return tax;
  }

  getTotal() {
    double subtotal = getSubtotal();
    double tax = getTax();
    double total = subtotal + tax;

    return total;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.myUid != '') {
      emailController.text =
          AuthController.instance.getCurUserEmail().toString();
    }

    if (sameAddress) {
      billingController.text = addressController.text;
    }

    return Scaffold(
      appBar: AppbarWidget(
        myUid: widget.myUid,
        tabBar: false,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                  'CHECK OUT',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                width: globals.getWidth(context, .8),
                child: Row(
                  children: [
                    const Text(
                      'Email :',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    SizedBox(
                      width: globals.getWidth(context, .5),
                      child: (widget.myUid != '')
                          ? TextField(
                              controller: emailController,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              enabled: false,
                              decoration: const InputDecoration(
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            )
                          : TextField(
                              controller: emailController,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: globals.getHeight(context, .025),
              ),
              SizedBox(
                width: globals.getWidth(context, .8),
                child: Row(
                  children: [
                    const Text(
                      'Shipping Address :',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    SizedBox(
                      width: globals.getWidth(context, .5),
                      child: TextField(
                        controller: addressController,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: globals.getHeight(context, .025),
              ),
              SizedBox(
                width: globals.getWidth(context, .8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'same as shipping address ?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(unselectedWidgetColor: Colors.white),
                      child: Checkbox(
                        value: sameAddress,
                        onChanged: (bool? value) {
                          setState(() {
                            sameAddress = value!;
                          });
                        },
                        checkColor: Colors.white,
                        activeColor: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: globals.getWidth(context, .8),
                child: Row(
                  children: [
                    const Text(
                      'Billing Address :',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    SizedBox(
                      width: globals.getWidth(context, .5),
                      child: (!sameAddress)
                          ? TextField(
                              controller: billingController,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            )
                          : TextField(
                              controller: billingController,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              enabled: false,
                              decoration: const InputDecoration(
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: globals.getHeight(context, .025),
              ),
              SizedBox(
                width: globals.getWidth(context, .8),
                child: Row(
                  children: [
                    const Text(
                      'Payment Info. :',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    SizedBox(
                      width: globals.getWidth(context, .5),
                      child: TextField(
                        controller: paymentController,
                        obscureText: true,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: globals.getHeight(context, .025),
              ),
              Container(
                height: globals.getHeight(context, .25),
                width: globals.getWidth(context, .8),
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: globals.getWidth(context, .4),
                          child: const Text(
                            'product',
                            textAlign: TextAlign.end,
                          ),
                        ),
                        SizedBox(
                          width: globals.getWidth(context, .2),
                          child: const Text(
                            'qty',
                            textAlign: TextAlign.end,
                          ),
                        ),
                        SizedBox(
                          width: globals.getWidth(context, .2),
                          child: const Text(
                            'subtotal',
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: globals.getHeight(context, .01),
                    ),
                    Container(
                      color: Colors.grey[500],
                      width: globals.getWidth(context, .8),
                      height: globals.getHeight(context, .15),
                      child: ListView.builder(
                        itemCount: widget.items.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: globals.getWidth(context, .4),
                                child: Text(
                                  widget.items[index]['name'],
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              SizedBox(
                                width: globals.getWidth(context, .2),
                                child: Text(
                                  widget.items[index]['qty'].toString(),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              SizedBox(
                                width: globals.getWidth(context, .2),
                                child: Text(
                                  (widget.items[index]['price'] *
                                          widget.items[index]['qty'])
                                      .toString(),
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: globals.getWidth(context, .6),
                          child: const Text(
                            'subtotal :',
                            textAlign: TextAlign.end,
                          ),
                        ),
                        SizedBox(
                          width: globals.getWidth(context, .2),
                          child: Text(
                            getSubtotal().toStringAsFixed(2),
                            textAlign: TextAlign.end,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: globals.getWidth(context, .6),
                          child: const Text(
                            'Tax(7%) :',
                            textAlign: TextAlign.end,
                          ),
                        ),
                        SizedBox(
                          width: globals.getWidth(context, .2),
                          child: Text(
                            getTax().toStringAsFixed(2),
                            textAlign: TextAlign.end,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: globals.getWidth(context, .6),
                          child: const Text(
                            'Total :',
                            textAlign: TextAlign.end,
                          ),
                        ),
                        SizedBox(
                          width: globals.getWidth(context, .2),
                          child: Text(
                            getTotal().toStringAsFixed(2),
                            textAlign: TextAlign.end,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: globals.getHeight(context, .025),
              ),
              SizedBox(
                width: globals.getWidth(context, .8),
                child: Row(
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
                        onPressed: () async {
                          if (checkEmptyInputs()) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Empty field detected'),
                                  content: Text('All fields must be filled'),
                                  actions: [
                                    TextButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            Map order = {};
                            List products = [];
                            widget.items.forEach(
                              (element) {
                                Map temp = {
                                  'name': element['name'],
                                  'qty': element['qty'],
                                  'price': element['price'],
                                  'pid': element['pid'],
                                };
                                products.add(temp);
                              },
                            );
                            order['products'] = products;
                            order['subtotal'] = getSubtotal();
                            order['tax'] = getTax();
                            order['total'] = getTotal();
                            Map<String, dynamic> data = {
                              'email': emailController.text,
                              'shipping': addressController.text,
                              'billing': billingController.text,
                              'payment': paymentController.text,
                              'order': order,
                              'status': 'pending',
                              'uid': widget.myUid,
                            };
                            await OrderController.instance
                                .createOrderDocument(data)
                                .then(
                              (orderId) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OrderReceiptMobile(
                                      orderId: orderId,
                                      myUid: widget.myUid,
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                        child: const Text('PLACE ORDER'),
                      ),
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
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';
import '../globals.dart' as globals;
import '../controllers/auth_controller.dart';
import '../controllers/order_controller.dart';
import '../pages/order_receipt.dart';
import '../controllers/user_controller.dart';
import '../widgets/checkout_input.dart';
import '../widgets/text_btn.dart';
import '../widgets/responsive_layout.dart';
import '../widgets/menu_list.dart';

class Checkout extends StatefulWidget {
  final String myUid;
  final List items;
  const Checkout({
    Key? key,
    required this.myUid,
    required this.items,
  }) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
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
    for (var item in widget.items) {
      subtotal += (item['qty'] * item['price']);
    }
    // widget.items.forEach((item) {
    //   subtotal += (item['qty'] * item['price']);
    // });
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
    return ResponsiveLayout(
      mobileVer: Scaffold(
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
                  child: CheckoutInput(
                    label: 'EMAIL : ',
                    myUid: widget.myUid,
                    controller: emailController,
                    width: globals.getWidth(context, .5),
                  ),
                ),
                SizedBox(
                  height: globals.getHeight(context, .025),
                ),
                SizedBox(
                  width: globals.getWidth(context, .8),
                  child: CheckoutInput(
                    label: 'SHIPPING ADDRESS : ',
                    myUid: widget.myUid,
                    controller: addressController,
                    width: globals.getWidth(context, .5),
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
                  child: CheckoutInput(
                    label: 'PAYMENT INFO. : ',
                    myUid: widget.myUid,
                    controller: paymentController,
                    width: globals.getWidth(context, .5),
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
                        child: TextBtn(
                          label: 'PLACE ORDER',
                          function: () async {
                            if (checkEmptyInputs()) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Empty field detected'),
                                    content:
                                        const Text('All fields must be filled'),
                                    actions: [
                                      TextButton(
                                        child: const Text('OK'),
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
                                'time': Timestamp.now(),
                              };
                              await OrderController.instance
                                  .createOrderDocument(data)
                                  .then(
                                (orderId) {
                                  UserController.instance
                                      .clearCart(widget.myUid);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OrderReceipt(
                                        orderId: orderId,
                                        myUid: widget.myUid,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
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
      ),
      tabletVer: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: globals.getWidth(context, 1.0),
            height: globals.getHeight(context, 1.0),
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: globals.getWidth(context, .8),
                  height: globals.getHeight(context, .1),
                  child: const Image(
                    image: AssetImage('img/Supreme-Logo.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(
                  height: globals.getHeight(context, .05),
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
                  child: CheckoutInput(
                    label: 'EMAIL : ',
                    myUid: widget.myUid,
                    controller: emailController,
                    width: globals.getWidth(context, .5),
                  ),
                ),
                SizedBox(
                  height: globals.getHeight(context, .025),
                ),
                SizedBox(
                  width: globals.getWidth(context, .8),
                  child: CheckoutInput(
                    label: 'SHIPPING ADDRESS : ',
                    myUid: widget.myUid,
                    controller: addressController,
                    width: globals.getWidth(context, .5),
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
                  child: CheckoutInput(
                    label: 'PAYMENT INFO. : ',
                    myUid: widget.myUid,
                    controller: paymentController,
                    width: globals.getWidth(context, .5),
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
                        child: TextBtn(
                          label: 'PLACE ORDER',
                          function: () async {
                            if (checkEmptyInputs()) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Empty field detected'),
                                    content:
                                        const Text('All fields must be filled'),
                                    actions: [
                                      TextButton(
                                        child: const Text('OK'),
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
                              for (var element in widget.items) {
                                Map temp = {
                                  'name': element['name'],
                                  'qty': element['qty'],
                                  'price': element['price'],
                                  'pid': element['pid'],
                                };
                                products.add(temp);
                              }
                              // widget.items.forEach(
                              //   (element) {
                              //     Map temp = {
                              //       'name': element['name'],
                              //       'qty': element['qty'],
                              //       'price': element['price'],
                              //       'pid': element['pid'],
                              //     };
                              //     products.add(temp);
                              //   },
                              // );
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
                                'time': Timestamp.now(),
                              };
                              await OrderController.instance
                                  .createOrderDocument(data)
                                  .then(
                                (orderId) {
                                  UserController.instance
                                      .clearCart(widget.myUid);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OrderReceipt(
                                        orderId: orderId,
                                        myUid: widget.myUid,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: globals.getHeight(context, .05),
                ),
                MenuList(myUid: widget.myUid),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
    for (var item in widget.items) {
      subtotal += (item['qty'] * item['price']);
    }
    // widget.items.forEach((item) {
    //   subtotal += (item['qty'] * item['price']);
    // });
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
                child: CheckoutInput(
                  label: 'EMAIL : ',
                  myUid: widget.myUid,
                  controller: emailController,
                  width: globals.getWidth(context, .5),
                ),
              ),
              SizedBox(
                height: globals.getHeight(context, .025),
              ),
              SizedBox(
                width: globals.getWidth(context, .8),
                child: CheckoutInput(
                  label: 'SHIPPING ADDRESS : ',
                  myUid: widget.myUid,
                  controller: addressController,
                  width: globals.getWidth(context, .5),
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
                child: CheckoutInput(
                  label: 'PAYMENT INFO. : ',
                  myUid: widget.myUid,
                  controller: paymentController,
                  width: globals.getWidth(context, .5),
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
                      child: TextBtn(
                        label: 'PLACE ORDER',
                        function: () async {
                          if (checkEmptyInputs()) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Empty field detected'),
                                  content:
                                      const Text('All fields must be filled'),
                                  actions: [
                                    TextButton(
                                      child: const Text('OK'),
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
                            for (var element in widget.items) {
                              Map temp = {
                                'name': element['name'],
                                'qty': element['qty'],
                                'price': element['price'],
                                'pid': element['pid'],
                              };
                              products.add(temp);
                            }
                            // widget.items.forEach(
                            //   (element) {
                            //     Map temp = {
                            //       'name': element['name'],
                            //       'qty': element['qty'],
                            //       'price': element['price'],
                            //       'pid': element['pid'],
                            //     };
                            //     products.add(temp);
                            //   },
                            // );
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
                              'time': Timestamp.now(),
                            };
                            await OrderController.instance
                                .createOrderDocument(data)
                                .then(
                              (orderId) {
                                UserController.instance.clearCart(widget.myUid);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OrderReceipt(
                                      orderId: orderId,
                                      myUid: widget.myUid,
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
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

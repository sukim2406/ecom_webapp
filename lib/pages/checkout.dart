import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';
import '../globals.dart' as globals;
import '../controllers/auth_controller.dart';

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

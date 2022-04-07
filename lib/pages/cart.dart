import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../widgets/appbar_widget.dart';
import '../widgets/cart_item.dart';
import '../static.dart';
import '../controllers/product_controller.dart';
import '../controllers/user_controller.dart';
import '../widgets/menu_list.dart';
import '../pages/checkout.dart';
import '../widgets/text_btn.dart';
import '../widgets/responsive_layout.dart';

class Cart extends StatefulWidget {
  final String myUid;
  const Cart({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List cartItems = [];
  List productList = [];
  double totalPrice = 0.0;
  @override
  void initState() {
    getCartItems();
    // getProducts();
    super.initState();
  }

  void getCartItems() async {
    if (widget.myUid == '') {
      cartItems = GuestCart.cartItems;
    } else {
      cartItems = await UserController.instance.getCartFromUser(widget.myUid);
    }
    getProducts();
    getTotalPrice();
    setState(() {});
  }

  void updateCart(pid) async {
    cartItems.removeWhere((element) => element['pid'] == pid);
    await UserController.instance
        .updateCart(widget.myUid, cartItems)
        .then((result) {
      getCartItems();
      getTotalPrice();
    }).then((result) {
      setState(() {});
    });
  }

  getTotalPrice() async {
    if (cartItems.isNotEmpty) {
      cartItems.forEach(
        (element) async {
          var temp = await ProductController.instance.getProductByPid(
            element['pid'],
          );
          setState(
            () {
              totalPrice += (element['cnt'] * temp['price']);
            },
          );
        },
      );
    } else {
      totalPrice = 0;
    }
  }

  getProducts() async {
    setState(() {});
    cartItems.forEach(
      (item) async {
        var temp =
            await ProductController.instance.getProductByPid(item['pid']);
        Map tempMap = temp.data();
        tempMap['qty'] = item['cnt'];
        setState(() {
          productList.add(tempMap);
        });
      },
    );
  }

  num getTotalItemCnt() {
    num totalCnt = 0;
    if (cartItems.isNotEmpty) {
      cartItems.forEach((item) {
        totalCnt = totalCnt + item['cnt'];
      });
    }

    return totalCnt;
  }

  generateCartItems() {
    List<Widget> cartItems = [];

    productList.forEach((item) {
      cartItems.add(
        CartItemMobile(item: item, update: updateCart, myUid: widget.myUid),
      );
    });

    return cartItems;
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileVer: Scaffold(
        appBar: AppbarWidget(
          tabBar: false,
          myUid: widget.myUid,
        ),
        drawer: Drawer(
          child: MenuList(
            myUid: widget.myUid,
          ),
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
                            color: Colors.grey,
                            height: globals.getHeight(context, .4),
                            child: ListView(
                              key: Key(cartItems.length.toString()),
                              children: generateCartItems(),
                            ),
                          )
                        : Container(
                            color: Colors.grey,
                            height: globals.getHeight(context, .4),
                            width: globals.getWidth(context, 1),
                            child: const Text(
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
                            getTotalItemCnt().toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            ' items',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Text(
                            totalPrice.toString(),
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
                          child: TextBtn(
                            label: 'CHECK OUT',
                            function: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckoutMobile(
                                    myUid: widget.myUid,
                                    items: productList,
                                  ),
                                ),
                              );
                            },
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
      ),
      tabletVer: Scaffold(
        body: Container(
          color: Colors.black,
          width: globals.getWidth(context, 1.0),
          height: globals.getHeight(context, 1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 400,
                height: 150,
                child: Image(
                  image: AssetImage('img/Supreme-Logo.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(
                height: globals.getHeight(context, .03),
              ),
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
                            color: Colors.grey,
                            height: globals.getHeight(context, .4),
                            child: ListView(
                              key: Key(cartItems.length.toString()),
                              children: generateCartItems(),
                            ),
                          )
                        : Container(
                            color: Colors.grey,
                            height: globals.getHeight(context, .4),
                            width: globals.getWidth(context, 1),
                            child: const Text(
                              'no items yet',
                            ),
                          ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Container(
                          width: globals.getWidth(context, .4),
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
                                getTotalItemCnt().toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                ' items',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Text(
                                totalPrice.toString(),
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
                      ],
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
                          child: TextBtn(
                            label: 'CHECK OUT',
                            function: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckoutMobile(
                                    myUid: widget.myUid,
                                    items: productList,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: globals.getHeight(context, .05),
              ),
              MenuList(myUid: widget.myUid),
            ],
          ),
        ),
      ),
      desktopVer: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: globals.getWidth(context, .8),
            height: globals.getHeight(context, .05),
            child: const Text(
              'SHOPPING CART',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          (cartItems.isNotEmpty)
              ? Container(
                  color: Colors.grey,
                  height: globals.getHeight(context, .5),
                  width: globals.getWidth(context, .8),
                  child: ListView(
                    key: Key(cartItems.length.toString()),
                    children: generateCartItems(),
                  ),
                )
              : Container(
                  color: Colors.grey,
                  height: globals.getHeight(context, .5),
                  width: globals.getWidth(context, .8),
                  child: const Text(
                    'no items yet',
                  ),
                ),
          // Container(
          //   color: Colors.grey,
          //   width: globals.getWidth(context, .8),
          //   height: globals.getHeight(context, .5),

          // ),

          SizedBox(
            height: globals.getHeight(context, .05),
            child: Row(
              children: [
                Expanded(
                  child: Container(),
                ),
                SizedBox(
                  width: globals.getWidth(context, .4),
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
                        getTotalItemCnt().toString(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        ' items',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        totalPrice.toString(),
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
              ],
            ),
          ),
          SizedBox(
            height: globals.getHeight(context, .05),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(),
              ),
              SizedBox(
                width: globals.getWidth(context, .4),
                child: TextBtn(
                  label: 'CHECK OUT',
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckoutMobile(
                          myUid: widget.myUid,
                          items: productList,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

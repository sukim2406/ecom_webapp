import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../globals.dart' as globals;
import '../widgets/appbar_widget.dart';
import '../controllers/order_controller.dart';
import '../pages/order_receipt.dart';

class FindOrderMobile extends StatelessWidget {
  final String myUid;
  const FindOrderMobile({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppbarWidget(
        myUid: myUid,
        tabBar: false,
      ),
      body: Container(
        width: globals.getWidth(context, 1),
        height: globals.getHeight(context, 1),
        color: Colors.black,
        child: (myUid == '')
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: globals.getHeight(context, .2),
                  ),
                  const Text(
                    'SEARCH ORDER BY ORDER ID',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: globals.getHeight(context, .05),
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      SizedBox(
                        width: globals.getWidth(context, .5),
                        child: TextField(
                          cursorColor: Colors.red,
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          controller: searchController,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (searchController.text.isNotEmpty) {
                            var orderData;
                            orderData = await OrderController.instance
                                .getOrderDocument(searchController.text);
                            if (orderData != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OrderReceiptMobile(
                                    orderId: searchController.text,
                                    myUid: myUid,
                                  ),
                                ),
                              );
                            } else {
                              Fluttertoast.showToast(
                                msg: 'ORDER NOT FOUND',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                            }
                          } else {
                            Container();
                          }
                        },
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'ORDER HISTORY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: globals.getHeight(context, .025),
                  ),
                  SizedBox(
                    height: globals.getHeight(context, .5),
                    width: globals.getWidth(context, .8),
                    child: FutureBuilder(
                      future: OrderController.instance.findOrdersByUid(myUid),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List data = snapshot.data as List;
                          return ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OrderReceiptMobile(
                                          orderId: data[index]['oid'],
                                          myUid: myUid),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: globals.getWidth(context, .1),
                                      ),
                                      Text(
                                        data[index]['time']
                                            .toDate()
                                            .toString()
                                            .substring(0, 10),
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(),
                                      ),
                                      Text(
                                        data[index]['oid'],
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: globals.getWidth(context, .1),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return const Text('error');
                        }
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

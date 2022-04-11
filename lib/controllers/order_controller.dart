import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrderController extends GetxController {
  static OrderController instance = Get.find();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  createOrderDocument(data) async {
    try {
      return await firestore.collection('Orders').add(data).then(
        (DocumentReference dr) {
          return dr.id;
        },
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: ('createOrderDocument error\n' + e.toString()),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  getOrderDocument(orderId) async {
    try {
      return await firestore.collection('Orders').doc(orderId).get().then(
        (DocumentSnapshot ds) {
          return ds.data();
        },
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: ('getOrderDocument error\n' + e.toString()),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  findOrdersByUid(uid) async {
    try {
      return await firestore
          .collection('Orders')
          .where('uid', isEqualTo: uid)
          .get()
          .then((QuerySnapshot qs) {
        List result = [];
        qs.docs.forEach(
          (doc) {
            Map tempData = doc.data() as Map;
            tempData['oid'] = doc.id;
            result.add(tempData);
          },
        );
        return result;
      });
    } catch (e) {
      Fluttertoast.showToast(
        msg: ('findOrdersByUid error /n' + e.toString()),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}

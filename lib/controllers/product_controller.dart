import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future getAllProducts() async {
    try {
      return await firestore.collection('Products').get().then(
        (QuerySnapshot qs) {
          final allData = qs.docs.map((doc) => doc.data()).toList();
          return allData;
        },
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: ('getAllProducts error \n' + e.toString()),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future getProductsByCategory(category) async {
    try {
      return firestore
          .collection('Products')
          .where(
            'category',
            arrayContains: category,
          )
          .get()
          .then(
        (QuerySnapshot qs) {
          final result = qs.docs
              .map(
                (doc) => doc.data(),
              )
              .toList();
          return result;
        },
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: ('getProductsByCategory error \n' + e.toString()),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future getProductsByName(keyword) async {
    try {
      return firestore.collection('Products').get().then(
        (QuerySnapshot qs) {
          List result = [];
          qs.docs.forEach(
            (doc) {
              if (doc['name'].contains(keyword)) {
                result.add(doc.data() as Map);
              }
            },
          );
          return result;
        },
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: ('getProductsByName error \n' + e.toString()),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future getProductByPid(pid) async {
    try {
      return await firestore.collection('Products').doc(pid).get();
    } catch (e) {
      Fluttertoast.showToast(
        msg: ('getProductByPid error\n' + e.toString()),
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

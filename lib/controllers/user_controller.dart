import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './auth_controller.dart';
import './product_controller.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void createUserDocument(userMap) async {
    try {
      await firestore
          .collection('Users')
          .doc(
            AuthController.instance.getCurUserUid(),
          )
          .set(userMap);
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future getFavorites(myUid) async {
    try {
      return await firestore.collection('Users').doc(myUid).get().then(
        (DocumentSnapshot ds) {
          return ds['favorite'];
        },
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future updateFavorites(myUid, list) async {
    try {
      await firestore.collection('Users').doc(myUid).update({'favorite': list});
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  getFavoriteStream(myUid) {
    try {
      return firestore.collection('Users').doc(myUid).snapshots();
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  getFavoriteProducts(myUid) async {
    try {
      List temp = [];
      var list = await getFavorites(myUid);
      temp = list
          .map((doc) async =>
              await ProductController.instance.getProductByPid(doc))
          .toList();
      return temp;
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  getCartFromUser(myUid) async {
    try {
      return await firestore.collection('Users').doc(myUid).get().then(
        (DocumentSnapshot ds) {
          return ds['cart'];
        },
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  Future updateCart(myUid, list) async {
    try {
      await firestore.collection('Users').doc(myUid).update({'cart': list});
    } catch (e) {
      Fluttertoast.showToast(
        msg: ('updateCart error\n' + e.toString()),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  // Future getSortedCart(myUid) async {
  //   try {
  //     var temp = await getCartFromUser(myUid);
  //     List<Map> sortedCart = [];
  //   } catch (e) {
  //     Fluttertoast.showToast(
  //       msg: ('getSortedCart error\n' + e.toString()),
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 16.0,
  //     );
  //   }
  // }

  clearCart(myUid) async {
    try {
      await firestore.collection('Users').doc(myUid).update(
        {'cart': []},
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: ('clearCart error\n' + e.toString()),
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

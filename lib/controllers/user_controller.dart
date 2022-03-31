import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

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
      print(
        'createUserDocument error',
      );
      print(
        e.toString(),
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
      print(
        'getFavorites error',
      );
      print(
        e.toString(),
      );
    }
  }

  Future updateFavorites(myUid, list) async {
    try {
      await firestore.collection('Users').doc(myUid).update({'favorite': list});
    } catch (e) {
      print(
        'updateFavorites error',
      );
      print(
        e.toString(),
      );
    }
  }

  getFavoriteStream(myUid) {
    try {
      return firestore.collection('Users').doc(myUid).snapshots();
    } catch (e) {
      print(
        'getFavoriteStream error',
      );
      print(
        e.toString(),
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
      print(temp);
      return temp;
    } catch (e) {
      print(
        'getFavoriteProducts error',
      );
      print(
        e.toString(),
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
      print(
        'getCartFromUser error',
      );
      print(
        e.toString(),
      );
    }
  }

  Future updateCart(myUid, list) async {
    try {
      await firestore.collection('Users').doc(myUid).update({'cart': list});
    } catch (e) {
      print(
        'updateCart error',
      );
      print(
        e.toString(),
      );
    }
  }

  Future getSortedCart(myUid) async {
    try {
      var temp = await getCartFromUser(myUid);
      List<Map> sortedCart = [];
    } catch (e) {
      print(
        'getSortedCart error',
      );
      print(
        e.toString(),
      );
    }
  }

  clearCart(myUid) async {
    try {
      await firestore.collection('Users').doc(myUid).update(
        {'cart': []},
      );
    } catch (e) {
      print(
        'clearCart error',
      );
      print(
        e.toString(),
      );
    }
  }
}

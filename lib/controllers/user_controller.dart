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
      // list.forEach(
      //   (pid) async {
      //     var tempItem = await ProductController.instance.getProductByPid(pid);
      //     temp.add(tempItem.data() as Map);
      //   },
      // );
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
}

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      print(
        'getAllProducts error',
      );
      print(
        e.toString(),
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
      print(
        'getAllProducts error',
      );
      print(
        e.toString(),
      );
    }
  }

  Future getProductsByName(keyword) async {
    try {
      return firestore.collection('Products').get().then(
        (QuerySnapshot qs) {
          final result = qs.docs.map(
            (doc) {
              if (doc['name'].contains(keyword)) {
                doc.data();
              }
            },
          ).toList();
          return result;
        },
      );
      //   final result = qs.docs.map(
      //     // (doc) => doc.data(),
      //     (doc) {
      //       if (doc['name'].contains(keyword)) {
      //         doc.data();
      //       }
      //     },
      //   ).toList();
      //   return result;
      // });
    } catch (e) {
      print(
        'getProductsByName error',
      );
      print(
        e.toString(),
      );
    }
  }
}

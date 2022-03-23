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
      print(
        'getProductsByName error',
      );
      print(
        e.toString(),
      );
    }
  }

  Future getProductByPid(pid) async {
    try {
      return await firestore.collection('Products').doc(pid).get();
    } catch (e) {
      print(
        'getProductByPid error',
      );
      print(
        e.toString(),
      );
    }
  }

  Future getProductsFromCart(cart) async {
    try {
      List<Map> temp = [];
      cart.forEach(
        (item) async {
          var data =
              await firestore.collection('Products').doc(item['pid']).get();
          temp.add(data.data() as Map);
        },
      );
      return temp;
    } catch (e) {
      print(
        'getProductsFromCart error',
      );
      print(
        e.toString(),
      );
    }
  }
}

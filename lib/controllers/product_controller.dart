import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future getAllProducts() async {
    try {
      return await firestore.collection('products').doc();
    } catch (e) {
      print(
        'getAllProducts error',
      );
      print(
        e.toString(),
      );
    }
  }
}

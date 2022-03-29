import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

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
      print('createOrderDocument error');
      print(e.toString());
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
      print(
        'getOrderDocument error',
      );
      print(
        e.toString(),
      );
    }
  }
}

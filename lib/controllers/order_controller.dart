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
      print('findOrdersByUid error');
      print(e.toString());
    }
  }
}

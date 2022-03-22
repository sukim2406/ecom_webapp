import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BlogController extends GetxController {
  static BlogController instance = Get.find();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future getAllBlogs() async {
    try {
      return await firestore.collection('Blogs').get().then(
        (QuerySnapshot qs) {
          final allData = qs.docs.map((doc) => doc.data()).toList();
          return allData;
        },
      );
    } catch (e) {
      print(
        'getAllBlogs error',
      );
      print(
        e.toString(),
      );
    }
  }
}

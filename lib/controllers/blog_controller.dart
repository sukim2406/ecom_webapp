import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      Fluttertoast.showToast(
        msg: ('getAllBlogs error\n' + e.toString()),
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

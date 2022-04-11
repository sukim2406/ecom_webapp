import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/max_width_container.dart';
import '../pages/landing.dart';
import './user_controller.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(
      auth.userChanges(),
    );
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) async {
    Get.offAll(
      () => MaxWidthContainer(
        child: Landing(
          myUid: (user != null) ? user.uid : '',
        ),
      ),
    );
  }

  void register(String email, password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        Map<String, dynamic> user = {
          'email': auth.currentUser?.email,
          'favorit': [],
          'cart': [],
        };
        UserController.instance.createUserDocument(user);
        Fluttertoast.showToast(
          msg: 'Register successful',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      });
    } catch (e) {
      Fluttertoast.showToast(
        msg: ('register error \n' + e.toString()),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Fluttertoast.showToast(
        msg: ('login error\n' + e.toString()),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  void logout() async {
    try {
      await auth.signOut().then(
        (result) {
          // Holder.setUid('');
          // print(Holder.getUid());
        },
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: ('logout error\n' + e.toString()),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  String? getCurUserUid() {
    final user = auth.currentUser;
    return user?.uid;
  }

  String? getCurUserEmail() {
    final user = auth.currentUser;
    return user?.email;
  }
}

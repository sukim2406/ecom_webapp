import 'package:ecom_webapp/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import './pages/landing.dart';
import './widgets/responsive_layout.dart';
import './widgets/max_width_container.dart';
import './controllers/auth_controller.dart';
import './controllers/product_controller.dart';
import './controllers/storage_controller.dart';
import './controllers/blog_controller.dart';
import './controllers/user_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAixDHyf8mBMWfbweKEh2sDsLfVWHXdNxY",
      authDomain: "sosodev-ecom-webapp.firebaseapp.com",
      projectId: "sosodev-ecom-webapp",
      storageBucket: "sosodev-ecom-webapp.appspot.com",
      messagingSenderId: "475130475964",
      appId: "1:475130475964:web:789d029339270525cd27b9",
    ),
  ).then(
    (value) {
      Get.put(
        AuthController(),
      );
      Get.put(
        ProductController(),
      );
      Get.put(
        StorageController(),
      );
      Get.put(
        BlogController(),
      );
      Get.put(
        UserController(),
      );
    },
  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error.toString());
          }
          // if (snapshot.connectionState == ConnectionState.done) {
          //   return const MaxWidthContainer(
          //     child: ResponsiveLayout(
          //       mobileVer: LandingMobile(
          //         user: User
          //       ),
          //       tabletVer: LandingTablet(),
          //       desktopVer: DesktopTest(),
          //     ),
          //   );
          // }
          return const CircularProgressIndicator();
        },
        // child: const MyHomePage(title: 'Flutter Demo Home Page')
      ),
    );
  }
}

class DesktopTest extends StatelessWidget {
  const DesktopTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
    );
  }
}

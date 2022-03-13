import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import './pages/landing.dart';
import './widgets/responsive_layout.dart';
import './widgets/max_width_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
    return MaterialApp(
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
          if (snapshot.connectionState == ConnectionState.done) {
            return const MaxWidthContainer(
              child: ResponsiveLayout(
                mobileVer: LandingMobile(),
                tabletVer: TabletTest(),
              ),
            );
          }
          return const CircularProgressIndicator();
        },
        // child: const MyHomePage(title: 'Flutter Demo Home Page')
      ),
    );
  }
}

class MobileTest extends StatelessWidget {
  const MobileTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }
}

class TabletTest extends StatelessWidget {
  const TabletTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

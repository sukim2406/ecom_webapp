import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../globals.dart' as globals;
import '../widgets/appbar_widget.dart';
import '../widgets/menu_list.dart';
import '../controllers/auth_controller.dart';

class SignupMobile extends StatefulWidget {
  final String myUid;
  const SignupMobile({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  State<SignupMobile> createState() => _SignupMobileState();
}

class _SignupMobileState extends State<SignupMobile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(
        tabBar: false,
      ),
      drawer: Drawer(
        child: MenuListMobile(
          myUid: widget.myUid,
        ),
      ),
      body: Container(
        color: Colors.black,
        width: globals.getWidth(context, 1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: globals.getWidth(context, .5),
              child: TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: globals.getWidth(context, .5),
              child: TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: globals.getWidth(context, .5),
              child: TextField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                obscureText: true,
                controller: confirmController,
                decoration: const InputDecoration(
                  labelText: 'Password Confirm',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: globals.getWidth(context, .2),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    side: const BorderSide(
                      width: 2.0,
                      color: Colors.red,
                    )),
                onPressed: () {
                  if (passwordController.text != confirmController.text) {
                    Fluttertoast.showToast(
                      msg: 'Password does not match',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.SNACKBAR,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  } else {
                    AuthController.instance.register(
                      emailController.text,
                      passwordController.text,
                    );
                  }
                },
                child: const Text('SIGN UP'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

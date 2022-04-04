import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../globals.dart' as globals;
import '../widgets/appbar_widget.dart';
import '../widgets/menu_list.dart';
import '../controllers/auth_controller.dart';
import '../widgets/text_btn.dart';
import '../widgets/text_input.dart';

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
      appBar: AppbarWidget(
        tabBar: false,
        myUid: widget.myUid,
      ),
      drawer: Drawer(
        child: MenuListMobile(
          myUid: widget.myUid,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          width: globals.getWidth(context, 1.0),
          height: globals.getHeight(context, 1.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: globals.getWidth(context, .5),
                child: TextInput(
                  controller: emailController,
                  obsecure: false,
                  label: 'EMAIL',
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: globals.getWidth(context, .5),
                child: TextInput(
                  controller: passwordController,
                  obsecure: true,
                  label: 'PASSWORD',
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: globals.getWidth(context, .5),
                child: TextInput(
                  controller: confirmController,
                  obsecure: true,
                  label: 'PASSWORD CONFIRM',
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: globals.getWidth(context, .2),
                child: TextBtn(
                  label: 'SIGN UP',
                  function: () {
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SingupTablet extends StatefulWidget {
  final String myUid;
  const SingupTablet({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  State<SingupTablet> createState() => _SingupTabletState();
}

class _SingupTabletState extends State<SingupTablet> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: globals.getWidth(context, 1.0),
        height: globals.getHeight(context, 1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 400,
              height: 150,
              child: Image(
                image: AssetImage('img/Supreme-Logo.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: globals.getHeight(context, .03),
            ),
            SizedBox(
              width: globals.getWidth(context, .5),
              child: TextInput(
                controller: emailController,
                obsecure: false,
                label: 'EMAIL',
              ),
            ),
            SizedBox(
              height: globals.getHeight(context, .02),
            ),
            SizedBox(
              width: globals.getWidth(context, .5),
              child: TextInput(
                controller: passwordController,
                obsecure: true,
                label: 'PASSWORD',
              ),
            ),
            SizedBox(
              height: globals.getHeight(context, .02),
            ),
            SizedBox(
              width: globals.getWidth(context, .5),
              child: TextInput(
                controller: confirmController,
                obsecure: true,
                label: 'PASSWORD CONFIRM',
              ),
            ),
            SizedBox(
              height: globals.getHeight(context, .03),
            ),
            SizedBox(
              width: globals.getWidth(context, .2),
              child: TextBtn(
                label: 'SIGN UP',
                function: () {
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
              ),
            ),
            SizedBox(
              height: globals.getHeight(context, .1),
            ),
            MenuListTablet(myUid: widget.myUid),
          ],
        ),
      ),
    );
  }
}

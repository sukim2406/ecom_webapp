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

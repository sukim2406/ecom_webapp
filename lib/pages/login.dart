import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../widgets/appbar_widget.dart';
import '../widgets/menu_list.dart';
import '../pages/signup.dart';
import '../controllers/auth_controller.dart';
import '../widgets/text_input.dart';
import '../widgets/text_btn.dart';

class LogInMobile extends StatelessWidget {
  final String myUid;
  const LogInMobile({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppbarWidget(
        tabBar: false,
        myUid: myUid,
      ),
      drawer: Drawer(
        child: MenuListMobile(
          myUid: myUid,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: globals.getHeight(context, 1),
          width: globals.getWidth(context, 1),
          color: Colors.black,
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
                width: globals.getWidth(context, .4),
                child: TextBtn(
                  label: 'LOG IN',
                  function: () {
                    AuthController.instance
                        .login(emailController.text, passwordController.text);
                  },
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: globals.getWidth(context, .4),
                child: TextBtn(
                  label: 'SIGN UP',
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupMobile(
                          myUid: myUid,
                        ),
                      ),
                    );
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

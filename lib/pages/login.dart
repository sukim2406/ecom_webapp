import 'package:ecom_webapp/widgets/responsive_layout.dart';
import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../widgets/appbar_widget.dart';
import '../widgets/menu_list.dart';
import '../pages/signup.dart';
import '../controllers/auth_controller.dart';
import '../widgets/text_input.dart';
import '../widgets/text_btn.dart';
import '../widgets/responsive_layout.dart';

class LogIn extends StatelessWidget {
  final String myUid;
  final Function? refreshFunc;
  const LogIn({
    Key? key,
    required this.myUid,
    this.refreshFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileVer: LogInMobile(
        myUid: myUid,
      ),
      tabletVer: LogInTablet(
        myUid: myUid,
      ),
      desktopVer: LogInDesktop(
        myUid: myUid,
        refreshFunc: refreshFunc,
      ),
    );
  }
}

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
        child: MenuList(
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
                        builder: (context) => SignUp(
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

class LogInTablet extends StatelessWidget {
  final String myUid;
  const LogInTablet({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: globals.getHeight(context, 1),
        child: Center(
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
                    label: 'EMAIL'),
              ),
              SizedBox(
                height: globals.getHeight(context, .02),
              ),
              SizedBox(
                width: globals.getWidth(context, .5),
                child: TextInput(
                    controller: passwordController,
                    obsecure: true,
                    label: 'PASSWORD'),
              ),
              SizedBox(
                height: globals.getHeight(context, .03),
              ),
              SizedBox(
                width: globals.getWidth(context, .5),
                child: Row(
                  children: [
                    SizedBox(
                      width: globals.getWidth(context, .2),
                      child: TextBtn(
                        function: () {
                          AuthController.instance.login(
                              emailController.text, passwordController.text);
                        },
                        label: 'LOG IN',
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    SizedBox(
                      width: globals.getWidth(context, .2),
                      child: TextBtn(
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(myUid: myUid),
                            ),
                          );
                        },
                        label: 'SIGN UP',
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: globals.getHeight(context, .1),
              ),
              MenuList(myUid: myUid),
            ],
          ),
        ),
      ),
    );
  }
}

class LogInDesktop extends StatelessWidget {
  final String myUid;
  final Function? refreshFunc;
  const LogInDesktop({
    Key? key,
    required this.myUid,
    this.refreshFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return SizedBox(
      width: globals.getWidth(context, .8),
      height: globals.getHeight(context, .7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: globals.getHeight(context, .3),
            width: globals.getWidth(context, .8),
            child: const Image(
              image: AssetImage('img/Supreme-Logo.png'),
            ),
          ),
          SizedBox(
            height: globals.getHeight(context, .03),
          ),
          SizedBox(
            height: globals.getHeight(context, .05),
            width: globals.getWidth(context, .5),
            child: TextInput(
                controller: emailController, obsecure: false, label: 'EMAIL'),
          ),
          SizedBox(
            height: globals.getHeight(context, .02),
          ),
          SizedBox(
            height: globals.getHeight(context, .05),
            width: globals.getWidth(context, .5),
            child: TextInput(
                controller: passwordController,
                obsecure: true,
                label: 'PASSWORD'),
          ),
          SizedBox(
            height: globals.getHeight(context, .1),
          ),
          SizedBox(
            height: globals.getHeight(context, .05),
            width: globals.getWidth(context, .5),
            child: Row(
              children: [
                SizedBox(
                  width: globals.getWidth(context, .2),
                  child: TextBtn(
                    function: () {
                      AuthController.instance
                          .login(emailController.text, passwordController.text);
                      refreshFunc!(0);
                    },
                    label: 'LOG IN',
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                SizedBox(
                  width: globals.getWidth(context, .2),
                  child: TextBtn(
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(myUid: myUid),
                        ),
                      );
                    },
                    label: 'SIGN UP',
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: globals.getHeight(context, .1),
          )
        ],
      ),
    );
  }
}

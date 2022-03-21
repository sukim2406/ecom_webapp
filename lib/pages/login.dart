import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../widgets/appbar_widget.dart';
import '../widgets/menu_list.dart';
import '../pages/signup.dart';
import '../controllers/auth_controller.dart';

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
                  controller: passwordController,
                  obscureText: true,
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
                width: globals.getWidth(context, .4),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      side: const BorderSide(
                        width: 2.0,
                        color: Colors.red,
                      )),
                  onPressed: () {
                    AuthController.instance
                        .login(emailController.text, passwordController.text);
                  },
                  child: const Text('LOG IN'),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: globals.getWidth(context, .4),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      side: const BorderSide(
                        width: 2.0,
                        color: Colors.red,
                      )),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupMobile(
                          myUid: myUid,
                        ),
                      ),
                    );
                  },
                  child: const Text('SIGN UP'),
                ),
              ),
              // SizedBox(
              //   width: globals.getWidth(context, .5),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       SizedBox(
              //         width: globals.getWidth(context, .2),
              //         child: ElevatedButton(
              //           style: ElevatedButton.styleFrom(
              //               primary: Colors.black,
              //               side: const BorderSide(
              //                 width: 2.0,
              //                 color: Colors.red,
              //               )),
              //           onPressed: () {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => SignupMobile(
              //                   myUid: myUid,
              //                 ),
              //               ),
              //             );
              //           },
              //           child: const Text('SIGN UP'),
              //         ),
              //       ),
              //       Expanded(
              //         child: Container(),
              //       ),
              //       SizedBox(
              //         width: globals.getWidth(context, .2),
              //         child: ElevatedButton(
              //           style: ElevatedButton.styleFrom(
              //               primary: Colors.black,
              //               side: const BorderSide(
              //                 width: 2.0,
              //                 color: Colors.red,
              //               )),
              //           onPressed: () {
              //             AuthController.instance.login(
              //                 emailController.text, passwordController.text);
              //           },
              //           child: const Text('LOG IN'),
              //         ),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

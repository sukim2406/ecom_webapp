// <a href="https://www.flaticon.com/free-icons/person" title="person icons">Person icons created by Ilham Fitrotul Hayat - Flaticon</a>

import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../pages/products.dart';
import '../pages/landing.dart';
import '../pages/about.dart';
import '../pages/login.dart';
import '../static.dart';
import '../controllers/auth_controller.dart';
import '../pages/cart.dart';

class MenuListMobile extends StatelessWidget {
  final String myUid;
  const MenuListMobile({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          color: Colors.black87,
          child: DrawerHeader(
            child: Column(
              children: [
                Expanded(
                  child: Container(),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('img/default-profile-pic.png'),
                  radius: 40,
                ),
                Expanded(
                  child: Container(),
                ),
                (myUid == '')
                    ? Row(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LogInMobile(
                                    myUid: myUid,
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CartMobile(
                                    myUid: myUid,
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              'Cart',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          TextButton(
                            onPressed: () {
                              AuthController.instance.logout();
                            },
                            child: const Text(
                              'Log out',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          TextButton(
                            onPressed: () {
                              print('favorites');
                            },
                            child: const Text(
                              'Favorites',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CartMobile(
                                    myUid: myUid,
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              'Cart',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.black54,
          height: globals.getHeight(context, 1),
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LandingMobile(
                        myUid: myUid,
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'Products',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductsMobile(
                        myUid: myUid,
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text(
                  'About',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutMobile(
                        myUid: myUid,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MenuListTablet extends StatelessWidget {
  const MenuListTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Products',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Log in',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'About',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

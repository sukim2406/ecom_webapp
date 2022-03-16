// <a href="https://www.flaticon.com/free-icons/person" title="person icons">Person icons created by Ilham Fitrotul Hayat - Flaticon</a>

import 'package:flutter/material.dart';

import '../pages/products.dart';
import '../pages/landing.dart';

class MenuListMobile extends StatelessWidget {
  const MenuListMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              const CircleAvatar(
                backgroundImage: AssetImage('img/default-profile-pic.png'),
                radius: 40,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Log In',
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Cart',
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
        ListTile(
          title: const Text(
            'Home',
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LandingMobile(),
              ),
            );
          },
        ),
        ListTile(
          title: const Text(
            'Products',
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductsMobile(),
              ),
            );
          },
        ),
        ListTile(
          title: const Text(
            'About',
          ),
          onTap: () {
            print('Home');
          },
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

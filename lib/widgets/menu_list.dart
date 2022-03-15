import 'package:flutter/material.dart';

class MenuListMobile extends StatelessWidget {
  const MenuListMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          title: const Text(
            'Home',
          ),
          onTap: () {
            print('Home');
          },
        ),
        ListTile(
          title: const Text(
            'Products',
          ),
          onTap: () {
            print('Home');
          },
        ),
        ListTile(
          title: const Text(
            'Account',
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

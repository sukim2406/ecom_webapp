import 'package:flutter/material.dart';

import '../widgets/dropdown.dart';
import '../widgets/appbar_padding.dart';

class LandingMobile extends StatelessWidget {
  const LandingMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supreme'),
        actions: [
          const Dropdown(),
          const AppbarPadding(),
        ],
      ),
      body: Container(
        color: Colors.amber,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../globals.dart' as globals;

class MaxWidthContainer extends StatelessWidget {
  final Widget child;
  const MaxWidthContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: globals.kMaxWidth,
        ),
        child: child,
      ),
    );
  }
}

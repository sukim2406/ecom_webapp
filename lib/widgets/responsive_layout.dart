import 'package:flutter/material.dart';

import '../globals.dart' as globals;

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileVer;
  final Widget? tabletVer;
  final Widget? desktopVer;

  const ResponsiveLayout({
    Key? key,
    required this.mobileVer,
    this.tabletVer,
    this.desktopVer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth < globals.kTabletBreakPoint) {
          return mobileVer;
        } else if (constraints.maxWidth >= globals.kTabletBreakPoint &&
            constraints.maxWidth < globals.kDesktopBreakPoint) {
          return tabletVer ?? mobileVer;
        } else {
          return desktopVer ?? mobileVer;
        }
      }),
    );
  }
}

import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../widgets/appbar_widget.dart';

class BlogDetailMobile extends StatelessWidget {
  final String myUid;
  final Map blog;
  const BlogDetailMobile({
    Key? key,
    required this.blog,
    required this.myUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        tabBar: false,
        myUid: myUid,
      ),
      body: Container(
        width: globals.getWidth(context, 1),
        height: globals.getHeight(context, 1),
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: globals.getHeight(context, .3),
              width: globals.getWidth(context, .8),
              color: Colors.red,
              child: Image(
                image: AssetImage(
                  blog['image'],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: globals.getHeight(context, .3),
              width: globals.getWidth(context, .6),
              child: Column(
                children: [
                  Text(
                    blog['title'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    blog['content'],
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

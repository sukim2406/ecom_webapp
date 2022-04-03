import 'package:ecom_webapp/widgets/responsive_layout.dart';
import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../pages/blog_detail.dart';

class BlogCardMobile extends StatelessWidget {
  final String myUid;
  final Map blog;
  const BlogCardMobile({
    Key? key,
    required this.blog,
    required this.myUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogDetailMobile(
              blog: blog,
              myUid: myUid,
            ),
          ),
        );
      },
      child: Container(
        color: Colors.grey[100],
        margin: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Image.network(
              blog['image'],
              height: globals.getHeight(context, .3),
              width: globals.getWidth(context, .8),
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: globals.getHeight(context, .02),
            ),
            Text(
              blog['title'],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogCardTablet extends StatelessWidget {
  final Map blog;
  final String myUid;
  const BlogCardTablet({
    Key? key,
    required this.myUid,
    required this.blog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogDetailMobile(
              blog: blog,
              myUid: myUid,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        child: Image.network(
          blog['image'],
          fit: BoxFit.contain,
          width: globals.getWidth(context, 1),
          height: globals.getHeight(context, 1),
        ),
      ),
    );
  }
}

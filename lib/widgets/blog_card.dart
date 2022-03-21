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
            Image(
              height: globals.getHeight(context, .3),
              width: globals.getWidth(context, .8),
              image: AssetImage(blog['image']),
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
  const BlogCardTablet({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Image(
            image: AssetImage(blog['image']),
            fit: BoxFit.fill,
            width: globals.getWidth(context, 1),
            height: globals.getHeight(context, 1),
          ),
        ],
      ),
    );
  }
}

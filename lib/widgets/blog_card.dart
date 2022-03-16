import 'package:flutter/material.dart';

import '../globals.dart' as globals;

class BlogCardMobile extends StatelessWidget {
  final String imageUrl;
  const BlogCardMobile({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      margin: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Image(
            height: globals.getHeight(context, .3),
            width: globals.getWidth(context, .8),
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: globals.getHeight(context, .02),
          ),
          const Text(
            'Blog Title',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class BlogCardTablet extends StatelessWidget {
  final String imageUrl;
  const BlogCardTablet({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Image(
            image: AssetImage(imageUrl),
            fit: BoxFit.fill,
            width: globals.getWidth(context, 1),
            height: globals.getHeight(context, 1),
          ),
        ],
      ),
    );
  }
}

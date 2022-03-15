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
      margin: const EdgeInsets.all(5.0),
      height: globals.getHeight(context, .2),
      child: Stack(
        children: [
          Image(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
            width: globals.getWidth(context, 1),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: const Text(
                'BLOG TITLE',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
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

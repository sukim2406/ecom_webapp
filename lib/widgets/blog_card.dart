import 'package:flutter/material.dart';

import '../globals.dart' as globals;

class BlogCard extends StatelessWidget {
  final String imageUrl;
  const BlogCard({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      height: globals.getHeight(context, .2),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
            child: Image(
              image: AssetImage(imageUrl),
              fit: BoxFit.fitHeight,
              height: globals.getHeight(
                context,
                .2,
              ),
              width: globals.getWidth(
                context,
                .8,
              ),
            ),
          ),
          SizedBox(
            height: globals.getHeight(context, .02),
          ),
          const Text(
            'Blog Title',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          // const Text('blog post content \n new line '),
        ],
      ),
    );
    // return Container(
    //   margin: const EdgeInsets.all(5.0),
    //   child: ClipRRect(
    //     borderRadius: const BorderRadius.all(
    //       Radius.circular(5.0),
    //     ),
    //     child: Column(
    //       children: [
    //         Image(
    //           image: AssetImage(imageUrl),
    //           fit: BoxFit.fill,
    //           width: globals.getWidth(context, .8),
    //         ),
    //         const Text(
    //           'Blog Title',
    //           style: TextStyle(
    //             fontSize: 30,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //         const Text('blog post hahahaasda;sdklas;dlkasd'),
    //       ],
    //     ),
    //   ),
    // );
  }
}

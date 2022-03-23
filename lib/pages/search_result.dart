import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../widgets/appbar_widget.dart';
import '../widgets/product_card.dart';
import '../controllers/product_controller.dart';

class SearchResultMobile extends StatefulWidget {
  final String keyword;
  final String myUid;
  const SearchResultMobile({
    Key? key,
    required this.keyword,
    required this.myUid,
  }) : super(key: key);

  @override
  State<SearchResultMobile> createState() => _SearchResultMobileState();
}

class _SearchResultMobileState extends State<SearchResultMobile> {
  List<Widget> searchResult = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        myUid: widget.myUid,
        tabBar: false,
      ),
      body: Container(
        height: globals.getHeight(context, 1),
        width: globals.getHeight(context, 1),
        color: Colors.black,
        child: FutureBuilder(
          future: ProductController.instance.getProductsByName(
            widget.keyword,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasData) {
              var temp = snapshot.data! as List<Object?>;
              searchResult = temp
                  .map(
                    (doc) => ProductCard(
                      product: doc as Map,
                      myUid: widget.myUid,
                    ),
                  )
                  .toList();
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Search Result for : ',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: widget.keyword,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const TextSpan(
                          text: '   ( ',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: searchResult.length.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const TextSpan(
                          text: ' found )',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: globals.getHeight(context, .7),
                    width: globals.getWidth(context, .8),
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20.0),
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      children: searchResult,
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              );
            } else {
              return RichText(
                text: TextSpan(
                  text: 'Search Result for : ',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: widget.keyword,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const TextSpan(
                      text: '   ( ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: searchResult.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const TextSpan(
                      text: ' found )',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

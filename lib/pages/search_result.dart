import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../widgets/appbar_widget.dart';
import '../widgets/product_card.dart';

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
  List searchResult = [];
  @override
  void initState() {
    getSearchResults();
    // TODO: implement initState
    super.initState();
  }

  getSearchResults() {
    globals.tempProductData.forEach(
      (element) {
        if (element['name'].contains(widget.keyword)) {
          searchResult.add(element);
        } else {
          print('not found');
        }
      },
    );
    setState(() {});
  }

  getProductCards() {
    List<Widget> temp = [];
    searchResult.forEach(
      (element) {
        temp.add(
          ProductCard(product: element, myUid: widget.myUid),
        );
      },
    );
    return temp;
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
        child: Column(
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
              child: (searchResult.isEmpty)
                  ? const Text('Result not found')
                  : GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20.0),
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      children: getProductCards(),
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

// class SearchResultMobile extends StatelessWidget {
//   final String keyword;
//   final String myUid;
//   const SearchResultMobile({
//     Key? key,
//     required this.myUid,
//     required this.keyword,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppbarWidget(
//         myUid: myUid,
//         tabBar: false,
//       ),
//       body: Container(color: Colors.amber),
//     );
//   }
// }

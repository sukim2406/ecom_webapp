import 'package:flutter/material.dart';

import '../globals.dart' as globals;
import '../pages/search_result.dart';

class SearchProduct extends StatelessWidget {
  final String myUid;
  const SearchProduct({
    Key? key,
    required this.myUid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return SizedBox(
      child: Row(
        children: [
          SizedBox(
            width: globals.getWidth(context, .2),
            child: TextField(
              cursorColor: Colors.red,
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
              controller: searchController,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              (searchController.text.isNotEmpty)
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchResultMobile(
                          keyword: searchController.text,
                          myUid: myUid,
                        ),
                      ),
                    )
                  : Container();
            },
            child: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
    );
  }
}

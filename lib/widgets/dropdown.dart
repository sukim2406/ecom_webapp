import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  const Dropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List dropdownList = [
      () {
        print('test1');
      },
      () {
        print('test2');
      },
      () {
        print('test3');
      },
    ];
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        icon: const Icon(
          Icons.favorite,
        ),
        items: [
          'Home',
          'test2',
          'test3',
        ].map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
              ),
            );
          },
        ).toList(),
        onChanged: (String? newValue) {
          if (newValue == 'test1') {
            dropdownList[0]();
          } else if (newValue == 'test2') {
            dropdownList[1]();
          } else {
            dropdownList[2]();
          }
        },
      ),
    );
  }
}

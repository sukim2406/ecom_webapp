import 'package:flutter/material.dart';

class TextBtn extends StatelessWidget {
  final Function function;
  final String label;
  const TextBtn({Key? key, required this.function, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.black,
          side: const BorderSide(
            width: 2.0,
            color: Colors.red,
          )),
      onPressed: () {
        function();
      },
      child: Text(label),
    );
  }
}

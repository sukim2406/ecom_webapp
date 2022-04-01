import 'package:flutter/material.dart';

class CheckoutInput extends StatelessWidget {
  final String label;
  final String myUid;
  final double width;
  final TextEditingController controller;

  const CheckoutInput({
    Key? key,
    required this.label,
    required this.myUid,
    required this.controller,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Container(),
        ),
        SizedBox(
          width: width,
          child: (myUid != '')
              ? TextField(
                  controller: controller,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  enabled: false,
                  decoration: const InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                )
              : TextField(
                  controller: controller,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
        )
      ],
    );
  }
}

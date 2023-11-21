import 'package:flutter/material.dart';

import '../pallete.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: constraints.maxWidth * .9,
          maxHeight: constraints.maxHeight * .2,
        ),
        child: TextFormField(
          controller: controller,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Pallete.borderColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Pallete.gradient2,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            labelText: labelText,
          ),
          // cursorColor: Colors.red,
          // cursorRadius: const Radius.circular(10),
          // cursorWidth: 5,
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
   const CustomTextFormField({super.key, required this.text});
   final String text;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:  InputDecoration(
        labelText: text,
        labelStyle: const TextStyle(
          color:
          Colors.white,
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );

  }
}

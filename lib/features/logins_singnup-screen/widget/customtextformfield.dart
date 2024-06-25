import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
    CustomTextFormField({super.key, required this.text,required this.onChanged});
   final String text;
    Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value){
         if(value!.isEmpty){
           return 'Field required';
         }
      },
      style: TextStyle(
        color: Colors.white
      ),
      onChanged: onChanged ,
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

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   const CustomButton({super.key, required this.text,required this.onTap});
   final String text;
    final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child:  Center(
          child: Text(text,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff2A465E),
            ),
          ),
        ),
      ),
    );
  }
}

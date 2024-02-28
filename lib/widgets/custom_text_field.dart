
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int? maxline;
  final TextEditingController? controller;

  const CustomTextField({super.key, required this.hintText, this.maxline,required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      maxLines: maxline,
      controller: controller,
    );
  }
}
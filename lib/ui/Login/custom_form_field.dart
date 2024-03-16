import 'package:flutter/material.dart';

typedef Myvalidator = String? Function(String?);

class CustomFormField extends StatelessWidget {
  bool isPassword;
  TextInputType keyboardType;
  String label;
  TextEditingController controller;
  Myvalidator validator;
  int lines;

  CustomFormField({
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    required this.label,
    required this.validator,
    required this.controller,
    this.lines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: lines,
      minLines: lines,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}

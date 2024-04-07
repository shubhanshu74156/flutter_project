import 'package:flutter/material.dart';

/// Flutter code sample for [TextField].

class MyTextField extends StatelessWidget {
  final String labelText;
  final bool obscureText, filled, border;
  final double width;
  final IconData icon;
  const MyTextField(
      {super.key,
      required this.labelText,
      required this.width,
      required this.icon,
      required this.obscureText,
      required this.filled,
      required this.border});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          border: border ? const OutlineInputBorder() : InputBorder.none,
          labelText: labelText,
          prefixIcon: Icon(icon),
          filled: filled,
        ),
      ),
    );
  }
}

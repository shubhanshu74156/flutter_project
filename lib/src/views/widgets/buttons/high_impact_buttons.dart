import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final String title;
  final double height, width;
  final Color background, color;
  final Function() onPressed;

  const MyElevatedButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.height,
    required this.width,
    required this.background,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        fixedSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

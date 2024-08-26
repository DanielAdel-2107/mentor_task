import 'package:flutter/material.dart';

class CustomTaskBar extends StatelessWidget {
  const CustomTaskBar({
    super.key,
    required this.title,
    required this.btnName,
    this.onPressed,
  });
  final String title;
  final String btnName;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              btnName,
              style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ))
      ],
    );
  }
}

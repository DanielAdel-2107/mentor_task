import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.enabelIcon,
    this.fontSize,
    this.color,
    required this.label,
    this.icon,
    this.onPressed,
  });
  final String label;
  final double? fontSize;
  final Color? color;
  final IconData? icon;
  final Function()? onPressed;
  final bool? enabelIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
          onPressed: onPressed,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 40.sp,
            color: Colors.white,
          ),
        ),
        Container()
      ],
    );
  }
}

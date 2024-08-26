import 'package:flutter/material.dart';
import 'package:mentor_task/views/clipper/auth_clipper.dart';

class CuustomClipPath extends StatelessWidget {
  const CuustomClipPath({
    super.key,
    required this.child,
    this.height,
  });
  final Widget child;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AuthClipper(),
      child: Container(
          color: Colors.blue,
          width: MediaQuery.sizeOf(context).width,
          height: height != null
              ? height!.toDouble()
              : MediaQuery.sizeOf(context).height * 0.20,
          child: child),
    );
  }
}

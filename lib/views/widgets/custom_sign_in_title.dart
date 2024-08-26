import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSignInTitle extends StatelessWidget {
  const CustomSignInTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.sizeOf(context).width,
      height: 600,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Welcome Back',
          style: TextStyle(
              fontSize: 80.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'Qwitcher_Grypen'),
        ),
      ),
    );
  }
}

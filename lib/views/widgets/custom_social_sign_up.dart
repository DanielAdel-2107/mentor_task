import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_task/core/assets/images/image_manager.dart';

class CustomSocialSignUp extends StatelessWidget {
  const CustomSocialSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            child: Image.asset(AssetManager.fecbook),
          ),
          CircleAvatar(
            child: Image.asset(AssetManager.twitter),
          ),
          CircleAvatar(
            child: Image.asset(AssetManager.google),
          )
        ],
      ),
    );
  }
}

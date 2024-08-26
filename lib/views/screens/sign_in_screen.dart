import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_task/provider/auth_provider.dart';
import 'package:mentor_task/views/screens/sign_up_screen.dart';
import 'package:mentor_task/views/widgets/custom_button.dart';
import 'package:mentor_task/views/widgets/custom_clip_path.dart';
import 'package:mentor_task/views/widgets/custom_divider.dart';
import 'package:mentor_task/views/widgets/custom_sign_in_title.dart';
import 'package:mentor_task/views/widgets/custom_social_sign_up.dart';
import 'package:mentor_task/views/widgets/custom_task_bar.dart';
import 'package:mentor_task/views/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Form(
        key: authProvider.signInFormKey,
        child: Column(
          children: [
            CuustomClipPath(
                height: MediaQuery.sizeOf(context).height * 0.34,
                child: const CustomSignInTitle()),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    label: 'Email',
                    controller: authProvider.emailSignInController,
                    icon: Icons.email,
                  ),
                  CustomTextField(
                    label: 'Password',
                    controller: authProvider.passwordController,
                    obscureText: true,
                    icon: Icons.password_sharp,
                  ),
                  CustomButton(
                    text: 'Sign In',
                    onPressed: () async {
                      if (authProvider.signInFormKey.currentState!.validate()) {
                        await authProvider.signInWithEmailAndPassword(context);
                      }
                    },
                  ),
                  const CustomDivider(),
                  const CustomSocialSignUp(),
                  CustomTaskBar(
                    btnName: 'Sign Up',
                    title: 'Don\'t Have An Account?',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

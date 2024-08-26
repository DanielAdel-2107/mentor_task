import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_task/views/widgets/show_dialog.dart';
import 'package:provider/provider.dart';
import 'package:mentor_task/provider/auth_provider.dart';
import 'package:mentor_task/views/screens/sign_in_screen.dart';
import 'package:mentor_task/views/widgets/custom_app_bar.dart';
import 'package:mentor_task/views/widgets/custom_button.dart';
import 'package:mentor_task/views/widgets/custom_clip_path.dart';
import 'package:mentor_task/views/widgets/custom_divider.dart';
import 'package:mentor_task/views/widgets/custom_social_sign_up.dart';
import 'package:mentor_task/views/widgets/custom_task_bar.dart';
import 'package:mentor_task/views/widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Form(
        key: authProvider.signUpFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CuustomClipPath(
                child: CustomAppBar(
                  icon: Icons.arrow_back,
                  label: 'Sign Up',
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return SignInScreen();
                      },
                    ));
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => showImageSourceDialog(context, authProvider),
                      child: CircleAvatar(
                        radius: 50.r,
                        backgroundImage: authProvider.selectedImage != null
                            ? FileImage(authProvider.selectedImage!)
                            : null,
                        child: authProvider.selectedImage == null
                            ? Icon(
                                Icons.camera_alt,
                                size: 30.sp,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      icon: Icons.person,
                      label: 'First name',
                      controller: authProvider.firstNameController,
                    ),
                    CustomTextField(
                      icon: Icons.person,
                      label: 'Last name',
                      controller: authProvider.lastNameController,
                    ),
                    CustomTextField(
                      label: 'Email',
                      controller: authProvider.emailController,
                      icon: Icons.email,
                    ),
                    CustomTextField(
                      icon: Icons.password_sharp,
                      label: 'Password',
                      controller: authProvider.passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value !=
                            authProvider.confirmPasswordController.text) {
                          return "Passwords don't match";
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                        icon: Icons.password_sharp,
                        label: 'Confirm password',
                        controller: authProvider.confirmPasswordController,
                        obscureText: true,
                        validator: (value) {
                          if (value !=
                              authProvider.confirmPasswordController.text) {
                            return "Passwords don't match";
                          }
                          return null;
                        }),
                    CustomButton(
                      text: 'Sign Up',
                      onPressed: () async {
                        if (authProvider.signUpFormKey.currentState!
                            .validate()) {
                          await authProvider.createUserWithEmailAndPassword(
                            context,
                          );
                        } else {
                          const SnackBar(
                              content: Text('Passwords do not match'));
                        }
                      },
                    ),
                    const CustomDivider(),
                    const CustomSocialSignUp(),
                    CustomTaskBar(
                      btnName: 'Login.',
                      title: 'Have An Account?',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

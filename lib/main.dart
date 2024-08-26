import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mentor_task/provider/auth_provider.dart';
import 'package:mentor_task/views/screens/on_boarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AuthProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: OnBoardingScreen(),
          ),
        );
      },
    );
  }
}

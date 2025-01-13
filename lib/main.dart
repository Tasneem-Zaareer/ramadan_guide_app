import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ramadan_guide_app/features/onboarding/views/onboarding_control.dart';
import 'core/constants/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
     theme: lightMode,
        debugShowCheckedModeBanner: false,
        title: 'Ramadan',
        home: const OnboardingControl(),
      ),
    );
  }
}

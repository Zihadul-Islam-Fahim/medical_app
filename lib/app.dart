
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/presentation/ui/widgets/app_theme_data.dart';

import 'controller_binder.dart';
import 'presentation/ui/screen/auth/splash_screen.dart';

class Medblocks extends StatelessWidget {
  const Medblocks({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemeData.lightTheme,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
    );
  }
}

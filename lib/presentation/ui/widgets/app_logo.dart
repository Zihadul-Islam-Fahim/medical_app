import 'package:flutter/material.dart';
import 'package:medical_app/presentation/ui/utility/app_colors.dart';

import '../utility/assets_path.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsPath.logo,
      width: width ?? 160,
      color: AppColors.primaryColor,
      height: height,
    );
  }
}

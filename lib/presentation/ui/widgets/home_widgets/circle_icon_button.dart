import 'package:flutter/material.dart';
import 'package:medical_app/presentation/ui/utility/app_colors.dart';

class CircleIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData iconData;

  const CircleIconButton({
    super.key,
    required this.onTap,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: onTap,
      child: CircleAvatar(
        radius: 15,
        backgroundColor: Colors.grey.shade300,
        child: Icon(
          iconData,
          color: AppColors.primaryColor,
          size: 20,
        ),
      ),
    );
  }
}

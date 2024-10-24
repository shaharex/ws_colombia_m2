import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.color, required this.btnText});
  final Function()? onTap;
  final Color color;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          btnText,
          style: const TextStyle(
              fontFamily: 'Roboto-Bold', fontSize: 18, color: AppColors.white),
        ),
      ),
    );
  }
}

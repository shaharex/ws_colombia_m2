import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, required this.controller, required this.hintText, required this.icon});
  final TextEditingController controller;
  final String hintText;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        hintText: hintText,
        hintStyle: const TextStyle(fontFamily: 'Roboto-Regular', fontSize: 20, color: Colors.grey),
        prefixIcon:  Icon(icon, color: Colors.grey),
        fillColor: const Color.fromARGB(255, 235, 235, 235),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.whiteLightShade),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.whiteLightShade),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

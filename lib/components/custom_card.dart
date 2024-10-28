import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.suffix, required this.prefix});
  final String prefix;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
            color: AppColors.whiteLightShade,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 3,
                  offset: const Offset(1, 3))
            ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            suffix,
            style: const TextStyle(fontFamily: 'Roboto-Regular', fontSize: 18),
          ),
          Text(
            prefix,
            style: const TextStyle(color: AppColors.orange, fontSize: 18, fontFamily: 'Roboto-Bold',),
          )
        ],
      ),
    );
  }
}

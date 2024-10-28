import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    this.onTap,
  });
  final String title;
  final String image;
  final double price;
  final String description;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        height: 150,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.whiteLightShade,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 3,
                  offset: const Offset(1, 3))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              image,
              width: 60,
            ),
            Text(
              title,
              style: const TextStyle(fontFamily: 'Roboto-Bold', fontSize: 22),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              description,
              style: const TextStyle(fontFamily: 'Roboto-Regular'),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '\$ $price',
              style: const TextStyle(fontFamily: 'Roboto-Bold', fontSize: 20),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

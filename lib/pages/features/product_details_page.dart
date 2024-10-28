import 'package:flutter/material.dart';

import '../../models/products_model.dart';
import '../../theme/app_colors.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarHeight: 60,
        backgroundColor: AppColors.orange,
        title: Text(
          product.title,
          style: const TextStyle(
              fontFamily: 'Roboto-Regular',
              fontSize: 22,
              color: AppColors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.black,
                  child: Image.network(product.thumbnail),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                            fontFamily: 'Roboto-Bold', fontSize: 20),
                      ),
                      Text(
                        'Category: ${product.category}',
                        style: const TextStyle(
                            color: AppColors.orange, fontSize: 18),
                      ),
                      Text(
                        product.description,
                        style: TextStyle(
                          fontFamily: 'Roboto-Regular',
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.asset(
                      'assets/images/Imagen 4.png',
                      fit: BoxFit.cover,
                    ),
                  ),
            Container(
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          )),
                      const SizedBox(width: 5),
                      Text(
                        '\$ ${product.price}',
                        style: const TextStyle(
                            fontFamily: 'Roboto-Bold', fontSize: 20),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'Message',
                      style: TextStyle(
                          color: AppColors.white,
                          fontFamily: 'Roboto-Bold',
                          fontSize: 16),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

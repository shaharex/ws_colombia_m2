import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ws_colombia_m2/components/custom_search_item.dart';
import 'package:ws_colombia_m2/components/custom_textfield.dart';
import 'package:ws_colombia_m2/models/products_model.dart';
import 'package:ws_colombia_m2/pages/features/product_details_page.dart';

import '../../theme/app_colors.dart';

class SearchItemPage extends StatefulWidget {
  const SearchItemPage({super.key, required this.product, required this.username});
  final List<Product> product;
  final String username;

  @override
  State<SearchItemPage> createState() => _SearchItemPageState();
}

class _SearchItemPageState extends State<SearchItemPage> {
  final TextEditingController _searchController = TextEditingController();

  bool isEmptyList = true;
  List<Product> products = [];

  final dio = Dio();

  void search(String value) async {
    final response =
        await dio.get("https://dummyjson.com/products/search?q=$value");
    final productsModel = ProductsModel.fromJson(response.data);

    setState(() {
      isEmptyList = value.isEmpty;
      products = productsModel.productsList!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.orange,
        title: const Text(
          'Search Item',
          style: TextStyle(
              fontFamily: 'Roboto-Regular',
              fontSize: 22,
              color: AppColors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Hello ',
                  style: TextStyle(
                      color: AppColors.orange,
                      fontFamily: 'Roboto-Bold',
                      fontSize: 28),
                ),
                Text(
                  widget.username,
                  style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto-Bold',
                      fontSize: 28),
                )
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Please type for search by item name.',
              style: TextStyle(fontFamily: 'Roboto-Light', fontSize: 18),
            ),
            const SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: CustomTextfield(
                    onChanged: (value) {
                      setState(() {
                        search(value);
                      });
                    },
                    controller: _searchController,
                    hintText: 'Type the item name...',
                    icon: null)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Results',
                style: TextStyle(fontFamily: 'Roboto-Light', fontSize: 18),
              ),
            ),
            isEmptyList
                ? const SizedBox(height: 10)
                : Expanded(
                    child: ListView.separated(
                      itemCount: products.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10);
                      },
                      itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomSearchItem(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsPage(product: products[index])));
                        },
                        title: products[index].title,
                        image: products[index].thumbnail,
                        price: products[index].price,
                        description: products[index].description,
                      ),
                    );
                  })),
          ],
        ),
      ),
    );
  }
}

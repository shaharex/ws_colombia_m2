import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../components/custom_search_item.dart';
import '../../models/products_model.dart';
import '../../theme/app_colors.dart';
import 'product_details_page.dart';

class ProductCategoriesPage extends StatefulWidget {
  const ProductCategoriesPage({super.key});

  @override
  State<ProductCategoriesPage> createState() => _ProductCategoriesPageState();
}

class _ProductCategoriesPageState extends State<ProductCategoriesPage> {
  bool isEmptyList = true;
  bool isLoading = true;
  String? selectedCategory = '';
  List<String> categories = [];
  List<Product> products = [];

  final dio = Dio();

  void getCategories() async {
    final response = await dio.get('https://dummyjson.com/products/categories');
    final List<String> kCategories = [];
    for (var data in response.data) {
      kCategories.add(data['slug'].toString().toUpperCase());
    }
    setState(() {
      categories = kCategories;
      isLoading = false;
    });
    debugPrint(kCategories.toString());
  }

  void getItems(String? category) async {
    final response =
        await dio.get("https://dummyjson.com/products/category/$category");
    final productsModel = ProductsModel.fromJson(response.data);

    setState(() {
      products = productsModel.productsList!;
      isEmptyList = false;
    });
  }

  @override
  void initState() {
    getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: AppColors.orange,
        title: const Text(
          'Product Categories',
          style: TextStyle(
              fontFamily: 'Roboto-Regular',
              fontSize: 22,
              color: AppColors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator(
                color: AppColors.orange,
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Category: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto-Bold',
                          fontSize: 28),
                    ),
                    const SizedBox(height: 10),
                    DropdownMenu(
                      initialSelection: selectedCategory,
                      onSelected: (category) {
                        getItems(category);
                        setState(() {
                          selectedCategory = category!;
                        });
                      },
                      width: double.infinity,
                      dropdownMenuEntries: categories
                          .map((value) =>
                              DropdownMenuEntry(value: value, label: value))
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    isEmptyList
                        ? const Text('Please select the Category')
                        : Expanded(
                            child: ListView.separated(
                                itemCount: products.length,
                                separatorBuilder: (context, index) {
                                  return const SizedBox(height: 10);
                                },
                                itemBuilder: (context, index) {
                                  return CustomSearchItem(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetailsPage(
                                                      product:
                                                          products[index])));
                                    },
                                    title: products[index].title,
                                    image: products[index].thumbnail,
                                    price: products[index].price,
                                    description: products[index].description,
                                  );
                                }))
                  ],
                ),
              ),
      ),
    );
  }
}

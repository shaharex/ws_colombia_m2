import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ws_colombia_m2/components/custom_item.dart';
import 'package:ws_colombia_m2/models/products_model.dart';
import 'package:ws_colombia_m2/pages/features/notifications_page.dart';
import 'package:ws_colombia_m2/pages/features/product_categories_page.dart';
import 'package:ws_colombia_m2/pages/features/product_details_page.dart';
import 'package:ws_colombia_m2/theme/app_colors.dart';

import '../features/search_item_page.dart';
import 'user_profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.token});
  final String token;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dio = Dio();
  List<Product> products = [];
  bool isLoading = true;
  dynamic user;
  String username = '';

  void getCurrentUser() async {
    final userData = {'Authorization': 'Bearer ${widget.token}'};
    final response = await dio.get("https://dummyjson.com/auth/me",
        options: Options(headers: userData));

    setState(() {
      final user = response.data;
      username = user['firstName'] + ' ' + user['lastName'];
    });
    debugPrint(user['username']);
  }

  void getProducts() async {
    final response = await dio.get("https://dummyjson.com/products");
    final productsModel = ProductsModel.fromJson(response.data);
    setState(() {
      products = productsModel.productsList!;
      isLoading = false;
    });
    debugPrint(products[1].title);
  }

  @override
  void initState() {
    getProducts();
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        toolbarHeight: 60,
        title: const Text(
          'Korea - Go Yang',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontFamily: 'Roboto-Bold', color: AppColors.white, fontSize: 26),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SearchItemPage(product: products, username: username)));
          },
          icon: const Icon(
            Icons.search,
            color: Colors.white,
            size: 35,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationsPage()));
            },
            icon: const Icon(
              Icons.notifications_active,
              color: Colors.white,
              size: 35,
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset("assets/images/Imagen 18.png"),
            ),
            isLoading
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Lastest items',
                                style: TextStyle(
                                    color: AppColors.orange,
                                    fontFamily: 'Roboto-Bold',
                                    fontSize: 26),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductCategoriesPage()));
                                },
                                child: const Text(
                                  'Categories',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto-Bold',
                                      fontSize: 24),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 180,
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: 2,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 10);
                              },
                              itemBuilder: (context, index) {
                                final product = products[index];
                                return CustomItem(
                                  title: product.title,
                                  image: product.thumbnail,
                                  price: product.price,
                                  description: product.description,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailsPage(
                                                    product: product)));
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Your publications',
                            style: TextStyle(
                                color: AppColors.orange,
                                fontFamily: 'Roboto-Bold',
                                fontSize: 24),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: products.length - 2,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (context, index) {
                                final product = products[2 + index];
                                return CustomItem(
                                  title: product.title,
                                  image: product.thumbnail,
                                  price: product.price,
                                  description: product.description,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailsPage(
                                                    product: product)));
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.orange,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserProfilePage(
                          token: widget.token,
                        )));
          }),
    );
  }
}

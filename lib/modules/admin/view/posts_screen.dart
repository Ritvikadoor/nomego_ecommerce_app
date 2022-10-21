import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nomego_ecommerce_app/modules/account/widgets/single_product.dart';
import 'package:nomego_ecommerce_app/models/product.dart';
import 'package:nomego_ecommerce_app/modules/admin/view/add_product_screen.dart';
import 'package:nomego_ecommerce_app/modules/admin/view_model/admin_services.dart';
import 'package:nomego_ecommerce_app/common/widgets/loader.dart';
import 'package:provider/provider.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    final list = await adminServices.fetchAllProducts(context);
    context.read<AdminServices>().productList.addAll(list);

    setState(() {});
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
      context: context,
      product: product,
      onSuccess: () {
        adminServices.productList.removeAt(index);
        setState(() {});
      },
    );
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return adminServices.productList.isEmpty
        ? const Loader()
        : Consumer<AdminServices>(
            builder: (context, value, _) {
              log(value.productList.toString());
              return Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    itemCount: adminServices.productList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      final productData = adminServices.productList[index];
                      return Column(
                        children: [
                          SizedBox(
                            height: 140,
                            child: SingleProduct(
                              image: productData.images[0],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Text(
                                  productData.name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              IconButton(
                                onPressed: () =>
                                    deleteProduct(productData, index),
                                icon: const Icon(
                                  Icons.delete_outline,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: navigateToAddProduct,
                  tooltip: 'Add a Product',
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
              );
            },
          );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nomego_ecommerce_app/modules/account/view_model/account_services.dart';
import 'package:nomego_ecommerce_app/modules/account/widgets/single_product.dart';
import 'package:nomego_ecommerce_app/common/widgets/loader.dart';
import 'package:nomego_ecommerce_app/constants/global_variables.dart';
import 'package:nomego_ecommerce_app/modules/models/order.dart';
import 'package:nomego_ecommerce_app/modules/order_details/view/order_details.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<Order>? orders;
  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await accountServices.fetchMyOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: const Text(
                      'Your Orders',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      right: 15,
                    ),
                    child: Text(
                      'See all',
                      style: TextStyle(
                        color: GlobalVariables.selectedNavBarColor,
                      ),
                    ),
                  ),
                ],
              ),
              // display orders
              Column(
                children: [
                  Container(
                    height: 450,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemCount: orders!.length,
                      itemBuilder: (context, index) {
                        log(orders!.length.toString());
                        // log(orders![index]
                        //     .products[index]
                        //     .images[index]
                        //     .toString());

                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              OrderDetailScreen.routeName,
                              arguments: orders![index],
                            );
                          },
                          child: SingleProduct(
                            image: orders![index].products[0].images[0],
                            //orders![index].products[0].images[0]
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          );
  }
}

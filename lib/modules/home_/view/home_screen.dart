import 'package:flutter/material.dart';
import 'package:nomego_ecommerce_app/constants/global_variables.dart';
import 'package:nomego_ecommerce_app/modules/home_/widgets/address_box.dart';
import 'package:nomego_ecommerce_app/modules/home_/widgets/carousel_images.dart';
import 'package:nomego_ecommerce_app/modules/home_/widgets/deal_of_the_day.dart';
import 'package:nomego_ecommerce_app/modules/home_/widgets/side_scroll_product.dart';
import 'package:nomego_ecommerce_app/modules/home_/widgets/top_categories.dart';
import 'package:nomego_ecommerce_app/modules/models/product.dart';
import 'package:nomego_ecommerce_app/modules/search_screen/view/search_screen.dart';
import 'package:nomego_ecommerce_app/providers/users_providers.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product>? productList;

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UsersProvider>(context).user;

    return Scaffold(
        backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Hey ${user.name}"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 42,
                      margin: const EdgeInsets.only(left: 15),
                      child: Material(
                        borderRadius: BorderRadius.circular(7),
                        elevation: 1,
                        child: TextFormField(
                          onFieldSubmitted: navigateToSearchScreen,
                          decoration: InputDecoration(
                            prefixIcon: InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(
                                  left: 6,
                                ),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.green,
                                  size: 23,
                                ),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(top: 10),
                            border: InputBorder.none,
                            label: Text('Search'),
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.green.shade900,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const AddressBox(),
            const CarouselImage(),
            const SizedBox(height: 10),
            const TopCategories(),
            const DealOfDay(),
            const SideScroll()
          ]),
        ));
  }
}

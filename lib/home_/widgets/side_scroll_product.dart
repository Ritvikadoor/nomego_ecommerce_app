import 'package:flutter/material.dart';
import 'package:nomego_ecommerce_app/models/product.dart';
import 'package:nomego_ecommerce_app/home_/view_model/home_services.dart';
import 'package:nomego_ecommerce_app/product_details/view/product_details.dart';

class SideScrollMobile extends StatefulWidget {
  const SideScrollMobile({Key? key}) : super(key: key);

  @override
  State<SideScrollMobile> createState() => _SideScrollMobileState();
}

class _SideScrollMobileState extends State<SideScrollMobile> {
  Product? product;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    // product = await homeServices.fetchCategoryProducts(category: );
    setState(() {});
  }

  void navigateToDetailScreen() {
    Navigator.pushNamed(
      context,
      ProductDetailScreen.routeName,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return
        // product == null
        //     ? const Loader()
        //     : product!.name.isEmpty
        //         ? const SizedBox()
        //         :
        SizedBox(
      height: 150,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(10.0),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(product!.images[index]))),
          );
        },
      ),
    );

    // GestureDetector(
    //     onTap: navigateToDetailScreen,
    //     child: Column(
    //       children: [
    //         Container(
    //           alignment: Alignment.topLeft,
    //           padding: const EdgeInsets.only(left: 10, top: 15),
    //           child: const Text(
    //             'Mobiles',
    //             style: TextStyle(fontSize: 20),
    //           ),
    //         ),
    //         Image.network(
    //           product!.images[0],
    //           height: 235,
    //           fit: BoxFit.fitHeight,
    //         ),
    //         Container(
    //           padding: const EdgeInsets.only(left: 15),
    //           alignment: Alignment.topLeft,
    //           child: Text(
    //             '\$${product!.price}',
    //             style: TextStyle(fontSize: 18),
    //           ),
    //         ),
    //         Container(
    //           alignment: Alignment.topLeft,
    //           padding:
    //               const EdgeInsets.only(left: 15, top: 5, right: 40),
    //           child: Text(
    //             product!.name,
    //             maxLines: 2,
    //             overflow: TextOverflow.ellipsis,
    //           ),
    //         ),
    //         // SingleChildScrollView(
    //         //   scrollDirection: Axis.horizontal,
    //         //   child: Row(
    //         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         //     children: product!.images
    //         //         .map(
    //         //           (e) => Image.network(
    //         //             e,
    //         //             fit: BoxFit.fitWidth,
    //         //             width: 100,
    //         //             height: 100,
    //         //           ),
    //         //         )
    //         //         .toList(),
    //         //   ),
    //         // ),
    //         // Container(
    //         //   padding: const EdgeInsets.symmetric(
    //         //     vertical: 15,
    //         //   ).copyWith(left: 15),
    //         //   alignment: Alignment.topLeft,
    //         //   child: Text(
    //         //     'See all deals',
    //         //     style: TextStyle(
    //         //       color: Colors.cyan[800],
    //         //     ),
    //         //   ),
    //         // ),
    //       ],
    //     ),
    //   );
  }
}

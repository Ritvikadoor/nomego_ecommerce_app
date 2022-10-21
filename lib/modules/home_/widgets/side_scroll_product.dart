import 'package:flutter/material.dart';
import 'package:nomego_ecommerce_app/common/widgets/loader.dart';
import 'package:nomego_ecommerce_app/modules/home_/view_model/home_services.dart';
import 'package:nomego_ecommerce_app/modules/models/product.dart';

class SideScroll extends StatefulWidget {
  const SideScroll({
    Key? key,
  }) : super(key: key);

  @override
  State<SideScroll> createState() => _SideScrollState();
}

class _SideScrollState extends State<SideScroll> {
  Product? product;
  final HomeServices homeServices = HomeServices();
  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    product = await homeServices.fetchDealOfDay(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return product == null
        ? const Loader()
        : GestureDetector(
            // onTap: () => Get.to(() => ItemView(
            //       item: item,
            //     )),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Card(
                elevation: 4,
                shadowColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: Image.network(product!.images[0]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

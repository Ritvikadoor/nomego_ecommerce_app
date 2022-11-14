import 'package:flutter/material.dart';

String uri = "http://10.0.2.2:3000";

class GlobalVariables {
  // COLORS

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static var backgroundColor = Color.fromARGB(255, 165, 226, 167);
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = const Color.fromARGB(255, 156, 39, 176);
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'assets/images/banneroffervege.png',
    'assets/images/banner_grocery.jpg',
    'assets/images/important _grocery_banner.webp',
    'assets/images/india_online_grocery_store.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Mobiles',
      'image': 'assets/images/mobileimage.jpeg',
    },
    {
      'title': 'Essentials',
      'image': 'assets/images/essentialproducts.png',
    },
    {
      'title': 'Appliances',
      'image': 'assets/images/appliance.png',
    },
    {
      'title': 'Books',
      'image': 'assets/images/books.jpeg',
    },
    {
      'title': 'Fashion',
      'image': 'assets/images/fashion.jpg',
    },
  ];
  final SizedBox h20 = const SizedBox(
    height: 20,
  );
  final SizedBox h50 = const SizedBox(
    height: 50,
  );
  // final Color bgColor = const Color.fromARGB(255, 209, 255, 233);
}

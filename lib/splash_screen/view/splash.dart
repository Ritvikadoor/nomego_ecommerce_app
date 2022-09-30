import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nomego_ecommerce_app/common/widgets/bottom_bar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const BottomBar())));

    return Scaffold(
      body: Container(
        color: Colors.purple,
        child: const Center(child: Text("NOMOGO")),
      ),
    );
  }
}

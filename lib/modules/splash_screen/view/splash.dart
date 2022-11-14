import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nomego_ecommerce_app/modules/admin/view/admin_screen.dart';
import 'package:nomego_ecommerce_app/modules/auth/view/auth_screens.dart';
import 'package:nomego_ecommerce_app/common/widgets/bottom_bar.dart';
import 'package:nomego_ecommerce_app/providers/users_providers.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) =>
              Provider.of<UsersProvider>(context).user.type == 'admin'
                  ? const AdminScreen()
                  : Provider.of<UsersProvider>(context).user.type.isNotEmpty
                      ? const BottomBar()
                      : const AuthScreen(),
        ),
      ),
    );

    return Scaffold(
      body: Container(
          color: Colors.greenAccent,
          child: const Center(
              child: SizedBox(
            width: 200,
            height: 200,
            child: Image(
              image: AssetImage("assets/images/g-company-removebg-preview.png"),
            ),
          ))),
    );
  }
}

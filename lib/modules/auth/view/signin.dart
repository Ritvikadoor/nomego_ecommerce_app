import 'package:flutter/material.dart';
import 'package:nomego_ecommerce_app/modules/auth/controllers/signin_controller.dart';
import 'package:nomego_ecommerce_app/common/widgets/custom_button.dart';
import 'package:nomego_ecommerce_app/common/widgets/custom_textfield.dart';
import 'package:nomego_ecommerce_app/constants/global_variables.dart';
import 'package:nomego_ecommerce_app/modules/auth/widgets/image_ui_signin.dart';
import 'package:nomego_ecommerce_app/modules/auth/widgets/signin_field.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sign-In your Account',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  GlobalVariables().h50,
                  const SignInUiImage(),
                ],
              ),
            ),
            const SignInField(),
          ],
        ),
      ),
    );
  }
}

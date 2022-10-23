import 'package:flutter/material.dart';
import 'package:nomego_ecommerce_app/modules/auth/controllers/signin_controller.dart';
import 'package:nomego_ecommerce_app/constants/global_variables.dart';
import 'package:nomego_ecommerce_app/modules/auth/widgets/signup_field.dart';
import 'package:provider/provider.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatelessWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: Consumer<SignInController>(builder: (context, value, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GlobalVariables().h20,
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: value.signUpFormKey,
                    child: SignUpField(),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

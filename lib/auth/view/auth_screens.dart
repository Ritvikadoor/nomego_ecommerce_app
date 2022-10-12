import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nomego_ecommerce_app/auth/controllers/signin_controller.dart';
import 'package:nomego_ecommerce_app/auth/view/signin.dart';
import 'package:nomego_ecommerce_app/common/widgets/custom_button.dart';
import 'package:nomego_ecommerce_app/common/widgets/custom_textfield.dart';
import 'package:nomego_ecommerce_app/constants/global_variables.dart';
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
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: Consumer<SignInController>(builder: (context, value, _) {
            return ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  tileColor: value.auth == Auth.signup
                      ? GlobalVariables.backgroundColor
                      : GlobalVariables.greyBackgroundCOlor,
                  title: const Text(
                    'Create Account',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: value.signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: value.nameController,
                          hintText: 'Name',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: value.emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: value.passwordController,
                          hintText: 'Password',
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          text: 'Sign Up',
                          onTap: () {
                            if (value.signUpFormKey.currentState!.validate()) {
                              value.signUpUser(context);
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an account?'),
                            TextButton(
                              child: const Text(
                                'Sign In',
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () => value.navigateToSignIn(context),
                            ),
                          ],
                        ),
                      ],
                    ),
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

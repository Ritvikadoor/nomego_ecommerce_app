import 'package:flutter/material.dart';
import 'package:nomego_ecommerce_app/auth/controllers/signin_controller.dart';
import 'package:nomego_ecommerce_app/common/widgets/custom_button.dart';
import 'package:nomego_ecommerce_app/common/widgets/custom_textfield.dart';
import 'package:nomego_ecommerce_app/constants/global_variables.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Consumer<SignInController>(builder: (context, value, _) {
            return Container(
              padding: const EdgeInsets.all(8),
              color: GlobalVariables.backgroundColor,
              child: Form(
                key: value.signInFormKey,
                child: Column(
                  children: [
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
                      text: 'Sign In',
                      onTap: () {
                        if (value.signInFormKey.currentState!.validate()) {
                          value.signInUser(context);
                        }
                      },
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

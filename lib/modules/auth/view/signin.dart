import 'package:flutter/material.dart';
import 'package:nomego_ecommerce_app/modules/auth/controllers/signin_controller.dart';
import 'package:nomego_ecommerce_app/common/widgets/custom_button.dart';
import 'package:nomego_ecommerce_app/common/widgets/custom_textfield.dart';
import 'package:nomego_ecommerce_app/constants/global_variables.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/d544ba41-973c-4c06-8b9a-d0fb7a8cd894-removebg-preview.png"))),
                  )
                ],
              ),
            ),
            Consumer<SignInController>(builder: (context, value, _) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: CustomButton(
                          text: 'Sign In',
                          onTap: () {
                            if (value.signInFormKey.currentState!.validate()) {
                              value.signInUser(context);
                            }
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Sign-Up a new account?'),
                          TextButton(
                            child: const Text(
                              'Sign-Up',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () => value.navigateToSignUp(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nomego_ecommerce_app/common/widgets/custom_button.dart';
import 'package:nomego_ecommerce_app/common/widgets/custom_textfield.dart';
import 'package:nomego_ecommerce_app/constants/global_variables.dart';
import 'package:nomego_ecommerce_app/modules/auth/controllers/signin_controller.dart';
import 'package:provider/provider.dart';

class SignInField extends StatelessWidget {
  const SignInField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SignInController>(builder: (context, value, _) {
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
                obscure: true,
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
                  const Text('You don\'t have an Account?'),
                  TextButton(
                    child: const Text(
                      'Sign-Up',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => value.navigateToSignUp(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}

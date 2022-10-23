import 'package:flutter/material.dart';
import 'package:nomego_ecommerce_app/common/widgets/custom_button.dart';
import 'package:nomego_ecommerce_app/common/widgets/custom_textfield.dart';
import 'package:nomego_ecommerce_app/constants/global_variables.dart';
import 'package:nomego_ecommerce_app/modules/auth/controllers/signin_controller.dart';
import 'package:provider/provider.dart';

class SignUpField extends StatelessWidget {
  const SignUpField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SignInController>(builder: (context, value, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Create Account",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
          GlobalVariables().h20,
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
      );
    });
  }
}

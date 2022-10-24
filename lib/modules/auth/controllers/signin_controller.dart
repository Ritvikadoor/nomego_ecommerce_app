import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nomego_ecommerce_app/modules/auth/view/auth_screens.dart';
import 'package:nomego_ecommerce_app/modules/auth/view/signin.dart';
import 'package:nomego_ecommerce_app/services/auth_services.dart';

class SignInController extends ChangeNotifier {
  Auth auth = Auth.signup;
  final signUpFormKey = GlobalKey<FormState>();
  final signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  void signUpUser(BuildContext context) {
    // log('signupbuttton presssed');
    authService.signUpUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );
    notifyListeners();
  }

  void signInUser(BuildContext context) {
    // log('signinbuttton presssed');
    authService.signInUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    );
    notifyListeners();
  }

  void navigateToSignIn(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const SignIn(),
    ));
  }

  void navigateToSignUp(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const AuthScreen(),
    ));
  }
}

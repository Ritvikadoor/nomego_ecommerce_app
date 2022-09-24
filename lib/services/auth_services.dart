import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nomego_ecommerce_app/common/widgets/bottom_bar.dart';
import 'package:nomego_ecommerce_app/constants/errorhandling.dart';
import 'package:nomego_ecommerce_app/constants/global_variables.dart';
import 'package:nomego_ecommerce_app/constants/utils.dart';
import 'package:nomego_ecommerce_app/home_/view/home_screen.dart';
import 'package:nomego_ecommerce_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:nomego_ecommerce_app/providers/users_providers.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  void signupUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        address: '',
        type: '',
        token: '',
        cart: [],
      );
      http.Response res = await http.post(
        Uri.parse("$uri/api/signup"),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandling(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Account created !');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse("$uri/api/signin"),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandling(
          response: res,
          context: context,
          onSuccess: () async {
            final jwtdec = jsonDecode(res.body)['token'];
            // log(jwtdec.toString());
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UsersProvider>(context, listen: false)
                .setUser(res.body);
            await prefs.setBool('isLoggedIn', true);
            await prefs.setString('x-auth-token', jwtdec);
            Navigator.pushNamedAndRemoveUntil(
                context, BottomBar.routeName, (route) => false);
            // Navigator.of(context).pushAndRemoveUntil(
            //     MaterialPageRoute(builder: (context) => const HomeScreen()),
            //     (route) => false);
            //RoutesProvider.nextScreen(screen: const HomeScreen());
            // print(res.body.toString());
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

//get user data
  void getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var userProvider = Provider.of<UsersProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}

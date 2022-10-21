import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nomego_ecommerce_app/modules/models/user.dart';

class UsersProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
    cart: [],
  );

  User get user => _user;

  setUser(String user) {
    _user = User.fromJson(user);

    notifyListeners();
    return true;
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}

import 'dart:convert';
import 'dart:developer';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final String token;
  List<Map<String, dynamic>>? cart;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.type,
    required this.token,
    this.cart,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
      'token': token,
      'cart': cart,
    };
  }

  factory User.fromMap(Map<String, dynamic> njanMap) {
    log("Wroking");
    return User(
      id: njanMap['_id'] ?? '',
      name: njanMap['name'] ?? '',
      email: njanMap['email'] ?? '',
      password: njanMap['password'] ?? '',
      address: njanMap['address'] ?? '',
      type: njanMap['type'] ?? '',
      token: njanMap['token'] ?? '',
      // cart: List<Map<String, dynamic>>.from(njanMap["cart"])
      // List<Map<String, dynamic>>.from(
      //   njanMap['cart'].map(
      //     (x) => Map<String, dynamic>.from(x),
      //   ),
      // ),
      cart: [],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? type,
    String? token,
    List<Map<String, dynamic>>? cart,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      type: type ?? this.type,
      token: token ?? this.token,
      cart: cart ?? this.cart,
    );
  }
}

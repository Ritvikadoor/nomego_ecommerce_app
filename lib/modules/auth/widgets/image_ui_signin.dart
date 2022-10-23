import 'package:flutter/material.dart';

class SignInUiImage extends StatelessWidget {
  const SignInUiImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  "assets/images/d544ba41-973c-4c06-8b9a-d0fb7a8cd894-removebg-preview.png"))),
    );
  }
}

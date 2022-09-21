import 'package:flutter/material.dart';
import 'package:nomego_ecommerce_app/constants/global_variables.dart';
import 'package:nomego_ecommerce_app/modules/features/auth/screens/auth_screens.dart';
import 'package:nomego_ecommerce_app/providers/users_providers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UsersProvider()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              scaffoldBackgroundColor: GlobalVariables.backgroundColor,
              appBarTheme: const AppBarTheme(
                  elevation: 0,
                  iconTheme: IconThemeData(
                      color: GlobalVariables.greyBackgroundCOlor)),
              colorScheme: const ColorScheme.light(
                  primary: GlobalVariables.secondaryColor)),
          home: const AuthScreen()),
    );
  }
}

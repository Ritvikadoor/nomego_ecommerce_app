import 'package:flutter/material.dart';
import 'package:nomego_ecommerce_app/constants/global_variables.dart';
import 'package:nomego_ecommerce_app/home/screens/home_screen.dart';
import 'package:nomego_ecommerce_app/modules/features/auth/screens/auth_screens.dart';
import 'package:nomego_ecommerce_app/providers/users_providers.dart';
import 'package:nomego_ecommerce_app/services/auth_services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UsersProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthServices authServices = AuthServices();

  @override
  void initState() {
    authServices.getUserData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme:
              const ColorScheme.light(primary: GlobalVariables.secondaryColor),
          appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme:
                  IconThemeData(color: GlobalVariables.greyBackgroundCOlor)),
        ),
        home: Provider.of<UsersProvider>(context).user.token.isNotEmpty
            ? const HomeScreen()
            : const AuthScreen());
  }
}

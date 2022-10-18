import 'package:flutter/material.dart';
import 'package:nomego_ecommerce_app/admin/view_model/admin_services.dart';
import 'package:nomego_ecommerce_app/auth/controllers/signin_controller.dart';
import 'package:nomego_ecommerce_app/constants/global_variables.dart';
import 'package:nomego_ecommerce_app/providers/users_providers.dart';
import 'package:nomego_ecommerce_app/routes/routes.dart';
import 'package:nomego_ecommerce_app/services/auth_services.dart';
import 'package:nomego_ecommerce_app/splash_screen/view/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => AdminServices(),
    ),
    ChangeNotifierProvider(
      create: (context) => SignInController(),
    ),
    ChangeNotifierProvider(
      create: (context) => UsersProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nomogo',
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme: const ColorScheme.light(
            primary: Colors.purple,
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          useMaterial3: true, // can remove this line
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const SplashScreen()
        //GetStarted
        //GetStartedTwo
        );
  }
}

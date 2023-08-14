import 'package:rahroo/pages/login_page.dart';
import 'package:rahroo/pages/register_page.dart';
import 'package:rahroo/pages/homePage.dart';
// import 'package:rahroo/services/firebase_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // GetIt.instance.registerSingleton<FirebaseService>(FirebaseService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 219, 102)),
          useMaterial3: true,
        ),
        initialRoute: 'home',
        routes: {
          'register': (context) => RegisterPage(),
          'login': (context) => LoginPage(),
          'home': (context) => HomePage()
        });
  }
}

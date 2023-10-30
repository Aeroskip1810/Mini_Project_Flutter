import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_flutter/firebase/firebase_options.dart';
import 'package:mini_project_flutter/home/main_page.dart';
import 'package:mini_project_flutter/login/login_page.dart';
import 'package:mini_project_flutter/page/detail_page.dart';
import 'package:mini_project_flutter/page/add_shoes.dart';
import 'package:mini_project_flutter/register/register_page.dart';
import 'package:mini_project_flutter/page/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const MainPage(),
        '/add': (context) => const AddShoes(),
        '/detail': (context) => const DetailPage(),
      },
    );
  }
}

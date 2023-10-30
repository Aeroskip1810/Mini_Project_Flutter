import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mini_project_flutter/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamed(context, '/login'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Container(
          width: 285,
          height: 75,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/splashscreen.png'),
            ),
          ),
        ),
      ),
    );
  }
}

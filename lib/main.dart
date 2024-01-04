import 'package:flutter/material.dart';
import 'dart:async';
import './Pages/login_page.dart';
import './Pages/Home_Page.dart';

void main() => runApp(const healthy());

// ignore: camel_case_types
class healthy extends StatelessWidget {
  const healthy({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Healthy',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      //home: Home_Page(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login_Page()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Home_Page();
  }
}

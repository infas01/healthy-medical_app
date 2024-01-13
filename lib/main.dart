import 'package:flutter/material.dart';
import 'dart:async';
import './Pages/login_page.dart';
import './Pages/Home_Page.dart';

void main() => runApp(healthy());

class healthy extends StatelessWidget {
  const healthy({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      title: 'Healthy',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      //home: Home_Page(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login_Page()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Home_Page();
  }
}

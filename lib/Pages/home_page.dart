import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceHeight;
    var deviceWidth;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
<<<<<<< HEAD
      body: Padding(
        padding: EdgeInsets.only(top: deviceHeight * 0.2),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'images/Healthy_Logo_R.png',
                height: deviceHeight * 0.4,
                width: deviceWidth * 0.4,
              ),
              SizedBox(height: deviceHeight * 0.01),
              Text(
                'Welcome to Healthy',
                style: TextStyle(
                  fontSize: deviceHeight * 0.04,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Timed New Roman',
                  color: Colors.lightBlue[900],
=======
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 100, 10, 10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Lottie.asset('images/Main_1.json'),
>>>>>>> bec0b0932bcc32c18feb5f7d5a42075e0155e314
                ),
                SizedBox(height: deviceHeight * 0.02),
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [Colors.lightBlue, Colors.lightBlue[900]!],
                      stops: [0.3, 1.0],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(bounds);
                  },
                  child: Text(
                    'Welcome to Healthy',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arial',
                      fontStyle: FontStyle.italic,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: Duration(seconds: 3),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: child,
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Image.asset(
                      'images/Healthy_Logo_R.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceHeight;
    var deviceWidth;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

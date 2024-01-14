import 'package:lottie/lottie.dart';

import '../Animation/animation.dart';
import '../constant.dart';
import 'package:flutter/material.dart';
import './login_page.dart';

class Signup_Page extends StatefulWidget {
  const Signup_Page({super.key});

  @override
  State<Signup_Page> createState() => _Signup_PageState();
}

class _Signup_PageState extends State<Signup_Page> {
  var options = ['Login', 'Sign Up'];
  var selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    var deviceHeight;
    var deviceWidth;

    deviceWidth = MediaQuery.of(context).size.width;
    deviceHeight = MediaQuery.of(context).size.height;
    var adjustWidth = deviceWidth > 720 ? deviceWidth * 0.035 : 20.0;
    var adjustHeight = deviceHeight > 600 ? deviceHeight * 0.025 : 5.0;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: selectedIndex == 1
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        //color: Colors.redAccent[200],
                        margin: const EdgeInsets.only(
                            right: 2, left: 2, top: 1, bottom: 1),
                        child: Stack(
                          children: [
                            Container(
                              //color: Colors.blue,
                              width: deviceWidth,
                              child: Transform.rotate(
                                angle: 180 * (3.141592653589793 / 180),
                                child: Lottie.asset(
                                  'images/Animation_1.json',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      //color: Colors.amber,
                                      height: (70.0 + adjustWidth),
                                      width: deviceWidth * 0.65,
                                      child: TopAnime(
                                        2,
                                        30,
                                        child: ListView.builder(
                                          itemCount: options.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectedIndex = index;
                                                });
                                              },
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            25.0,
                                                            0.0,
                                                            20.0,
                                                            0.0),
                                                    child: Text(
                                                      options[index],
                                                      style: TextStyle(
                                                        color: selectedIndex ==
                                                                index
                                                            ? Colors.black
                                                            : Colors.grey,
                                                        fontSize: adjustWidth,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 2.5,
                                                  ),
                                                  selectedIndex == index
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .fromLTRB(
                                                                  0, 2, 0, 0),
                                                          child: Container(
                                                            height: 3,
                                                            width: (10.0 +
                                                                adjustWidth),
                                                            color: Colors.black,
                                                          ),
                                                        )
                                                      : Container(),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                            //color: Colors.red,
                                            )),
                                    RightAnime(
                                      1,
                                      (adjustWidth),
                                      child: Container(
                                        margin: EdgeInsets.only(top: 5),
                                        width: 70,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.green[50],
                                        ),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'images/Healthy_Logo_R.png',
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10.0 + adjustHeight,
                                ),
                                Container(
                                  //color: Colors.yellow,
                                  padding: EdgeInsets.only(left: 25),
                                  width: deviceWidth,
                                  child: TopAnime(
                                    1,
                                    5,
                                    curve: Curves.fastOutSlowIn,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Hello!",
                                            style: TextStyle(
                                              fontSize: 15.0 + adjustWidth,
                                              fontWeight: FontWeight.w500,
                                            )),
                                        SizedBox(
                                          height: adjustHeight,
                                        ),
                                        Text(
                                          'Enter your details to create an account',
                                          style: TextStyle(
                                            fontSize: adjustWidth - 5.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0 + adjustHeight,
                                ),
                                Container(
                                  //padding: EdgeInsets.fromLTRB(2, 0, 25, 0),
                                  //color: Colors.blue,
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 25, right: 25),
                                        //color: Colors.red[200],
                                        width: deviceWidth,
                                        height: 400.0 + adjustHeight,
                                        child: TopAnime(
                                          1,
                                          5,
                                          curve: Curves.easeInExpo,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextField(
                                                  cursorColor: Colors.black,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  showCursor: true,
                                                  decoration:
                                                      textFiledInputDecoration
                                                          .copyWith(
                                                              labelText:
                                                                  "Username")),

                                              SizedBox(
                                                height: 10.0 + adjustHeight,
                                              ),
                                              TextField(
                                                cursorColor: Colors.black,
                                                style: TextStyle(
                                                    color: Colors.black),
                                                showCursor: true,
                                                decoration:
                                                    textFiledInputDecoration,
                                              ),
                                              SizedBox(
                                                height: 10.0 + adjustHeight,
                                              ),
                                              TextField(
                                                  cursorColor: Colors.black,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  showCursor: true,
                                                  decoration:
                                                      textFiledInputDecoration
                                                          .copyWith(
                                                              labelText:
                                                                  "Password")),
                                              SizedBox(
                                                height: 15.0 + adjustHeight,
                                              ),
                                              // TopAnime(
                                              //   1,
                                              //   5,
                                              //   child: Row(
                                              //     children: [
                                              //       // IconButton(
                                              //       //   // icon: FaIcon(
                                              //       //   //   FontAwesomeIcons.facebookF,
                                              //       //   //   size: 30,
                                              //       //   // ),
                                              //       //   onPressed: () {},
                                              //       // ),
                                              //       SizedBox(
                                              //         width: 15,
                                              //       ),
                                              //       // IconButton(
                                              //       //   // icon: FaIcon(
                                              //       //   //     FontAwesomeIcons
                                              //       //   //         .googlePlusG,
                                              //       //   //     size: 35),
                                              //       //   onPressed: () {},
                                              //       // ),
                                              //     ],
                                              //   ),
                                              // )

                                              Container(
                                                //color: Colors.grey[300],
                                                alignment: Alignment.center,
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              Login_Page(),
                                                        ));
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .lightBlue[900],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    width: deviceWidth * 0.60,
                                                    height: 50,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Create an Account',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20.0),
                                                        ),
                                                        // Padding(
                                                        //     padding:
                                                        //         EdgeInsets.only(
                                                        //             right: 10)),
                                                        // Icon(
                                                        //   Icons.arrow_forward,
                                                        //   size: 20.0,
                                                        //   color: Colors.white,
                                                        // ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Login_Page(),
        ),
      ),
    );
  }
}

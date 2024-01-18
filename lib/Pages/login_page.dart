import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:healthy/widgets/navbar_roots.dart';
import 'package:lottie/lottie.dart';
import '../Animation/animation.dart';
import '../constant.dart';
import 'package:flutter/material.dart';
import './signup_page.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  var options = ['Login', 'Sign Up'];
  var selectedIndex = 0;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

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
            body: selectedIndex == 0
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          //color: Colors.redAccent[200],
                          margin: const EdgeInsets.only(
                              right: 2, left: 2, top: 1, bottom: 1),
                          child: Column(
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
                                        itemBuilder:
                                            (BuildContext context, int index) {
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
                                                      const EdgeInsets.fromLTRB(
                                                          25.0, 0.0, 20.0, 0.0),
                                                  child: Text(
                                                    options[index],
                                                    style: TextStyle(
                                                      color:
                                                          selectedIndex == index
                                                              ? Colors.black
                                                              : Colors.grey,
                                                      fontSize: adjustWidth,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
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
                                      margin: const EdgeInsets.only(top: 5),
                                      width: 70,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
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
                              Center(
                                child: Container(
                                    //color: Colors.blue,
                                    height: 250,
                                    child: Lottie.asset('images/Login.json')),
                              ),
                              Container(
                                //color: Colors.yellow,
                                padding: const EdgeInsets.only(left: 25),
                                width: deviceWidth,
                                child: TopAnime(
                                  1,
                                  5,
                                  curve: Curves.fastOutSlowIn,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Welcome Back,",
                                          style: TextStyle(
                                            fontSize: 15.0 + adjustWidth,
                                            fontWeight: FontWeight.w500,
                                          )),
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
                                      padding: const EdgeInsets.only(
                                          left: 25, right: 25),
                                      //color: Colors.red[200],
                                      width: deviceWidth,
                                      height: 300.0 + adjustHeight,
                                      child: TopAnime(
                                        1,
                                        5,
                                        curve: Curves.easeInExpo,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextField(
                                                controller: _emailController,
                                                cursorColor: Colors.black,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                                showCursor: true,
                                                decoration:
                                                    textFiledInputDecoration),

                                            SizedBox(
                                              height: 10.0 + adjustHeight,
                                            ),
                                            TextField(
                                                controller: _passwordController,
                                                cursorColor: Colors.black,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                                showCursor: true,
                                                decoration:
                                                    textFiledInputDecoration
                                                        .copyWith(
                                                            labelText:
                                                                "Password")),

                                            SizedBox(
                                              height: 25.0 + adjustHeight,
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
                                              child: GestureDetector(
                                                onTap: () {
                                                  _postData();
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 0, 0, 0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  width: deviceWidth * 0.35,
                                                  height: 40,
                                                  child: const Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Login',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 25.0),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            selectedIndex == 0
                                                ? TopAnime(
                                                    2,
                                                    3,
                                                    curve: Curves.fastOutSlowIn,
                                                    child: Container(
                                                      //color: Colors.red,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 0,
                                                              left: 5,
                                                              bottom: 10),
                                                      height:
                                                          deviceHeight * 0.05,
                                                      child: Text(
                                                        "Forgot Password?",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey[800],
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ),
                                                  )
                                                : const Signup_Page()
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : const Signup_Page()),
      ),
    );
  }

  Future<void> _postData() async {
    final String password = _passwordController.text;
    final String email = _emailController.text;

    final dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Authorization'] =
        'Basic ${base64Encode(utf8.encode('asam:8385'))}';

    final response = await dio.post(
      'http://10.0.2.2:8080/login', // Replace with your actual port if it's different
      data: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      var jdata = json.decode(response.data);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      prefs.setString('id', jdata["id"]);
      prefs.setString('name', jdata["name"]);
      prefs.setString('email', jdata["email"]);
      prefs.setString('image', jdata["image"]);
      prefs.setInt('age', jdata["age"]);

      print(response.data);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Successful'),
            content: const Text('You have successfully Login!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                  // Navigate to login page or perform any other action
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => NavBarRoots()),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('login failed'),
            content: const Text('Your Email or Password is wrong'),
            actions: [
              TextButton(
                onPressed: () {
                  // Navigate to login page or perform any other action
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login_Page()),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );

      print('Error: ${response.data}');
    }
  }
}

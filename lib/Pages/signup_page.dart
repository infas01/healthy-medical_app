import 'dart:convert';
import 'dart:io';
import 'package:lottie/lottie.dart';
import '../Animation/animation.dart';
import '../constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import './login_page.dart';
import 'package:image_picker/image_picker.dart';

class Signup_Page extends StatefulWidget {
  const Signup_Page({super.key});

  @override
  State<Signup_Page> createState() => _Signup_PageState();
}

class _Signup_PageState extends State<Signup_Page> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  TextEditingController titleController = TextEditingController();
  String imagePath = '';

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        imagePath = pickedImage.path;
      });
    }
  }

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
                                                        const EdgeInsets.fromLTRB(
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
                                        Center(
                                          child: GestureDetector(
                                            onTap: pickImage,
                                            child: CircleAvatar(
                                              radius: 70,
                                              backgroundColor: Colors.black,
                                              backgroundImage: imagePath
                                                      .isNotEmpty
                                                  ? FileImage(File(imagePath))
                                                  : null,
                                              child: imagePath.isNotEmpty
                                                  ? null
                                                  : const Icon(
                                                      Icons.camera_alt,
                                                      size: 40,
                                                      color: Colors.white,
                                                    ),
                                            ),
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
                                        padding: const EdgeInsets.only(
                                            left: 25, right: 25),
                                        //color: Colors.red[200],
                                        width: deviceWidth,
                                        height: 500.0 + adjustHeight,
                                        child: TopAnime(
                                          1,
                                          5,
                                          curve: Curves.easeInExpo,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextField(
                                                  controller: _nameController,
                                                  cursorColor: Colors.black,
                                                  style: const TextStyle(
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
                                                controller: _emailController,
                                                cursorColor: Colors.black,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                                showCursor: true,
                                                decoration:
                                                    textFiledInputDecoration,
                                              ),
                                              SizedBox(
                                                height: 10.0 + adjustHeight,
                                              ),
                                              TextField(
                                                  controller:
                                                      _passwordController,
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
                                                height: 15.0 + adjustHeight,
                                              ),
                                              TextField(
                                                  controller: _ageController,
                                                  cursorColor: Colors.black,
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                  showCursor: true,
                                                  decoration:
                                                      textFiledInputDecoration
                                                          .copyWith(
                                                              labelText:
                                                                  "Age")),
                                              SizedBox(
                                                height: 15.0 + adjustHeight,
                                              ),
                                              Container(
                                                // color: Colors.grey[300],
                                                alignment: Alignment.center,
                                                margin: const EdgeInsets.only(
                                                    top: 10),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    if (imagePath.isNotEmpty) {
                                                      _postData();
                                                    } else {
                                                      // Handle the case when imagePath is empty
                                                      // You may want to show a message or take some other action
                                                    }
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: const Color.fromARGB(
                                                            255, 0, 0, 0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    width: deviceWidth * 0.60,
                                                    height: 50,
                                                    child: const Row(
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
              : const Login_Page(),
        ),
      ),
    );
  }

  Future<void> _postData() async {
    final String name = _nameController.text;
    final String password = _passwordController.text;
    final int age = int.tryParse(_ageController.text) ?? 0;
    final String email = _emailController.text;

    final dio = Dio();
    dio.options.headers['Authorization'] =
        'Basic ${base64Encode(utf8.encode('asam:8385'))}';
    print(base64Encode(File(imagePath).readAsBytesSync()));
    var image = base64Encode(File(imagePath).readAsBytesSync());

    final response = await dio.post(
      'http://10.0.2.2:8080/', // Replace with your actual port if it's different
      data: {
        'name': name,
        'email': email,
        'password': password,
        'age': age,
        'image': image,
      },
    );

    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Registration Successful'),
            content: const Text('You have successfully registered!'),
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
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Registration Successful'),
            content: const Text('You have successfully registered!'),
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

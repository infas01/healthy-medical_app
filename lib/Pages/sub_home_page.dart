import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:healthy/Pages/booking_page.dart';
import 'package:healthy/Pages/login_page.dart';
import 'package:healthy/Pages/settings_screen.dart';
import 'package:healthy/askQuestion/ask.dart';
import 'package:healthy/clinicchat/clinic_chat.dart';
import 'package:healthy/widgets/upcoming_schedule.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './apointment_screen.dart';
import '../MedReminder/medreminder.dart';
import 'package:lottie/lottie.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SubHomePage extends StatefulWidget {
  const SubHomePage({super.key});

  @override
  State<SubHomePage> createState() => _SubHomePageState();
}

class _SubHomePageState extends State<SubHomePage> {
  late SharedPreferences prefs;
  String? id;
  String? name;
  String? email;
  String? password;

  String? base64String;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
      id = prefs.getString('id');
      name = prefs.getString('name');
      email = prefs.getString('email');
      password = prefs.getString('password');
      base64String = prefs.getString("image");
    });
  }

  @override
  Widget build(BuildContext context) {
    var _deviceHeight, _deviceWidth;
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    final drawerHeader = Container(
      //color: Colors.yellow,
      child: UserAccountsDrawerHeader(
        accountName: Text('$name'),
        accountEmail: Text('$email'),
        currentAccountPicture: base64String != null
            ? CircleAvatar(
                backgroundImage: MemoryImage(base64Decode(base64String!)),
              )
            : const CircleAvatar(
                // Provide a default image or leave it empty as per your requirement
                // For example, you can use AssetImage to load an image from your assets
                backgroundImage: AssetImage('images/doctor1.jpg'),
              ),
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
      ),
    );
    final drawerItems = ListView(
      children: [
        drawerHeader,
        ListTile(
          title: const Text('Settings'),
          leading: const Icon(Icons.settings),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditProfilePage()));
          },
        ),
        ListTile(
          title: const Text('About us'),
          leading: const Icon(Icons.details),
          onTap: () {
            Navigator.pop(context);
          },
        ),

        // Logout button
        ListTile(
          title: const Text('Logout'),
          leading: const Icon(Icons.exit_to_app),
          onTap: () {
            _showLogoutConfirmationDialog(context);
          },
        ),
      ],
    );

    final healthImageUrls = [
      'https://picsum.photos/id/429/4128/2322',
      'https://picsum.photos/id/493/3872/2592',
      'https://picsum.photos/id/755/5000/3800',
    ];

    final imageList = ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: healthImageUrls.length,
      itemBuilder: (context, index) {
        return SizedBox(
          child: CachedNetworkImage(
            imageUrl: healthImageUrls[index],
            width: _deviceWidth,
            fit: BoxFit.cover,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Hello $name',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 220,
              child: imageList,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              //color: Colors.blue[200],
              height: 500,
              child: Stack(
                children: [
                  Container(
                    //color: Colors.blue,
                    width: _deviceWidth,
                    child: Lottie.asset(
                      'images/Animation_2.json',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    //color: Colors.blue,
                    width: _deviceWidth,
                    child: Transform.rotate(
                      angle: 45 * (3.141592653589793 / 180),
                      child: Lottie.asset(
                        'images/Animation_4.json',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 150.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Ask(),
                                  ),
                                );
                              },
                              child: Container(
                                width: _deviceWidth * 0.4,
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.history,
                                      size: 35,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      "Chat With AI",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Medreminder(),
                                  ),
                                );
                              },
                              child: Container(
                                width: _deviceWidth * 0.4,
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.medication_liquid,
                                      size: 35,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      "Medications",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 150.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const UpcomingSchedule(),
                                  ),
                                );
                              },
                              child: Container(
                                width: _deviceWidth * 0.4,
                                margin: const EdgeInsets.all(10),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.medical_information_outlined,
                                      size: 35,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      "Medical Reports",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AppointmentScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                width: _deviceWidth * 0.4,
                                margin: const EdgeInsets.all(10),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.local_hospital,
                                      size: 35,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      "Booking",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 150.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Clinicask(),
                                  ),
                                );
                              },
                              child: Container(
                                width: _deviceWidth * 0.4,
                                margin: const EdgeInsets.all(10),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.chat_rounded,
                                      size: 35,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      "Chat With Clinic",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const BookingPage(),
                                  ),
                                );
                              },
                              child: Container(
                                width: _deviceWidth * 0.4,
                                margin: const EdgeInsets.all(10),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.food_bank_outlined,
                                      size: 35,
                                      color: Colors.blue,
                                    ),
                                    Text(
                                      "Diet plan",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: drawerItems,
        ),
        width: 250.0,
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _logoutAndNavigateToLogin(context);
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  void _logoutAndNavigateToLogin(BuildContext context) async {
    // Add your logout logic here, for example, clearing preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

    // Navigate to the login page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login_Page()),
    );
  }
}

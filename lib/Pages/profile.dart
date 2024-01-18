import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthy/Pages/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late SharedPreferences prefs;

  String id = '';
  String name = '';
  String email = '';
  String age = '';
  String? image;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      // Load profile data from SharedPreferences
      id = prefs.getString('id') ?? '';
      name = prefs.getString('name') ?? '';
      email = prefs.getString('email') ?? '';
      image = prefs.getString('image') ?? '';
      age = prefs.getInt('age').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            image != null
                ? CircleAvatar(
                    backgroundImage: MemoryImage(base64Decode(image!)),
                    radius: 70,
                  )
                : const CircleAvatar(
                    // Provide a default image or leave it empty as per your requirement
                    // For example, you can use AssetImage to load an image from your assets
                    backgroundImage: AssetImage('images/doctor1.jpg'),
                  ), // Remove the extra comma here
            const SizedBox(height: 20),
            _buildProfileItem('Name', name, CupertinoIcons.person),
            const SizedBox(height: 10),
            _buildProfileItem('Email', email, CupertinoIcons.mail),
            const SizedBox(height: 10),
            _buildProfileItem('Age', age, CupertinoIcons.mail),
            const SizedBox(height: 20),
            _buildEditProfileButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return CircleAvatar(
      backgroundImage: MemoryImage(base64Decode(image!)),
    );
  }

  Widget _buildProfileItem(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.deepOrange.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10,
          )
        ],
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }

  Widget _buildEditProfileButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditProfilePage()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: const EdgeInsets.all(15),
        ),
        child: const Text('Edit Profile'),
      ),
    );
  }
}

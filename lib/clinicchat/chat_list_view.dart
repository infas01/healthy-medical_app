import 'package:flutter/material.dart';
import './widgets/chat_tile.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Clinic Centers",
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 2,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80,
        elevation: 0,
      ),
      body: const Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ChatTile(
                      name: "Clinic 1",
                      msg: "Okay",
                      time: "4:00PM",
                      img: "assets/image/Clinic.jpg"),
                  ChatTile(
                      name: "Clinic 2",
                      msg: "Thank You",
                      time: "2:00PM",
                      img: "assets/image/Clinic.jpg"),
                  ChatTile(
                      name: "Clinic 3",
                      msg: "What are your symptoms?",
                      time: "3:00PM",
                      img: "assets/image/Clinic.jpg"),
                  ChatTile(
                      name: "Clinic 4",
                      msg: "Okay",
                      time: "6:00PM",
                      img: "assets/image/Clinic.jpg"),
                  ChatTile(
                      name: "Clinic 5",
                      msg: "~ Sent A Photo",
                      time: "9:00PM",
                      img: "assets/image/Clinic.jpg"),
                  ChatTile(
                      name: "Clinic 6",
                      msg: "Okay",
                      time: "4:00PM",
                      img: "assets/image/Clinic.jpg"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
// import 'package:healthcare/widgets/chat_sample.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: const Color(0xFF7165D6),
          leadingWidth: 30,
          title: const Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(
                  "images/doctor1.jpg",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Dr. Doctor Name",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.call,
                color: Colors.white,
                size: 26,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.video_call,
                color: Colors.white,
                size: 30,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding:
            const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 80),
        children: const [
          // ChatSample(),
          // ChatSample(),
          // ChatSample(),
          // ChatSample(),
          // ChatSample(),
          // ChatSample(),
          // ChatSample(),
        ],
      ),
      bottomSheet: Container(
        height: 65,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ]),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(
                Icons.add,
                size: 30,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Icon(
                Icons.emoji_emotions_outlined,
                size: 30,
                color: Colors.amber,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                alignment: Alignment.centerRight,
                width: 270,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Type omething",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.send,
                size: 30,
                color: Color(0xFF7165D6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

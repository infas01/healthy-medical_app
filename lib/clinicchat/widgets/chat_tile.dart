import 'package:flutter/material.dart';
import '../secondscreen.dart';

class ChatTile extends StatelessWidget {
  final String name;
  final String msg;
  final String time;
  final String img;
<<<<<<< HEAD
  
=======

>>>>>>> bec0b0932bcc32c18feb5f7d5a42075e0155e314
  const ChatTile({
    Key? key,
    required this.name,
    required this.msg,
    required this.time,
    required this.img,
<<<<<<< HEAD
 
=======
>>>>>>> bec0b0932bcc32c18feb5f7d5a42075e0155e314
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 2),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 5,
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
<<<<<<< HEAD
            MaterialPageRoute(builder: (context) =>  SimpleChatApp()),
=======
            MaterialPageRoute(builder: (context) => SimpleChatApp()),
>>>>>>> bec0b0932bcc32c18feb5f7d5a42075e0155e314
          );
        },
        tileColor: Colors.white,
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(img), // Fixed typo
          radius: 25,
        ),
        title: Text(name),
        subtitle: Text(msg),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
<<<<<<< HEAD
             
=======
>>>>>>> bec0b0932bcc32c18feb5f7d5a42075e0155e314
            Text(
              time,
              style: const TextStyle(fontSize: 12),
            ),
            const Icon(
              Icons.circle_notifications_rounded,
<<<<<<< HEAD
              color:Color.fromARGB(255, 17, 110, 187),
              size: 20,
            ),

            const SizedBox(width: 10), // Add some spacing
           
=======
              color: Color.fromARGB(255, 17, 110, 187),
              size: 20,
            ),
            const SizedBox(width: 10),
>>>>>>> bec0b0932bcc32c18feb5f7d5a42075e0155e314
          ],
        ),
      ),
    );
  }
}

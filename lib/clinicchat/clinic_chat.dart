import 'package:flutter/material.dart';
import './chat_list_view.dart';


class Clinicask extends StatelessWidget {
  const Clinicask({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:ChatListView(
      
      ));
}
}
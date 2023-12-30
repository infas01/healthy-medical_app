import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthy/Pages/booking_page.dart';
import 'package:healthy/Pages/letstalk_screen.dart';
import 'package:healthy/Pages/sub_home_page.dart';
import '../Pages/schedule_screen.dart';

// ignore: use_key_in_widget_constructors
class NavBarRoots extends StatefulWidget {
  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
  int _selectedIndex = 0;
  final _screens = [
    SubHomePage(),
    ChatScreen(),
    //LetsTalkScreen(),
    ScheduleScreen(),
    BookingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      // ignore: sized_box_for_whitespace
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF7165D6),
          unselectedItemColor: Colors.black26,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Home"),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat_rounded,
                ),
                label: "Let's Talk"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined), label: "Schedule"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.book_online), label: "Booking"),
          ],
        ),
      ),
    );
  }
}

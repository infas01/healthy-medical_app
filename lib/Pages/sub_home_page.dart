import 'package:flutter/material.dart';
import 'package:healthy/Pages/booking_page.dart';
import 'history_page.dart';

class SubHomePage extends StatelessWidget {
  const SubHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    var _deviceHeight, _deviceWidth;
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    final drawerHeader = Container(
      //color: Colors.yellow,
      child: UserAccountsDrawerHeader(
        accountName: Text('Infas'),
        accountEmail: Text('infas1002@gmail.com'),
        currentAccountPicture: const CircleAvatar(
          child: FlutterLogo(
            size: 40.0,
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.lightBlue[900],
        ),
      ),
    );
    final drawerItems = ListView(
      children: [
        drawerHeader,
        Container(
          color: Colors.green,
          child: const Padding(
            padding: EdgeInsets.fromLTRB(15, 8, 10, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Full Name:'),
                      Text('Nizam Mohamed Infas'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Blood Group:'),
                      Text('B+'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          title: Text('Settings'),
          leading: const Icon(Icons.settings),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('About us'),
          leading: const Icon(Icons.details),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );

    final healthImageUrls = [
      'https://via.placeholder.com/120x120.png?text=Image+1',
      'https://via.placeholder.com/120x120.png?text=Image+2',
      'https://via.placeholder.com/120x120.png?text=Image+3',
    ];
    List imgs = [
      "doctor1.jpg",
      "doctor2.jpg",
      "doctor3.jpg",
      "doctor4.jpg",
    ];

    final imageList = ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: healthImageUrls.length,
      itemBuilder: (context, index) {
        return SizedBox(
          child: Image.network(
            healthImageUrls[index],
            width: _deviceWidth,
            fit: BoxFit.cover,
          ),
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        title: Text(
          'Hello Infas',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 220,
              child: imageList,
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              color: Colors.blue[200],
              child: Column(
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
                                builder: (context) => HistoryPage(),
                              ),
                            );
                          },
                          child: Container(
                            width: _deviceWidth * 0.4,
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.symmetric(vertical: 5),
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookingPage(),
                              ),
                            );
                          },
                          child: Container(
                            width: _deviceWidth * 0.4,
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.symmetric(vertical: 15),
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 150.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookingPage(),
                              ),
                            );
                          },
                          child: Container(
                            width: 140,
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookingPage(),
                              ),
                            );
                          },
                          child: Container(
                            width: 140,
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
}

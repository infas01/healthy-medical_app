import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'history_page.dart';
import './apointment_screen.dart';
import '../MedReminder/medreminder.dart';


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
   late Future<void> _preferencesFuture;

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
    });

    // Do something with the retrieved values if needed
    print('Stored values: id=$id, name=$name, email=$email, password=$password');
  }


  
  @override
  Widget build(BuildContext context) {
    var _deviceHeight, _deviceWidth;
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    final drawerHeader = Container(
      child: UserAccountsDrawerHeader(
        accountName:  Text('$name'),
        accountEmail: Text('$email'),
        currentAccountPicture: const CircleAvatar(
          child: FlutterLogo(
            size: 40.0,
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.teal[700],
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
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('About us'),
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
        backgroundColor: Colors.teal[700],
        title:  Text('Hello $name'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _deviceHeight * 0.25,
              child: imageList,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              //color: Colors.blue[200],
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
                                builder: (context) => const HistoryPage(),
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
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.history,
                                  size: 35,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "History",
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
                                builder: (context) =>const Medreminder(),
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
                            child: const Column(
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
                  const SizedBox(
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
                                builder: (context) => AppointmentScreen(),
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
                            child: const Column(
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
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.local_hospital,
                                  size: 35,
                                  color: Colors.blue,
                                ),
                                Text(
                                  "Something",
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
        child: drawerItems,
        width: 250.0,
      ),
    );
  }
}











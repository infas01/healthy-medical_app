import 'package:flutter/material.dart';
import 'package:healthy/medicalreport/addrep.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UpcomingSchedule extends StatefulWidget {
  const UpcomingSchedule({Key? key}) : super(key: key);

  @override
  State<UpcomingSchedule> createState() => _UpcomingScheduleState();
}

class _UpcomingScheduleState extends State<UpcomingSchedule> {
  List<MedicalReport> medicalReports = [];

  @override
  void initState() {
    super.initState();
    fetchMedicalReports();
  }

  Future<void> fetchMedicalReports() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/mr/all'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        medicalReports =
            data.map((json) => MedicalReport.fromJson(json)).toList();
      });
    } else {
      // Handle error
      print('Failed to load medical reports');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Medical Reports'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DataEntryForm()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: medicalReports.length,
        itemBuilder: (context, index) {
          final report = medicalReports[index];
          return ListTile(
            title: Text(report.title),
            subtitle: Text('Patient ID: ${report.userId}'),
            // Display the image here, you might need to decode the base64Image
            // For simplicity, we are just displaying the base64Image string
            leading: Image.memory(
              base64.decode(report.base64Image),
              width: 50,
              height: 50,
            ),
            // Add more details as needed
          );
        },
      ),
    );
  }
}

class MedicalReport {
  final String title;
  final String userId;
  final String base64Image;

  MedicalReport(
      {required this.title, required this.userId, required this.base64Image});

  factory MedicalReport.fromJson(Map<String, dynamic> json) {
    return MedicalReport(
      title: json['title'],
      userId: json['userId'],
      base64Image: json['base64Img'],
    );
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:healthy/widgets/upcoming_schedule.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataEntryForm extends StatefulWidget {
  const DataEntryForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DataEntryFormState createState() => _DataEntryFormState();
}

class _DataEntryFormState extends State<DataEntryForm> {
  TextEditingController titleController = TextEditingController();
  String imagePath = '';
  bool _uploading = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        imagePath = pickedImage.path;
      });
    }
  }

  Future<void> sendDataToBackend() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    const String apiUrl =
        'http://10.0.2.2:8080/mr/medrepadd'; // Replace with your backend API endpoint

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': titleController.text,
        'userId': prefs.getString('id'),
        'base64Img': base64Encode(File(imagePath).readAsBytesSync()),
      }),
    );

    if (response.statusCode == 200) {
      // Show success message using SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data successfully sent to the backend.'),
        ),
      );

      // Clear the form after success if needed
      titleController.clear();
      setState(() {
        imagePath = '';
      });
    } else {
      // Handle error, e.g., show an error message
      // ignore: avoid_print
      print(
          'Failed to send data to the backend. Error: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Add your Medical Report'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    labelText: 'Title', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: pickImage,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    width: 140.0,
                    height: 300.0,
                    color: Colors.grey[200],
                    child: imagePath.isNotEmpty
                        ? Image.file(
                            File(imagePath),
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : const Icon(
                            Icons.camera_alt,
                            size: 40,
                            color: Colors.grey,
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    _uploading = true;
                  });

                  await sendDataToBackend();

                  setState(() {
                    _uploading = false;
                  });

                  // Navigate to the success screen after upload
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UpcomingSchedule()),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: _uploading
                        ? Colors.grey
                        : const Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 100,
                  height: 40,
                  child: _uploading
                      ? const Center(child: CircularProgressIndicator())
                      : const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Upload',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

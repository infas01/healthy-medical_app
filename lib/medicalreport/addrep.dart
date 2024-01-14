import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class DataEntryForm extends StatefulWidget {
  const DataEntryForm({super.key});

  @override
  _DataEntryFormState createState() => _DataEntryFormState();
}

class _DataEntryFormState extends State<DataEntryForm> {
  TextEditingController titleController = TextEditingController();
  String imagePath = '';

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
    final String apiUrl = 'http://your-backend-api-endpoint'; // Replace with your backend API endpoint

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': titleController.text,
        'image': base64Encode(File(imagePath).readAsBytesSync()),
      }),
    );

    if (response.statusCode == 200) {
      // Handle success, e.g., show a success message
      print('Data successfully sent to the backend.');
    } else {
      // Handle error, e.g., show an error message
      print('Failed to send data to the backend. Error: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Entry Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: pickImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 16.0),
            imagePath.isNotEmpty
                ? Image.file(
                    File(imagePath),
                    height: 100,
                  )
                : Container(),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: (imagePath.isNotEmpty) ? sendDataToBackend : null,
              child: Text('Save Data'),
            ),
          ],
        ),
      ),
    );
  }
}


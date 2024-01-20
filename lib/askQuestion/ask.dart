import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:healthy/widgets/navbar_roots.dart';

class Ask extends StatelessWidget {
  const Ask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          // systemOverlayStyle: const SystemUiOverlayStyle(
          //     statusBarColor: Color.fromARGB(255, 190, 28, 28)),
          backgroundColor: Colors.black,
          title: const Text(
            'Tell Us To Help You',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NavBarRoots()),
              );
            },
          ),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final TextEditingController _textFieldController = TextEditingController();
  final TextEditingController _responseController = TextEditingController();
  bool isLoading = false;

  String enteredText = '';

  Future<void> sendDataToServer() async {
    try {
      final dio = Dio();

      final response = await dio.post(
        'http://10.0.2.2:8000/ask', // Change to your Django server endpoint
        data: {'inputText': enteredText},
        options: Options(
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        ),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = json.decode(response.toString());
        dynamic responseTextValue = responseBody["responseText"];

        // ignore: avoid_print
        print(responseTextValue.toString());
        setState(() {
          _responseController.text = responseTextValue.toString();
        });
      } else {
        // ignore: avoid_print
        print('Error: ${response.statusMessage}');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error sending data to server: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        Expanded(
          child: _buildConversation(),
        ),
        _buildInputArea(),
      ],
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        'Ask your doubts about your symptoms',
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }

  Widget _buildConversation() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          _buildText(enteredText),
          _buildText(_responseController.text),
        ],
      ),
    );
  }

  Widget _buildText(String text) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20.0),
      ),
    );
  }

  Widget _buildInputArea() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your question',
              ),
            ),
          ),
          IconButton(
            icon: isLoading
                ? const CircularProgressIndicator()
                : const Icon(Icons.send),
            onPressed: () async {
              setState(() {
                enteredText = _textFieldController.text;
                isLoading = true; // Set loading to true when sending data
              });
              await sendDataToServer();
              setState(() {
                isLoading = false; // Set loading to false when data is received
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    _responseController.dispose();
    super.dispose();
  }
}

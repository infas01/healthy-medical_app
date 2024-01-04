import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black87,
        title: const Text(
          'Let\'s Talk',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.white,
            onPressed: () {
              // write the search function
            },
          ),
        ],
      ),
      body: Container(
        //color: Colors.lightGreen,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) => _messages[index],
              ),
            ),
            Divider(
              height: 2.0,
              color: Colors.grey[500],
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: _buildTextComposer(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextComposer() {
    var deviceHeight;

    deviceHeight = MediaQuery.of(context).size.height;
    return IconTheme(
      data: IconThemeData(
        color: Theme.of(context).focusColor,
      ),
      child: Container(
        height: deviceHeight * 0.08,
        //color: Colors.yellow,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _textController,
                    // We want to update the state when text changes
                    onChanged: (text) {
                      setState(() {});
                    },
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Send a message',
                    ),
                    style: const TextStyle(fontSize: 15.0),
                    maxLines: null,
                  ),
                ),
              ),
            ),
            Material(
              child: InkWell(
                onTap: _textController.text.isNotEmpty
                    ? () => _handleSubmitted(_textController.text)
                    : null,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: _textController.text.isNotEmpty
                        ? Colors.green[700]
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;

  ChatMessage({required this.text});

  @override
  Widget build(BuildContext context) {
    var deviceWidth;

    deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          //color: Colors.lightBlue,
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                //color: Colors.amber,
                width: deviceWidth * 0.10,
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: const CircleAvatar(
                  backgroundColor: Colors.amber,
                  //Here we want to set the set the profile picture.
                  child: Text('Inf'),
                ),
              ),
              Container(
                width: deviceWidth * 0.75,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Expanded(
                  child: Container(
                    //color: Colors.lightGreen,
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //Here we want to set the username
                        const Text(
                          'Infas',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0, right: 15.0),
                          child: Text(
                            text,
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          //color: Colors.lightBlue,
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                //color: Colors.amber,
                width: deviceWidth * 0.10,
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  //Here we want to set the set the profile picture.
                  child: Text('Tal'),
                ),
              ),
              Container(
                width: deviceWidth * 0.75,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Expanded(
                  child: Container(
                    //color: Colors.lightGreen,
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //Here we want to set the username
                        const Text(
                          'Talky',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0, right: 15.0),
                          child: const Text(
                            //Here we want to connect the chatgpt
                            'Wait for the response',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

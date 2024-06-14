import 'package:flutter/material.dart';

class ChatPage_meal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 228, 225),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 241, 220, 127),
        title: Text('Meal Requests',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w800,
            )),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                // Replace the following with your actual chat messages
                _buildChatMessage(
                    isMe: false,
                    text:
                        'Devrikh: \nRequested: 2 Maggie  \nDiscription: kal exam hai , dinner miss kiya tha jaldi batao'),
                _buildChatMessage(
                    isMe: true,
                    text:
                        'Isha:\nRequest Fulfilled\nDiscription: pure sem parta nahi\n hai fir dinner miss karta hai'),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildChatMessage({required bool isMe, required String text}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isMe
              ? const Color.fromARGB(255, 148, 211, 241)
              : Color.fromARGB(255, 234, 171, 243),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(width: 8.0),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Implement sending message logic here
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Session'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                // Replace the following with your actual chat messages
                _buildChatMessage(isMe: false, text: "Anonymous: \nConfession: 🙈 I have a secret talent for talking to plants and convincing them to grow faster. 🌱 Shh, don't tell anyone, but my superpower is turning them into green superheroes! 🌿 #PlantWhisperer #GreenThumb"),
                _buildChatMessage(isMe: true, text: "Anonymous: \nConfession: 💔 There's a chapter in my life that I revisit late at night, filled with echoes of laughter and the bittersweet symphony of a love that once bloomed. We danced through the pages of a story that left its imprint on my heart. Even though the music has faded, the melody lingers, a reminder of a love that shaped the person I am today. 📖❤️ #LostLove #ChaptersOfTheHeart"),
            
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
          color: isMe ? Color.fromARGB(255, 141, 118, 201) : Color.fromARGB(255, 226, 219, 241),
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

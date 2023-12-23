// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_app/main_page/NavBar.dart';
import 'package:my_app/util/chatpage.dart';
import 'package:my_app/util/emotion_face.dart';

class emotionpage extends StatefulWidget {
  const emotionpage({Key? key}) : super(key: key);

  @override
  _emotionpageState createState() => _emotionpageState();
}

class _emotionpageState extends State<emotionpage> {
  String selectedPersonality = 'Select Personality';
  String confessionText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 202, 147, 247),
      drawer: NavBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              AppBar(
                elevation: 0.0,
                backgroundColor: Color.fromARGB(255, 202, 147, 247), // Set the background color
                title: Text(
                  'Emotion Section',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Color.fromARGB(255, 12, 12, 12)), // Adjust font size and color
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatPage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 202, 147, 247),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(6), // Adjust padding
                      child: Icon(
                        Icons.chat,
                        color: Color.fromARGB(255, 111, 3, 194),
                        size: 24, // Adjust icon size
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Hey \nPhilosopher!',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 202, 147, 247),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      Icons.notifications,
                      color: const Color.fromARGB(255, 7, 7, 7),
                      size: 30,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'How do you feel today?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 5, 5, 5),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      EmotionFace(
                        emotionFace: '😊',
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Happy',
                        style: TextStyle(color: const Color.fromARGB(255, 7, 7, 7)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      EmotionFace(
                        emotionFace: '😢',
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Sad',
                        style: TextStyle(color: const Color.fromARGB(255, 7, 7, 7)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      EmotionFace(
                        emotionFace: '😡',
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Angry',
                        style: TextStyle(color: const Color.fromARGB(255, 6, 6, 6)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      EmotionFace(
                        emotionFace: '😌',
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Relaxed',
                        style: TextStyle(color: const Color.fromARGB(255, 8, 8, 8)),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      EmotionFace(
                        emotionFace: '😄',
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'fine',
                        style: TextStyle(color: const Color.fromARGB(255, 5, 5, 5)),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              // Find Your Personality Type
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Find Your Personality Type',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 10, 10, 10),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 111, 3, 194),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButton<String>(
                  value: selectedPersonality,
                  items: <String>[
                    'Select Personality',
                    'The Strategist (INTJ)',
                    'The Engineer (INTP)',
                    'The Chief (ENTJ)',
                    'The Originator (ENTP)',
                    'The Confidant (INFJ)',
                    'The Dreamer (INFP)',
                    'The Mentor (ENFJ)',
                    'The Advocate (ENFP)',
                    'The Examiner (ISTJ)',
                    'The Defender (ISFJ)',
                    'The Overseer (ESTJ)',
                    'The Supporter (ESFJ)',
                    'The Craftsman (ISTP)',
                    'The Artist (ISFP)',
                    'The Persuader (ESTP)',
                    'The Entertainer (ESFP)',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Color.fromARGB(255, 241, 237, 237)),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedPersonality = newValue!;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Display selected personality type
              Text(
                'Selected Personality: $selectedPersonality',
                style: TextStyle(color: Color.fromARGB(255, 6, 6, 6),
                 fontWeight: FontWeight.bold,),
               
              ),
              SizedBox(
                height: 25,
              ),
              // Confession Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Confession Session',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 7, 7, 7),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 111, 3, 194),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  onChanged: (text) {
                    confessionText = text;
                  },
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  decoration: InputDecoration(
                    hintText: 'Share your confession...',
                    hintStyle: TextStyle(color:Color.fromARGB(255, 255, 255, 255)),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Display Confession
              Text(
                'Your Confession: $confessionText',
                style: TextStyle(color: const Color.fromARGB(255, 7, 7, 7)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

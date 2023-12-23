import 'package:flutter/material.dart';

class EmotionFace extends StatefulWidget {
  final String emotionFace;

  const EmotionFace({
    Key? key,
    required this.emotionFace,
  }) : super(key: key);

  @override
  _EmotionFaceState createState() => _EmotionFaceState();
}

class _EmotionFaceState extends State<EmotionFace> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 218, 185, 243),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(16),
      child: Center(
        child: Text(
          widget.emotionFace,
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}

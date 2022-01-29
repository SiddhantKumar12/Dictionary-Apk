import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class FlashcardView extends StatelessWidget {
  final String word;
  final String origin;
  final String partOfSpeech;
  final String urll;

  FlashcardView({
    required this.word,
    required this.origin,
    required this.partOfSpeech,
    required this.urll,
  });

  FlutterTts flutterTts = FlutterTts();

  void speakWord() async {
    await flutterTts.speak(urll);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          side: new BorderSide(color: Colors.blue, width: 2.0)),
      semanticContainer: true,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 5),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              word.toUpperCase(),
              style: TextStyle(fontSize: 40, color: Colors.blue),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              origin,
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              partOfSpeech.toUpperCase(),
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            IconButton(
                onPressed: () {
                  speakWord();
                  // print('hi');
                },
                icon: Icon(
                  Icons.audiotrack,
                  size: 40,
                ))
          ],
        ),
      ),
    );
  }
}

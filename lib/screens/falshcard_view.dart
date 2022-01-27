import 'package:flutter/material.dart';

class FlashcardView extends StatelessWidget {
  final String word;
  final String origin;
  final String partOfSpeech;
  final String? urll;

  FlashcardView({
    required this.word,
    required this.origin,
    required this.partOfSpeech,
    this.urll,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              word.toUpperCase(),
              style: TextStyle(
                fontSize: 40,
              ),
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
                onPressed: () {},
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

import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'models/api_model.dart';
import 'screens/falshcard_view.dart';
import 'services/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  List<DataModel>? data;
  String randomWord = 'apple';
  API api = API();

  void getData() async {
    data = await api.getAPI(randomWord);
    if (data!.isEmpty) {
      pickRandomWord();
      return;
    }
    setState(() {
      isLoading = false;
    });
  }

  void pickRandomWord() {
    int i = Random().nextInt(api.words!.length);
    // setState(() {
    randomWord = api.words![i];
    // });
    getData();
  }

  @override
  void initState() {
    super.initState();
    getData();
    //pickRandomWord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    SizedBox(
                      width: 350,
                      height: 350,
                      child: FlipCard(
                        front: FlashcardView(
                          word: data![0].word,
                          origin: 'Origin : ' + data![0].origin,
                          partOfSpeech: 'Part Of Speech : ' +
                              data![0].meanings[0].partOfSpeech,
                        ),
                        back: Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 40,
                              left: 20,
                              right: 15,
                              bottom: 20,
                            ),
                            child: Text(
                              data![0].meanings[0].definitions[0].definition,
                              style: const TextStyle(fontSize: 26),
                            ),
                          ),
                          // FlashcardView(
                          //   word: results.meanings[index]
                          //       .definitions[index].definition,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OutlineButton.icon(
                            borderSide: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                            onPressed: pickRandomWord,
                            icon: Icon(Icons.chevron_left),
                            label: Text('Prev')),
                        OutlineButton.icon(
                            borderSide: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 2,
                            ),
                            onPressed: pickRandomWord,
                            icon: Icon(Icons.chevron_right),
                            label: Text('Next')),
                      ],
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

// void showNextCard() {
//   setState(() {
//     _currentIndex =
//     (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
//   });
// }
//
// void showPreviousCard() {
//   setState(() {
//     _currentIndex =
//     (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashcards.length - 1;
//   });
// }
// }
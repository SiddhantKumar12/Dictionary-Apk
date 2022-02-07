import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'models/api_model.dart';
import 'screens/falshcard_view.dart';
import 'services/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // FlutterTts flutterTts = FlutterTts();
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

  // void speakWord() async {
  //   await flutterTts.speak(data![0].word);
  // }

  @override
  void initState() {
    getData();
    //pickRandomWord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daily Grammmer',
          style: TextStyle(fontSize: 26),
        ),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         speakWord();
        //         // print('hi');
        //       },
        //       icon: Icon(Icons.audiotrack))
        // ],
      ),
      body: SafeArea(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 70, left: 30, right: 20),
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
                          urll: data![0].word,
                        ),
                        back: Card(
                          shape: RoundedRectangleBorder(
                              side: new BorderSide(
                                  color: Colors.blue, width: 2.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Defination of: ' +
                                      data![0].word.toUpperCase(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  data![0]
                                      .meanings[0]
                                      .definitions[0]
                                      .definition,
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.blueAccent,
                        elevation: 1,
                      ),
                      onPressed: () {
                        pickRandomWord();
                      },
                      child: const Text(
                        'Click to see New Word',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     OutlineButton.icon(
                    //         borderSide: BorderSide(
                    //           color: Colors.white,
                    //           style: BorderStyle.solid,
                    //           width: 2,
                    //         ),
                    //         onPressed: pickRandomWord,
                    //         icon: Icon(Icons.chevron_left),
                    //         label: Text('Prev')),
                    //     OutlineButton.icon(
                    //         borderSide: BorderSide(
                    //           color: Colors.white,
                    //           style: BorderStyle.solid,
                    //           width: 2,
                    //         ),
                    //         onPressed: pickRandomWord,
                    //         icon: Icon(Icons.chevron_right),
                    //         label: Text('Next')),
                    //   ],
                    // )
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

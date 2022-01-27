// import 'package:flash_cards/models/flashcard.dart';
// import 'package:flip_card/flip_card.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'falshcard_view.dart';
//
// class FlashCardScreen extends StatefulWidget {
//   const FlashCardScreen({Key? key}) : super(key: key);
//
//   @override
//   _FlashCardScreenState createState() => _FlashCardScreenState();
// }
//
// class _FlashCardScreenState extends State<FlashCardScreen> {
//   List<Flashcard> _flashcards = [
//     Flashcard(
//         question: "What programming language does Flutter use?",
//         answer: "Dart"),
//     Flashcard(question: "who is smart?", answer: "Siddhant!"),
//     Flashcard(question: "is flutter is created by google?", answer: "Yes!")
//   ];
//
//   int _currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flash Card'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//                 width: 350,
//                 height: 350,
//                 child: FlipCard(
//                     front: FlashcardView(
//                       word: _flashcards[_currentIndex].question,
//                     ),
//                     back: FlashcardView(
//                       word: _flashcards[_currentIndex].answer,
//                     ))),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 OutlineButton.icon(
//                     borderSide: BorderSide(
//                       color: Colors.white,
//                       style: BorderStyle.solid,
//                       width: 2,
//                     ),
//                     onPressed: showPreviousCard,
//                     icon: Icon(Icons.chevron_left),
//                     label: Text('Prev')),
//                 OutlineButton.icon(
//                     borderSide: BorderSide(
//                       color: Colors.white,
//                       style: BorderStyle.solid,
//                       width: 2,
//                     ),
//                     onPressed: showNextCard,
//                     icon: Icon(Icons.chevron_right),
//                     label: Text('Next')),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   void showNextCard() {
//     setState(() {
//       _currentIndex =
//           (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
//     });
//   }
//
//   void showPreviousCard() {
//     setState(() {
//       _currentIndex =
//           (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashcards.length - 1;
//     });
//   }
// }

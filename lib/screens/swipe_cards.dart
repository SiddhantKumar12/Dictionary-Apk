import 'dart:math';

import 'package:flash_cards/models/api_model.dart';
import 'package:flash_cards/services/api.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      likeAction();
    });
  }

  void pickRandomWord() {
    int i = Random().nextInt(api.words!.length);
    // setState(() {
    randomWord = api.words![i];
    // });
    getData();
  }

  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await api.getListData();
      getData();
    });
  }

  void likeAction() {
    if (data == null) return;
    for (int i = 0; i < data!.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(
            text: data![0].word,
          ),
          likeAction: () {
            _scaffoldKey.currentState?.showSnackBar(SnackBar(
              content: Text("Liked ${data![0]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
            _scaffoldKey.currentState?.showSnackBar(SnackBar(
              content: Text("Nope ${data![0]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          superlikeAction: () {
            _scaffoldKey.currentState?.showSnackBar(SnackBar(
              content: Text("Superliked ${data![0]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          onSlideUpdate: (SlideRegion? region) async {
            pickRandomWord();
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('app'),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                child: Stack(children: [
                Container(
                  // height: MediaQuery.of(context).size.height - kToolbarHeight,
                  height: 400,
                  width: 300,
                  child: SwipeCards(
                    matchEngine: _matchEngine!,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        alignment: Alignment.center,
                        // color: _swipeItems[index].content.color,
                        color: Colors.white,
                        child: Text(
                          _swipeItems[index].content.text,
                          style: TextStyle(fontSize: 100),
                        ),
                      );
                    },
                    onStackFinished: () {
                      _scaffoldKey.currentState!.showSnackBar(SnackBar(
                        content: Text("Stack Finished"),
                        duration: Duration(milliseconds: 500),
                      ));
                    },
                    itemChanged: (SwipeItem item, int index) {
                      print("item: ${item.content.text}, index: $index");
                    },
                    upSwipeAllowed: true,
                    fillSpace: true,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          _matchEngine!.currentItem?.nope();
                        },
                        child: Text("Nope")),
                    ElevatedButton(
                        onPressed: () {
                          _matchEngine!.currentItem?.superLike();
                        },
                        child: Text("Superlike")),
                    ElevatedButton(
                        onPressed: () {
                          _matchEngine!.currentItem?.like();
                        },
                        child: Text("Like"))
                  ],
                )
              ])));
  }
}

class Content {
  String text;

  Content({
    required this.text,
  });
}

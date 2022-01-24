import 'package:flutter/material.dart';

import 'package:english_words/english_words.dart';

/*
class wordgeneratar extends StatelessWidget {
  const wordgeneratar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('words generatar'),),

      body: Center(
        child: randomwords(),
      )
    );
  }
}*/

class randomwords extends StatefulWidget {
  const randomwords({Key? key}) : super(key: key);

  @override
  _randomwordsState createState() => _randomwordsState();
}

class _randomwordsState extends State<randomwords> {
final _saggestions =<WordPair>[];
final _biggerfont = TextStyle(fontSize: 18);

Widget _buildSuggestions() {
  return ListView.builder(itemBuilder: (context, i) {
    if (i.isOdd) return Divider();
    final index = i ~/ 2;
    // if (index >= _saggestions.length) {
      _saggestions.addAll(generateWordPairs().take(10));
    // }
    return _buildRow(_saggestions[index]);
  });
}
Widget _buildRow(WordPair pair){
  return ListTile(
   title: Text(pair.asPascalCase, style: _biggerfont),

  );
}
  @override
  Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(title:  Text('Word generater'),),
  body: _buildSuggestions(),
);
  }
}


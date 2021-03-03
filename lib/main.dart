import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18);

  Widget _buildRow(WordPair wordPair) {
    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
  Widget _buildSuggestion() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext _context, int i) {
            if( i.isOdd){
              return Divider();
            }
            final int index = i ~/2;
            if (index >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10));
            }
            return _buildRow(_suggestions[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return _buildSuggestion();
  }
}

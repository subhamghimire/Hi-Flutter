import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


// void main() => runApp(MaterialApp(
//   home: Scaffold(
//     appBar: AppBar(
//       title: Text('Test App'),
//       centerTitle: true,
//     ),
//     body: Center(
//       child: Text('Hello World!'),
//     ),
//     floatingActionButton: FloatingActionButton(
//       child: Text('Click'),
//     ),
//   ),
//
// ));
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random(); // Add this line.
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Container(
          child: GridView.count(
            crossAxisCount: 2,
//            scrollDirection: Axis.horizontal,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            children: <Widget>[
              Image.asset('assets/images/img1.jpg',semanticLabel: 'image1'),
              Image.asset('assets/images/img2.png',semanticLabel: 'image2'),
              Image.asset('assets/images/img3.png',semanticLabel: 'image3'),
              Image.asset('assets/images/img4.jpg',semanticLabel: 'image4'),
            ]
          ),
        )
      ),
    );
  }
}

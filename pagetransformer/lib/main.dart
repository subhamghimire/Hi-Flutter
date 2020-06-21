import 'package:flutter/material.dart';
import 'package:page_transformer/intro_page_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Page Transformer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroPageView(),
    );
  }
}

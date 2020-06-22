import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Next Sreen'),
        ),
        body: Container(
          child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              children: <Widget>[
                Image.asset('assets/images/img1.jpg', semanticLabel: 'image1'),
                Image.asset('assets/images/img2.png', semanticLabel: 'image2'),
                Image.asset('assets/images/img3.png', semanticLabel: 'image3'),
                Image.asset('assets/images/img4.jpg', semanticLabel: 'image4'),
              ]),
        ));
  }
}

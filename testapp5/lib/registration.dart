import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Registration Sreen'),
          backgroundColor: Colors.purpleAccent,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(),)
              ],
           )
         )
      ));
  }
}

import 'package:flutter/material.dart';
import 'package:testapp5/login.dart';
import 'package:testapp5/registration.dart';
import 'package:testapp5/next.dart';
import 'package:testapp5/jwt/auth.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Test App 5';

    return MaterialApp(
      routes: {
        '/home': (context) => NextScreen(),
        '/login': (context) => Login(),
        '/register': (context) => GoRegister(),
        '/logout': (context) {
          Auth.logout();
          return NextScreen();
        }
      },
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
          backgroundColor: Colors.purpleAccent,
        ),
        backgroundColor: Colors.white,
        body: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (Container(
            child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background1.png'),
                    fit: BoxFit.fill)),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 30,
                  width: 80,
                  height: 150,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/light-1.png'))),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Login()
        ],
      ),
    ))));
  }
}

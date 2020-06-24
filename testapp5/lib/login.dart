import 'package:flutter/material.dart';
import 'package:testapp5/next.dart';
import 'package:testapp5/registration.dart';
import 'package:testapp5/jwt/auth.dart';
import 'package:testapp5/jwt/token.dart';
import 'package:testapp5/api/api.dart';
import 'package:testapp5/components/alert.dart';
import 'package:testapp5/components/showToast.dart';
import 'package:testapp5/common.dart';
import 'constrant.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(143, 148, 251, .2),
                              blurRadius: 20.0,
                              offset: Offset(0, 10))
                        ]),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey[100]))),
                          child: TextFormField(
                            controller: phoneController,
                            validator: (value) {
                              if (!phoneRegex.hasMatch(value) &&
                                  !emailRegex.hasMatch(value))
                                return "Please enter a valid phone!";
                              return null;
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Phone or Email",
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    child: RaisedButton(
                      onPressed: () => {
                        if (_formKey.currentState.validate())
                          {
                            this._login(),
                          }
                      },
                      child: new Text('Log In'),
                      color: Color.fromRGBO(123, 100, 200, 0.7),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Don\'t have an account?'),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GoRegister()));
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Forgot Password?",
                    style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _login() async {
    setState(() {});

    var data = {
      'username': phoneController.text,
      'password': passwordController.text
    };

    print(data);

    ApiResponse apiResponse = await Auth.login(data);
    apiResponse.printErrors();
    if (apiResponse.hasErrors()) {
      alert(context, "The Phone/Password is incorrect!");
    } else {
      showToast("Welcome to Test App 5!");
      isUserLoggedIn = true;
      currentUser = await Token.getUser();
      Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (context) => NextScreen(),
        ),
      );
    }
    setState(() {});
  }
}

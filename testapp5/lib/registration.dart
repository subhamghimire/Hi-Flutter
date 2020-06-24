import 'package:flutter/material.dart';
import 'constrant.dart';
import 'package:testapp5/components/alert.dart';
import 'package:testapp5/components/showToast.dart';
import 'package:testapp5/api/api.dart';
import 'package:testapp5/jwt/auth.dart';
import 'main.dart';

class GoRegister extends StatefulWidget {
  @override
  _GoRegisterState createState() => _GoRegisterState();
}

class _GoRegisterState extends State<GoRegister> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
    return Scaffold(
        appBar: AppBar(
          title: Text('Register Screen'),
          backgroundColor: Colors.purpleAccent,
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[_registerWidget()])));
  }

  Widget _registerWidget() {
    return Form(
        key: _formKey,
        child: Container(
            child: Column(
          children: <Widget>[
            Container(
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/nature.png'),
                      fit: BoxFit.fill)),
            ),
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
                            validator: (value) {
                              if (!usernameRegex.hasMatch(value))
                                return "Please enter a valid useername!";
                              return null;
                            },
                            controller: usernameController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "User Name",
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey[100]))),
                          child: TextFormField(
                            validator: (value) {
                              if (!emailRegex.hasMatch(value))
                                return "Please enter a valid email!";
                              return null;
                            },
                            controller: emailController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey[100]))),
                          child: TextFormField(
                            validator: (value) {
                              if (!phoneRegex.hasMatch(value))
                                return "Please enter a valid phone!";
                              return null;
                            },
                            controller: phoneController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Phone Number",
                                hintStyle: TextStyle(color: Colors.grey[400])),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value.length < 8)
                                return "Password must be greater than 8 characters!";
                              return null;
                            },
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
                            this._signup(),
                            {Navigator.pop(context)},
                          }
                      },
                      child: new Text('Register'),
                      color: Color.fromRGBO(98, 250, 200, 0.7),
                    ),
                  ),
                ],
              ),
            )
          ],
        )));
  }

  Future<void> _signup() async {
    FocusScope.of(context).unfocus();
    setState(() {});

    var data = {
      'name': usernameController.text ?? '',
      'email': emailController.text ?? '',
      'password': passwordController.text ?? '',
      'phone': phoneController.text ?? '',
    };

    print(data);

    ApiResponse response = await Auth.register(data);
    if (response.hasErrors()) {
      String error = "";
      response.getErrors().forEach((k, v) => error = error + v[0]);
      alert(context, error);
    } else {
      showToast("Your Account has been Created Successfully");
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => MainPage()));
    }
    setState(() {});
  }
}

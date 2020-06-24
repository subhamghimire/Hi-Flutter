import 'package:flutter/material.dart';

RegExp usernameRegex = RegExp(
  r"^[a-zA-Z][a-zA-z_0-9]{3,18}$",
  caseSensitive: false,
  multiLine: false,
);
RegExp emailRegex = RegExp(
  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  caseSensitive: false,
  multiLine: false,
);
RegExp phoneRegex = RegExp(
  r"^[0-9]{10}$",
  caseSensitive: false,
  multiLine: false,
);

Color primaryColor = Color(0xff0d50a0);

// routes
import 'package:flutter/material.dart';

const String initial = 'initial';
const String login = 'login';
const String home = 'home';
const String create = 'create';
const String pending = 'pending';
const String completed = 'completed';
const String detail = 'detail';

// key
const String authKey = 'authKey';

void showSnackBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

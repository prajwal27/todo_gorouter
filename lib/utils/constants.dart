import 'package:flutter/material.dart';

// routes
const String initial = 'initial';
const String login = 'login';
const String home = 'home';
const String create = 'create';
const String pending = 'pending';
const String completed = 'completed';
const String detail = 'detail';

// key
const String authKey = 'authKey';

const String appTitle = 'TODOs';

void showSnackBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

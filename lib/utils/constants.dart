// routes
import 'package:flutter/material.dart';

const String initial = 'initial';
const String login = 'login';
const String home = 'home';
const String create = 'create';
const String pending = 'pending';
const String completed = 'completed';
const String detail = 'detail';
const String homePending = 'homePending';
const String deleted = 'deleted';

// key
const String authKey = 'authKey';
const String itemsKey = 'itemsKey';

const String appTitle = 'TODOs';

void showSnackBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

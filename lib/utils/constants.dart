// routes
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

extension Data on GoRouterState {
  Map<String, String?> get getString {
    return {
      'location': location,
      'subloc': subloc,
      'name': name,
      'path': path,
      'fullPath': fullpath,
      'pageKey': pageKey.value,
    };
  }
}

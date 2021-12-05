import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: const Text(
          'Oops!',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.arrow_back, // add custom icons also
          ),
        ),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_gorouter/model/todo_item.dart';
import 'package:todo_gorouter/state/todo_state.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    TodoItem? item = Provider.of<TodoState>(context).getItem(id);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.lightBlue,
        title: Text(
          'TODO #$id',
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: const Icon(
            Icons.arrow_back, // add custom icons also
          ),
        ),
      ),
      body: item == null
          ? const Center(
              child: Text('No item found!'),
            )
          : Column(
              children: [],
            ),
    );
  }
}

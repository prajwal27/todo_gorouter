import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_gorouter/model/todo_item.dart';
import 'package:todo_gorouter/state/todo_state.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    Status status = index == 0 ? Status.pending : Status.completed;
    final todoItems = Provider.of<TodoState>(context).getItems(status);

    return todoItems.isNotEmpty
        ? ListView.builder(
            itemBuilder: (context, position) {
              TodoItem todoItem = todoItems[position];
              return GestureDetector(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '${todoItem.id}. ${todoItem.message}',
                      style: const TextStyle(fontSize: 22.0),
                    ),
                  ),
                ),
                onTap: () {
                  final TodoItem item = todoItems[position];
                },
              );
            },
            itemCount: todoItems.length,
          )
        : const Center(
            child: Text("No Items to show."),
          );
  }
}

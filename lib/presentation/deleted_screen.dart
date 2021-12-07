import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_gorouter/model/todo_item.dart';
import 'package:todo_gorouter/state/todo_state.dart';

class DeletedScreen extends StatelessWidget {
  const DeletedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoItems = Provider.of<TodoState>(context).getItems(Status.deleted);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: const Text(
          'Deleted Items',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: todoItems.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, position) {
                TodoItem item = todoItems[position];
                return GestureDetector(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '${item.id}. ${item.message}',
                        style: const TextStyle(fontSize: 22.0),
                      ),
                    ),
                  ),
                );
              },
              itemCount: todoItems.length,
            )
          : const Center(
              child: Text("No Items to show."),
            ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_gorouter/model/todo_item.dart';
import 'package:todo_gorouter/state/todo_state.dart';
import 'package:todo_gorouter/utils/constants.dart';
import 'package:todo_gorouter/utils/extension.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.id}) : super(key: key);

  final String id;

  Status changeStatus(Status status) {
    return status == Status.pending ? Status.completed : Status.pending;
  }

  String routeAfterChangingStatus(Status status) {
    return status == Status.pending ? pending : completed;
  }

  @override
  Widget build(BuildContext context) {
    TodoItem? item = Provider.of<TodoState>(context).getItem(id);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text(
          'TODO #$id',
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: item == null
          ? const Center(
              child: Text('No item found!'),
            )
          : Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    item.message,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text('Current Status: ${item.status.getValue}')
                ],
              ),
            ),
      bottomNavigationBar: item != null
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Change to ${changeStatus(item.status).getValue}',
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}

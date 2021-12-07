import 'package:flutter/material.dart';
import 'package:todo_gorouter/model/todo_item.dart';

class TodoState extends ChangeNotifier {
  List<TodoItem> items = <TodoItem>[];

  int idCounter = 1;

  TodoState();

  void addTodo(String message) {
    TodoItem todoItem = TodoItem(
      id: idCounter,
      message: message,
      status: Status.pending,
    );
    idCounter++;
    items.add(todoItem);
    notifyListeners();
  }

  TodoItem? getItem(String? id) {
    int index = items.indexWhere((element) => id == '${element.id}');
    return index == -1 ? null : items[index];
  }

  bool changeStatus(int id, Status status) {
    final int index = items.indexWhere((element) => element.id == id);
    if (index == -1) {
      return false;
    }
    items[index] = items[index].copyWith(status: status);
    notifyListeners();
    return true;
  }

  List<TodoItem> getItems(Status status) {
    return items.where((element) => element.status == status).toList();
  }

  bool deleteItem(int id) {
    try {
      items.removeWhere((element) => element.id == id);
      notifyListeners();
    } on Exception catch (e) {
      print('Exception deleting item with id:$id, error ${e.toString()}');
      return false;
    }
    return true;
  }

  void clearAllItems() {
    items.clear();
    notifyListeners();
  }
}
